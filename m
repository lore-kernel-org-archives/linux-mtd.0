Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B0EC4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 01:58:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57342238EB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 01:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57342238EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiOsxCLmO5CghcuWCOt/ozxCdpuvKHyL9YZaIWpq8hM=; b=BzLp5/OVwX8/yStXrCFYgW1mPc
	moy1S2V3TAN1hu0mVDpN+CLE0neZTiQY2YstiaVWETVdjYLyl5xcLZ2IiLvl+0nj4WvCCe77fhzPA
	p84NqlWAxQpIHhV/G4HDWwCCBZ94JVD+0MllvTZZJknAVYz4Ke1xO2xvCT5qoCTTz2MIjzbMJSxgD
	eZ5LH3LRALspz4owlN0dOeuVZGZkn58dZNIaAx+9pF+ztWG9nGp50qNp0cbt1n9U+AWbeZ8sziMdg
	76CdubmQ7UZjQmcx/L+x3ED6OtXjs9FO5pvRtk0g/+Zt5YvUTITPWX7O1yHJPCUO2LVBShNZ0paUn
	+qMxSNqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmSGL-0007gN-IW; Tue, 08 Dec 2020 01:57:57 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmSGJ-0007fi-7s
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 01:57:56 +0000
Received: by mail-pl1-x642.google.com with SMTP id s2so6142624plr.9
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2020 17:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kEbqzzqCEqvcGZp9bdSJJ8AMDzH/+lH+MN/rwH64wJo=;
 b=tpcfkOK4AiGpW/gJsFTLcjsn/2HvWOAp1O4CdQOTwRoLRW9AXtTduIPuKLdbP2ai49
 iiWiQ8A6SwWQx3GgFcSaFXcymA9hdSD8ScLGnnS+dBlf5oiyH+o3cjY1kcEYNkJ93lXx
 IzW/HJ6DvY2if3+DgzCJFP/SAID3FsONo+//KmUpcL2uryGn7uHlyAke/zMMzuACV5VC
 UHwRsUFzwhjSqqCQH7mmyUMsk3Jpbzbezkj5TrthQyonT2avqX7fYjgzFnCv1b6sAC7S
 0qivsmcH/cjm+MvWubD82gAC1/JFd7TeQR600xEx1g8X6e7/8WhEEyTZtIjeHpVrCF6l
 N4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kEbqzzqCEqvcGZp9bdSJJ8AMDzH/+lH+MN/rwH64wJo=;
 b=K5CLaBHKWGwTVnLldR3I+J7g4bSpmHo0yhNYy5XSs1QHF3RBMypugSG7H3oLNEEsSY
 AryNS76JL41RCm8ZvSmVD0fZ4ihPGrsDIwctlPke+Yf8ybruLHXnDUVFUdLzNA0ag/MR
 w/r3vmuH6QHl1yzSdCtUu4qT2mtxK4Tzk0ZsAolVuztZcb80d3esDZHf6V3loCBCq5nl
 SJGkXuf84iNhZ5O5TawZFMHdktqZVyxC968KGM+dGLK7SdBW04K/Ix5pm17B2YlnNWep
 iN7joeUB2Pee77VxeA4ferxhNpY+04kC4SXHyxFYyXQxl9PdIfYafxp4pGMSGS9BBnF3
 dvKA==
X-Gm-Message-State: AOAM5316HuIzKAIlOszb9PuFtzfziJ9obeU81ypaME36l619WspLh4p6
 MGDUZUArcIdbdmBcsV/HfU8=
X-Google-Smtp-Source: ABdhPJwy0sVvTrNJCU/91mPdx1mvvw3ejgk0sGgkyj5PVcoOGX/Nl1dZHNYR2N6dTDKgmtwQhWWaUw==
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr8687962plk.68.1607392673070; 
 Mon, 07 Dec 2020 17:57:53 -0800 (PST)
Received: from DESKTOP-8REGVGF.localdomain ([124.13.157.5])
 by smtp.gmail.com with ESMTPSA id gp17sm686030pjb.0.2020.12.07.17.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 17:57:52 -0800 (PST)
From: Sieng Piaw Liew <liew.s.piaw@gmail.com>
To: 
Subject: [PATCH v2] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
Date: Tue,  8 Dec 2020 09:57:30 +0800
Message-Id: <20201208015730.12351-1-liew.s.piaw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208011938.GB12175@DESKTOP-8REGVGF.localdomain>
References: <20201208011938.GB12175@DESKTOP-8REGVGF.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_205755_293448_C3DFA460 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 liew.s.piaw@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Enable 4-bit Block Protect support for MX256405D and its variants using
the same ID.

Tested on Innacom W3400V6 router with MX25L6406E chip.
https://github.com/openwrt/openwrt/pull/3501

Signed-off-by: Sieng Piaw Liew <liew.s.piaw@gmail.com>
---
Changes in v2:
- Add SPI_NOR_HAS_LOCK which SPI_NOR_4BIT_BP required.

 drivers/mtd/spi-nor/macronix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9203abaac229..033ede381673 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -42,7 +42,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
