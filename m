Received: from out4.smtp.messagingengine.com ([66.111.4.28])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ex8tz-0006VX-QE
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2006 20:18:32 +0000
Received: from frontend1.internal (mysql-sessions.internal [10.202.2.149])
	by frontend1.messagingengine.com (Postfix) with ESMTP id 814E2D2F23D
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jan 2006 15:18:14 -0500 (EST)
Message-Id: <1137097087.13427.251724548@webmail.messagingengine.com>
From: "Rod Whitby" <rod@whitby.id.au>
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: multipart/mixed; boundary="_----------=_1137097087134270";
	charset="ISO-8859-1"
MIME-Version: 1.0
Date: Fri, 13 Jan 2006 06:48:07 +1030
Subject: [PATCH]: Make JFFS2 endianness configurable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_1137097087134270
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
X-Mailer: MIME::Lite 1.5  (F2.73; T1.15; A1.64; B3.05; Q3.03)
Date: Thu, 12 Jan 2006 20:18:07 UT

This patch allows the endianness of the JFSS2 filesystem to be
specified by config options.  It was discussed with dwmw2 on IRC.

It defaults to native-endian (the previously hard-coded option).

Some architectures (in particular, the NSLU2) benefit from having a
single known endianness of JFFS2 filesystem (for data, not
executables) independent of the endianness of the processor (ARM
processors can be switched to either endianness at run-time).

Signed-off-by: Rod Whitby <rod@whitby.id.au>

[Attached instead of inline due to mailer wrapping incorrectly.
 Apologies in advance for any inconvenience caused by this.]

-- Rod Whitby
-- NSLU2-Linux project lead

--_----------=_1137097087134270
Content-Disposition: attachment; filename="15-jffs2-endian-config.patch"
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream; name="15-jffs2-endian-config.patch"
MIME-Version: 1.0
X-Mailer: MIME::Lite 1.5  (F2.73; T1.15; A1.64; B3.05; Q3.03)
Date: Thu, 12 Jan 2006 20:18:07 UT

