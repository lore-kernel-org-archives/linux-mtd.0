Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A808C77B6D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+RO6t3j8MQE1Hm6fSwzhypJM97LQ7H0gyFToPKD8CU=; b=4HLHFC1lcEvaYv
	nKLHBbnmsoC5dounq7PoY768hSBN0vDu03+GzJ/CVUkgZCTXA7jyrbq9WDEGhpE35M1ooX2fP6GNL
	O6A/TOsSS8J22ykEjxaPotPalmOrslc8kWkMxSFHCGCyURmyQMAKngNea75jREjiZIXkHszNijCMs
	1sMobe8s9pEOSD+q2cMWJ59ReDFq8WW5yYO8c7Js1rvAkxatH5QeQyPkCy08FPAKKHiwegS1pwThQ
	kHwWE1ENHfkgvw2J7r21U73VDkng8y8jzrPVyFnrYo+qZ1j6DDgDzWR8+4CA7Zg5ApwLcbhHEhmZH
	wBI0Xx1wfpy7aAg9HmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxq-00AsOR-16;
	Sat, 01 Apr 2023 16:20:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxX-00AsBA-15
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxP-0000LW-CS; Sat, 01 Apr 2023 18:19:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxN-008GTK-CY; Sat, 01 Apr 2023 18:19:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxM-009kiD-J4; Sat, 01 Apr 2023 18:19:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 49/49] mtd: rawnand: xway: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:38 +0200
Message-Id: <20230401161938.2503204-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5YFrUJmlWlgutYJkBqaIuy6wBe87bfq4UYHWS2feeYM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhSNyNCUthCJprCWx3lbffnOK26vdy6ecExl5eZ9h9RKb 3SuCSjqZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiL1ex/08W/rYqakYgj2bg p+RjeYvUHK+xfxJnm11/beafW7rXrt1L/T55m9XPu76LNJxOSyTpcPKG1uk9FT4s8lBgzrVUrUs /7u7ccbxB7PUme0dB/6MPrpjIXW6LWaPlySS369OExo7rn+pevQtv8rp90UPOQ1MpWM+u8/EbzW 3/MuaurrTQre26obTv/Zf85I1dm870NDsrq0kkZDyWMIxR0X/wIaKl/Pm9F9z/dCpYyvdJesT/Z MsId+sMUzGMTGCRkD4amv9uwfK6hHf1DhlJzREpEd2ae/dqLTHmDPX+fJHvluCZX6GBH3y9tBfx Ta8/dW7+JvUP7gtYTO6fvffE2qvpYZYRj1dSjMz81I88AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_092007_395386_2DD66CB6 
X-CRM114-Status: GOOD (  17.53  )
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
dmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5j
CmluZGV4IDAzNWI4MmFhMmY0YS4uNmIxZTJhMmJiYTE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy94d2F5X25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25h
bmQuYwpAQCAtMjM4LDcgKzIzOCw3IEBAIHN0YXRpYyBpbnQgeHdheV9uYW5kX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAvKgogICogUmVtb3ZlIGEgTkFORCBkZXZpY2UuCiAg
Ki8KLXN0YXRpYyBpbnQgeHdheV9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQorc3RhdGljIHZvaWQgeHdheV9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogewogCXN0cnVjdCB4d2F5X25hbmRfZGF0YSAqZGF0YSA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwogCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAmZGF0YS0+Y2hpcDsKQEAg
LTI0Nyw4ICsyNDcsNiBAQCBzdGF0aWMgaW50IHh3YXlfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlyZXQgPSBtdGRfZGV2aWNlX3VucmVnaXN0ZXIobmFuZF90b19t
dGQoY2hpcCkpOwogCVdBUk5fT04ocmV0KTsKIAluYW5kX2NsZWFudXAoY2hpcCk7Ci0KLQlyZXR1
cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgeHdheV9uYW5kX21h
dGNoW10gPSB7CkBAIC0yNTgsNyArMjU2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgeHdheV9uYW5kX21hdGNoW10gPSB7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIHh3YXlfbmFuZF9kcml2ZXIgPSB7CiAJLnByb2JlCT0geHdheV9uYW5kX3Byb2JlLAotCS5y
ZW1vdmUJPSB4d2F5X25hbmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0geHdheV9uYW5kX3JlbW92
ZSwKIAkuZHJpdmVyCT0gewogCQkubmFtZQkJPSAibGFudGlxLG5hbmQteHdheSIsCiAJCS5vZl9t
YXRjaF90YWJsZSA9IHh3YXlfbmFuZF9tYXRjaCwKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
