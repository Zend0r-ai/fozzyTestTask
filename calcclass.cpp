#include "calcclass.h"

CalcClass::CalcClass(QObject *parent) : QObject(parent) {
}

int CalcClass::getdata() const
{
    return data;
}

void CalcClass::nearestEven(QString data){
    QLibrary lib(libPath);
    lib.load();
    if (!lib.isLoaded()) {
        qDebug() << lib.errorString();
    }
    typedef int (*function)(int);
    auto dosmth = (function)lib.resolve("dosmth");
    if(dosmth)
        emit somethingHappened(dosmth(data.toInt()));
}

void CalcClass::setLibraryPath(QString lib_path)
{
    libPath = lib_path;
}
