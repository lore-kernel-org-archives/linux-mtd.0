Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6pIY-00010m-Rm
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 07:19:23 -0500
Date: Thu, 3 Mar 2005 12:19:14 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Kevin Liao <kevinliao@wellsyn.com>
In-Reply-To: <027b01c51fe8$7f7624d0$1b0a060a@WellSyn.org>
Message-ID: <Pine.LNX.4.58.0503031217170.26599@phoenix.infradead.org>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
	<Pine.LNX.4.58.0503031136030.26599@phoenix.infradead.org>
	<027b01c51fe8$7f7624d0$1b0a060a@WellSyn.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1456859747-47218541-1109852354=:26599"
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: compile error (undefined reference to jffs2_getlink) for kernel
 2.4.26
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--1456859747-47218541-1109852354=:26599
Content-Type: TEXT/PLAIN; charset=US-ASCII

Kevin Liao wrote:
> You do not need to be sorry at all.
Ok, but I should have been more accurate.

Here is the patch I propose. I didn't test it and didn't compile. Please 
try it. The idea is simple: f->dents contains the target link and you only 
need take it from there.

Please, report if the patch works and we might commit it.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
--1456859747-47218541-1109852354=:26599
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="jffs2_symlink-01-c24.diff"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0503031219140.26599@phoenix.infradead.org>
Content-Description: 
Content-Disposition: attachment; filename="jffs2_symlink-01-c24.diff"

LS0tIHN5bWxpbmstdjI0LmMJMjAwNS0wMy0wMyAxNToxMzoyMS4yMjc4MjEy
MTUgKzAzMDANCisrKyBzeW1saW5rLXYyNF90d2Vha2VkLmMJMjAwNS0wMy0w
MyAxNToxNTozMS40NTcyOTEyMDcgKzAzMDANCkBAIC0yNywxMiArMjcsMzQg
QEANCiAJLnNldGF0dHIgPQlqZmZzMl9zZXRhdHRyDQogfTsNCiANCitzdGF0
aWMgaW5saW5lIGNoYXIgKiBqZmZzMl9wcm92aWRlX2xpbmsoc3RydWN0IGpm
ZnMyX3NiX2luZm8gKmMsIHN0cnVjdCBqZmZzMl9pbm9kZV9pbmZvICpmKQ0K
K3sNCisJdW5zaWduZWQgY2hhciAqa2J1ZiA9IGttYWxsb2MoZi0+bWV0YWRh
dGEtPnNpemUgKyAxLCBHRlBfVVNFUik7DQorCQ0KKwlpZiAoIWtidWYpIHsN
CisJCXByaW50ayhLRVJOX0VSUiAiamZmczJfcHJvdmlkZV9saW5rKCk6IGNh
bid0IGFsbG9jYXRlIG1lbW9yeSBmb3Igc3ltbGluayB0YXJnZXRcbiIpOw0K
KwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQorCX0NCisJDQorCWlmICgh
Zi0+ZGVudHMpIHsNCisJCXByaW50ayhLRVJOX0VSUiAiamZmczJfcHJvdmlk
ZV9saW5rKCk6IGNhbid0IGZpbmQgc3ltbGluayB0YXJnZXRcbiIpOw0KKwkJ
cmV0dXJuIEVSUl9QVFIoLUVJTyk7DQorCX0NCisJDQorCUQxKHByaW50ayhL
RVJOX0RFQlVHICJqZmZzMl9wcm92aWRlX2xpbmsoKTogdGFyZ2V0IHBhdGgg
aXMgJyVzJ1xuIiwgKGNoYXIgKikgZi0+ZGVudHMpKTsNCisNCisJbWVtY3B5
KGtidWYsIChjaGFyICopIGYtPmRlbnRzLCBmLT5tZXRhZGF0YS0+c2l6ZSAr
IDEpOw0KKwlidWZbZi0+bWV0YWRhdGEtPnNpemUgKyAxXSA9ICdcMCc7DQor
DQorCXJldHVybiBidWY7DQorfQ0KKw0KIGludCBqZmZzMl9yZWFkbGluayhz
dHJ1Y3QgZGVudHJ5ICpkZW50cnksIGNoYXIgKmJ1ZmZlciwgaW50IGJ1Zmxl
bikNCiB7DQogCXVuc2lnbmVkIGNoYXIgKmtidWY7DQogCWludCByZXQ7DQog
DQotCWtidWYgPSBqZmZzMl9nZXRsaW5rKEpGRlMyX1NCX0lORk8oZGVudHJ5
LT5kX2lub2RlLT5pX3NiKSwgSkZGUzJfSU5PREVfSU5GTyhkZW50cnktPmRf
aW5vZGUpKTsNCisJa2J1ZiA9IGpmZnMyX3Byb3ZpZGVfbGluayhKRkZTMl9T
Ql9JTkZPKGRlbnRyeS0+ZF9pbm9kZS0+aV9zYiksIEpGRlMyX0lOT0RFX0lO
Rk8oZGVudHJ5LT5kX2lub2RlKSk7DQogCWlmIChJU19FUlIoa2J1ZikpDQog
CQlyZXR1cm4gUFRSX0VSUihrYnVmKTsNCiANCkBAIC00Niw3ICs2OCw3IEBA
DQogCXVuc2lnbmVkIGNoYXIgKmJ1ZjsNCiAJaW50IHJldDsNCiANCi0JYnVm
ID0gamZmczJfZ2V0bGluayhKRkZTMl9TQl9JTkZPKGRlbnRyeS0+ZF9pbm9k
ZS0+aV9zYiksIEpGRlMyX0lOT0RFX0lORk8oZGVudHJ5LT5kX2lub2RlKSk7
DQorCWJ1ZiA9IGpmZnMyX3Byb3ZpZGVfbGluayhKRkZTMl9TQl9JTkZPKGRl
bnRyeS0+ZF9pbm9kZS0+aV9zYiksIEpGRlMyX0lOT0RFX0lORk8oZGVudHJ5
LT5kX2lub2RlKSk7DQogDQogCWlmIChJU19FUlIoYnVmKSkNCiAJCXJldHVy
biBQVFJfRVJSKGJ1Zik7DQo=

--1456859747-47218541-1109852354=:26599--
