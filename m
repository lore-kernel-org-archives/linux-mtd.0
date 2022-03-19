Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28043C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Mar 2022 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uFMMNafQ2uvFgsrQZvH7cOr4bJ7AdNKXt5o7Ma3iIM4=; b=i/x2gLoxCpp1Pg
	LAdwNblKOc43mdv2kB9I/IHKqcWDNzuByN54IItQ4HsObWaIkxHjbohuZLibFyd3I98me/Ljxc/Kr
	i84atzM8NjnrD9Tkn90s0M79qraucgu7TOqsrQK9A87PhzKDHhn7K7MZN6rPunMRrpmAPyjfQdMBT
	c7H5bFSdJtYC7Kj8mPNRz5unjKKk78hlaFkF5n8aTb/h6PBFtcvEygx68ggDY2lZcq5IXAc4sTLNL
	3Zx4w6mGKAsb61z9dyawD+6ehQchX8TQkSxki3Hf11CiEvj5ootOZVcNuGqIpxi3wd5TUdCX7S2KL
	8DBBJGtlB87J2/xWf9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVUXC-003SpL-S5; Sat, 19 Mar 2022 08:34:02 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVUX9-003Sp2-Rs
 for linux-mtd@lists.infradead.org; Sat, 19 Mar 2022 08:34:01 +0000
Received: by mail-pf1-x432.google.com with SMTP id a5so11502128pfv.2
 for <linux-mtd@lists.infradead.org>; Sat, 19 Mar 2022 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s8PQKlbtuifCe2sia50BJ6lrE2M1PS4ubrNMMi1Ne9c=;
 b=bfFtFMpcAxaVfh3gkrWqlEq0PnXL0euWimLa+T3aBEH5mwxqjgsrpuZQjag+zmNZLz
 +r8BsOn5CLKF7WlQql1FpniVjZnEnzbOj8WKfgv9XJMrzLj7BVwCFeFYXU29rl0vai7B
 G0uNXAs47kqh7QQ2ymECriz8uuTlKYvvPhXJs+MihE+fctEbHMeqj/d233lTwGu2GFcY
 WhFVtpdLAzrBs2YZvpw5VYM78bJbDBa2XM5wdOUNYAXzAgmmZ+uGHyQIGLipGOOKmWpJ
 q4uYjkABJtjIF3OrBRGqqR75nz5P2wvIsFlxjQ6G5CKL/BlfJluaUO4ZiTfDFVOKuJDG
 ourQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s8PQKlbtuifCe2sia50BJ6lrE2M1PS4ubrNMMi1Ne9c=;
 b=b8t6vR3sdvNLYSO/Wb4CxX/4rLFGYwHetCLRZ9AaVL43A3lpF7EOfjeLY+g5Ss+sWE
 tMSGtYodprONPunjAq88KNeCdPnZkKAKBYVJpVueHlJzydiWTVXeBhKjEU3xCqjWvB/v
 Ht1WNNX/sky48VbIyrpSEY/qStzBn7ZkOCXTn4aA1HtPjh2D79MfWPqq5cNVBD3VZcVt
 xmW9EVTXo/iCqNFnMAwBg4NTtNlg5/jKvU6GIqUeCFq7gREfR0/98ej40nJCxmrRaTsG
 +nyL9ZhzTkJi+e3AglelV1cG1RMqTU3uEiQQXkIIQ2efyvt5Bixra3V9A5FDftgEvfYL
 wmXQ==
X-Gm-Message-State: AOAM532GE97y0MYEl5qyKslvJg7OgksC277l8LBbbQLTOFWjX8s0PwGM
 qqRUzA/lzZX9x/loT7X3sK/kLwAe8oNfylsw
X-Google-Smtp-Source: ABdhPJzvPQ5s00j8GuhEw13G6sxP+1nGQ5JUwL/1FT1v3OxYPjLFLpwRxafPNSKIggDmdANj4AkwbQ==
X-Received: by 2002:a63:f94d:0:b0:381:5104:c3d9 with SMTP id
 q13-20020a63f94d000000b003815104c3d9mr11094175pgk.600.1647678838142; 
 Sat, 19 Mar 2022 01:33:58 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056a000b8200b004fa23c8b522sm12306880pfj.156.2022.03.19.01.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 01:33:57 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: spinand: gigadevice: fix Quad IO for GD5F1GQ5UExxG
Date: Sat, 19 Mar 2022 16:32:59 +0800
Message-Id: <20220319083301.87400-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_013359_934757_19D2845E 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Read From Cache Quad IO (EBH) uses 2 dummy bytes on this chip according
to page 23 of the datasheet[0].

[0]: https://www.gigadevice.com/datasheet/gd5f1gq5xexxg/

Fixes: 469b99248985 ("mtd: spinand: gigadevice: Support GD5F1GQ5UExxG")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 1dd1c5898093..f765a394a2d2 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -39,6 +39,14 @@ static SPINAND_OP_VARIANTS(read_cache_variants_f,
 		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(true, 0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(false, 0, 0, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_q5,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD(true, 0, NULL, 0));
@@ -339,7 +347,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x51),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(4, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_q5,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
