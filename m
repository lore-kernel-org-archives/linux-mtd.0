Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586B5F8A145
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+RiBd2MAaaNlM10C6b9NeHqyzEVwLkmekxeDnrvxEaE=; b=wvF2p0IXty5siI
	BY4wIVFqvHpLd+9pqc/wjuwS1iQDdozaUY2rfxnE/4DqRmqUN+4NS7YX1pea0v7xCKxSL6qlItoWS
	4SrwHevGTvdyZEwmX8mr9XFJdjeekrf9ze0wkl/5cqiF/FZHbueT4lUbC7QyPcgofzTNs4DCi5KFQ
	5OWnJK5vK8Qn3fb4JXPWqXjQolo7tLv8qkFyYYD8YbUoIipa5knxWAY5o7tbA0ofFsh5vKRR5MUXY
	rS4GKu+9U+4YQIocXKQ06zXdGUUOg6srDxfc0JlB55MRPTqQaFObSSFNnPs2dI/tlgyNQAurqpAaO
	Rr6+Vv4PVWKOszPnNqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIdh-00000002DUh-1x63;
	Thu, 16 Apr 2026 09:03:57 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIde-00000002DUH-3wTk
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 09:03:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-827270d50d4so6821676b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2026 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776330233; x=1776935033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7F7WFW43QiFAG2sG5uCQ0+GqPDCdDXhPu+H8U7iVyiM=;
        b=lg6B9uZz3pjYE0ImrOf8bw3APIgXQoNHDvRbMt1gA+14ozF8uNtqieSwzjWva7fC/o
         Pk7jIJQ9RC0QZTaPq/0Tinhkzjbas7UG8NxOp8nsuB+NBn/ICqHsvZ9Is6/qMPObAT+8
         Gf89nn9DaUanCdqmNbiNhPi5gYZDl79RVMsHDzhbv9ZVefuDie+xbpBHNzqu+AcnVtmx
         1EuPLMHVmsaSgNc28QD8J0JQ9TAlTg0C+udsiXVYj/ck20BVuYvnAuU007wmbiD+Fcpw
         eWx1hNEzdaXzubbG1lTN23XNx0qpdqHhdhVZyeHCmL44HFTUmY3/YLSCFv/aNxVafEwE
         AqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776330233; x=1776935033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7F7WFW43QiFAG2sG5uCQ0+GqPDCdDXhPu+H8U7iVyiM=;
        b=qAFKI26F+hyR4AE+tp9hB/nlUL8CiJ50cZR492N/2SUUepyAp6BQfVro6+VpNFonnA
         5BVHENQtWZ/vOY0i04FuER4gNfTMw8red0OIRYy73CBKgiHiBdnjp9GKt7dRiEIrtBT1
         OFcp1Xy6aDLzfTu1xWjYCsQmDJe3fjdli10P4wThtoTlQvi5MkcO4MH4q+fkcAp1Nq0s
         FPqOKvHXHaGnaor+7MrMbHGxWZdbRpfqr+tOegB/5NLK9vmq91Clm28bYSJowZDiGLyZ
         fHuyWcpa5yDIslqsBhVHrHMxKh2HIUd6qE0mj/HZcLPVKVKoeKG1b4uvS62eejRBj7ln
         SdhQ==
X-Gm-Message-State: AOJu0YxuPLVLuXFrEqkLCvdyTYIe97Lzpe6KcD8edN67agWbwMqAokeq
	JXwGIQrg1Uib2rW1atGlcoAKUH/T2vvX+BWPKrNLQYIBcyowcULjnMi1AXgXIw==
X-Gm-Gg: AeBDieurWoG5MlAaRCYH2XVSrQfrpjqIGC/BKHAAM2sXj8h8B6i5YGenT2yQHvHZ7Vc
	DE86Fs1Dcf3ygl3pFKjwRvZx8xtf/oD0/d8W96h7SRSPVNBPvWeOare2tDnH+H1QHoz/WR42uOp
	nsGcU/I8T+cj9muurZcK0Xv+Ct46DD3kOj/GFm8hRCXA3cgtZPWuzYovthds56pybzijXqjjPRB
	t/kk+KKXfABKQfgX477Ilq4Du8dkMQd8SzzdnVP7X46S73N/Y6jJZjD8bnoCJ6/lTRJNErRiGRU
	FAh8LT79wxM5X+49+KOD93gZK/XQ139CsgXph76AykNWmHsft10eRnaPCNGOO5F8nuyllSQbu32
	6B0n6xLxnqVL1tiuTazO/kwo4u7XT9ryQ0up9i5A6dYeoR6X/sJ5iVNDJUYhWhYHztswCsQ5qgy
	T36PW/UEKjr/LRq2dKG/mPms8wqWo5h0XrzR3/3Crk6jibpWVF9hx5jisblqhAXL+1UttHn0o2l
	XTuAXZZDK0upLeKfJw=
