Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147G4u-0005Ix-00
	for mtd-list@infradead.org; Sat, 16 Dec 2000 12:04:40 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 147G4n-0005Ir-00
	for mtd@infradead.org; Sat, 16 Dec 2000 12:04:33 +0000
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: Nicolas Pitre <nico@cam.org>, <mstumpf@pobox.com>
Subject: Re: MTD, generic physmap memory, MTD_BLOCK
Date: Sat, 16 Dec 2000 01:04:04 +0000
Content-Type: Multipart/Mixed;
  charset="US-ASCII";
  boundary="------------Boundary-00=_SYYMX23O7PF2QGIDK89C"
Cc: <mtd@infradead.org>
References: <Pine.LNX.4.30.0012131359200.3311-100000@xanadu.gn.com>
In-Reply-To: <Pine.LNX.4.30.0012131359200.3311-100000@xanadu.gn.com>
MIME-Version: 1.0
Message-Id: <0012160104041B.11759@www.easysolutions.net>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--------------Boundary-00=_SYYMX23O7PF2QGIDK89C
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 8bit


> > It's a trivial driver, and I'll write it / modify existing MTD code if
> > desired/needed, but it really seems important to have so that I can
> > execute-in-place from a cramfs partition in ROM (and also have this as my
> > root partition).
>
> It's impossible to execute_in_place from a cramfs partition since the
> in-place code is compressed.

Unless you expand the inode and mark things as uncompressed and aligned and 
others as compressed.  Attached is a patch to cramfs that allows it to access 
the memory locations that are mapped in directly rather than buffering 
compressed data..., which is a big fat waste and is a "first step" towards 
XIPable cramfs.  We're working on a cramfs that is XIPable, but only for 
MIPs.  The increased performance of a linearly addressed cramfs partition is 
pretty decent..., although I haven't figured out a smart way to bootstrap 
right into the cramfs stuff...  (I'm thinking init.c or around there is where 
I should be looking)

Thanks,
Shane.

Oh, BTW, I finished "a version" of mtd for XIP kernel writable for 
cfi_cmdset_0001.c, and cfi_probe.  I haven't figured out a smart way to deal 
with having two versions of stuff yet..., because most of the code is the 
same.  You can find it on 
ftp.agendacomputing.com/pub/kernel/*someversion*/patches .  Once I figure out 
a smart way to do this, and forward port to CVS I'll put it in the mainline 
MTD code unless there are any nay-sayers.
--------------Boundary-00=_SYYMX23O7PF2QGIDK89C
Content-Type: text/english;
  name="cramfs-linear-addressing.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="cramfs-linear-addressing.patch"

