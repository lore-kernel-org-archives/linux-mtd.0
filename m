Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E779EC43327
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=95bevXA2ev1F9Iis3LaO/hLmPJF51J2USSnRGyQrxQo=; b=c25vjk3+JqFnIO
	3+0dJSf+I5mCpUsa6lWwAvrYeuLad/vzboIMWBMr4K30jcxMPCb5AV83aQ3UG3FV8zcco83NJwJIm
	jgjLKLh4KpqyAHn4BbTGwqnYB2ICyku/qYpmKt2FAsPicmTdFfxat421rgP6tLK+kljWbGMRxXfwn
	jU8ao0uQ/euaxy9tE3JwkQ9Ff1SSIvVH+Ylv5vWzNUPR80IUlSX8wGLTXjY/cmdgK1klF50zsZJAK
	3Xy895GIYWtnJ3X5pt+PQUIGULbSiL0//TJDRQCa7dd4+frzmbMxImx5JHVbPasp/hJ4T7E+NJ+uU
	CS707k3b4b8zYlbi6I1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekrk-00000000XCV-3eas;
	Wed, 01 Jul 2026 02:39:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekrf-00000000XC4-32Cv
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 02:39:53 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84236f9b638so62029b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 19:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782873590; x=1783478390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lhBKIBTyUUlzBSrRoY3fwwZdfAj9Qw3eVw3ezZbn3wQ=;
        b=prvuESJpzkqaSyMo0MJVqqAZAnyu4BbOVukx/xnoS51l8X7bVjBmBksZnEzc0Bftze
         JlZXIiLIIBjG4CGktgZd6EOTuhxmqxnNAG0c0PIrSpgPF9bNRgm2Ew5UXJ5FQ0uOQ2AX
         s2y8uhXMoQMpWfSSZNTPgt723WeXsITkFrOzNV1EbEz/RfHo6fMRwjQhV6lki4uePAM9
         1Gx+D94jJ3hMX7bbxgQMTd1QH5Djfz8jrBuJcth2vzXCpMhziHs5rr4yln59m+SU0g/K
         J9Fe5om5OCWQmqszYCRiWVmUkTO4Pipv9UKyWSUgfiOgZxsOaVdy60IbieQuN6gNJhnz
         8tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782873590; x=1783478390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhBKIBTyUUlzBSrRoY3fwwZdfAj9Qw3eVw3ezZbn3wQ=;
        b=HOXE3SAUug4V7p6w1VkdutapPTkO0PuI4XtnohSspq1EcVcZsuaDTeM/DStr1qCGYE
         YrjWN9aW9hX2UPzqUXnU0Bzp/tXqvTQd6uP3p8EXoKmRMPAj7c/yKWbWKJzevLAFp3UH
         TDrid0YsyV2cRnRVmaBsaTOSTyVBdOcalXni9V4ZZePG+j9KIPAKsLAvL+VHGE8Lf9Z9
         owrq+5cwTimVBSyOjDin1Z+8Wg24Ew1OwmMNRGyo7SKGY+p/hTfigdNnBY/F/OBI0kzV
         J5Q6ha9MpQziJDbs70gxYwO9GdxjpEkemoEVcYPlxjl0xDEqoSIda1Z+PatmPJu4ilnI
         nW3A==
X-Forwarded-Encrypted: i=1; AFNElJ8wXLxwEk1Z/NKH6elJ7opntrv90lLcFK2bC4DEPY74t95huXnyE542Pi189qnZb1A4I/0CPyORurk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7jYNZeKAgl7vPr1d5kPaLs0LOz4PPC5+MJfUqcbiZSJ+VTQWR
	IMCKFLjBs8pMT4lMit4W+JmONUJju3eoEaEpkx8H9UFFq2F/2CsJN5rA
X-Gm-Gg: AfdE7ck4SeMWBkRgcVvRQ2t32UO/eVZFT3cs4DiBodpCXsTGBDdFdagQwbiD/6senrs
	YgM9nIWGj3IGl+TBglYF5gpVGGFwOBvsfRPzjsOyf2AOAnQTp8KihQl71LUW5wILp8MCI/15QR9
	FecSeoDdwsgnk9X0E8TcEI2q+dB7/3Wyqa6vekzzQ/Q6c9rn4hLFJ9Kz1e+rjCvDII/0ieYihd0
	j0XmfXS76Q/EE8ZPgMIdWJixAz4GBzzS1q7ZMGxJy3nE8ObMMaBGoDORQ2lRJlsYRtyIlszILoD
	FNEU6O7pTC7ulkjN7VrPDiuvPkW5zAsiq2QrdBfrYdhNceAhDPmHaQJ5sRAdtBRHVyIaxPHHNo2
	NV8KUBjY78KzWtlRSgSBU5nnPLU12xkxG3TatUjTcSBPOCI9tr1Jgxc9yLLEKv8NDOu0fHwbORe
	ueh/VEMk/l7Am8FUs1D1fpt42bgw3f3e6VlpM=
X-Received: by 2002:a05:6a00:3408:b0:845:bc1d:40f4 with SMTP id d2e1a72fcca58-847addc8f6dmr2692628b3a.27.1782873590337;
        Tue, 30 Jun 2026 19:39:50 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0329c08sm3058685b3a.42.2026.06.30.19.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:39:49 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 40F31416A065;
	Wed,  1 Jul 2026 10:39:47 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: stable@vger.kernel.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 6.6.y] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Wed,  1 Jul 2026 10:36:18 +0800
Message-Id: <20260701023619.2730136-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_193951_785509_83B08CE5 
X-CRM114-Status: GOOD (  14.04  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit 798aafeffb369c5eb36e406b18970ef27baa820d upstream.

Although certain Macronix NOR flash support the Quad Input Page Program
feature, the corresponding information in the 4-byte Address Instruction
Table of these flash is not properly filled. As a result, this feature
cannot be enabled as expected.

To address this issue, a post_sfdp fixups implementation is required to
correct the missing information.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Link: https://lore.kernel.org/r/20250211063028.382169-2-linchengming884@gmail.com
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index eb149e517c1f..b676a71822a3 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -28,8 +28,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+static int
+macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+				SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
+static const struct spi_nor_fixups macronix_qpp4b_fixups = {
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
 static const struct flash_info macronix_nor_parts[] = {
@@ -81,7 +99,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
 		PARSE_SFDP
 		FLAGS(SPI_NOR_RWW) },
@@ -91,18 +110,22 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512) },
 	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ)
+		.fixups = &macronix_qpp4b_fixups },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048)
 		NO_SFDP_FLAGS(SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &macronix_qpp4b_fixups },
 };
 
 static void macronix_nor_default_init(struct spi_nor *nor)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
