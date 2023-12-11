![LogoType](https://raw.githubusercontent.com/guilhermetog/plug/main/assets/logotype.png)

A Dart/Flutter package to deal with async communication between 2 instances or methods.<br/>
It works like a cable connecting two class instances.<br/>
Each Plug can only have one corresponding connection, and it works by transmitting and receiving asynchronous signals and values.
<br/>

## Table of Contents
- [ Plug with signal](#plug-signal)
- [ Plug with data](#plug-data)



<a name="plug-signal"></a>

## Plug with signal

```dart

void main(){
    FirstClass firstClassInstance = FirstClass();
    SecondClass secondClassInstance = SecondClass();
    firstClassInstance.onSignal.then(secondClassInstance.handleSignal);
    firstClassInstance.someMethod();
}

class FirstClass{
    Plug onSignal = Plug();

    someMethod(){
        ...some work
        onSignal();
    }
}

class SecondClass{
    handleSignal(){
        print('signal received');
    }
}

```

<a name="plug-data"></a>

## Plug with data

```dart
void main(){
    FirstClass firstClassInstance = FirstClass();
    SecondClass secondClassInstance = SecondClass();
    firstClassInstance.onData.take(secondClassInstance.handleData);
    firstClassInstance.someMethod();
}

class FirstClass{
    Plug<int> onData = Plug();

    someMethod(){
        ...some work
        onData.send(10);
    }
}

class SecondClass{
    handleData(int value){
        print('value received $value');
    }
}


```

##
<br/><br/><br/>

## Contribute
If you have some improvement or correction to make, please feel free to open an issue or pull request on the github project. All feedback are very welcome.


<a href="https://www.buymeacoffee.com/guilhermetog" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174">
</a>
