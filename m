Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FDDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28483601FF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 15:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28483601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8H9ketabeHDrouM7zlc3o9xwhwJBqHMUFhdEng57A8=; b=jUTlvWrRUzwPF1
	KWiG8g2fjA1iXb71ZPdnOBktkqVjk3M+4Q8G0MGWVEYuKSsBmxITAUVbRLS/4YipSReCrgtXmetZ+
	nAlO28zU6MxR+1DcGPehQ+KwpYwe1rZaL2C/fZpdirPzQn08jSj16OCDaBL/LtVX3GMesHQG+WXkI
	ZruzpLEo00/wQI9/ict8ikTqJPBXcG8SLjXop8sAatjCGyMmtXsCYKl0EGPJbGkJ1XNkuddzs9AwK
	WpNZC+OnyXktaDHAmRjTC2KWR9eJB6vwEMTNEEqz3JCrQFgffuX1Ga/5O0GIZ+pUW2aBX6jnPgPYf
	aCHAn1QwIAiTgyqDO+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJtW-00DNCO-Mu; Tue, 12 Oct 2021 15:40:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJsx-00DN12-P2
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 15:40:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJst-0000hT-Hg; Tue, 12 Oct 2021 17:40:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJss-0004mN-PB; Tue, 12 Oct 2021 17:40:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsd-0004Yg-AC; Tue, 12 Oct 2021 17:39:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 13/20] mtd: dataflash: Warn about failure to unregister mtd
 device
Date: Tue, 12 Oct 2021 17:39:38 +0200
Message-Id: <20211012153945.2651412-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=2VqFZIno/yGWsKtWn0NIvGoO0BsdZpAyUJM3JsTcgVQ=;
 m=aWXlVn4zGl3/VNxE8xQ1auTXzJiWk3xyQCYCHspYcNI=;
 p=16dswzFeECicSzBQSJ0SvtjK+opu7BN5qXI4WIJZwCw=;
 g=4c0006553a00ca9772c08d8155c3e429fb469b7b
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlrCAACgkQwfwUeK3K7Alhzgf7Bnt
 6NQEigDpsGNLR4Myl4ULhsm8W+utz3BBsS3tu1LnZ0L+/KEVHfNOrQ1S+vkblFJ6JY0R69KN47agg
 y59Tdik0oGDpjLURzS6MdNk+Q4/5zZo6vX82yM08oabjCPkJh/FDMxB4P7MEVE0WDgyeXdGmqJdwH
 KqyUh4HH8dv8ZM/ph+H0TBSnPnY//97FeHPY8hLaOac4rWkk8yusOkaS3mz+05oXoQz4k7oKKHftH
 q9TzY9yMqAIIHGgRPze5NgG7Q4O4QyG7h0E0Sv2b2NFMIlTw87Ky3BsxvqbVTxa/u/t66ZODGiUgc
 oP+AB9hEZN4JtSTDgGIGBTUa8DyJk9A==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_084011_835558_5DB4F1F1 
X-CRM114-Status: GOOD (  14.36  )
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
aWNlcy9tdGRfZGF0YWZsYXNoLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9t
dGRfZGF0YWZsYXNoLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9kYXRhZmxhc2guYwppbmRl
eCA5ODAyZTI2NWZjYTguLjI2OTFiNmI3OWRmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2
aWNlcy9tdGRfZGF0YWZsYXNoLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfZGF0YWZs
YXNoLmMKQEAgLTkxOSw3ICs5MTksMTAgQEAgc3RhdGljIGludCBkYXRhZmxhc2hfcmVtb3ZlKHN0
cnVjdCBzcGlfZGV2aWNlICpzcGkpCiAJc3RhdHVzID0gbXRkX2RldmljZV91bnJlZ2lzdGVyKCZm
bGFzaC0+bXRkKTsKIAlpZiAoc3RhdHVzID09IDApCiAJCWtmcmVlKGZsYXNoKTsKLQlyZXR1cm4g
c3RhdHVzOworCWVsc2UKKwkJZGV2X3dhcm4oJnNwaS0+ZGV2LCAiRmFpbGVkIHRvIHVucmVnaXN0
ZXIgbXRkIGRldmljZSAoJXBlKVxuIiwKKwkJCSBFUlJfUFRSKHN0YXR1cykpOworCXJldHVybiAw
OwogfQogCiBzdGF0aWMgc3RydWN0IHNwaV9kcml2ZXIgZGF0YWZsYXNoX2RyaXZlciA9IHsKLS0g
CjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
