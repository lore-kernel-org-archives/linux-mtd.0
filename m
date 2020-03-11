Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7A2C0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A0420691
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G2PlVwPl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfhjLI+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A0420691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GFw5OneaJBmSQGS/7dQke/eBFRp7LnTQkeQNMHAtIuE=; b=G2P
	lVwPlwNrTzKFV3sII5Sm32grtwpr33MKd2wdg2PZGjYqWBqxzmkjLrDnMASMNqcxtza0H7XeDuvVk
	GR7R4FsKxaG55fRmuRH5KENVdn06Uhub9t46vklrcT+jB5ITkgZLODuew37xImlZvWOYO0H/AhLI0
	zFgA90MTt0UuT4M5ole53d8iV7Xk5Ft/DnE4TMMJ5Apd+eJNWxOpDkotkQhY/LlAi1u3cE/mndKI2
	DVx5nqydzVrsB+DEs5RVM7oy9X88ilVdDOHeKCX9CcQTSfaSnzfrgisgVicxYK9wdGkDq2u8Z2/U/
	xOKhHQ/QV7xuKJM12E09ylcza1AfXog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC5dI-0006c8-Up; Wed, 11 Mar 2020 17:59:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC5d4-0006OG-LY
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 17:58:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id n2so3155828wmc.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=D0MmJxY6JdQ6gZeoOlIDmYiScwpgWMOLFKV0aKt57H0=;
 b=KfhjLI+11lfhCg/ocC5rckfQmrjWJic2uNKWFfImfjqyRwZLXIDBgsDNrtjljyRynH
 GdURhYfMl5lUtixt0hF66fG5ie8/CZQ9TwvV14k60xkaKNTepFbbcr973/zys4k1Nrs9
 3fLLRTmnOxomYLegaGsox085+SbGpG+ufgRJJBvHAkcLWyA3vl2dVPF8jNdKtkyuepDj
 yMWSvbtopBCWYA9sDUgRxWjF8BYWgAkL8+dk+6FBPkJNjLexq7E7aOb+LUDOlxl3xK1a
 8MZ8g19bz3o6fdrQrtbyvMDgr3oJKQ/tIxYBhkYtTKARST421XYhh11bi5YDhF3Fuda5
 obWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=D0MmJxY6JdQ6gZeoOlIDmYiScwpgWMOLFKV0aKt57H0=;
 b=URzlhwSunPSXrx1L/zBscE4eEQQJw3mFnNRmaqsaeqwVdseF1NCp+hj1ME9HtPlep7
 hDUqH1N9wr5WFVlvGDYRDWURmpG1f56wH9+INpjGBvHS9RI3ajdPLsQ+dogHBIryXVUM
 P9zr2OTy7M88gjuaSfxEORHKDB2GXRghRAKX/+u4Yfk8PigfUyGdTap8UcajmWnHbL40
 6H2VkWlqpbrbqrAaLDi7kxB0aiwKxX02ZGo3DxVe9tTWR/fjmQcdz3GxXnaiVdWETKZV
 l5JP1m8jtUZJdckZtzTqarmTg8CeoE308dRpB2igYkkd23N0728TEoVOkuby6PWhwGTE
 XdxA==
X-Gm-Message-State: ANhLgQ2GGo7fYmDhWvKadvTmFjoptVFDehVAHcQzjFHB/zuOBY0TXMqj
 t60bq0uKY4mnca9ELatGBDLgLxr3Dro=
X-Google-Smtp-Source: ADFU+vva0oWNwwcrUmHlZ4NWdzEHtYTEf73OgVui5Nkk1uBnR1wtjMNBg1BPy56FUaXPkyV0VToN5g==
X-Received: by 2002:a1c:9690:: with SMTP id y138mr985818wmd.65.1583949527159; 
 Wed, 11 Mar 2020 10:58:47 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id l18sm1502107wrr.17.2020.03.11.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 10:58:46 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] Add new series Micron SPI NAND devices
Date: Wed, 11 Mar 2020 18:57:29 +0100
Message-Id: <20200311175735.2007-1-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_105850_733144_A03723A4 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

This patchset is for the new series of Micron SPI NAND devices, and the
following links are their datasheets.

M78A:
[1] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_3v_nand_spi.pdf
[2] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_1_8v_nand_spi.pdf

M79A:
[3] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_2gb_1_8v_nand_spi.pdf
[4] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_ddp_4gb_3v_nand_spi.pdf

M70A:
[5] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_3v_nand_spi.pdf
[6] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_1_8v_nand_spi.pdf
[7] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_3v_nand_spi.pdf
[8] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_1_8v_nand_spi.pdf

Changes since v6:
-----------------

1. Rebased series to nand/next.
2. Added Reviewed-by from Boris.

Changes since v5:
-----------------

1. Rebased series to v5.6-rc1.

Changes since v4:
-----------------

1. Patch 2 is separated into two as per the comment by Boris.
2. Renamed MICRON_CFG_CONTI_READ into MICRON_CFG_CR.
3. Reworked die selection function as per the comment by Boris.

Changes since v3:
-----------------

1. Patch 3 and 4 reworked as follows
   - Patch 3 introducing the Continuous read feature
   - Patch 4 adding devices with the feature

Changes since v2:
-----------------

1. Patch commit messages have been modified.
2. Handled devices with Continuous Read feature with vendor specific flag.
3. Reworked die selection function as per the comment.

Changes since v1:
-----------------

1. The patch split into multiple patches.
2. Added comments for selecting the die.

Shivamurthy Shastri (6):
  mtd: spinand: micron: Generalize the OOB layout structure and function
    names
  mtd: spinand: micron: Describe the SPI NAND device MT29F2G01ABAGD
  mtd: spinand: micron: Add new Micron SPI NAND devices
  mtd: spinand: micron: identify SPI NAND device with Continuous Read
    mode
  mtd: spinand: micron: Add M70A series Micron SPI NAND devices
  mtd: spinand: micron: Add new Micron SPI NAND devices with multiple
    dies

 drivers/mtd/nand/spi/micron.c | 158 +++++++++++++++++++++++++++++++---
 include/linux/mtd/spinand.h   |   1 +
 2 files changed, 145 insertions(+), 14 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
