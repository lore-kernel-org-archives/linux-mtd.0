Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13914CD6E79
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QsadpbjnvduaU9TKOwT7cuW/0bBgS3I+TrxeVw2wuk=; b=v4/66C/XhU/ojE
	x2EAWyJj4CA8UmmFqcME7wcjlPU5atXiNYvR+asbfmcT4QdN/KY88hOxCvjLQWXd36sZ/s6Tjiaci
	tAk9sED0VZY6dyztWlAyNCdkvpV/KcaAr62XBmmCyGghAl6bThfIeMJrIJb92i7gLX9mP5FjvqAJ7
	z6kw1A/snOmyMldoCQ4pK0E5GvQSXJSS1GNoiZDiKnZnqO0pRR58Zg43OlfpQOYpcygyJozqhQ/X/
	yOQBEG3wSW2vmxxcUwVMWHsOB1wAArJzwX9zcqZQlBsmDNp/QuRd9tkV1o7+FnXybMOVn2C912gtZ
	oQITsVT62X6INwhS1Q5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIuq-0000000HTSD-1Z3d;
	Fri, 05 Jun 2026 01:00:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIul-0000000HTQV-15r5
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36bd175fdbaso924982a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2026 17:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780621198; x=1781225998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTPPV6JZiYYlwbArmH1Q/4ShfP+Wrc5dPQHhlSVN1ec=;
        b=fJjJpOTZmrxlzbgmCn3NFmpznX3U3MgaC+8jpX2rjlra4NvJoqcoYB3jFhm50h/USE
         sN2xPTzEnGhUgB0/kkjnxPp7/nqXeF49vcy2WZ1NI+nkjGVoz6bzkG1eLrBacfE5/9P4
         BZe1ycYHI19S7e7bnvdzoSCn2bF+3x2SW845gS84f+/z6poxy5lqEPeKh53+yG1jjkJN
         huKGNdCDmefj0pxDmSffKosL0exG3pKqF7muO8HgnEHQcg24p36p7xEHsTH5bwo3Xe5T
         JAfgIQsImvezX9iauC/jfeIsuTfRGjY93WSAIfxOTg3RVxlmYEpxIR05Tr9ocSuAcArQ
         xqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621198; x=1781225998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTPPV6JZiYYlwbArmH1Q/4ShfP+Wrc5dPQHhlSVN1ec=;
        b=Ak5nyPaHriniiw898KNkHWznBUcqXxETgF/23XpqW0ChBMrEJ+te0S/w71IMVEU4TH
         GdGGsuDi2CQYCFNVwW0MkKfqFP/xNoQtmdQ1MO1U7pG6GmpgQIA6lOBYc7nqoxK5vgCZ
         c35mmBMO9Jf6IFkpyrDij16MJ4mU9kIPAjOtJ5bkVhvniO6jDdA0wYNetW+qoqP+GmzA
         xAK179kSPbuUJqlbT3UfdkW+w2dT9F5aGtPNKraMKGTwi4HfjpxFG8PhqXxd0EsSpLSA
         JpERfqUhG38cGsUb0jFnO6SJTcnJDhivDYW/mR7wPHCk0WOxJb8k+85XZ2044BamXClE
         9pYw==
X-Gm-Message-State: AOJu0YyY9UJCsrvGvUdHrAHjzCgXedTi/aD9KXU1FflGKmhHa8KCM42k
	Pl54nIFW4URt0ntqNqN5td0KfVSNdQxhGr9x0hkTSQj86iT77NBRTP/2
X-Gm-Gg: Acq92OGybsrLm0ItaAZvlunCtf2GY9GMrY2bmDWfd6Lmu/gXvFz4SmGFHHnQivhdHsF
	0GgJW5SztNMWEU6QVGMY8XNOJQ/L90FZnxVz5lDdsRRQ1fn26qI26HWqX+RrSftw8sLgTrn8JvH
	jKjLzjhBd4lrXN3r6JPbsvUb6RZGZFZQBOHj8TdE57i8Os+7idj2wJr1KYFr7l7+kpZfwDdVGqj
	45+stX9SD7Ze6VEsPkl7aSoMwLtzjT3ZBprv7WQatK6CD+ZQJCFADsGYt3pimBVeWuDlaOEg60n
	mMcbssDvzfx2n6AdVv5tJrWnglMgpj56/rAeIZAg89z3GUAZBywi9/EyG9GC1qMIQjEEuZREbDi
	4jt/9YxRsKZlvm+1Gmcsafcsgc5Wvr3+qEFEL5VOWLANMtks4izRKJRVOyKMTJRDqGgLkK7Sr2l
	SbwsXUQcYITo7Nefhod0JW9/p4nejqQE7c5RE/6XGSI/7o8VgZ20TCT+US
X-Received: by 2002:a05:6a20:be86:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3b4ccf7f128mr1382064637.24.1780621198351;
        Thu, 04 Jun 2026 17:59:58 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0bdbe4sm6528618a12.32.2026.06.04.17.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 17:59:57 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7333E4163B71;
	Fri,  5 Jun 2026 08:59:55 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/2] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
Date: Fri,  5 Jun 2026 08:57:19 +0800
Message-Id: <20260605005720.1857413-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605005720.1857413-1-linchengming884@gmail.com>
References: <20260605005720.1857413-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_175959_300122_79E790FB 
X-CRM114-Status: GOOD (  14.39  )
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

Add support for Macronix MX25L12833F and MX25L12845G SPI NOR flashes.
These parts share the same JEDEC ID (0xc2, 0x20, 0x18) as the legacy
MX25L12805D.

The newer flashes support SFDP and 1-4-4 Page Program in 3-byte address
mode, but this 4PP capability is not defined in their SFDP tables.
Conversely, the legacy MX25L12805D lacks SFDP support entirely and does
not support 4PP.

To safely enable 4PP for the newer flashes without breaking the legacy
part, introduce a post_bfpt fixup. Since the legacy MX25L12805D does
not support SFDP, it falls back to static parameters and will never
execute the post_bfpt hook. The newer flashes will successfully parse
the BFPT, trigger the hook, and safely append the SNOR_HWCAPS_PP_1_4_4
capability.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9..febcef6a1 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -83,6 +83,25 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l12805d_4pp3b_post_bfpt_fixups(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * JEDEC ID 0xc22018 is shared by MX25L12805D (no SFDP, no 4PP) and
+	 * MX25L12833F/MX25L12845G (support SFDP and 4PP in 3-byte mode).
+	 * The legacy 05D lacks SFDP and will not execute this hook. For
+	 * the newer flashes, 3-byte 1-4-4 PP is not defined in SFDP, so
+	 * we safely enable it here.
+	 */
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
+				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -96,6 +115,10 @@ static const struct spi_nor_fixups mx25l3255e_fixups = {
 	.late_init = mx25l3255e_late_init_fixups,
 };
 
+static const struct spi_nor_fixups mx25l12805d_4pp3b_fixups = {
+	.post_bfpt = mx25l12805d_4pp3b_post_bfpt_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -130,9 +153,10 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		/* MX25L12805D */
+		/* MX25L12805D, MX25L12833F, MX25L12845G */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.fixups = &mx25l12805d_4pp3b_fixups,
 	}, {
 		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
