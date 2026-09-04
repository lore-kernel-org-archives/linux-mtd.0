Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEEEC79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+itJVGA3YM1joAMo8HZy/EX1EpMpDkPaBxaN+KIK80g=; b=ENw7pWhisZg0d0
	5zXwk9vSnv6RwAvNpli07emJz+MnehuHfbxzKa6NX+sPXOmujQothA+8otuBAUJ7CP5kRKWvxUuqp
	VVGtOiluFI0G/0XmApdNRljyOl2iMH7yY23Kh16vkAZj2Frzh+rZJpONCXqbzWxPbnG0ow43TKRau
	apduX6zaerErMGh4JqMYG6754SgsI+XACjMSmQubWPG3zsaZttw7LJlclFrST+sc16Rti9v51KIeh
	QTI53deWLa6EdWozTXKJ2y6hGCh5boo4z11BLVmKSEFkpBCRO8poJCbMDi0AR3VKQcw2sZxkirpwD
	WSjOXiJ4FdNawLTRkSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TP2-0000000252I-1fl7;
	Fri, 04 Sep 2026 12:52:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TOz-0000000250u-1e3z
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 12:52:19 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cace91f112so8215845ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526336; x=1789131136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCG99e+5QxRQXSuO8zd59u52whzEDFO7RhFXyu9E9Gk=;
        b=HjVuLj8X52nNj4xUYbtLDbtzUFpOucprnspa6AmzSNrJ04EF2T+7JUphCz8uAtXACg
         KoJ8g06MIwjr+fHfUysNvm5toRv1kJI4gYA2fVqRNIrsBSK3PbBdXLcLfWzQu0eheEQW
         QFPk1Dq0H+kuL9FJV/kfuU7sxOmaLfdoXRVHuM42V9LsOj8V3qQEVay57Vis7SqTDjbq
         zm/CvvKDjiEc0dLQQZaPH+2zm+5deTFs0GhO6CU/HJIkBe95mS8+hSzI9ciGfUgXVUln
         z4C1jQPzPhCDEmyAtVlkY4GrMxciLrQjD9+46Ka6asE2slAndh/5krSr/WlhkeB5n7Iv
         fASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526336; x=1789131136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCG99e+5QxRQXSuO8zd59u52whzEDFO7RhFXyu9E9Gk=;
        b=MjHNTM1b6goNTM70079HuCU5qOpBvg0RnbxIhmhTS+aPZsH9kJUWusD9lqnNeJ1IJv
         pi3suNg8EyauBzN9/FLoeJkLTkPNL3Bf0xEz8esdHpfOxYwM6Q9BIEBe5kn7rJjcWANX
         kK1VSUzWr5NqRo8Zt3kqAQqpFIumJ09ddgeBwi8enjPcb8xH8d+XtnMHs11iCZIPykAi
         tHEZzJD+XAS4xYZAyezct3qsg0Bs1+6luUcQ6StlI3U9RkWM6840PC9g3pMruKHzk7dT
         MXwilwEoeHocTeN9Q6vxN1YJXQu5rcGO1i+hGJCfNGEmAtScT3XzUyzl0PLveqrPKg0T
         xGNA==
X-Forwarded-Encrypted: i=1; AKwUvByAw86X7WrWY+IazrRnOOTX45tqPXrxzzUcmoW057PNfrJ0hXXsDOv1cQC4BE7NqAagNISoIadob2g=@lists.infradead.org
X-Gm-Message-State: AFuF++k2h1TOgB4znB8lpyz5OFBCtIfqVqffIwkOIt07PZfmoOwy93XA
	Azz8ne87hO3os0rjmb433CN+zsG6O+MP46xdUzkv8YWPbY/y6xxBCe9O
