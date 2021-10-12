Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13675C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D270B6108F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D270B6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S44NWMHqOX6HFoz/Z57U+xh5QGvOv8k/rAoWSIaItFc=; b=y/lUGXHrMZkHT7
	58ueYdgQEIr28Zzxa0UvWEJxNXBgo4E/PBllkIqikBSXj53VLSPakkLyN4yTYUphQVXIS5BiQr7YL
	ljo8XSD+qGQa9QXs9LfcPUkk2w91KwlSbF4VGcmM/kRejbnkMpEVHNfhBoh3v9cINq8jGAvZ0Faue
	eCvEOF+lYGSWYEpLWbCMuosYdnsqeyYbjJIIxiz0w0AAKZpCmZa+EUQV7to4ZUQeFQajOL7dNWn5x
	esVtxNp7T9rG/bBE+jDiWnJUEskv6t54DoCuib2GjpIV/69FXBjlGaz06rWgyobBYZthArPNq0YoG
	yJp5nmP/jgrZutY+JOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJts-00DNKk-4I; Tue, 12 Oct 2021 15:41:08 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJsz-00DN1d-7s
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 15:40:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJst-0000ht-RM; Tue, 12 Oct 2021 17:40:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJst-0004mQ-1I; Tue, 12 Oct 2021 17:40:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsd-0004Ym-Ja; Tue, 12 Oct 2021 17:39:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Fabio Estevam <festevam@gmail.com>, Heiko Schocher <hs@denx.de>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 15/20] mtd: mchp48l640: Warn about failure to unregister
 mtd device
Date: Tue, 12 Oct 2021 17:39:40 +0200
Message-Id: <20211012153945.2651412-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=KPueYbzN9LsEzHTCniRvcOu6N1K1tzW4s5WqwnR8va8=;
 m=aWXlVn4zGl3/VNxE8xQ1auTXzJiWk3xyQCYCHspYcNI=;
 p=FVG/f8D5OMv+6zHQi0LEySf59uooBM1A6otMYWx90Jo=;
 g=6463cff8dfe6da637770875deae96bedaf2afd8a
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlrCYACgkQwfwUeK3K7An3Nwf/WXu
 jfvNabwoFPSNIxb8bkOy5RAOhKb23xPLjHY4UjV+pX+ycBjJrnh4F4HTJGUCg+CVbiL6L8y9cTPS4
 FmdhdkenR90XYefsNf7ZJdCfLxIWQu4A9W67wDs4VX6wU16g+D9G40Q2qQtjD4hmecoKIkvNxx9yR
 PrMfF++7OQQPIECqBy1mQpXvAJ+GI0qBhYnwJntJ3vjpJf4djt6wzwLM0vx1mw7SFD9E5UPAthfe+
 VcB51aDJh0iehgoZ6usEprA9E9wcndz48jDsvC4DB6pYt1mAVc8/9GdAgfpk6zJHGi5Cq0EdnHwdi
 iqVWyiWwbXZkgjekoF7f/IRsvEuUK9Q==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_084013_319174_AFF573E5 
X-CRM114-Status: GOOD (  13.58  )
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

V2hlbiBhbiBzcGkgZHJpdmVyJ3MgcmVtb3ZlIGZ1bmN0aW9uIHJldHVybnMgYSBub24temVybyBl
cnJvciBjb2RlCm5vdGhpbmcgaGFwcGVucyBhcGFydCBmcm9tIGVtaXR0aW5nIGEgZ2VuZXJpYyBl
cnJvciBtZXNzYWdlLiBNYWtlIHRoaXMKZXJyb3IgbWVzc2FnZSBtb3JlIGRldmljZSBzcGVjaWZp
YyBhbmQgcmV0dXJuIHplcm8gaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9tdGQvZGV2
aWNlcy9tY2hwNDhsNjQwLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9t
Y2hwNDhsNjQwLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL21jaHA0OGw2NDAuYwppbmRleCA5OTQw
MGQwZmI4YzEuLmI4N2Y3ZWNhM2U2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9t
Y2hwNDhsNjQwLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwNDhsNjQwLmMKQEAgLTM0
NCw4ICszNDQsMTQgQEAgc3RhdGljIGludCBtY2hwNDhsNjQwX3Byb2JlKHN0cnVjdCBzcGlfZGV2
aWNlICpzcGkpCiBzdGF0aWMgaW50IG1jaHA0OGw2NDBfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNl
ICpzcGkpCiB7CiAJc3RydWN0IG1jaHA0OGw2NDBfZmxhc2ggKmZsYXNoID0gc3BpX2dldF9kcnZk
YXRhKHNwaSk7CisJaW50IHJldDsKKworCXJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigmZmxh
c2gtPm10ZCk7CisJaWYgKHJldCkKKwkJZGV2X3dhcm4oJnNwaS0+ZGV2LCAiRmFpbGVkIHRvIHVu
cmVnaXN0ZXIgbXRkIGRldmljZSAoJXBlKVxuIiwKKwkJCSBFUlJfUFRSKHJldCkpOwogCi0JcmV0
dXJuIG10ZF9kZXZpY2VfdW5yZWdpc3RlcigmZmxhc2gtPm10ZCk7CisJcmV0dXJuIDA7CiB9CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1jaHA0OGw2NDBfb2ZfdGFibGVbXSA9
IHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
