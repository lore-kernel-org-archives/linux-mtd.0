Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A51C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Nov 2021 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=34O6ZaCIncp4UfC4cOaoFFGoOt6lfaHp1Z7HEzB5MCc=; b=e/AmLj73SDmBCn
	YXD6nMPQvBXlrXyBYzAWyt+HpNLVt6idK08lsSYDRf94a4asSxjng5rCXD8GONkiSAj1qMFFgOZXL
	hC48oiVakTkD7W+okKAx0GvVG8dzSt4TuuC7w2Iw9CCk4vtQNHCqo9moS2Xqu6nsnyyBteC3A3Xcs
	LQ/s36dk0AsKL8l6R+ynkIMFZ6x6irhr9kLfRPLiWvzkksX5Fuyx6je6lYodihwA9VZ2TE2wj0WxO
	nt0g7HlMtDAZVmU8V/lzW7EdoNUMD846S+nWPENC4XZy6FFxG7lurtA3HwAEyVDN/j8HD4c1vwQY/
	1x4wjcseBgUc174MkzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mr27R-00EBOp-Jd; Sat, 27 Nov 2021 18:08:13 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mr27O-00EBNZ-Lf
 for linux-mtd@lists.infradead.org; Sat, 27 Nov 2021 18:08:11 +0000
Received: by mail-lj1-x231.google.com with SMTP id d11so25447029ljg.8
 for <linux-mtd@lists.infradead.org>; Sat, 27 Nov 2021 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CoNm0drA3aI7lfneRSUhJcrvL7D1YbjC78jWyeY53I=;
 b=EGiK9q4xmxtSZ6Mrf7tDzIMrqC3/cJHmg9UJypohzII7Lfe8vo4oUvwUjUO93lmRVt
 vsnHmC03TxqHBycJMM/3tRQd1L62pb+E4TxKiAA6FYJ81OTf+H25bandB6lSVs6uW4qO
 13O89pklmC3wvpkQsapdjMZWkUe4sMgls38E0s0HUSPWnWhQEnQaAMivEFnyIxt/flQa
 SpRuuXmcD4FHoEYd95n8lS4amIEOgCLs4XOtVGsgQ4JH4TAoXo2isNN+y5g5lIG5P8Jn
 eybK+yZyfrpFDrG320nGmKoqoF7yI8I5Zgr83eBhK8Zsb0reGJyvsiomVx7XUIynAC8P
 WB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CoNm0drA3aI7lfneRSUhJcrvL7D1YbjC78jWyeY53I=;
 b=2xl3RcaUMndqW/23cG/YHMA5VMogkB2d/vJeFSZIC7/d7vrUc1mdTJ4v6jXYhTZEt3
 f7id4mdoWMfmyzd7WlLKE+DdGG+Nv7vIbGXrEQBYdie4pRBevhOg9pVAij+5DyodcaZG
 OG5w9oifbYFMCyHjjJqRDuohqbTaXWR4r7wE9UJIj9dx4H4yOya9KbE81q0tqa5YdCSr
 RQKvqE7UCYf8zUThnhMUNYkNuPWNGvkjf+b3IK1T4mmtopIXUvDELw4rO2gul9tG9TIo
 nt9m6IjXp3hbAi1Clu1pjrD2P97QBO3TH/hvsHUWpO2FhznN4cgPWuZ131dSG8+LuW3+
 D+cQ==
X-Gm-Message-State: AOAM5313k4ROwQMPo1ZjeQZEMTzI8LrRw8rGO/W7EucYHVJKfH7z0LnU
 8bTeM8GL7bH8MYYASIMvNPg=
X-Google-Smtp-Source: ABdhPJyQMYsswPacNEkC8SKE4hJwVUJoWLnn9y6MjPoxRv3q2R6B7vYoDnfzggdgtAC0DF6A7qVv2A==
X-Received: by 2002:a2e:a376:: with SMTP id i22mr38977042ljn.201.1638036488063; 
 Sat, 27 Nov 2021 10:08:08 -0800 (PST)
Received: from helga-MS-7721.makeup ([31.148.138.103])
 by smtp.gmail.com with ESMTPSA id m16sm793142lfj.59.2021.11.27.10.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 10:08:07 -0800 (PST)
From: Olga Kitaina <okitain@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	Olga Kitaina <okitain@gmail.com>
Subject: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Date: Sat, 27 Nov 2021 21:07:58 +0300
Message-Id: <20211127180758.30884-1-okitain@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_100810_735098_BCCF1A82 
X-CRM114-Status: GOOD (  13.38  )
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

According to the Arasan NAND controller spec,
the flash clock rate for SDR must be <= 100 MHz,
while for NV-DDR it must be the same as the rate
of the CLK line for the mode.
The driver previously always set 100 MHz for NV-DDR, which
would result in incorrect behavior for NV-DDR modes 0-4.

The appropriate clock rate can be calculated
from the NV-DDR timing parameters as 1/tCK, or for rates
measured in picoseconds, 10^12 / nand_nvddr_timings->tCK_min.

Signed-off-by: Olga Kitaina <okitain@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 53bd10738418..ed4ee9942441 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -18,6 +18,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -1043,7 +1044,12 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
 				 DQS_BUFF_SEL_OUT(dqs_mode);
 	}
 
-	anand->clk = ANFC_XLNX_SDR_DFLT_CORE_CLK;
+	if (nand_interface_is_sdr)
+		anand->clk = ANFC_XLNX_SDR_DFLT_CORE_CLK;
+	else
+		/* ONFI timings are defined in picoseconds */
+		anand->clk = div_u64((u64)NSEC_PER_SEC * 1000,
+				     conf->timings.nvddr.tCK_min);
 
 	/*
 	 * Due to a hardware bug in the ZynqMP SoC, SDR timing modes 0-1 work

base-commit: f53d4c109a666bf1a4883b45d546fba079258717
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
