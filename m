Received: from [211.210.107.120] (helo=palmpalm.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JZTS-0007nl-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 13:21:59 +0000
Received: from tium ( [192.168.1.87] (may be forged))
	by palmpalm.com (8.11.6/8.11.6) with SMTP id gB4E1mk10268
	for <linux-mtd@lists.infradead.org>; Wed, 4 Dec 2002 23:01:49 +0900
From: "Taeil Um" <tium@mail.palmpalm.com>
To: <linux-mtd@lists.infradead.org>
Subject: fail to mount MTD (NAND) as root file system
Date: Wed, 4 Dec 2002 22:54:06 +0900
Message-ID: <BDEDIOGGNJEEPBHLJLFGAEDPCEAA.tium@palmpalm.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
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

SSBzdWNjZWVkZWQgdG8gYWNjZXNzIGFuZCBtb3VudCBOQU5EIGZsYXNoIChKRkZTMiBvbiBNVEQp
Lg0KQnV0IGlzIHdhcyBub3QgYSByb290IGZpbGUgc3lzdGVtLg0KDQpXaGVuIGkgdHJpZWQgbW91
bnQgdGhlIE5BTkQgZmxhc2ggYXMgYSByb290IGZpbGUgc3lzdGVtLCBpIHN1Y2NlZWRlZCBmb3Ig
dGhlIGZpcnN0IHRpbWUuDQoNCkJ1dCBpZiBpIHJlYm9vdCB0aGUgc3lzdGVtIGFuZCBtb3VudCBO
QU5EIGZsYXNoIGFzIGEgcm9vdCBmaWxlIHN5c3RlbSBhZ2FpbiwNCmkgZ290IGEgS0VSTkVMLU9P
UFMgYXMgYmVsbG93DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KVkZTOiBNb3VudGVkIHJvb3QgKGV4dDIgZmlsZXN5c3RlbSkuDQpWRlM6
IE1vdW50ZWQgcm9vdCAoamZmczIgZmlsZXN5c3RlbSkuDQpVbmFibGUgdG8gaGFuZGxlIGtlcm5l
bCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAzDQpw
Z2QgPSBjMDAyNDAwMA0KKnBnZCA9IDAwMDAwMDAwLCAqcG1kID0gMDAwMDAwMDANCkludGVybmFs
IGVycm9yOiBPb3BzOiBmZmZmZmZmZg0KQ1BVOiAwDQpwYyA6IFs8YzAwNTU2Njg+XSAgICBsciA6
IFs8YzAwMDYwMDA+XSAgICBOb3QgdGFpbnRlZA0Kc3AgOiBjMDAxZmU2YyAgaXAgOiBmZmZmZmZm
ZiAgZnAgOiBjMDAxZmU4OA0KcjEwOiBjMWQ0MTAwMCAgcjkgOiBjMDE3Mjc0YyAgcjggOiAwMDAw
MDAwMw0KcjcgOiA2MDAwMDAxMyAgcjYgOiBjMDIwZjIxOCAgcjUgOiAwMDAwMDFmMCAgcjQgOiBj
MDIwZjIxMA0KcjMgOiBmZmZmZmZmZiAgcjIgOiBmZmZmZmZmZiAgcjEgOiBmZmZmZmZmZiAgcjAg
OiBmZmZmZmZiZg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkFuZCB0aGUgamZmczIgZmlsZSBzeXN0ZW1zIGFyZSBj
b3JydXB0ZWQgb24gTkFORCBmbGFzaC4NCkRvZXMgYW55Ym9keSBoYXZlIHNhbWUgZXhwZXJpZW5j
ZT8NCg0KRm9sbG93aW5ncyBhcmUgbXkgc3lzdGVtIHNwZWMuDQoJQ1BVIDogRVA3MzEyDQoJU0RS
QU0gOiAzMk0NCglOT1IgRkxBU0ggOiA4TQ0KCU5BTkQgRkxBU0ggOiAxNk0gKHNhbXN1bmcgMTZi
aXQgTkFORCBmbGFzaCkNCglLZXJuZWwgOiAyLjQuMTgtcm1rNg0KCU1URCBwYXRjaCA6IDIwMDIu
MTEuMjkgZnJvbSBNVEQgQ1ZTDQoJQ3Jvc3MgQ29tcGlsZXIgOiBhcm0tbGludXggKDIuOTUuMykN
Cg0KDQoNCg0KDQoNClRoYW5rcyBhbGwgIQ0KDQoNCg0K
