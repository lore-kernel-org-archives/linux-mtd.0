Received: from smtp.lynuxworks.com ([207.21.185.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169lRZ-0000sX-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 11:02:58 +0000
Date: Fri, 30 Nov 2001 03:13:23 -0800 (PST)
From: Aleksander Sanochkin <asanochkin@Lnxw.COM>
To: <linux-mtd@lists.infradead.org>, <jffs-dev@axis.com>
Subject: cfi_cmdset_001.c problem
Message-ID: <Pine.LNX.4.33.0111300305120.11565-200000@newbast.lynuxworks.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="365889209-386149611-1007118803=:11565"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--365889209-386149611-1007118803=:11565
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi!

I see that after write and erase operations,
the current version of cfi_cmdset_0001.c driver
can left a Flash device not in the READY state.
If soft reboot is performed in such a situation,
applications that use flash will behave erroneously
since they expect that the flash is in the READY state.
For instance, if the system is supposed to boot from flash,
it will hang.

I've made a patch that fixes the problem for me - it is attached.
I was hoping it might be helpful for other people too.

Best regards.

--365889209-386149611-1007118803=:11565
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="ready_state.diff"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.33.0111300313230.11565@newbast.lynuxworks.com>
Content-Description: 
Content-Disposition: attachment; filename="ready_state.diff"

ZGlmZiAtdXIgY3ZzL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAw
MS5jIHJlYWR5X3N0YXRlL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMS5jDQotLS0gY3ZzL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMS5jCVR1ZSBPY3QgIDIgMTk6MDU6MTEgMjAwMQ0KKysrIHJlYWR5X3N0
YXRlL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jCVdlZCBO
b3YgMjEgMTI6NTc6MjcgMjAwMQ0KQEAgLTE3MCw4ICsxNzAsMTAgQEANCiAJ
bWFwLT5mbGRydiA9ICZjZmlfaW50ZWxleHRfY2hpcGRydjsNCiAJTU9EX0lO
Q19VU0VfQ09VTlQ7DQogCQ0KKwkvKiBDbGVhciBTdGF0dXMgUmVnaXN0ZXIu
ICovDQorCWNmaV9zZW5kX2dlbl9jbWQoMHg1MCwgMHg1NSwgYmFzZSwgbWFw
LCBjZmksIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOw0KKw0KIAkvKiBNYWtl
IHN1cmUgaXQncyBpbiByZWFkIG1vZGUgKi8NCi0JY2ZpX3NlbmRfZ2VuX2Nt
ZCgweGZmLCAweDU1LCBiYXNlLCBtYXAsIGNmaSwgY2ZpLT5kZXZpY2VfdHlw
ZSwgTlVMTCk7DQogCXJldHVybiBjZmlfaW50ZWxleHRfc2V0dXAobWFwKTsN
CiB9DQogDQpAQCAtNTUxLDEyICs1NTMsMTYgQEANCiAJaWYgKHN0YXR1cyAm
IENNRCgweDAyKSkgew0KIAkJLyogY2xlYXIgc3RhdHVzICovDQogCQljZmlf
d3JpdGUobWFwLCBDTUQoMHg1MCksIGFkcik7DQotCQkvKiBwdXQgYmFjayBp
bnRvIHJlYWQgc3RhdHVzIHJlZ2lzdGVyIG1vZGUgKi8NCi0JCWNmaV93cml0
ZShtYXAsIENNRCgweDcwKSwgYWRyKTsNCisJCS8qIFJldHVybiB0byB0aGUg
cmVhZCBhcnJheSBtb2RlLiAqLw0KKwkJY2ZpX3dyaXRlKG1hcCwgQ01EKDB4
ZmYpLCBhZHIpOw0KKwkJY2hpcC0+c3RhdGUgPSBGTF9SRUFEWTsNCiAJCXdh
a2VfdXAoJmNoaXAtPndxKTsNCiAJCXNwaW5fdW5sb2NrX2JoKGNoaXAtPm11
dGV4KTsNCiAJCXJldHVybiAtRVJPRlM7DQogCX0NCisJLyogUmV0dXJuIHRv
IHRoZSByZWFkIGFycmF5IG1vZGUuICovDQorCWNmaV93cml0ZShtYXAsIENN
RCgweGZmKSwgYWRyKTsNCisJY2hpcC0+c3RhdGUgPSBGTF9SRUFEWTsNCiAJ
d2FrZV91cCgmY2hpcC0+d3EpOw0KIAlzcGluX3VubG9ja19iaChjaGlwLT5t
dXRleCk7DQogCXJldHVybiAwOw0KQEAgLTgzOSwxMiArODQ1LDE2IEBADQog
CWlmIChzdGF0dXMgJiBDTUQoMHgwMikpIHsNCiAJCS8qIGNsZWFyIHN0YXR1
cyAqLw0KIAkJY2ZpX3dyaXRlKG1hcCwgQ01EKDB4NTApLCBjbWRfYWRyKTsN
Ci0JCS8qIHB1dCBiYWNrIGludG8gcmVhZCBzdGF0dXMgcmVnaXN0ZXIgbW9k
ZSAqLw0KLQkJY2ZpX3dyaXRlKG1hcCwgQ01EKDB4NzApLCBhZHIpOw0KKwkJ
LyogUmV0dXJuIHRvIHRoZSByZWFkIGFycmF5IG1vZGUuICovDQorCQljZmlf
d3JpdGUobWFwLCBDTUQoMHhmZiksIGFkcik7DQorCQljaGlwLT5zdGF0ZSA9
IEZMX1JFQURZOw0KIAkJd2FrZV91cCgmY2hpcC0+d3EpOw0KIAkJc3Bpbl91
bmxvY2tfYmgoY2hpcC0+bXV0ZXgpOw0KIAkJcmV0dXJuIC1FUk9GUzsNCiAJ
fQ0KKwkvKiBSZXR1cm4gdG8gdGhlIHJlYWQgYXJyYXkgbW9kZS4gKi8NCisJ
Y2ZpX3dyaXRlKG1hcCwgQ01EKDB4ZmYpLCBhZHIpOw0KKwljaGlwLT5zdGF0
ZSA9IEZMX1JFQURZOw0KIAl3YWtlX3VwKCZjaGlwLT53cSk7DQogCXNwaW5f
dW5sb2NrX2JoKGNoaXAtPm11dGV4KTsNCiAJcmV0dXJuIDA7DQpAQCAtMTA3
Nyw2ICsxMDg3LDEwIEBADQogCQl9DQogCX0NCiANCisJLyogUmV0dXJuIHRv
IHRoZSByZWFkIGFycmF5IG1vZGUuICovDQorCWNmaV93cml0ZShtYXAsIENN
RCgweGZmKSwgYWRyKTsNCisJY2hpcC0+c3RhdGUgPSBGTF9SRUFEWTsNCisN
CiAJd2FrZV91cCgmY2hpcC0+d3EpOw0KIAlzcGluX3VubG9ja19iaChjaGlw
LT5tdXRleCk7DQogCXJldHVybiByZXQ7DQpAQCAtMTMxOSw3ICsxMzMzLDkg
QEANCiAJfQ0KIAkNCiAJLyogRG9uZSBhbmQgaGFwcHkuICovDQotCWNoaXAt
PnN0YXRlID0gRkxfU1RBVFVTOw0KKwkvKiBSZXR1cm4gdG8gdGhlIHJlYWQg
YXJyYXkgbW9kZS4gKi8NCisJY2ZpX3dyaXRlKG1hcCwgQ01EKDB4ZmYpLCBh
ZHIpOw0KKwljaGlwLT5zdGF0ZSA9IEZMX1JFQURZOw0KIAlESVNBQkxFX1ZQ
UChtYXApOw0KIAl3YWtlX3VwKCZjaGlwLT53cSk7DQogCXNwaW5fdW5sb2Nr
X2JoKGNoaXAtPm11dGV4KTsNCkBAIC0xNDY4LDcgKzE0ODQsOSBAQA0KIAl9
DQogCQ0KIAkvKiBEb25lIGFuZCBoYXBweS4gKi8NCi0JY2hpcC0+c3RhdGUg
PSBGTF9TVEFUVVM7DQorCS8qIFJldHVybiB0byB0aGUgcmVhZCBhcnJheSBt
b2RlLiAqLw0KKwljZmlfd3JpdGUobWFwLCBDTUQoMHhmZiksIGFkcik7DQor
CWNoaXAtPnN0YXRlID0gRkxfUkVBRFk7DQogCURJU0FCTEVfVlBQKG1hcCk7
DQogCXdha2VfdXAoJmNoaXAtPndxKTsNCiAJc3Bpbl91bmxvY2tfYmgoY2hp
cC0+bXV0ZXgpOw0K
--365889209-386149611-1007118803=:11565--
