import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 100;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  // startTime := Time.now();

  let id = 123412341234132;

  Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float) {
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount not available to withdraw");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let elapsedTimeInNs = currentTime - startTime;
    let elapsedTime = elapsedTimeInNs / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(elapsedTime));
    startTime := currentTime;
  };
}