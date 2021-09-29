Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E47C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 12:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890206124A
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 12:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 890206124A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FuHFmN2Q8ZcO06duQyUzvkclbl1z3wcliNSjx8rhsug=; b=cVFsF4LVUpYPYk
	+X6qmdxiy4JKX3Yl2LWMSDwLNBA+d12IsX7B9ExAC6qAfqACSCYDrWVVJfrxkQ8YIuRm5FYRFxoB3
	P+5TXDr48eeBkKdw+a4NGSV5583L+266f3ADTyCSFF7mquRxmfYQV06u3u+Yp+HvzTg9gL+74RWI7
	5wZY/jqbQyjpvpZ2kMKhYCrOWyl1rWNJbOHihaBJxUc5x3bMau9zEONGjhwdTHPx75ru+Tkia5z0I
	4e22YpoogDAwOjOQ9zKWze2NDQM5K8cIBznF9ueg+aFqxPORT9H0lPZBUa/6/kOX8AZK+5Vlgd3qN
	9/yhrHsaEJ7jHoMazyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVYFU-00AvkI-82; Wed, 29 Sep 2021 11:59:44 +0000
Received: from thorn.bewilderbeest.net ([2605:2700:0:5::4713:9cab])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVYAQ-00Atzb-Ge; Wed, 29 Sep 2021 11:54:32 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E8698C81;
 Wed, 29 Sep 2021 04:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916470;
 bh=Y009K+RO8RDHvkwOXnnVGdcXcV27deDObF+gK4oQAV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1JR3ccgRHn33ud6tMgC1CMeeRisKIlAAgrBRm7eb6hSGpyGrdolKwcy7HVnjgYQk
 PNAz2XS/8sH8jKzNjRq3hHsPjLgkukc3El2ZdjBfGCg1RbDxoUuzgZfUkDPi+piwd/
 RC1TN5yznTetYwWE5qOhl0+22V/KcVmBL31QXIEc=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Zev Weiss <zev@bewilderbeest.net>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Jeffery <andrew@aj.id.au>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] mtd: spi-nor: aspeed: Don't automatically attach reserved
 chips
Date: Wed, 29 Sep 2021 04:54:07 -0700
Message-Id: <20210929115409.21254-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_045430_601407_ABA5B8A0 
X-CRM114-Status: GOOD (  15.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With this change, any flash chips under the controller that are marked
with a DT status of "reserved" will be created, but not automatically
attached.  Userspace can later request that they be attached using the
attach_chip sysfs file.

This is to accommodate situations where a chip may be (for example)
shared with another controller external to the SoC and require
userspace to arbitrate access to it prior to actually attaching it.
(such as a firmware SPI flash shared between a BMC and the host
system).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index da49192a8220..328b008fafb2 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -826,10 +826,14 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 	unsigned int cs;
 	int ret = -ENODEV;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
 		struct spi_nor *nor;
 
+		/* Skip disabled nodes, but include reserved ones for later attachment */
+		if (!of_device_is_available(child) && !of_device_is_reserved(child))
+			continue;
+
 		/* This driver does not support NAND or NOR flash devices. */
 		if (!of_device_is_compatible(child, "jedec,spi-nor"))
 			continue;
@@ -873,6 +877,9 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
 
 		controller->chips[cs] = chip;
 
+		if (of_device_is_reserved(child))
+			continue;
+
 		ret = aspeed_smc_register_chip(chip);
 		if (ret)
 			break;
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
