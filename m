Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Johw8-0000u9-Re
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 16:35:13 +0000
Received: by wf-out-1314.google.com with SMTP id 29so2124574wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 09:35:11 -0700 (PDT)
Message-ID: <15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
Date: Wed, 23 Apr 2008 18:35:11 +0200
From: "Abel Bernabeu" <abelbg@m2grp.com>
Sender: abel.bernabeu@gmail.com
To: "Alexey Korolev" <akorolev@infradead.org>
Subject: Re: PATCH: solving a hang while waiting in FL_STATUS
In-Reply-To: <Pine.LNX.4.64.0804231408140.28908@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_11221_18045560.1208968511555"
References: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
	<1208946790.9212.782.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0804231408140.28908@pentafluge.infradead.org>
Cc: abel.bernabeu@gmail.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: abelbg@m2grp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_11221_18045560.1208968511555
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/4/23, Alexey Korolev <akorolev@infradead.org>:
> Hi David,
>
>
>  > > I am experimenting an infinite loop problem happening at
>  > > cfi_cmdset_0001.c:chip_ready.
>  > >
>  > > Some kind of timeout while waiting  in FL_STATUS should be included.
>  > > Indeed, this timeout feature is not new at all.
>  > >
>  > > The feature was present in 2.6.23.17 but disappeared in 2.6.24 (after
>  > > some refactoring work easily perceptible).
>  >
>  > Hm. This was removed in commit 5a37cf19:
>  >       Fix deadlock in Intel chip driver caused by get_chip recursion
>  >
>  > Alexey, can you explain why you removed it? Abel's patch simply adds
>  > this back where it was. That looks reasonable to me, so I'd like to know
>  > if I've missed some reason why it shouldn't be there...
>  >
>  >
>
> Yes. I can explain. I removed it because just simple adding timeout
>  won't work. Please look at the code after patch applying (solving a hang while waiting in FL_STATUS). Time_after will never occur:


Alexey, you are rigth... the patch did nothing, but the attached one
does the correct thing (discard the previous one).

Believe me, it is not a good idea to return -EAGAIN and let get_chip
to iterate forever (was my case).

I have added a timeout parameter to get_chip. It is a dirty solution
but I cannot redesign that piece of code since I did not wrote it and
I could introduce serious bugs.

Image you have a broken sector which will never respond... that could
hang the process while unlocking the sectors of a partition. In my
case the problem prevents our board to complete the kernel start-up.

Yours, Abel.

------=_Part_11221_18045560.1208968511555
Content-Type: text/x-patch; name=chip_ready.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ffe4k13k
Content-Disposition: attachment; filename=chip_ready.patch

