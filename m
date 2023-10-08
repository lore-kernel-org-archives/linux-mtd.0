Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEDFE95A8E
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71HKbGGGrdajnDRk0HQoNXe8SvakTkA6sfKnWVPJrys=; b=xAzzRvGNh8AwN1
	6/9nGJHj21Z8o85vs/7fooAnio5CHY+Cr1e0AK64cP3XRksf4xecEJUErh8dn++F17EnDjQnsMZZV
	3wR/OEHoBA4Zislg+LsdMtZtGiSldOwYc7+yVArltEsjDhVSSZvnZ4Uk2hJDygDJwNRq3aEfZu84B
	cwlErhbfCSDjGt/0yN+QU7F7kGDEo3V43KuF3tek6J99V1FnJoUSNR5Tc2nbq+Beg9+ZdzItPaHr0
	QTeyCHPvtAKne9XiJkr9S+2Yl/EwayzoQ5X6/k+x93Dgm4tRFg27Z9cVbFMQlzYFsgeJeH5to36eU
	jZG0ULd/bHcccOqXglZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZya-009Dvr-1u;
	Sun, 08 Oct 2023 20:02:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpZyV-009Dqw-1i
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:02:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-0001YM-MJ; Sun, 08 Oct 2023 22:01:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-000Ezh-9S; Sun, 08 Oct 2023 22:01:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyO-00Bf0e-0A; Sun, 08 Oct 2023 22:01:56 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 10/20] mtd: hyperbus: rpc-if: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:33 +0200
Message-Id: <20231008200143.196369-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7eQAR1pKoC9wnZ0mAaAcNt0WH40d+IlL6s8XiGrzxGw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwqLCck0qHa0kcxvTVIlWFZMQAs3ThPd9JeBi JIArXL576iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKiwAKCRCPgPtYfRL+ Ti+jB/9cgSXif3CNQQIbBfjyvTp5olwGYbyH8Y1w71z7L2tndi+GTnf/tiinf7KmYD9X6903sVc 7wUuzr0+r51DnSEwSM0JCwz+9AzPJ5ImUdWSYB2PfCu1Y+P8UIXrFG4iz+pkAV3UaKaTntbkI03 FE161wTLAHspBY6+rs64KQqTZA2RDTBTCvGBEH9ja7HbuHf6C0ehU9Uw8Oon+Lf8X/9j4tgOH/g ESAuHJZyrsu/3Vl4gL7frtKtcLUKv0b+w2TAQHMaKEosAGRFu2dWrNCmg1pD208MU+O0PLkJHZB j7m86zU4LHiT08x1bdeLhI6b42LmXRnkQp2mHNcC/QkoTlhm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_130203_579643_46B974FE 
X-CRM114-Status: GOOD (  15.33  )
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
ZXJzL210ZC9oeXBlcmJ1cy9ycGMtaWYuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2h5
cGVyYnVzL3JwYy1pZi5jIGIvZHJpdmVycy9tdGQvaHlwZXJidXMvcnBjLWlmLmMKaW5kZXggZWYz
MmZjYTVmNzg1Li5iMjJhYTU3MTE5ZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2h5cGVyYnVz
L3JwYy1pZi5jCisrKyBiL2RyaXZlcnMvbXRkL2h5cGVyYnVzL3JwYy1pZi5jCkBAIC0xNTQsMjAg
KzE1NCwxOCBAQCBzdGF0aWMgaW50IHJwY2lmX2hiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJcmV0dXJuIGVycm9yOwogfQogCi1zdGF0aWMgaW50IHJwY2lmX2hiX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgcnBjaWZfaGJfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHJwY2lmX2h5cGVy
YnVzICpoeXBlcmJ1cyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCiAJaHlwZXJidXNf
dW5yZWdpc3Rlcl9kZXZpY2UoJmh5cGVyYnVzLT5oYmRldik7CiAKIAlwbV9ydW50aW1lX2Rpc2Fi
bGUoaHlwZXJidXMtPnJwYy5kZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHJwY2lmX3BsYXRmb3JtX2RyaXZlciA9IHsKIAkucHJvYmUJPSBycGNp
Zl9oYl9wcm9iZSwKLQkucmVtb3ZlCT0gcnBjaWZfaGJfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0g
cnBjaWZfaGJfcmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1lCT0gInJwYy1pZi1oeXBlcmZs
YXNoIiwKIAl9LAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
