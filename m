Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68B3C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XSrS/AZa1YX8M+4YzIhoSUxF8tNPRNjJs5Z3VUfj9JA=; b=oJoVCpOMWpYjkY
	ZDPRzrw4hnJ+R2hioBQ2n15mbZOdOhqqwGTN/6hRR2dVZJF9dBI+X6o9v8J3sofiBM8Atbf0w1pg1
	zTXs9f4DoP134J1Ee/dACYQcgpkhOIcsr3Jzl7s1c+/oDYOpeoIC7U1NDDg6NW/OItpw2Bz/FDX92
	devkRVc0VG3TCNUruqjv5saTDqzQPlT5DN5d9mIrzpgdZH+bHoZvvs5dUFKFlKKM9dJnKPjUWhNOy
	dtA1gRG8MTago326AGAFkX6vmYvHnKbIC/M1QsnmN1OmnsEAutdacuOj1hl0ybhrcpnTORq1x0P+A
	D1VWraCVv78L42CiFBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9WTZ-00HRQY-F4; Thu, 07 Jul 2022 18:43:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9WTW-00HRNI-Rh
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 18:43:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B12E6225E;
	Thu,  7 Jul 2022 18:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFFBC3411E;
	Thu,  7 Jul 2022 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657219419;
	bh=X91w2s3hUBEJKzueE4a8QnnBJdFZ4qmysMaFWqtieW8=;
	h=From:To:Cc:Subject:Date:From;
	b=RaYdur2UIQSvJZV5FQkxANnCQt0U0P0pzQmezpzqVeElD3fyiyWi5oueWfNNKCPoy
	 WuClWYYENFBlKMAjZnxj3838d6FtG58MNDul78DsgAfmnXRA44qqtLONw+ozeT3CFG
	 B1jR3HFVGJ/C5yuxgWQ6ALKXSds5lXEC2RdtcOoFpUvkQ+/yJOVpqL6ep40vaBOFkC
	 Ie2ov+8Rx6yYiY/Q6j7Y0mUmFZDhc3JyyhJyeCmAcwAydKKnxYKBAc8q9v/G+Nflp2
	 nXzJ/MORl7D6V68xPONc6ywJdgF+zvBRMx3TmlAXkTKZVeT0XbrcoagbmgjPAoKk97
	 zVENHjZIjlkAg==
Received: by pali.im (Postfix)
	id AC6DE7B1; Thu,  7 Jul 2022 20:43:36 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fsl_elbc: Fix none ECC mode