ZGlmZiAtdXJOIGxpbnV4Lm9yaWcvZnMvQ29uZmlnLmluIGxpbnV4L2ZzL0NvbmZpZy5pbgotLS0g
bGludXgub3JpZy9mcy9Db25maWcuaW4JRnJpIE9jdCAyNyAwNDoyMzoxOCAyMDAwCisrKyBsaW51
eC9mcy9Db25maWcuaW4JRnJpIE9jdCAyNyAwMzo1Nzo1MiAyMDAwCkBAIC0yOSw2ICsyOSwxMCBA
QAogCWludCAnSkZGUyBkZWJ1Z2dpbmcgdmVyYm9zaXR5ICgwID0gcXVpZXQsIDMgPSBub2lzeSkn
IENPTkZJR19KRkZTX0ZTX1ZFUkJPU0UgMAogZmkKIHRyaXN0YXRlICdDb21wcmVzc2VkIFJPTSBm
aWxlIHN5c3RlbSBzdXBwb3J0JyBDT05GSUdfQ1JBTUZTCitkZXBfbWJvb2wgJ0xpbmVhciBhZGRy
ZXNzaW5nIGZvciBDUkFNRlMnIENPTkZJR19DUkFNRlNfTElORUFSX0FERFJFU1NJTkcgJENPTkZJ
R19DUkFNRlMKK2lmIFsgIiRDT05GSUdfQ1JBTUZTX0xJTkVBUl9BRERSRVNTSU5HIiAhPSAibiIg
XSA7IHRoZW4KKwloZXggJ1N0YXJ0aW5nIGFkZHJlc3MgZm9yIENSQU1GUyBmaWxlc3lzdGVtJyBD
T05GSUdfQ1JBTUZTX0xBX0FERFJFU1MgYmYyMDAwMDgKK2ZpCiB0cmlzdGF0ZSAnU2ltcGxlIFJB
TS1iYXNlZCBmaWxlIHN5c3RlbSBzdXBwb3J0JyBDT05GSUdfUkFNRlMKIAogdHJpc3RhdGUgJ0lT
TyA5NjYwIENEUk9NIGZpbGUgc3lzdGVtIHN1cHBvcnQnIENPTkZJR19JU085NjYwX0ZTCmRpZmYg
LXVyTiBsaW51eC5vcmlnL2ZzL2NyYW1mcy9pbm9kZS5jIGxpbnV4L2ZzL2NyYW1mcy9pbm9kZS5j
Ci0tLSBsaW51eC5vcmlnL2ZzL2NyYW1mcy9pbm9kZS5jCUZyaSBPY3QgMjcgMDQ6MjI6MzYgMjAw
MAorKysgbGludXgvZnMvY3JhbWZzL2lub2RlLmMJRnJpIE9jdCAyNyAwNDozMDoxOCAyMDAwCkBA
IC0xMSw2ICsxMSwyMCBAQAogICogVGhlIGFjdHVhbCBjb21wcmVzc2lvbiBpcyBiYXNlZCBvbiB6
bGliLCBzZWUgdGhlIG90aGVyIGZpbGVzLgogICovCiAKKy8qIExpbmVhciBBZGRyZXNzaW5nIGNv
ZGUKKyAqCisgKiBDb3B5cmlnaHQgKEMpIDIwMDAgU2hhbmUgTmF5LgorICoKKyAqIEFsbG93cyB5
b3UgdG8gaGF2ZSBhIGxpbmVhcmx5IGFkZHJlc3NlZCBjcmFtZnMgZmlsZXN5c3RlbS4KKyAqIFNh
dmVzIHRoZSBuZWVkIGZvciBidWZmZXIsIGFuZCB0aGUgbXVuZ2luZyBvZiB0aGUgYnVmZmVyLgor
ICogU2F2aW5ncyBhIGJpdCBvdmVyIDMyayB3aXRoIGRlZmF1bHQgUEFHRV9TSVpFLCBCVUZGRVJf
U0laRQorICogZXRjLiAgVXNlZnVsbCBvbiBlbWJlZGRlZCBwbGF0Zm9ybSB3aXRoIFJPTSA6LSku
CisgKgorICogRG93bnNpZGVzLSBDdXJyZW50bHkgbGluZWFyIGFkZHJlc3NlZCBjcmFtZnMgcGFy
dGl0aW9ucworICogZG9uJ3QgY28tZXhpc3Qgd2l0aCBibG9jayBjcmFtZnMgcGFydGl0aW9ucy4K
KyAqCisgKi8KKwogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Zz
Lmg+CiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgpAQCAtNjgsNiArODIsMjMgQEAKIAlyZXR1
cm4gaW5vZGU7CiB9CiAKKyNpZiBkZWZpbmVkKENPTkZJR19DUkFNRlNfQ1JBTUZTX0xJTkVBUl9B
RERSRVNTSU5HKSAmJiBkZWZpbmVkIChDT05GSUdfQ1JBTUZTX0xBX0FERFJFU1MpCisKKy8qCisg
KiBSZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgbGluZWFybHkgYWRkcmVzc2VkIGZpbGVzeXN0ZW0u
CisgKiBTaW1wbGUgYnl0ZSBzaXplIHBvaW50ZXIgYWRkaXRpb24uCisgKi8KK3N0YXRpYyB1bnNp
Z25lZCBjaGFyKiByb21kaXNrX3RvcD0odW5zaWduZWQgY2hhciopIENPTkZJR19DUkFNRlNfTEFf
QUREUkVTUzsKKworc3RhdGljIHZvaWQgKmNyYW1mc19yZWFkKHN0cnVjdCBzdXBlcl9ibG9jayAq
c2IsIHVuc2lnbmVkIGludCBvZmZzZXQsIHVuc2lnbmVkIGludCBsZW4pCit7CisJaWYgKCFsZW4p
CisJCXJldHVybiBOVUxMOworCXJldHVybiByb21kaXNrX3RvcCArIG9mZnNldDsKK30KKworI2Vs
c2UgLyogIUNPTkZJR19DUkFNRlNfTElORUFSX0FERFJFU1NJTkcgYWthIFJlZ3VsYXIgYmxvY2sg
bW9kZSAqLworCiAvKgogICogV2UgaGF2ZSBvdXIgb3duIGJsb2NrIGNhY2hlOiBkb24ndCBmaWxs
IHVwIHRoZSBidWZmZXIgY2FjaGUKICAqIHdpdGggdGhlIHJvbS1pbWFnZSwgYmVjYXVzZSB0aGUg
d2F5IHRoZSBmaWxlc3lzdGVtIGlzIHNldApAQCAtMTQ5LDYgKzE4MCw4IEBACiAJfQogCXJldHVy
biByZWFkX2J1ZmZlcnNbYnVmZmVyXSArIG9mZnNldDsKIH0KKworI2VuZGlmCiAJCQkKIAogc3Rh
dGljIHN0cnVjdCBzdXBlcl9ibG9jayAqIGNyYW1mc19yZWFkX3N1cGVyKHN0cnVjdCBzdXBlcl9i
bG9jayAqc2IsIHZvaWQgKmRhdGEsIGludCBzaWxlbnQpCkBAIC0xNjEsMTAgKzE5NCwxMSBAQAog
CXNldF9ibG9ja3NpemUoc2ItPnNfZGV2LCBQQUdFX0NBQ0hFX1NJWkUpOwogCXNiLT5zX2Jsb2Nr
c2l6ZSA9IFBBR0VfQ0FDSEVfU0laRTsKIAlzYi0+c19ibG9ja3NpemVfYml0cyA9IFBBR0VfQ0FD
SEVfU0hJRlQ7CgorI2lmICEoIGRlZmluZWQoQ09ORklHX0NSQU1GU19DUkFNRlNfTElORUFSX0FE
RFJFU1NJTkcpICYmIGRlZmluZWQgKENPTkZJR19DUkFNRlNfTEFfQUREUkVTUykgKQogCS8qIElu
dmFsaWRhdGUgdGhlIHJlYWQgYnVmZmVycyBvbiBtb3VudDogdGhpbmsgZGlzayBjaGFuZ2UuLiAq
LwogCWZvciAoaSA9IDA7IGkgPCBSRUFEX0JVRkZFUlM7IGkrKykKIAkJYnVmZmVyX2Jsb2NrbnJb
aV0gPSAtMTsKKyNlbmRpZgogCiAJLyogUmVhZCB0aGUgZmlyc3QgYmxvY2sgYW5kIGdldCB0aGUg
c3VwZXJibG9jayBmcm9tIGl0ICovCiAJbWVtY3B5KCZzdXBlciwgY3JhbWZzX3JlYWQoc2IsIDAs
IHNpemVvZihzdXBlcikpLCBzaXplb2Yoc3VwZXIpKTsK

--------------Boundary-00=_SYYMX23O7PF2QGIDK89C--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
