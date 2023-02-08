Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9674DC636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqS147RMww0lS6QR1cCjRXlX8it/cgXqIzCxyOIvy/o=; b=cC0KBjaV4T6i7D
	/vbF3M8Xq8IFGM4fETXtpEGK1L+rlhC6BKxz++FfGj8YXFmsyHE7LDZg1sqflHBYHZUB8KtqrD7j/
	3DxSMbUOpletDuiK8wJU4olV9JWBzKRs01LpfYHx8E5VGnJQtwbPZX9AN8u/1D/EligotVvmMBRID
	v1QZ0ffkMnhgvFjisFyMy+geMwg6bDafNBLAcnQDYMIDp4jUicVsJ5yRuB79Zlf9GaudEiyFqbz5J
	C8agHFbF3fU99phdgpPACkjemApX1ZCcGlTzGyyhdRrKDOVnz4fezrkrmvj/H3x+a0In2SGD26K6a
	442AX5W5BbrriyJrwrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPe-00EDzS-PL; Wed, 08 Feb 2023 05:54:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdPb-00EDyi-Kl
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 05:54:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id i2so4734651ple.13
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxNYGB1ZN8D5QdSUKG28VcsT/7/UpMZcWYJPfypqyKQ=;
        b=HAiijYn8Vjh4CsjgHnzuCzM9IQGGV+658yNAJtB8L4K4iTzXxJ6GeotOBcZnPvoXrS
         /9IBwoc5yb+EHZ+9nRjQaADMv+fNvdjo7WDNpXvwmz0yYwSDzDWcge22S4gKAkhaV/cB
         zHpjEDZZ/bYUL8jjp4FddByVDe8CD63XM9PYU+accWBUbo6RU71PA+HehJSD0TCrlIWB
         bESEAiXxn+5C3KwbK5l+hswopk1HWWYoNYUomgUTJvQYSXRtjN68+6x6j+5QfHMF+D3G
         NW8u8Km8nQYhw+B7qmaib/neDAUB9Vw+1T6w/0g6X54kdGmHJ3yFwdwgc3UbdKlr8pcA
         7Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxNYGB1ZN8D5QdSUKG28VcsT/7/UpMZcWYJPfypqyKQ=;
        b=FmiNVTquX+H/9mcQfx0khFJMZ7WTKewmPr38JPAy3Pz354/PSY0CaxQYizyAHUpfCx
         M10YahRzzOkrv5hG3BKhBYsj0+SjO/w7hGOyk8r73zbFLwmzJ+75+itY805wcCVJcqiR
         f/+lOLJWuoKckuGZw8O846Y3INj750tmCyuKKOu6dClhePLA68mCNC4Y1y3rd2QUrXFD
         9AgjegaO0PFA4HAz0fgICZpVOrk4W3MmOyGAM7qZzfgqr95beb63HaBbAi1FVYnWi6ma
         WXgwJUrAAk7ejkekly6IXozmjO3yon6YBgZ2I6ARu6K4Hf3cLs3fvG1AAyJFX2oOY9tj
         aK5Q==
X-Gm-Message-State: AO0yUKX4aTislQHZXy1eWfS4EYBBXZnG4gGUlNfE0xjJcqNx5XQT0zBX
	OoH+eiYiii0a0KNo6azjl7v1FdCJiB8=
X-Google-Smtp-Source: AK7set8bZ8iYp5OoW65vMfq01zeV4mYrLH3auKBRQtf7hOpredl4D4OG6+y/9IohMyfOa0Vsb6sZYw==
X-Received: by 2002:a05:6a20:8e29:b0:be:972a:f5e9 with SMTP id y41-20020a056a208e2900b000be972af5e9mr7173919pzj.34.1675835671187;
        Tue, 07 Feb 2023 21:54:31 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:30 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 1/8] mtd: spi-nor: core: Introduce number of dice and volatile register offset params
Date: Wed,  8 Feb 2023 14:53:38 +0900
Message-Id: <97e4456016d31567649e2a99d6d4daff7ed90e4a.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215431_718507_69EB04A2 
X-CRM114-Status: GOOD (  12.77  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In use of mult-chip devices, we need to access registers in each die for
configuration and status check. The number of dice in the device and
volatile register offset for each die are essential to iterate register
access ops.

The number of dice must be initialized as 1 and may be updated through
SFDP parse.

The volatile register offset table is dinamically allocated based on
the number of dice then filled with offset values collected from SFDP.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 1 +
 drivers/mtd/spi-nor/core.h | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b500655f7937..f18be6283740 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2576,6 +2576,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
+	params->num_of_dice = 1;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		/* Default to Fast Read for DT and non-DT platform devices. */
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index f6d012e1f681..c876ece62f13 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -349,6 +349,8 @@ struct spi_nor_otp {
  *			in octal DTR mode.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command in octal DTR mode.
+ * @num_of_dice:	number of dice in the flash memory.
+ * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -381,6 +383,8 @@ struct spi_nor_flash_parameter {
 	u8				addr_mode_nbytes;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u8				num_of_dice;
+	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
