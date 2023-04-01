Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A34CC76196
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsglTh8RovadKk7ih2PpbaT0OOcITcAqBzhQauLSYZ0=; b=K3YkWr672GZVWU
	ySk/SCMXGYmDAWtQk9RvN9CTbhaDASnVQ3JdDjCp7jv7v5nWVVJ4v7S1G9XCyVENzZknTBMopwkVX
	WwSkx6JdUt7zq0YuWQ2DCMi1s4aHrVwIc/W45kR3iSa6ZBVpN9lxtCe0tQ5t/CwmOV9AcrruF8ogR
	uCOKa964HNRvSQebbx4bmTPqBEhPsRouDvJGefIsEckA1Z4RpCLtrHHBzJV8gCUpVBVOyU4lg1UOr
	Q0nFlwybGD342f9Wp3iwUYQ5SVQn0sIIYay4qPS7uhZeYkREf3I+5XElc3/crpjsLqHbhut8yCRMx
	WUOt+xvXyERYxT3xSJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEO-00AwX1-1V;
	Sat, 01 Apr 2023 16:37:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pieEI-00AwRk-0m
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ErzwJ5kzo6l5ZW5Rc4wdyAvH069TDMDmCzN+eXTqyw0=; b=Yvymh9Vgy9rL8xYmrxUOEXPxb7
	KjlCMy+cDCmnOfhzAtI87b5YoCECrSI9xK1laeQ7hNC44Q41huqNY4NYt3YPL1/yKDEYvndIyplWo
	2mwtbV0LHWml5msv9zt1fFp7B3pDywNSPR7RE++URuODLotnrIHav0y2b/HU0vKWyHLd+5zEKZooo
	om6Xkuzof/lpLxWH99TwPUyrGkHFhKklGRokZ6gyNTq8VmLjDvWx3j5W7B0i6j49Kg96RVslxQRss
	LqdEawT1wr+uj0xxq2lbXOdOTr7PGfhNyVh5b9eubhrVHa9cCQ7FaTA749TCjexHq190encc3L7Kp
	wz8WhGPw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pidxW-00CYSi-AX
	for linux-mtd@lists.infradead.org; Sat, 01 Apr 2023 16:20:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxN-0000Bb-97; Sat, 01 Apr 2023 18:19:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxL-008GSq-S5; Sat, 01 Apr 2023 18:19:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxK-009khi-RR; Sat, 01 Apr 2023 18:19:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 41/49] mtd: rawnand: s3c2410: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:30 +0200
Message-Id: <20230401161938.2503204-42-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gguQzC+fJqIHjPX5PYpmAn7zDOs8OCBvzY7Y15EDBEQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlMQXXoDqp81e3QnKDx7z39gru64y4FbgMaj KI5M1IdxlOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZTAAKCRCPgPtYfRL+ TlCuB/9eFDdyVe27z4YEIwZJnF0ArJxl5hIR8b7wf/Tg6+HlE2efqZpkTpvE2wnotHdVxDbZx8X jUxuT4zTfczv4RiQv2iB71Weu0yLZDms9b647m0/P38xf3aeyEPeqCkaXRosRNHAzvSBWoZk0vK GSkP2+rQYDKi4UWFPsI/z9JGV3ewr5hN50vCZvmVL9HgwOBZqFkRZCcWyYeY70u9jYEhzRLBgRq uJ2xndXGSCR5TfggRuPEbfTJpp/cLDt5Zykg/b2oo4FB51pT2Xzy9Dn/haU2uLMB7+yxQMB/NhS OzMtJJJOq64RqRrUIV5wsINPBCXJdxgOqYVNxeSzTEkTr7CB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_391913_0FF98C88 
X-CRM114-Status: GOOD (  14.09  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9tdGQvbmFuZC9yYXcvczNjMjQxMC5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9zM2MyNDEwLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zM2MyNDEwLmMKaW5k
ZXggODBkOTZmOTRkNmNiLi5hYzgwYWFmNWI0ZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3MzYzI0MTAuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zM2MyNDEwLmMKQEAg
LTcwOSwxMiArNzA5LDEyIEBAIHN0YXRpYyB2b2lkIHMzYzI0NDBfbmFuZF93cml0ZV9idWYoc3Ry
dWN0IG5hbmRfY2hpcCAqdGhpcywgY29uc3QgdV9jaGFyICpidWYsCiAKIC8qIGRldmljZSBtYW5h
Z2VtZW50IGZ1bmN0aW9ucyAqLwogCi1zdGF0aWMgaW50IHMzYzI0eHhfbmFuZF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHMzYzI0eHhfbmFuZF9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgczNjMjQxMF9uYW5k
X2luZm8gKmluZm8gPSB0b19uYW5kX2luZm8ocGRldik7CiAKIAlpZiAoaW5mbyA9PSBOVUxMKQot
CQlyZXR1cm4gMDsKKwkJcmV0dXJuOwogCiAJLyogUmVsZWFzZSBhbGwgb3VyIG10ZHMgIGFuZCB0
aGVpciBwYXJ0aXRpb25zLCB0aGVuIGdvIHRocm91Z2gKIAkgKiBmcmVlaW5nIHRoZSByZXNvdXJj
ZXMgdXNlZApAQCAtNzM1LDggKzczNSw2IEBAIHN0YXRpYyBpbnQgczNjMjR4eF9uYW5kX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJaWYgKCFJU19FUlIoaW5mby0+Y2xr
KSkKIAkJczNjMjQxMF9uYW5kX2Nsa19zZXRfc3RhdGUoaW5mbywgQ0xPQ0tfRElTQUJMRSk7Ci0K
LQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBzM2MyNDEwX25hbmRfYWRkX3BhcnRpdGlvbihz
dHJ1Y3QgczNjMjQxMF9uYW5kX2luZm8gKmluZm8sCkBAIC0xMjE4LDcgKzEyMTYsNyBAQCBNT0RV
TEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBzM2MyNHh4X2RyaXZlcl9pZHMpOwogCiBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBzM2MyNHh4X25hbmRfZHJpdmVyID0gewogCS5wcm9iZQkJ
PSBzM2MyNHh4X25hbmRfcHJvYmUsCi0JLnJlbW92ZQkJPSBzM2MyNHh4X25hbmRfcmVtb3ZlLAor
CS5yZW1vdmVfbmV3CT0gczNjMjR4eF9uYW5kX3JlbW92ZSwKIAkuc3VzcGVuZAk9IHMzYzI0eHhf
bmFuZF9zdXNwZW5kLAogCS5yZXN1bWUJCT0gczNjMjR4eF9uYW5kX3Jlc3VtZSwKIAkuaWRfdGFi
bGUJPSBzM2MyNHh4X2RyaXZlcl9pZHMsCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
