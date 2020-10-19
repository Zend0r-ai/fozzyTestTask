#ifndef CALCCLASS_H
#define CALCCLASS_H

#include <QObject>
#include <QLibrary>
#include <QDebug>
#include <string>
#include <QFileInfo>

class CalcClass : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString param READ getdata WRITE nearestEven NOTIFY somethingHappened)
    explicit CalcClass(QObject *parent = nullptr);
    int getLibPath() const;
    int getdata() const;
public slots:
    void nearestEven(QString param);
    void setLibraryPath(QString lib_path);

signals:
    void somethingHappened(int res);
private:
    int data;
    QString libPath;
};

#endif // CALCCLASS_H
