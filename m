Received: from onz.com ([67.121.61.113] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UKVM-0003Rw-1n
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2003 07:08:40 +0100
Message-Id: <5.2.1.1.0.20030622225659.00a46a30@192.168.1.10>
Date: Sun, 22 Jun 2003 22:58:28 -0700
To: Infradead Org <linux-mtd@lists.infradead.org>
From: Allen Curtis <acurtis@onz.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====================_25429890==_"
Subject: JFFS patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=====================_25429890==_
Content-Type: text/plain; charset="us-ascii"; format=flowed

Patch for updating JFFS in 2.4.20 kernel
--=====================_25429890==_
Content-Type: application/octet-stream; name="jffs.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="jffs.patch"

ZGlmZiAtcnUgZnMvamZmcy9pbm9kZS12MjMuYyAuLi90aGFsZXMvbGludXhwcGMvZnMvamZmcy9p
bm9kZS12MjMuYwotLS0gZnMvamZmcy9pbm9kZS12MjMuYwlUaHUgTWFyIDEzIDAyOjA0OjUyIDIw
MDMKKysrIC4uL3RoYWxlcy9saW51eHBwYy9mcy9qZmZzL2lub2RlLXYyMy5jCVN1biBKdW4gMjIg
MjI6MzE6MzcgMjAwMwpAQCAtNTksNyArNTksNyBAQAogI2luY2x1ZGUgImpmZnNfcHJvYy5oIgog
I2VuZGlmCiAKLSNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPCBLRVJORUxfVkVSU0lPTigyLDUsMikK
KyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPCBLRVJORUxfVkVSU0lPTigyLDQsMjApCiAjZGVmaW5l
IG1pbm9yKHgpIE1JTk9SKHgpCiAjZGVmaW5lIG1ham9yKHgpIE1BSk9SKHgpCiAjZW5kaWYKT25s
eSBpbiAuLi90aGFsZXMvbGludXhwcGMvZnMvamZmczogaW5vZGUtdjIzLmN+CmRpZmYgLXJ1IGZz
L2pmZnMvaW50cmVwLmMgLi4vdGhhbGVzL2xpbnV4cHBjL2ZzL2pmZnMvaW50cmVwLmMKLS0tIGZz
L2pmZnMvaW50cmVwLmMJVHVlIE1hciAgNSAwNjowNzozOSAyMDAyCisrKyAuLi90aGFsZXMvbGlu
dXhwcGMvZnMvamZmcy9pbnRyZXAuYwlTdW4gSnVuIDIyIDIyOjMxOjM3IDIwMDMKQEAgLTcxLDYg
KzcxLDggQEAKICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxpbnV4L2N0eXBl
Lmg+CiAKKyNpbmNsdWRlIDxsaW51eC9tdGQvY29tcGF0bWFjLmg+CisKICNpbmNsdWRlICJpbnRy
ZXAuaCIKICNpbmNsdWRlICJqZmZzX2ZtLmgiCiAKQEAgLTM0MjcsNyArMzQyOSw4IEBACiAJCQl1
bnNpZ25lZCBsb25nIHNpZ25yOwogCiAJCQlzcGluX2xvY2tfaXJxKCZjdXJyZW50LT5zaWdtYXNr
X2xvY2spOwotCQkJc2lnbnIgPSBkZXF1ZXVlX3NpZ25hbCgmY3VycmVudC0+YmxvY2tlZCwgJmlu
Zm8pOworCQkJc2lnbnIgPSBkZXF1ZXVlX3NpZ25hbChjdXJyZW50LCAmY3VycmVudC0+YmxvY2tl
ZCwgJmluZm8pOworLyoJCQlzaWduciA9IGRlcXVldWVfc2lnbmFsKCZjdXJyZW50LT5ibG9ja2Vk
LCAmaW5mbyk7Ki8KIAkJCXNwaW5fdW5sb2NrX2lycSgmY3VycmVudC0+c2lnbWFza19sb2NrKTsK
IAogCQkJc3dpdGNoKHNpZ25yKSB7CmRpZmYgLXJ1IGZzL2pmZnMvamZmc19mbS5jIC4uL3RoYWxl
cy9saW51eHBwYy9mcy9qZmZzL2pmZnNfZm0uYwotLS0gZnMvamZmcy9qZmZzX2ZtLmMJVHVlIEph
biAyMiAwMTo0ODoxNiAyMDAyCisrKyAuLi90aGFsZXMvbGludXhwcGMvZnMvamZmcy9qZmZzX2Zt
LmMJU3VuIEp1biAyMiAyMjozMTozNyAyMDAzCkBAIC0yMyw3ICsyMyw3IEBACiAjaW5jbHVkZSA8
bGludXgvY29tcGF0bWFjLmg+CiAjaW5jbHVkZSAiamZmc19mbS5oIgogCi0jaWYgTElOVVhfVkVS
U0lPTl9DT0RFIDwgS0VSTkVMX1ZFUlNJT04oMiw1LDIpCisjaWYgTElOVVhfVkVSU0lPTl9DT0RF
IDwgS0VSTkVMX1ZFUlNJT04oMiw0LDIwKQogI2RlZmluZSBtaW5vcih4KSBNSU5PUih4KQogI2Rl
ZmluZSBtYWpvcih4KSBNQUpPUih4KQogI2VuZGlmCg==
--=====================_25429890==_
Content-Type: text/plain; charset="us-ascii"; format=flowed


--=====================_25429890==_--