X-Gm-Gg: AYBFou0JQQypVdxlmiaRhzw7ofkmRO4R04iiL2B/aaaSywKLYwUJBN7sGZ0WFjib3Cl
	hCdmYp87WxRQis6cuo6g6e6Y7ev2fcVKWWLt/sWEJ4X2Pl65Untv8MSy/895wHQ3t6pMduVnSrs
	D6WzR7UqkxyJthndX/iYFUYE9u1WPmeVqdY7MYI9WKl4MmY7fmjFSJG1tMCrgbgm8v6AwOx/gQ3
	zUuS2MDIqNtLGXyo6Q+NuBSpnbenfWW+lWl9yJr1q0MU8irujkbArRPAIz1vTB00qVauJoFKYL8
	CFulKlKXeddVKwPnMLAX20pflUSeUUkUFAGFD1VxHOV7vAvB/fV/czaRdD6gDbOZjYbB94wOrmV
	mTPRLQQN32/8+y3hSHxDQOpSPp6uzvGJ2OzIH67uIa29LObxNv25pCPJqpOH+zYzvQwD1P+6FCW
	WLHgdMuD9hwWsRdjiQSz5U6/YdItCCjUPqok/7Bn3Xmko3he0OioHehNYAImMK75iwKXhl62bAw
	9zwkJfEY8SotX8=
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr9145959a91.17.1788526335895;
        Fri, 04 Sep 2026 05:52:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm9816370eec.16.2026.09.04.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:52:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Han Xu <han.xu@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mtd: fix typos in comments
Date: Fri,  4 Sep 2026 18:22:03 +0530
Message-ID: <20260904125208.12099-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_055217_523306_0E3367F7 
X-CRM114-Status: GOOD (  21.84  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mtd/devices/docg3.c                | 4 ++--
 drivers/mtd/nand/onenand/onenand_base.c    | 2 +-
 drivers/mtd/nand/raw/fsmc_nand.c           | 2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 drivers/mtd/nand/raw/mtk_nand.c            | 2 +-
 drivers/mtd/nand/raw/nand_base.c           | 2 +-
 drivers/mtd/nand/raw/nand_legacy.c         | 4 ++--
 drivers/mtd/spi-nor/otp.c                  | 2 +-
 include/linux/mtd/bbm.h                    | 2 +-
 include/linux/mtd/rawnand.h                | 2 +-
 include/linux/mtd/sh_flctl.h               | 4 ++--
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 603fd0efc2ea..84566997d665 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1884,7 +1884,7 @@ static void doc_release_device(struct mtd_info *mtd)
 
 /**
  * docg3_resume - Awakens docg3 floor
- * @pdev: platfrom device
+ * @pdev: platform device
  *
  * Returns 0 (always successful)
  */
@@ -1963,7 +1963,7 @@ static int docg3_suspend(struct platform_device *pdev, pm_message_t state)
  * @pdev: platform device
  *
  * Probes for a G3 chip at the specified IO space in the platform data
- * ressources. The floor 0 must be available.
+ * resources. The floor 0 must be available.
  *
  * Returns 0 on success, -ENOMEM, -ENXIO on error
  */
diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index d08aeac86f9f..bca5a3bebd41 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -3279,7 +3279,7 @@ static void onenand_check_features(struct mtd_info *mtd)
 			 *
 			 * Now it has as following
 			 * KFM4G16Q4M has NOP 4 with version ID 0x0131
-			 * KFM4G16Q5M has NOP 1 with versoin ID 0x013e
+			 * KFM4G16Q5M has NOP 1 with version ID 0x013e
 			 */
 			if ((this->version_id & 0xf) == 0xe)
 				this->options |= ONENAND_HAS_NOP_1;
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index b13b2b0c3f30..08ef4425559c 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -461,7 +461,7 @@ static int fsmc_correct_ecc1(struct nand_chip *chip,
 				      chip->ecc.size, sm_order);
 }
 
