Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE75E95A67
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lwqnSal5JcTSVHQ2BwOS7UHzI7l81AJyrUCS6KLuW0=; b=4oev5sTwSJWOsf
	C9iIzV+Qm/sqK7xhplsFYf2f/d/rI+hwFp+8LYME62ysa3qF2MnpQgwULSf3UWSrn5JaXry2gZlfk
	yiFTygf9TTafVO0uV3CBObd/TOQrLjBtiZUvZ6lYgB6DAMux1YlNV4KUWH+CMc48X9yY+aUSFhr3o
	T0x+RGWEBzivutBgDqh96BVm7/Yez+CfzwCEuJQPScQrAFi+c7kETHCwyFG0gQU2U3IqUyhEl+QMc
	V2IDvXf/CudcLjDKW0D4QvSOudgdm/q0gqbU+OL6GUPkExL9jq1iB1wPIGJc6zg/Xf0k384GSjARs
	je+P/X+TMt9FCeJ4EziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyk-009E25-0h;
	Sun, 08 Oct 2023 20:02:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZya-009Dvd-1S
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyS-0001Yc-9K; Sun, 08 Oct 2023 22:02:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-000Ezl-Ho; Sun, 08 Oct 2023 22:01:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-00Bf0i-8h; Sun, 08 Oct 2023 22:01:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Hui Tang <tanghui20@huawei.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 11/20] mtd: lpddr2_nvm: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:34 +0200
Message-Id: <20231008200143.196369-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=F3MBL0A1oTKO24UwFt5q+Qq30ydMO5UmafloJWvAdDc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqNwRYEn+6b+vUQ2tU8TVROQfxyTBxAYhcki Ccb2JMZZNmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKjQAKCRCPgPtYfRL+ TkR7B/0ZLDfyog65rf3mRaKfFuvbGiqWX6JO41YJ3n+jkw7rr4zyQdxCXI8J2DAosJEkXpLmciZ FL95aQvqwhamis0Fiy3VAdMGxTiu1JI5fjCzYFhr06JiYhMeDwWJCogW+C2KpwS7X9lkVVuL8gE +XkvC9PuYaPn1LHoVJMLzGzLiCEcNdQeg2RWPrXrydT1rCotcVmj/+h8QwwA9a/fDrTQhrwaj6O CfP0/NwLPYmPTL2zjpZEZZb45OD4aEgaFvx9ePPjHRha0zg4wYr+su0ooUVB+S3HoEIKWuo3hGx ZK4+go6SLqaW5kX8Nw1IZrC0dILnoCEJW/lSYTH7t6JCsuhZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130208_524722_8E4267CC 
X-CRM114-Status: GOOD (  15.48  )
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
ZXJzL210ZC9scGRkci9scGRkcjJfbnZtLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9s
cGRkci9scGRkcjJfbnZtLmMgYi9kcml2ZXJzL210ZC9scGRkci9scGRkcjJfbnZtLmMKaW5kZXgg
ZjRlNTE3NGIyNDQ5Li45MTY5ZTExNTVkYmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2xwZGRy
L2xwZGRyMl9udm0uYworKysgYi9kcml2ZXJzL210ZC9scGRkci9scGRkcjJfbnZtLmMKQEAgLTQ3
NiwxMSArNDc2LDkgQEAgc3RhdGljIGludCBscGRkcjJfbnZtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAvKgogICogbHBkZHIyX252bSBkcml2ZXIgcmVtb3ZlIG1ldGhvZAog
ICovCi1zdGF0aWMgaW50IGxwZGRyMl9udm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCitzdGF0aWMgdm9pZCBscGRkcjJfbnZtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewogCVdBUk5fT04obXRkX2RldmljZV91bnJlZ2lzdGVyKGRldl9nZXRfZHJ2
ZGF0YSgmcGRldi0+ZGV2KSkpOwotCi0JcmV0dXJuIDA7CiB9CiAKIC8qIEluaXRpYWxpemUgcGxh
dGZvcm1fZHJpdmVyIGRhdGEgc3RydWN0dXJlIGZvciBscGRkcjJfbnZtICovCkBAIC00ODksNyAr
NDg3LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbHBkZHIyX252bV9kcnYgPSB7
CiAJCS5uYW1lCT0gImxwZGRyMl9udm0iLAogCX0sCiAJLnByb2JlCQk9IGxwZGRyMl9udm1fcHJv
YmUsCi0JLnJlbW92ZQkJPSBscGRkcjJfbnZtX3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IGxwZGRy
Ml9udm1fcmVtb3ZlLAogfTsKIAogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihscGRkcjJfbnZtX2Ry
dik7Ci0tIAoyLjQwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
