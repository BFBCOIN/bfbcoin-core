// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017 The bfb Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BFB_QT_BFBADDRESSVALIDATOR_H
#define BFB_QT_BFBADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class bfbAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit bfbAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** bfb address widget validator, checks for a valid bfb address.
 */
class bfbAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit bfbAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BFB_QT_BFBADDRESSVALIDATOR_H