-/* Count the number of 0's in buff upto a max of max_bits */
+/* Count the number of 0's in buff up to a max of max_bits */
 static int count_written_bits(u8 *buff, int size, int max_bits)
 {
 	int k, written_bits = 0;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..c61f3983a713 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2271,7 +2271,7 @@ static int nand_boot_init(struct gpmi_nand_data  *this)
 {
 	nand_boot_set_geometry(this);
 
-	/* This is ROM arch-specific initilization before the BBT scanning. */
+	/* This is ROM arch-specific initialization before the BBT scanning. */
 	if (GPMI_IS_MX23(this))
 		return mx23_boot_init(this);
 	return 0;
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..c439b7814ebb 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -42,7 +42,7 @@
 #define		CON_BRD			BIT(8)  /* burst  read */
 #define		CON_BWR			BIT(9)	/* burst  write */
 #define		CON_SEC_SHIFT		(12)
-/* Timming control register */
+/* Timing control register */
 #define NFI_ACCCON		(0x0C)
 #define NFI_INTR_EN		(0x10)
 #define		INTR_AHB_DONE_EN	BIT(6)
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..a225b10f8145 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6205,7 +6205,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/*
 	 * FIXME: some NAND manufacturer drivers expect the first die to be
 	 * selected when manufacturer->init() is called. They should be fixed
-	 * to explictly select the relevant die when interacting with the NAND
+	 * to explicitly select the relevant die when interacting with the NAND
 	 * chip.
 	 */
 	nand_select_target(chip, 0);
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 97700f80d5b8..94d5c7723c5a 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -319,7 +319,7 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
 				      NAND_CTRL_CLE | NAND_CTRL_CHANGE);
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
+		/* EZ-NAND can take up to 250ms as per ONFi v4.0 */
 		nand_wait_status_ready(chip, 250);
 		return;
 
@@ -459,7 +459,7 @@ static void nand_command_lp(struct nand_chip *chip, unsigned int command,
 				      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
+		/* EZ-NAND can take up to 250ms as per ONFi v4.0 */
 		nand_wait_status_ready(chip, 250);
 		return;
 
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 7d0b145d78d8..61c55227e15d 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -25,7 +25,7 @@
  * Read a security register by using the SPINOR_OP_RSECR commands.
  *
  * In Winbond/GigaDevice datasheets the term "security register" stands for
- * an one-time-programmable memory area, consisting of multiple bytes (usually
+ * a one-time-programmable memory area, consisting of multiple bytes (usually
  * 256). Thus one "security register" maps to one OTP region.
  *
  * This method is used on GigaDevice and Winbond flashes.
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index d890805f5494..67929fdf2dff 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -75,7 +75,7 @@ struct nand_bbt_descr {
  * with NAND_BBT_CREATE.
  */
 #define NAND_BBT_CREATE_EMPTY	0x00000400
-/* Write bbt if neccecary */
+/* Write bbt if necessary */
 #define NAND_BBT_WRITE		0x00002000
 /* Read and write back block contents when writing bbt */
 #define NAND_BBT_SAVECONTENT	0x00004000
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..43fefff02025 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1592,7 +1592,7 @@ void nand_wait_ready(struct nand_chip *chip);
 
 /*
  * Free resources held by the NAND device, must be called on error after a
- * sucessful nand_scan().
+ * successful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);
 
diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 78fc2d4218c8..15adf2474fa0 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -60,8 +60,8 @@
  * Some hardware uses bits called PULSEx instead of FCKSEL_E and QTSEL_E
  * to control the clock divider used between the High-Speed Peripheral Clock
  * and the FLCTL internal clock. If so, use CLK_8_BIT_xxx for connecting 8 bit
- * and CLK_16_BIT_xxx for connecting 16 bit bus bandwith NAND chips. For the 16
- * bit version the divider is seperate for the pulse width of high and low
+ * and CLK_16_BIT_xxx for connecting 16 bit bus bandwidth NAND chips. For the 16
+ * bit version the divider is separate for the pulse width of high and low
  * signals.
  */
 #define PULSE3	(0x1 << 27)
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
