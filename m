Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB55E95A90
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ymf19bJAoW0OP9/3OM2F+6w5cV6YSN+23soWnbU64xs=; b=V8azIurtE7M2tR
	HIH4HeUMo28I3ia4mcyWE5CnfVnLPf6GFuG5p+1pPBemrgHmUiv7ptQk+3A4+EEfFkb2ftaoEphzc
	wlwJgS3uK0hMjLh0AaS4Ou+4Z4NtnDmvyUZQvsIrMT6ROi6RV0bgSWHV+Vyxk1kIglNUedn0EJo7/
	ESMHIdA2YHk9iTpYgpVYfoXiXSnI+ZeOUu+Y4kCud6TMO/DXLYgBEvSpE6LQxiPANpsbcIoibLcaF
	WONK0CZ+N8mo1GUttFwMLIT9NlwoDBerUp39e6v7gsG4sW2G6GYCkokMuKaIucoH+LB0Y0Pqp5keA
	kWC3vVrPIr3L+He89ZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyg-009Dz4-0t;
	Sun, 08 Oct 2023 20:02:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyW-009DrE-27
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyN-0001Sk-4L; Sun, 08 Oct 2023 22:01:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-000EzP-Iv; Sun, 08 Oct 2023 22:01:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyM-00Bf0F-9a; Sun, 08 Oct 2023 22:01:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Joern Engel <joern@lazybastard.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 05/20] mtd: phram: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:28 +0200
Message-Id: <20231008200143.196369-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qUq0uT8BS02+Q1TJZ61v0B12sQYNbP+xdTZs7JPHVKU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqB/xcP/JAiFP10u24ar5K6EylSwgJWfW7fg WVudZ9onPqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKgQAKCRCPgPtYfRL+ Ti72B/9DzuTjlgzjp+IvhEFm2whOPIu+RLFGCZ3Mn+OeKrRwE/H2hKnT0fX9qyyPcvbAInREWSH j0W5cX86pJjYjL7SaCxWbFmzXtOZOGpn0JlGIhYu6BAK6Oof9cAu0YJeFqIAOXLk4KKubgnNQmP tIoy6rEzo/9uRDZOhc5PxYOFRqbeS507BZ0cNxE/DjmRUUsIO/JE5dtXb2cklShUFcMCkP6dtYF a4hvt8m1LE8L4Nw5FMieNoiA/VG7vrP3LfmjQyBkaXahW3h9LBSmuiXopSNM3L88UrR3X24rN/u PCAFJWU/XlBUE0JkFMyBOHnp588eSNSWmNKLNc74XsC9Tf2Q
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130204_687688_1A460ACC 
X-CRM114-Status: GOOD (  15.71  )
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZp
Y2VzL3BocmFtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKaW5kZXggMjA4YmQ0ZDg3
MWY0Li4xYmYxOTJmMjI5ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0u
YworKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKQEAgLTM4OCwyMCArMzg4LDE4IEBA
IHN0YXRpYyBpbnQgcGhyYW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJ
CSAgICAgICBQQUdFX1NJWkUpOwogfQogCi1zdGF0aWMgaW50IHBocmFtX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgcGhyYW1fcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHBocmFtX210ZF9saXN0ICpwaHJhbSA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJbXRkX2RldmljZV91bnJlZ2lzdGVyKCZw
aHJhbS0+bXRkKTsKIAlwaHJhbV91bm1hcChwaHJhbSk7CiAJa2ZyZWUocGhyYW0pOwotCi0JcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHBocmFtX2RyaXZlciA9
IHsKIAkucHJvYmUJCT0gcGhyYW1fcHJvYmUsCi0JLnJlbW92ZQkJPSBwaHJhbV9yZW1vdmUsCisJ
LnJlbW92ZV9uZXcJPSBwaHJhbV9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCQk9ICJw
aHJhbSIsCiAJCS5vZl9tYXRjaF90YWJsZQk9IG9mX21hdGNoX3B0cihwaHJhbV9vZl9tYXRjaCks
Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