Date: Thu,  7 Jul 2022 20:43:28 +0200
Message-Id: <20220707184328.3845-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_114343_017725_BBEB3988 
X-CRM114-Status: GOOD (  16.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q29tbWl0IGY2NDI0YzIyYWEzNiAoIm10ZDogcmF3bmFuZDogZnNsX2VsYmM6IE1ha2UgU1cgRUND
IHdvcmsiKSBhZGRlZApzdXBwb3J0IGZvciBzcGVjaWZ5aW5nIEVDQyBtb2RlIHZpYSBEVFMgYW5k
IHNraXBwaW5nIGF1dG9kZXRlY3Rpb24uCgpCdXQgaXQgYnJva2UgZXhwbGljaXQgc3BlY2lmaWNh
dGlvbiBvZiBIVyBFQ0MgbW9kZSBpbiBEVFMgYXMgY29ycmVjdApzZXR0aW5ncyBmb3IgSFcgRUND
IG1vZGUgYXJlIGFwcGxpZWQgb25seSB3aGVuIE5PTkUgbW9kZSBvciBub3RoaW5nIHdhcwpzcGVj
aWZpZWQgaW4gRFRTIGZpbGUuCgpBbHNvIGl0IHN0YXJ0ZWQgYWxpYXNpbmcgTk9ORSBtb2RlIHRv
IGJlIHNhbWUgYXMgd2hlbiBFQ0MgbW9kZSB3YXMgbm90CnNwZWNpZmllZCBhbmQgZGlzYWxsb3dl
ZCB1c2FnZSBvZiBPTl9ESUUgbW9kZS4KCkZpeCBhbGwgdGhlc2UgaXNzdWVzLiBVc2UgYXV0b2Rl
dGVjdGlvbiBvZiBFQ0MgbW9kZSBvbmx5IGluIGNhc2Ugd2hlbiBtb2RlCndhcyByZWFsbHkgbm90
IHNwZWNpZmllZCBpbiBEVFMgZmlsZSBieSBjaGVja2luZyB0aGF0IGVjYyB2YWx1ZSBpcyBpbnZh
bGlkLgpTZXQgSFcgRUNDIHNldHRpbmdzIGVpdGhlciB3aGVuIEhXIEVDQyB3YXMgc3BlY2lmaWVk
IGluIERUUyBvciBpdCB3YXMKYXV0b2RldGVjdGVkLiBBbmQgZG8gbm90IGZhaWwgd2hlbiBPTl9E
SUUgbW9kZSBpcyBzZXQuCgpGaXhlczogZjY0MjRjMjJhYTM2ICgibXRkOiByYXduYW5kOiBmc2xf
ZWxiYzogTWFrZSBTVyBFQ0Mgd29yayIpClNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxp
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jIHwg
MjggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2ZzbF9lbGJjX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9lbGJjX25hbmQu
YwppbmRleCBhYWI5M2I5ZTYwNTIuLmExOGQxMjEzOTZhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Zz
bF9lbGJjX25hbmQuYwpAQCAtNzI2LDM2ICs3MjYsNDAgQEAgc3RhdGljIGludCBmc2xfZWxiY19h
dHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQogCXN0cnVjdCBmc2xfbGJjX3JlZ3Mg
X19pb21lbSAqbGJjID0gY3RybC0+cmVnczsKIAl1bnNpZ25lZCBpbnQgYWw7CiAKLQlzd2l0Y2gg
KGNoaXAtPmVjYy5lbmdpbmVfdHlwZSkgewogCS8qCiAJICogaWYgRUNDIHdhcyBub3QgY2hvc2Vu
IGluIERULCBkZWNpZGUgd2hldGhlciB0byB1c2UgSFcgb3IgU1cgRUNDIGZyb20KIAkgKiBDUyBC
YXNlIFJlZ2lzdGVyCiAJICovCi0JY2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9OT05FOgorCWlm
IChjaGlwLT5lY2MuZW5naW5lX3R5cGUgPT0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfSU5WQUxJRCkg
ewogCQkvKiBJZiBDUyBCYXNlIFJlZ2lzdGVyIHNlbGVjdHMgZnVsbCBoYXJkd2FyZSBFQ0MgdGhl
biB1c2UgaXQgKi8KIAkJaWYgKChpbl9iZTMyKCZsYmMtPmJhbmtbcHJpdi0+YmFua10uYnIpICYg
QlJfREVDQykgPT0KIAkJICAgIEJSX0RFQ0NfQ0hLX0dFTikgewotCQkJY2hpcC0+ZWNjLnJlYWRf
cGFnZSA9IGZzbF9lbGJjX3JlYWRfcGFnZTsKLQkJCWNoaXAtPmVjYy53cml0ZV9wYWdlID0gZnNs
X2VsYmNfd3JpdGVfcGFnZTsKLQkJCWNoaXAtPmVjYy53cml0ZV9zdWJwYWdlID0gZnNsX2VsYmNf
d3JpdGVfc3VicGFnZTsKLQogCQkJY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5H
SU5FX1RZUEVfT05fSE9TVDsKLQkJCW10ZF9zZXRfb29ibGF5b3V0KG10ZCwgJmZzbF9lbGJjX29v
YmxheW91dF9vcHMpOwotCQkJY2hpcC0+ZWNjLnNpemUgPSA1MTI7Ci0JCQljaGlwLT5lY2MuYnl0
ZXMgPSAzOwotCQkJY2hpcC0+ZWNjLnN0cmVuZ3RoID0gMTsKIAkJfSBlbHNlIHsKIAkJCS8qIG90
aGVyd2lzZSBmYWxsIGJhY2sgdG8gZGVmYXVsdCBzb2Z0d2FyZSBFQ0MgKi8KIAkJCWNoaXAtPmVj
Yy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7CiAJCQljaGlwLT5lY2Mu
YWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsKIAkJfQorCX0KKworCXN3aXRjaCAoY2hpcC0+
ZWNjLmVuZ2luZV90eXBlKSB7CisJLyogaWYgSFcgRUNDIHdhcyBjaG9zZW4sIHNldHVwIGVjYyBh
bmQgb29iIGxheW91dCAqLworCWNhc2UgTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVDoKKwkJ
Y2hpcC0+ZWNjLnJlYWRfcGFnZSA9IGZzbF9lbGJjX3JlYWRfcGFnZTsKKwkJY2hpcC0+ZWNjLndy
aXRlX3BhZ2UgPSBmc2xfZWxiY193cml0ZV9wYWdlOworCQljaGlwLT5lY2Mud3JpdGVfc3VicGFn
ZSA9IGZzbF9lbGJjX3dyaXRlX3N1YnBhZ2U7CisJCW10ZF9zZXRfb29ibGF5b3V0KG10ZCwgJmZz
bF9lbGJjX29vYmxheW91dF9vcHMpOworCQljaGlwLT5lY2Muc2l6ZSA9IDUxMjsKKwkJY2hpcC0+
ZWNjLmJ5dGVzID0gMzsKKwkJY2hpcC0+ZWNjLnN0cmVuZ3RoID0gMTsKIAkJYnJlYWs7CiAKLQkv
KiBpZiBTVyBFQ0Mgd2FzIGNob3NlbiBpbiBEVCwgd2UgZG8gbm90IG5lZWQgdG8gc2V0IGFueXRo
aW5nIGhlcmUgKi8KKwkvKiBpZiBub25lIG9yIFNXIEVDQyB3YXMgY2hvc2VuLCB3ZSBkbyBub3Qg
bmVlZCB0byBzZXQgYW55dGhpbmcgaGVyZSAqLworCWNhc2UgTkFORF9FQ0NfRU5HSU5FX1RZUEVf
Tk9ORToKIAljYXNlIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ6CisJY2FzZSBOQU5EX0VDQ19F
TkdJTkVfVFlQRV9PTl9ESUU6CiAJCWJyZWFrOwogCi0JLyogc2hvdWxkIHdlIGFsc28gaW1wbGVt
ZW50ICpfRUNDX0VOR0lORV9DT05UUk9MTEVSIHRvIGRvIGFzIGFib3ZlPyAqLwogCWRlZmF1bHQ6
CiAJCXJldHVybiAtRUlOVkFMOwogCX0KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
