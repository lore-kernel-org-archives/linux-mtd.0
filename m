Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D36DC33CB1
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 14:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23F9206D7
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 14:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eDO4eAAV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejm+XPPY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23F9206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4gKQ0DzfaOFoZZCjFigbFFWVH1zIu3OTq98YDzbTXsY=; b=eDO4eAAVWGBcZ5MnuQNMA0VCHk
	ae2ku2af16OsFqht66Cxe0fAEoCL/33qmltoQJUoFD0It/UjpeNKo+1wMPplNhw8ICz6CVno1Uc5o
	jSSwVtf7c9M68FwwETtQM0i0ABV9Z6DdcLEe2X3V4EOUshOQDpvRIxyUjV4QwIivbDjQgIZuEjroO
	49QTXaCrZtoTxM+5rRTP/PWG1qmBqOhFC+4EEFXBUkleE5yXp34tCarpRXuNU2DX31UwGMfM6QdIx
	QMezgMGtxRIKtFbwSKYqNan//2E3BVYTWaKOXPhqOZtAgFvGn4UvoFTwWhdwRHRP3aQ81LNmEjpc6
	CH8TOiaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itC12-0001pU-LZ; Sun, 19 Jan 2020 14:57:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itC0X-0001CM-RU
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 14:56:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id j42so26910009wrj.12
 for <linux-mtd@lists.infradead.org>; Sun, 19 Jan 2020 06:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AW6o0c/04VtmM4Wr/JwMdnRs9yEuZbHl3Nv4hAkPBgU=;
 b=ejm+XPPY2TzWFTaiaS6jz5ri/6+6mKJffpNjK7NHgP3WzikiM2XAPWV9eM21eni/L3
 RAKD3XVFLjApXTiQTE5c0QKGabNOIBmEIsX13t6Jto4pdV46n6HtPlCwR9G2e8UAUPS8
 shi+C3ddaOr/LtJcOsZr6tIhXU/jMZEqAfYz+oGjsBY0PCZ4Xo5m+5ez/QVeJVV+rwGd
 VUglSjrSXPW6uW09472FgbOKTPuk+RtX263/lDH7hZ4P4tVdGPodRt0LunouzkW5pqXa
 rt4VlRHZUyO6OTxmksvsBusisU/MLKvCuDoQbTEhbMbx6J3Ib5D2w1Xt6OFNytjtrZw8
 pHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AW6o0c/04VtmM4Wr/JwMdnRs9yEuZbHl3Nv4hAkPBgU=;
 b=es6jfhnGnGIP94wZ7ldLAiqvCdA0v+S4JKsl66nXU2jN3mSHYQB35PKxopfnM09ZZW
 RNxJNvAfVVP7QFbAu0lZazi3zH3CfIq2gj+tdoJPGSbCXjqcpiuWgvswb4ZZALuKcRdj
 U3JjXW9qw9KGXd9ZcVYQO7pDDISqS5wxNFuWdZpLkb8eIoPYI4gwut3LedlX633XC2RH
 IWibYxZB3tBWKs/4v4WFi6cc191gGXC7AXXmmPA3xxFgk6rkD6M9qyh7khFDWrnbA/tz
 SHTWgi3dqmGF6y+jgsz0YVoQ9I8nl8wPbC9EWnVRV2Ym3bLQFkHHXIuk/h6nbP1PE8+S
 3MmA==
X-Gm-Message-State: APjAAAWmzir+WI91FfIkJcs1xEaCwIM9wL1rVQTqBZ3tdk1IPdayp8m8
 J2MWGNFhXoSDovMrZMa+ICA=
X-Google-Smtp-Source: APXvYqxM78lY5I9+HBe7+4CcP13C7M2zs76YhQ/QJ8xDc45GVIxEYIgFZ+5+x8+MVQxQDkpo7tSo/Q==
X-Received: by 2002:a5d:558d:: with SMTP id i13mr13580848wrv.364.1579445816214; 
 Sun, 19 Jan 2020 06:56:56 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id p17sm43347877wrx.20.2020.01.19.06.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 06:56:55 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mtd: spinand: Add M70A series Micron SPI NAND devices
Date: Sun, 19 Jan 2020 15:54:31 +0100
Message-Id: <20200119145432.10405-4-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119145432.10405-1-sshivamurthy@micron.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_065657_905535_01E84496 
X-CRM114-Status: GOOD (  11.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add device table for M70A series Micron SPI NAND devices.

While at it, disable the Continuous Read feature which is enabled by
default.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5fd1f921ef12..45fc37c58f8a 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -131,6 +131,26 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 1.8V */
+	SPINAND_INFO("MT29F4G01ABBFD", 0x35,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
@@ -153,8 +173,19 @@ static int micron_spinand_detect(struct spinand_device *spinand)
 	return 1;
 }
 
+static int micron_spinand_init(struct spinand_device *spinand)
+{
+	/*
+	 * M70A device series enable Continuous Read feature at Power-up,
+	 * which is not supported. Disable this bit to avoid any possible
+	 * failure.
+	 */
+	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE, 0);
+}
+
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
 	.detect = micron_spinand_detect,
+	.init = micron_spinand_init,
 };
 
 const struct spinand_manufacturer micron_spinand_manufacturer = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