LS0tIGxpbnV4LTIuNi4yNS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwkyMDA4
LTA0LTE3IDA0OjQ5OjQ0LjAwMDAwMDAwMCArMDIwMAorKysgbGludXgtMi42LjI1LmhhY2tlZC9k
cml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwkyMDA4LTA0LTIzIDE4OjAwOjE2LjAw
MDAwMDAwMCArMDIwMApAQCAtODYsNyArODYsNyBAQAogc3RhdGljIHZvaWQgY2ZpX2ludGVsZXh0
X3VucG9pbnQgKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1X2NoYXIgKmFkZHIsIGxvZmZfdCBmcm9t
LAogCQkJc2l6ZV90IGxlbik7CiAKLXN0YXRpYyBpbnQgY2hpcF9yZWFkeSAoc3RydWN0IG1hcF9p
bmZvICptYXAsIHN0cnVjdCBmbGNoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcgYWRyLCBpbnQgbW9k
ZSk7CitzdGF0aWMgaW50IGNoaXBfcmVhZHkgKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3Qg
ZmxjaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIGFkciwgaW50IG1vZGUsIHVuc2lnbmVkIGxvbmcg
dGltZW91dCk7CiBzdGF0aWMgaW50IGdldF9jaGlwKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1
Y3QgZmxjaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIGFkciwgaW50IG1vZGUpOwogc3RhdGljIHZv
aWQgcHV0X2NoaXAoc3RydWN0IG1hcF9pbmZvICptYXAsIHN0cnVjdCBmbGNoaXAgKmNoaXAsIHVu
c2lnbmVkIGxvbmcgYWRyKTsKICNpbmNsdWRlICJmd2hfbG9jay5oIgpAQCAtNjkxLDM0ICs2OTEs
NDAgQEAKIC8qCiAgKiAgKioqKioqKioqKiogQ0hJUCBBQ0NFU1MgRlVOQ1RJT05TICoqKioqKioq
KioqCiAgKi8KLXN0YXRpYyBpbnQgY2hpcF9yZWFkeSAoc3RydWN0IG1hcF9pbmZvICptYXAsIHN0
cnVjdCBmbGNoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcgYWRyLCBpbnQgbW9kZSkKK3N0YXRpYyBp
bnQgY2hpcF9yZWFkeSAoc3RydWN0IG1hcF9pbmZvICptYXAsIHN0cnVjdCBmbGNoaXAgKmNoaXAs
IHVuc2lnbmVkIGxvbmcgYWRyLCBpbnQgbW9kZSwgdW5zaWduZWQgbG9uZyB0aW1lbykKIHsKIAlE
RUNMQVJFX1dBSVRRVUVVRSh3YWl0LCBjdXJyZW50KTsKIAlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNm
aSA9IG1hcC0+ZmxkcnZfcHJpdjsKIAltYXBfd29yZCBzdGF0dXMsIHN0YXR1c19PSyA9IENNRCgw
eDgwKSwgc3RhdHVzX1BXUyA9IENNRCgweDAxKTsKIAlzdHJ1Y3QgY2ZpX3ByaV9pbnRlbGV4dCAq
Y2ZpcCA9IGNmaS0+Y21kc2V0X3ByaXY7Ci0JdW5zaWduZWQgbG9uZyB0aW1lbyA9IGppZmZpZXMg
KyBIWjsKIAogCXN3aXRjaCAoY2hpcC0+c3RhdGUpIHsKIAogCWNhc2UgRkxfU1RBVFVTOgotCQlm
b3IgKDs7KSB7Ci0JCQlzdGF0dXMgPSBtYXBfcmVhZChtYXAsIGFkcik7Ci0JCQlpZiAobWFwX3dv
cmRfYW5kZXF1YWwobWFwLCBzdGF0dXMsIHN0YXR1c19PSywgc3RhdHVzX09LKSkKLQkJCQlicmVh
azsKIAotCQkJLyogQXQgdGhpcyBwb2ludCB3ZSdyZSBmaW5lIHdpdGggd3JpdGUgb3BlcmF0aW9u
cwotCQkJICAgaW4gb3RoZXIgcGFydGl0aW9ucyBhcyB0aGV5IGRvbid0IGNvbmZsaWN0LiAqLwot
CQkJaWYgKGNoaXAtPnByaXYgJiYgbWFwX3dvcmRfYW5kZXF1YWwobWFwLCBzdGF0dXMsIHN0YXR1
c19QV1MsIHN0YXR1c19QV1MpKQotCQkJCWJyZWFrOworCQlzdGF0dXMgPSBtYXBfcmVhZChtYXAs
IGFkcik7CiAKLQkJCXNwaW5fdW5sb2NrKGNoaXAtPm11dGV4KTsKLQkJCWNmaV91ZGVsYXkoMSk7
Ci0JCQlzcGluX2xvY2soY2hpcC0+bXV0ZXgpOwotCQkJLyogU29tZW9uZSBlbHNlIG1pZ2h0IGhh
dmUgYmVlbiBwbGF5aW5nIHdpdGggaXQuICovCi0JCQlyZXR1cm4gLUVBR0FJTjsKKwkJaWYgKG1h
cF93b3JkX2FuZGVxdWFsKG1hcCwgc3RhdHVzLCBzdGF0dXNfT0ssIHN0YXR1c19PSykpCisJCQly
ZXR1cm4gMDsKKworCQkvKiBBdCB0aGlzIHBvaW50IHdlJ3JlIGZpbmUgd2l0aCB3cml0ZSBvcGVy
YXRpb25zCisJCSAgIGluIG90aGVyIHBhcnRpdGlvbnMgYXMgdGhleSBkb24ndCBjb25mbGljdC4g
Ki8KKwkJaWYgKGNoaXAtPnByaXYgJiYgbWFwX3dvcmRfYW5kZXF1YWwobWFwLCBzdGF0dXMsIHN0
YXR1c19QV1MsIHN0YXR1c19QV1MpKQorCQkJcmV0dXJuIDA7CisKKwkJaWYgKHRpbWVfYWZ0ZXIo
amlmZmllcywgdGltZW8pKSB7CisJCQlwcmludGsoS0VSTl9FUlIgIiVzOiBXYWl0aW5nIGZvciBj
aGlwIHRvIGJlIHJlYWR5IHRpbWVkIG91dC4gU3RhdHVzICVseFxuIiwKKwkJCQltYXAtPm5hbWUs
IHN0YXR1cy54WzBdKTsKKwkJCXJldHVybiAtRUlPOwogCQl9Ci0JCS8qIEZhbGwgdGhyb3VnaCAq
LworCisJCXNwaW5fdW5sb2NrKGNoaXAtPm11dGV4KTsKKwkJY2ZpX3VkZWxheSgxKTsKKwkJc3Bp
bl9sb2NrKGNoaXAtPm11dGV4KTsKKworCQkvKiBTb21lb25lIGVsc2UgbWlnaHQgaGF2ZSBiZWVu
IHBsYXlpbmcgd2l0aCBpdC4gKi8KKwkJcmV0dXJuIC1FQUdBSU47CisKIAljYXNlIEZMX1JFQURZ
OgogCWNhc2UgRkxfQ0ZJX1FVRVJZOgogCWNhc2UgRkxfSkVERUNfUVVFUlk6CkBAIC04MDEsOCAr
ODA3LDEyIEBACiBzdGF0aWMgaW50IGdldF9jaGlwKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1
Y3QgZmxjaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIGFkciwgaW50IG1vZGUpCiB7CiAJaW50IHJl
dDsKKwl1bnNpZ25lZCBpbnQgdGltZW87CisKIAlERUNMQVJFX1dBSVRRVUVVRSh3YWl0LCBjdXJy
ZW50KTsKIAorCXRpbWVvID0gamlmZmllcyArIEhaOworCiAgcmV0cnk6CiAJaWYgKGNoaXAtPnBy
aXYgJiYgKG1vZGUgPT0gRkxfV1JJVElORyB8fCBtb2RlID09IEZMX0VSQVNJTkcKIAkJCSAgIHx8
IG1vZGUgPT0gRkxfT1RQX1dSSVRFIHx8IG1vZGUgPT0gRkxfU0hVVERPV04pKSB7CkBAIC04NDMs
NyArODUzLDcgQEAKIAkJCWlmICghcmV0KQogCQkJCWdvdG8gcmV0cnk7CiAJCQlzcGluX3VubG9j
ayhjaGlwLT5tdXRleCk7Ci0JCQlyZXQgPSBjaGlwX3JlYWR5KG1hcCwgY29udGVuZGVyLCBjb250
ZW5kZXItPnN0YXJ0LCBtb2RlKTsKKwkJCXJldCA9IGNoaXBfcmVhZHkobWFwLCBjb250ZW5kZXIs
IGNvbnRlbmRlci0+c3RhcnQsIG1vZGUsIHRpbWVvKTsKIAkJCXNwaW5fbG9jayhjaGlwLT5tdXRl
eCk7CiAKIAkJCWlmIChyZXQgPT0gLUVBR0FJTikgewpAQCAtODc4LDcgKzg4OCw3IEBACiAJCQlz
aGFyZWQtPmVyYXNpbmcgPSBjaGlwOwogCQlzcGluX3VubG9jaygmc2hhcmVkLT5sb2NrKTsKIAl9
Ci0JcmV0ID0gY2hpcF9yZWFkeShtYXAsIGNoaXAsIGFkciwgbW9kZSk7CisJcmV0ID0gY2hpcF9y
ZWFkeShtYXAsIGNoaXAsIGFkciwgbW9kZSwgdGltZW8pOwogCWlmIChyZXQgPT0gLUVBR0FJTikK
IAkJZ290byByZXRyeTsKIAo=
------=_Part_11221_18045560.1208968511555--
