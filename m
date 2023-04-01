Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95648C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Apr 2023 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrPq9crYDKCAEFm08wMeuy6aQDcpkknC8O24nhb1Mjo=; b=xyXIyqFGgC5yTi
	HR/MZz9It5NdCJSm9LAvaMcS832E2LXnllKhtkdjC+GgKqOiWSONI5Crws1Dw9vopjYciVE1tRiDZ
	1c47FD/c8j/WRNBQ/TeJ7NocofCvoSN/ZZ9FvYkYBsU5WNorqotFyKIhy1qq2rJVt55iOAmaINgyu
	oDRqVpEn2ETYbI2wsbP2FSauvVZmfgAPNL4J+VRcSuoI7arAt6gQEmaQXjMC3SFUH1fOwtm/L/hB0
	mtyqqw+9FzgTDC/3+jOzyAzfL3bncNjbOJwF3Sw2uyGc7iZP1etXNcZ9N3Bgcnnn8INNVcmcMdrH/
	/oqnODUEOgxS3TAl37pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxj-00AsKk-06;
	Sat, 01 Apr 2023 16:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxa-00AsFo-1r
	for linux-mtd@bombadil.infradead.org;
	Sat, 01 Apr 2023 16:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0s7087k9+qYnF+2XxvnOQFOrdung0zyXRBTlUmz+j80=; b=GPoPtSeL97arH6mSb6CGXG8Gs+
	KFSOFRlcVWRasIBmJOn67yOwIoLPQZ2wqhDaYP2XyE3pQB9pJfPctYO3xjl387dymAnjRUHboyPtb
	FIc2iwpuj1azYIcJNLHeBAqvZLt2BcY7k0ZwGwwr1L9CF8aJ0MfDmDvnDi5ATowQVkxn93wcFte8z
	hXhGF/ome6wgbXe4R95Tz/Q71oktxNRKTK1w+DBf47FEecUuxktUC6h8JG/wMpl8IcPXk6Me8z1/5
	gbtbjvTwlYmhcWw6Qx8iNgr6/iGYbjGeEnAmSzrYUlShT27rnqa35HuGZRu5MrPc2nrvKeHn7QEK9
	GL0VBnBA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidxW-008DKs-0x
	for linux-mtd@lists.infradead.org;
	Sat, 01 Apr 2023 16:20:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxJ-0008Lt-6h; Sat, 01 Apr 2023 18:19:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxI-008GRL-4Z; Sat, 01 Apr 2023 18:19:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pidxH-009kgV-2B; Sat, 01 Apr 2023 18:19:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 23/49] mtd: rawnand: lpc32xx_slc: Convert to platform remove callback returning void
Date: Sat,  1 Apr 2023 18:19:12 +0200
Message-Id: <20230401161938.2503204-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UbNuXQQQ0KcBVxzTXxsiQ9ppdg24ns5eP5qhdM3pSMc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFkjOoX2tn9StM5R7P/QaqUZ/q53dU5RYfwhc nxcaOCwwbSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZIwAKCRCPgPtYfRL+ Tqp9CACOW6nBWlTrLGkaBFcuz7IA2lDxG9WvCHr3IeR/PjNGixZKY5yt/BKvzDjUplRZD76ydop ZWCEbRbsiMNVvkQ1nC28vMyMDmNRLs8snNLwDnF8A6OfZvqCabcgZMKgBdgUX+3gIS1T79REaYt Hlk3bESCNim6lA2Dp6RZHn8zRWD7p+Ng1qMOQbWwaiQmqAGjEjstGuB7YeteDO7O60W8bMUddlq cf4ZkCzUK0TQHKrngtLwyuluawuZgsC0nXWSdEonXJ4Qa9pg9DKNSZU3oIYJ/l+gLpsCBXQu1LM IvwiT0u/EeyMSiWe5LnhMLqHAcz/zYik/TvDVdBT/nslK8e2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_172006_539347_1573371C 
X-CRM114-Status: GOOD (  15.63  )
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
dmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2xwYzMyeHhfc2xjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4
X3NsYy5jCmluZGV4IDY5MTg3MzczNDZjOS4uMzEzOWI2MTA3NjYwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2xwYzMyeHhfc2xjLmMKQEAgLTk0Niw3ICs5NDYsNyBAQCBzdGF0aWMgaW50IGxwYzMyeHhfbmFu
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogLyoKICAqIFJlbW92ZSBOQU5E
IGRldmljZS4KICAqLwotc3RhdGljIGludCBscGMzMnh4X25hbmRfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBscGMzMnh4X25hbmRfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJdWludDMyX3QgdG1wOwogCXN0cnVjdCBscGMz
Mnh4X25hbmRfaG9zdCAqaG9zdCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwpAQCAtOTY1
LDggKzk2NSw2IEBAIHN0YXRpYyBpbnQgbHBjMzJ4eF9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhvc3QtPmNsayk7CiAJ
bHBjMzJ4eF93cF9lbmFibGUoaG9zdCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBs
cGMzMnh4X25hbmRfcmVzdW1lKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC0xMDE1
LDcgKzEwMTMsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBscGMzMnh4X25hbmRfbWF0Y2gp
OwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBscGMzMnh4X25hbmRfZHJpdmVyID0g
ewogCS5wcm9iZQkJPSBscGMzMnh4X25hbmRfcHJvYmUsCi0JLnJlbW92ZQkJPSBscGMzMnh4X25h
bmRfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gbHBjMzJ4eF9uYW5kX3JlbW92ZSwKIAkucmVzdW1l
CQk9IHBtX3B0cihscGMzMnh4X25hbmRfcmVzdW1lKSwKIAkuc3VzcGVuZAk9IHBtX3B0cihscGMz
Mnh4X25hbmRfc3VzcGVuZCksCiAJLmRyaXZlcgkJPSB7Ci0tIAoyLjM5LjIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
