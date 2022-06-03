Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D37CCA473
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Tdw9+JzzO2egO01cBvh0ypD17+SG/Jl3Mk0DNnoxDk=; b=utzu88rK8wiGvp
	Z15gTUEzyqTPOBYO0Ic5LZf85GaEj7y9DMGrYIgrKNzg+BlZNkEYGJ0PlCQ85ohjUz46yYiXXGo00
	PxoKbwDTAFXAJnBHqZ5c6yTykcWeqYLUzkbpJeMk6eQTK0EEVQw4nzxN2ADRawqhoXFCSMgJOI2/r
	CTr2xSWAYreEND/fSPV35wkoVZUFeJiOTe7ff/FaDmzi9x5p8f3fMMJttEH9KEfmDru8hgucI5ZgR
	tmmh00R6FSg6ltYOgfnlZjpy+bU/mMSwpsBEaDqDsPCWwAsjVqOG2rFc7MRnLlsU2QTyXYJdotLdf
	ZIE+5qAp3YsO2bQVe8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWr-008h1m-7f; Fri, 03 Jun 2022 21:08:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxEWl-008gvl-BF
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 21:08:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-0003qm-OL; Fri, 03 Jun 2022 23:08:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWb-006Hpp-Pk; Fri, 03 Jun 2022 23:08:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nxEWZ-00E1H8-Cn; Fri, 03 Jun 2022 23:08:03 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH 01/14] mtd: hyperbus: Make hyperbus_unregister_device() return void
Date: Fri,  3 Jun 2022 23:07:45 +0200
Message-Id: <20220603210758.148493-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3486; i=uwe@kleine-koenig.org; h=from:subject; bh=XTLNQtW/QRVnQ5lwip2/uVSloTA13Pt5zGBaRMhevm4=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMSTNKj+RMFv6yYJ7aQ8MbF0LXKN3cjzve77MruZeM+vUr5bf bcwfdzIaszAwcjHIiimy1BVpiU2QWPPfrmQJN8wgViaQKQxcnAIwEZ4GDobOSyfmKsgvzznhE5AVwi GZGfdnt9VGBss1i7XdfXvkfmzdXhy8YnpYj/Kb7RoLuievmOjDYaeruPbUF/7GvvfO0y8XL2lN7eyJ 6tvW+U95143QwLM/gopOh1Uoqk0wtK8Pqra43h7G7XHGOn9JsaGffk6kfPfEyY89K71S66892GvJJW bzM/CUuXLffSFNvWj2nKCjmnOvLLhk/6G8fMknSc2wd8z3t5XM5ovRj13CUD07/K2uaZNzu+xbcY24 m49usH/vZ/yvm6LC6vPox7SXwWFfNqwPnFRqs/K7sFRs4vxXPwVy5c6qKCgJT5BhjFezWcnKlFlXsH nLoybmdvVLvWvapPkspzU3l3sBAA==
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_140815_426592_66A4C810 
X-CRM114-Status: GOOD (  17.52  )
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