X-Received: by 2002:a05:6a00:39a8:b0:824:a01f:6335 with SMTP id d2e1a72fcca58-82f0c28b6d4mr25240397b3a.22.1776330233424;
        Thu, 16 Apr 2026 02:03:53 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e38ccsm4595899b3a.33.2026.04.16.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:03:52 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Date: Thu, 16 Apr 2026 18:03:20 +0900
Message-ID: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_020355_004418_E61CD772 
X-CRM114-Status: GOOD (  12.01  )
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

NO_OP_CHIP_ERASE flag is no longer used.
Remove definition and references of the flag in core and debugfs.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c    |  3 +--
 drivers/mtd/spi-nor/core.h    | 33 ++++++++++++++++-----------------
 drivers/mtd/spi-nor/debugfs.c |  7 ++-----
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e6c1fda61f57..278b3fd0996e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1787,8 +1787,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return ret;
 
 	/* chip (die) erase? */
-	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) ||
-	    multi_die_erase) {
+	if (len == mtd->size || multi_die_erase) {
 		ret = spi_nor_erase_dice(nor, addr, len, die_size);
 		if (ret)
 			goto erase_err;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index e838c40a2589..30b965ccb44c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -124,23 +124,22 @@
 /* Keep these in sync with the list in debugfs.c */
 enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(0),
-	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
-	SNOR_F_BROKEN_RESET	= BIT(2),
-	SNOR_F_4B_OPCODES	= BIT(3),
-	SNOR_F_HAS_4BAIT	= BIT(4),
-	SNOR_F_HAS_LOCK		= BIT(5),
-	SNOR_F_HAS_16BIT_SR	= BIT(6),
-	SNOR_F_NO_READ_CR	= BIT(7),
-	SNOR_F_HAS_SR_TB_BIT6	= BIT(8),
-	SNOR_F_HAS_4BIT_BP      = BIT(9),
-	SNOR_F_HAS_SR_BP3_BIT6  = BIT(10),
-	SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
-	SNOR_F_SOFT_RESET	= BIT(12),
-	SNOR_F_SWP_IS_VOLATILE	= BIT(13),
-	SNOR_F_RWW		= BIT(14),
-	SNOR_F_ECC		= BIT(15),
-	SNOR_F_NO_WP		= BIT(16),
-	SNOR_F_SWAP16		= BIT(17),
+	SNOR_F_BROKEN_RESET	= BIT(1),
+	SNOR_F_4B_OPCODES	= BIT(2),
+	SNOR_F_HAS_4BAIT	= BIT(3),
+	SNOR_F_HAS_LOCK		= BIT(4),
+	SNOR_F_HAS_16BIT_SR	= BIT(5),
+	SNOR_F_NO_READ_CR	= BIT(6),
+	SNOR_F_HAS_SR_TB_BIT6	= BIT(7),
+	SNOR_F_HAS_4BIT_BP      = BIT(8),
+	SNOR_F_HAS_SR_BP3_BIT6  = BIT(9),
+	SNOR_F_IO_MODE_EN_VOLATILE = BIT(10),
+	SNOR_F_SOFT_RESET	= BIT(11),
+	SNOR_F_SWP_IS_VOLATILE	= BIT(12),
+	SNOR_F_RWW		= BIT(13),
+	SNOR_F_ECC		= BIT(14),
+	SNOR_F_NO_WP		= BIT(15),
+	SNOR_F_SWAP16		= BIT(16),
 };
 
 struct spi_nor_read_command {
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index fa6956144d2e..7505cbab75d6 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -12,7 +12,6 @@
 #define SNOR_F_NAME(name) [ilog2(SNOR_F_##name)] = #name
 static const char *const snor_f_names[] = {
 	SNOR_F_NAME(HAS_SR_TB),
-	SNOR_F_NAME(NO_OP_CHIP_ERASE),
 	SNOR_F_NAME(BROKEN_RESET),
 	SNOR_F_NAME(4B_OPCODES),
 	SNOR_F_NAME(HAS_4BAIT),
@@ -136,10 +135,8 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 		}
 	}
 
-	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
-		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
-	}
+	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
+	seq_printf(s, " %02x (%s)\n", nor->params->die_erase_opcode, buf);
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