LS0tIGxpbnV4LTIuNi4xNS9mcy9LY29uZmlnfgkyMDA2LTAxLTAzIDEzOjUx
OjEwLjAwMDAwMDAwMCArMTAzMA0KKysrIGxpbnV4LTIuNi4xNS9mcy9LY29u
ZmlnCTIwMDYtMDEtMDUgMDE6MzU6MzYuMDAwMDAwMDAwICsxMDMwDQpAQCAt
MTEzMiw2ICsxMTMyLDMxIEBAIGNvbmZpZyBKRkZTMl9DTU9ERV9TSVpFDQog
DQogZW5kY2hvaWNlDQogDQorY2hvaWNlDQorICAgICAgICBwcm9tcHQgIkpG
RlMyIGVuZGlhbm5lc3MiDQorICAgICAgICBkZWZhdWx0IEpGRlMyX05BVElW
RV9FTkRJQU4NCisgICAgICAgIGRlcGVuZHMgb24gSkZGUzJfRlMNCisgICAg
ICAgIGhlbHANCisgICAgICAgICAgWW91IGNhbiBzZXQgaGVyZSB0aGUgZGVm
YXVsdCBlbmRpYW5uZXNzIG9mIEpGRlMyIGZyb20NCisgICAgICAgICAgdGhl
IGF2YWlsYWJsZSBvcHRpb25zLiBEb24ndCB0b3VjaCBpZiB1bnN1cmUuDQor
DQorY29uZmlnIEpGRlMyX05BVElWRV9FTkRJQU4NCisgICAgICAgIGJvb2wg
Im5hdGl2ZSBlbmRpYW4iDQorICAgICAgICBoZWxwDQorICAgICAgICAgIFVz
ZXMgYSBuYXRpdmUgZW5kaWFuIGJ5dGVzdHJlYW0uDQorDQorY29uZmlnIEpG
RlMyX0JJR19FTkRJQU4NCisgICAgICAgIGJvb2wgImJpZyBlbmRpYW4iDQor
ICAgICAgICBoZWxwDQorICAgICAgICAgIFVzZXMgYSBiaWcgZW5kaWFuIGJ5
dGVzdHJlYW0uDQorDQorY29uZmlnIEpGRlMyX0xJVFRMRV9FTkRJQU4NCisg
ICAgICAgIGJvb2wgImxpdHRsZSBlbmRpYW4iDQorICAgICAgICBoZWxwDQor
ICAgICAgICAgIFVzZXMgYSBsaXR0bGUgZW5kaWFuIGJ5dGVzdHJlYW0uDQor
DQorZW5kY2hvaWNlDQorDQogY29uZmlnIENSQU1GUw0KIAl0cmlzdGF0ZSAi
Q29tcHJlc3NlZCBST00gZmlsZSBzeXN0ZW0gc3VwcG9ydCAoY3JhbWZzKSIN
CiAJc2VsZWN0IFpMSUJfSU5GTEFURQ0KLS0tIGxpbnV4LTIuNi4xNS9mcy9q
ZmZzMi9ub2RlbGlzdC5ofgkyMDA2LTAxLTA1IDAxOjM3OjA2LjAwMDAwMDAw
MCArMTAzMA0KKysrIGxpbnV4LTIuNi4xNS9mcy9qZmZzMi9ub2RlbGlzdC5o
CTIwMDYtMDEtMDUgMDE6Mzc6NTQuMDAwMDAwMDAwICsxMDMwDQpAQCAtMjks
MTIgKzI5LDEwIEBADQogI2luY2x1ZGUgIm9zLWxpbnV4LmgiDQogI2VuZGlm
DQogDQotI2RlZmluZSBKRkZTMl9OQVRJVkVfRU5ESUFODQotDQogLyogTm90
ZSB3ZSBoYW5kbGUgbW9kZSBiaXRzIGNvbnZlcnNpb24gZnJvbSBKRkZTMiAo
aS5lLiBMaW51eCkgdG8vZnJvbQ0KICAgIHdoYXRldmVyIE9TIHdlJ3JlIGFj
dHVhbGx5IHJ1bm5pbmcgb24gaGVyZSB0b28uICovDQogDQotI2lmIGRlZmlu
ZWQoSkZGUzJfTkFUSVZFX0VORElBTikNCisjaWYgZGVmaW5lZChDT05GSUdf
SkZGUzJfTkFUSVZFX0VORElBTikNCiAjZGVmaW5lIGNwdV90b19qZTE2KHgp
ICgoamludDE2X3Qpe3h9KQ0KICNkZWZpbmUgY3B1X3RvX2plMzIoeCkgKChq
aW50MzJfdCl7eH0pDQogI2RlZmluZSBjcHVfdG9famVtb2RlKHgpICgoam1v
ZGVfdCl7b3NfdG9famZmczJfbW9kZSh4KX0pDQpAQCAtNDIsNyArNDAsNyBA
QA0KICNkZWZpbmUgamUxNl90b19jcHUoeCkgKCh4KS52MTYpDQogI2RlZmlu
ZSBqZTMyX3RvX2NwdSh4KSAoKHgpLnYzMikNCiAjZGVmaW5lIGplbW9kZV90
b19jcHUoeCkgKGpmZnMyX3RvX29zX21vZGUoKHgpLm0pKQ0KLSNlbGlmIGRl
ZmluZWQoSkZGUzJfQklHX0VORElBTikNCisjZWxpZiBkZWZpbmVkKENPTkZJ
R19KRkZTMl9CSUdfRU5ESUFOKQ0KICNkZWZpbmUgY3B1X3RvX2plMTYoeCkg
KChqaW50MTZfdCl7Y3B1X3RvX2JlMTYoeCl9KQ0KICNkZWZpbmUgY3B1X3Rv
X2plMzIoeCkgKChqaW50MzJfdCl7Y3B1X3RvX2JlMzIoeCl9KQ0KICNkZWZp
bmUgY3B1X3RvX2plbW9kZSh4KSAoKGptb2RlX3Qpe2NwdV90b19iZTMyKG9z
X3RvX2pmZnMyX21vZGUoeCkpfSkNCkBAIC01MCw3ICs0OCw3IEBADQogI2Rl
ZmluZSBqZTE2X3RvX2NwdSh4KSAoYmUxNl90b19jcHUoeC52MTYpKQ0KICNk
ZWZpbmUgamUzMl90b19jcHUoeCkgKGJlMzJfdG9fY3B1KHgudjMyKSkNCiAj
ZGVmaW5lIGplbW9kZV90b19jcHUoeCkgKGJlMzJfdG9fY3B1KGpmZnMyX3Rv
X29zX21vZGUoKHgpLm0pKSkNCi0jZWxpZiBkZWZpbmVkKEpGRlMyX0xJVFRM
RV9FTkRJQU4pDQorI2VsaWYgZGVmaW5lZChDT05GSUdfSkZGUzJfTElUVExF
X0VORElBTikNCiAjZGVmaW5lIGNwdV90b19qZTE2KHgpICgoamludDE2X3Qp
e2NwdV90b19sZTE2KHgpfSkNCiAjZGVmaW5lIGNwdV90b19qZTMyKHgpICgo
amludDMyX3Qpe2NwdV90b19sZTMyKHgpfSkNCiAjZGVmaW5lIGNwdV90b19q
ZW1vZGUoeCkgKChqbW9kZV90KXtjcHVfdG9fbGUzMihvc190b19qZmZzMl9t
b2RlKHgpKX0pDQo=

--_----------=_1137097087134270--
