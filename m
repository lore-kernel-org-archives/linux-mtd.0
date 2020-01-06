Return-Path: <SRS0=lLyx=23=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D28EC33C9B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 12:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D31D52081E
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 12:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwkFTuXY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ncentric-com.20150623.gappssmtp.com header.i=@ncentric-com.20150623.gappssmtp.com header.b="tHmp1Bv+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D31D52081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ncentric.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CD5sBlXJcbw8LWmExNJ6p6cNsV96QQ7VE70FFIHeyg4=; b=Vwk
	FTuXYl5+92ko92Ccl7n0CwkSlQ9HwBo3evvvei2bttjGfLQmP0S1Ibr6aHo7UVxF++0J47AlNHgA+
	btBi+6OBckL4fvsd4kIwXIMOUZgjnSpJc/qBFZRd4y2wyR448SbX7ulei8jPtH36WoGE1qTRmLich
	4OluRrnwXcBLU1nMJ/rWW63tjSjMXN3K5LvybVlrq4XTe1Oad5gMKrj13wm/AtmhpwQiEswSArsDZ
	kiR9HJVCZ3HJIGB1qN1hT2/bf1UieMBPXLhB25EgEFuUiDuCoH0lqY8iKZD5qCvaAQ7srwl8iJ6Wf
	TOUY98c5A8ftxeixXymGK3BmUJrVZAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioRmY-0001Md-RZ; Mon, 06 Jan 2020 12:46:54 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioRmU-0001Lz-CS
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2020 12:46:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id z7so49364880wrl.13
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2020 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncentric-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=0Zx04WAqEXVkUkbdm0WmbEhgkeZlwQgpP/n5FtB9QGk=;
 b=tHmp1Bv+TUAnDZWxZdAAVY9S+YZFROkpk/LXOjYpHu9cH6KW9hm8QrokbIJN17ogkG
 sIncZgXi3OqjPtFkIIdL/CWGlOpZmdD/m0u1P8nRHKL8fyyBw87Oq+GiLpVcTjT8Zq8o
 ZNc+Ag4Z4UF8DXeaF3ZqN8wgmLLYPBwX9IX6wQdCi0ojfukmTyBM53vgV459UuesDcH/
 591dtItEXp8X98M3p2JLn4Gc9KZwtkyMG38BmkFmdB4+vXrkC4RJwF3GYcceyj9f0dFK
 ipcJmVy7PT3x7T6fTfUKh4bHdqHeh80nxGKZ+yztip4Fu0/MZQqpDnfUxKAcqMm/ydYj
 yOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0Zx04WAqEXVkUkbdm0WmbEhgkeZlwQgpP/n5FtB9QGk=;
 b=mRb1G9hyXUOCe3HhW0VPfV/W7Ata7mg2il22BWCuwI0tlnPRVpuK1PmSG0bc9WSUoV
 C3SWvnu7a1vZzx1wX/Z/PECD5soJs0Kvheyp1EijkYKg5zZ4f2NmwpqxkGEKZtvWDYo+
 joqymgfzV30+fNyco6YgCiUtgy2Yr1Vp3Z6dwOmoK4rmC0zt4xwsq+T/JWM4AZ/fJZ2p
 KfAcuLDgbJP9S3jKRjgAVrgfMRI7oeAObNdvFp2pAJMB0+4FQd+qH/dfkiK0I13y4sY9
 aMIjRVMFtMMlJZfNQA3zKRz9S4H/JyIxSrK+JelAjTWA7yRF1FNlN2TwlZ+gapHMN60A
 sBcA==
X-Gm-Message-State: APjAAAVEpV/ug8GyuwRpzr1htrWhz6aeR7ki7HJNU0Iz9X1pxW/kicbo
 r/hAaD50YmK1K/tLqdK6Wqh88a3n3qk=
X-Google-Smtp-Source: APXvYqxG3YtWeGeqFPZaJ9j3dqHH7hVRBv6QX8X9otd7UVKxtCEK0FH9Qu9pfu821ULzKKyYKNuTXQ==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr96869950wru.297.1578314804923; 
 Mon, 06 Jan 2020 04:46:44 -0800 (PST)
Received: from localhost.localdomain (d5152e8e2.static.telenet.be.
 [81.82.232.226])
 by smtp.gmail.com with ESMTPSA id n16sm72316413wro.88.2020.01.06.04.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 04:46:44 -0800 (PST)
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: add support for GigaDevice GD25D05
Date: Mon,  6 Jan 2020 13:46:24 +0100
Message-Id: <20200106124624.28779-1-koen.vandeputte@ncentric.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_044650_471059_8F7F9345 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tested on a MikroTik RB912UAG-5HPnD r2

[    0.641714] m25p80 spi0.0: found gd25d05, expected m25p80
[    0.649916] m25p80 spi0.0: gd25d05 (64 Kbytes)
[    0.655122] Creating 4 MTD partitions on "spi0.0":
[    0.660164] 0x000000000000-0x00000000c000 : "routerboot"
[    0.667782] 0x00000000c000-0x00000000d000 : "hard_config"
[    0.675073] 0x00000000d000-0x00000000e000 : "bios"
[    0.682613] 0x00000000e000-0x00000000f000 : "soft_config"

Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f4afe123e9dc..a34fa42d47a2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2346,6 +2346,11 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
 
 	/* GigaDevice */
+	{
+		"gd25d05", INFO(0xc84010, 0, 64 * 1024,  1,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{
 		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
