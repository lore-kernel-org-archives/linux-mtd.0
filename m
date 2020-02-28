Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423AAC3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:05:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04D0A24699
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 15:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aB9zj5Ed";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeF9PAxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04D0A24699
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1wGuZ+C+jKv+LwG1NsVj+6dk5tCGksAk3CUfR+GbpWw=; b=aB9zj5Ed7NSkvo5ppdj30Plpt3
	Yt5EaxkaN6R7nBGOCo0nWct2iczqENJFmahWBSWrPBzcPQ8nQkMnTsnSAr06WZLIwnCOCEwBdQ1uK
	Z9Lq3i0m+1HLmjO/SXs7E/xRVM+N5hwLm5PA8+4eT6UFbqus8eagqBwTG2uUzep92lsKYAwZV+4aT
	5vSAhXEuZ+pPznbHqqk+Bs7cbVNvdN5pkuzWp3BHApdoJKpbfcf2sGzq8h2AQtuaKGwTGO7SyQ88R
	NNwFoktz/NCR/cjV6v5pvSMuusv7MsG6uiSuo+JiZboO7wCEwNpAx+ctDOcFHjqCWDXJtK81VFw9j
	rc7Wn88A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hCE-0003vN-UD; Fri, 28 Feb 2020 15:04:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hAp-0002ai-3i
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 15:03:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id v2so3236875wrp.12
 for <linux-mtd@lists.infradead.org>; Fri, 28 Feb 2020 07:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fZEHZVAiXu8sfQoYawsUmY7xOYvR1LEo4KSCSXP/S8s=;
 b=IeF9PAxhj6qut36ZuWPrBeWpxsBAbTFDj0kdJdDFOcUUlHXoxL+vodyFM0zBrx+7kY
 aWnNTgGhHt0fSn6N2tRI6w71pq/1d+l7Y6TtHWzhmRvq+TLIjiikpV4UOTAuB1RDsu+P
 78LhVKa3JVcbW/j42+vKAlR5uYKbwxgDtaZ0pOPM5liw0jDr+HHoqRhm/t7YbNgpWG2f
 q5/XOqLy5uBevhgPj1NKUpNOKLwJefKoQSc6PSA/Vjwqs7Vuo8nTqCU5wGZscDAoktfz
 /kVS4oTr9ZViyhNMR/y0qe1pfYmV1RYRGme8zNzLDMDCQpLkF6Nsb/cRf8rw5FjdjV8S
 x8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fZEHZVAiXu8sfQoYawsUmY7xOYvR1LEo4KSCSXP/S8s=;
 b=OuiQ30Kksv/LCBb7RsOw+NwRD7OR+ioLtnIThGw4rUjYGG8PN8dl5jVf6ztaMXiQvw
 v0gCUgbvoUDzDiln47+mYH6nOjUuC8HCPdDSG49a0JMZ33KrafBQQ7FWFwX8UjSzuqiL
 eunUXRFDPzytMh69A1EQ48+f28SyAttmlfWiif/8W2GYkNpb9E5EYmGSPMUhyOfRyBhB
 6BXSSZP3flPf64LnGnGClB9Sb6EjPCIq26Xoxl8COfHgRJtZhnesYLvOGa/J9Ny+Tuqu
 xUKLrv4jxcYUCd/p2n8FKCUtZEupcuWl7QpONP2CpNLCf5TrTDuQt9trcxHWiPnMBjjV
 miVg==
X-Gm-Message-State: APjAAAUEidyh8iNtA5Nx//yuyL1FFJQ97JL8Oa76Z6wYX80CrdRg4vh1
 AeixP1K0IZ030VkTEx3EYYw=
X-Google-Smtp-Source: APXvYqyleSgvxT4d7cfXOT/h9tVeDS9Or+040xuk304Gj5BfOtQaMIdihejRcWDBnVnGROLg24plRw==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr5109017wru.127.1582902209561; 
 Fri, 28 Feb 2020 07:03:29 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m125sm2540235wmf.8.2020.02.28.07.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 07:03:28 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] mtd: spinand: micron: Add new Micron SPI NAND devices
 with multiple dies
Date: Fri, 28 Feb 2020 16:03:11 +0100
Message-Id: <20200228150311.12184-7-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150311.12184-1-sshivamurthy@micron.com>
References: <20200228150311.12184-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070331_238160_FFFD33EA 
X-CRM114-Status: GOOD (  11.71  )
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

Add device table for new Micron SPI NAND devices, which have multiple
dies.

Also, enable support to select the dies.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 55 +++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 9db1ab71fcae..f7d148aaa476 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -20,6 +20,14 @@
 
 #define MICRON_CFG_CR			BIT(0)
 
+/*
+ * As per datasheet, die selection is done by the 6th bit of Die
+ * Select Register (Address 0xD0).
+ */
+#define MICRON_DIE_SELECT_REG	0xD0
+
+#define MICRON_SELECT_DIE(x)	((x) << 6)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -66,6 +74,20 @@ static const struct mtd_ooblayout_ops micron_8_ooblayout = {
 	.free = micron_8_ooblayout_free,
 };
 
+static int micron_select_target(struct spinand_device *spinand,
+				unsigned int target)
+{
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(MICRON_DIE_SELECT_REG,
+						      spinand->scratchbuf);
+
+	if (target > 1)
+		return -EINVAL;
+
+	*spinand->scratchbuf = MICRON_SELECT_DIE(target);
+
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
 static int micron_8_ecc_get_status(struct spinand_device *spinand,
 				   u8 status)
 {
@@ -133,6 +155,17 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M79A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ADAGD", 0x36,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 80, 2, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
 	/* M70A 4Gb 3.3V */
 	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -153,6 +186,28 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_HAS_CR_FEAT_BIT,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 8Gb 3.3V */
+	SPINAND_INFO("MT29F8G01ADAFD", 0x46,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
+	/* M70A 8Gb 1.8V */
+	SPINAND_INFO("MT29F8G01ADBFD", 0x47,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