VGhlIG9ubHkgdGhpbmcgdGhhdCBjb3VsZCB0aGVvcmV0aWNhbGx5IGZhaWwgaW4gdGhhdCBmdW5j
dGlvbiBpcwptdGRfZGV2aWNlX3VucmVnaXN0ZXIoKS4gSG93ZXZlciBpdCdzIG5vdCBzdXBwb3Nl
ZCB0byBmYWlsIGFuZCB3aGVuCnVzZWQgY29ycmVjdGx5IGl0IGRvZXNuJ3QuIFNvIHdhaWwgbG91
ZGx5IGlmIGl0IGRvZXMgYW55aG93LgoKVGhpcyBtYXRjaGVzIGhvdyBvdGhlciBkcml2ZXJzIChl
LmcuIG5hbmQvcmF3L25hbmRzaW0uYykgdXNlCm10ZF9kZXZpY2VfdW5yZWdpc3RlcigpLgoKVGhp
cyBpcyBhIHByZXBhcmF0aW9uIGZvciBtYWtpbmcgcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrcyBy
ZXR1cm4gdm9pZC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tdGQvaHlwZXJidXMvaGJtYy1hbTY1
NC5jICAgIHwgNiArKystLS0KIGRyaXZlcnMvbXRkL2h5cGVyYnVzL2h5cGVyYnVzLWNvcmUuYyB8
IDggKystLS0tLS0KIGRyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jICAgICAgICB8IDUgKysr
LS0KIGluY2x1ZGUvbGludXgvbXRkL2h5cGVyYnVzLmggICAgICAgICB8IDQgKy0tLQogNCBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL2h5cGVyYnVzL2hibWMtYW02NTQuYyBiL2RyaXZlcnMvbXRkL2h5cGVyYnVz
L2hibWMtYW02NTQuYwppbmRleCBhMzQzOWI3OTFlZWIuLmE2MTYxY2UzNDBkNCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvaHlwZXJidXMvaGJtYy1hbTY1NC5jCisrKyBiL2RyaXZlcnMvbXRkL2h5
cGVyYnVzL2hibWMtYW02NTQuYwpAQCAtMjMzLDE2ICsyMzMsMTYgQEAgc3RhdGljIGludCBhbTY1
NF9oYm1jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBh
bTY1NF9oYm1jX3ByaXYgKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1
Y3QgYW02NTRfaGJtY19kZXZpY2VfcHJpdiAqZGV2X3ByaXYgPSBwcml2LT5oYmRldi5wcml2Owot
CWludCByZXQ7CiAKLQlyZXQgPSBoeXBlcmJ1c191bnJlZ2lzdGVyX2RldmljZSgmcHJpdi0+aGJk
ZXYpOworCWh5cGVyYnVzX3VucmVnaXN0ZXJfZGV2aWNlKCZwcml2LT5oYmRldik7CisKIAlpZiAo
cHJpdi0+bXV4X2N0cmwpCiAJCW11eF9jb250cm9sX2Rlc2VsZWN0KHByaXYtPm11eF9jdHJsKTsK
IAogCWlmIChkZXZfcHJpdi0+cnhfY2hhbikKIAkJZG1hX3JlbGVhc2VfY2hhbm5lbChkZXZfcHJp
di0+cnhfY2hhbik7CiAKLQlyZXR1cm4gcmV0OworCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBhbTY1NF9oYm1jX2R0X2lkc1tdID0gewpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvaHlwZXJidXMvaHlwZXJidXMtY29yZS5jIGIvZHJpdmVycy9tdGQvaHlw
ZXJidXMvaHlwZXJidXMtY29yZS5jCmluZGV4IDJmOWZjNGUxN2Q1My4uNGQ4MDQ3ZDQzZTQ4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL210ZC9oeXBlcmJ1cy9oeXBlcmJ1cy1jb3JlLmMKKysrIGIvZHJp
dmVycy9tdGQvaHlwZXJidXMvaHlwZXJidXMtY29yZS5jCkBAIC0xMjYsMTYgKzEyNiwxMiBAQCBp
bnQgaHlwZXJidXNfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBoeXBlcmJ1c19kZXZpY2UgKmhiZGV2
KQogfQogRVhQT1JUX1NZTUJPTF9HUEwoaHlwZXJidXNfcmVnaXN0ZXJfZGV2aWNlKTsKIAotaW50
IGh5cGVyYnVzX3VucmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBoeXBlcmJ1c19kZXZpY2UgKmhiZGV2
KQordm9pZCBoeXBlcmJ1c191bnJlZ2lzdGVyX2RldmljZShzdHJ1Y3QgaHlwZXJidXNfZGV2aWNl
ICpoYmRldikKIHsKLQlpbnQgcmV0ID0gMDsKLQogCWlmIChoYmRldiAmJiBoYmRldi0+bXRkKSB7
Ci0JCXJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcihoYmRldi0+bXRkKTsKKwkJV0FSTl9PTiht
dGRfZGV2aWNlX3VucmVnaXN0ZXIoaGJkZXYtPm10ZCkpOwogCQltYXBfZGVzdHJveShoYmRldi0+
bXRkKTsKIAl9Ci0KLQlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTF9HUEwoaHlwZXJidXNf
dW5yZWdpc3Rlcl9kZXZpY2UpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9oeXBlcmJ1cy9y
cGMtaWYuYyBiL2RyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jCmluZGV4IDZlMDhlYzFkNGYw
OS4uMTVhMGJlNjNlZGUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYu
YworKysgYi9kcml2ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYwpAQCAtMTUzLDExICsxNTMsMTIg
QEAgc3RhdGljIGludCBycGNpZl9oYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogc3RhdGljIGludCBycGNpZl9oYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3QgcnBjaWZfaHlwZXJidXMgKmh5cGVyYnVzID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7Ci0JaW50IGVycm9yID0gaHlwZXJidXNfdW5yZWdpc3Rlcl9kZXZpY2UoJmh5
cGVyYnVzLT5oYmRldik7CisKKwloeXBlcmJ1c191bnJlZ2lzdGVyX2RldmljZSgmaHlwZXJidXMt
PmhiZGV2KTsKIAogCXJwY2lmX2Rpc2FibGVfcnBtKCZoeXBlcmJ1cy0+cnBjKTsKIAotCXJldHVy
biBlcnJvcjsKKwlyZXR1cm4gMDsKIH0KIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
cnBjaWZfcGxhdGZvcm1fZHJpdmVyID0gewpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQv
aHlwZXJidXMuaCBiL2luY2x1ZGUvbGludXgvbXRkL2h5cGVyYnVzLmgKaW5kZXggMGNlNjEyNDI4
YWVhLi5iYjZiNzEyMWE1NDIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbXRkL2h5cGVyYnVz
LmgKKysrIGIvaW5jbHVkZS9saW51eC9tdGQvaHlwZXJidXMuaApAQCAtODksOSArODksNyBAQCBp
bnQgaHlwZXJidXNfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBoeXBlcmJ1c19kZXZpY2UgKmhiZGV2
KTsKIC8qKgogICogaHlwZXJidXNfdW5yZWdpc3Rlcl9kZXZpY2UgLSBkZXJlZ2lzdGVyIEh5cGVy
QnVzIHNsYXZlIG1lbW9yeSBkZXZpY2UKICAqIEBoYmRldjogaHlwZXJidXNfZGV2aWNlIHRvIGJl
IHVucmVnaXN0ZXJlZAotICoKLSAqIFJldHVybjogMCBmb3Igc3VjY2Vzcywgb3RoZXJzIGZvciBm
YWlsdXJlLgogICovCi1pbnQgaHlwZXJidXNfdW5yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGh5cGVy
YnVzX2RldmljZSAqaGJkZXYpOwordm9pZCBoeXBlcmJ1c191bnJlZ2lzdGVyX2RldmljZShzdHJ1
Y3QgaHlwZXJidXNfZGV2aWNlICpoYmRldik7CiAKICNlbmRpZiAvKiBfX0xJTlVYX01URF9IWVBF
UkJVU19IX18gKi8KLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
