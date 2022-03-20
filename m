Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BABC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ck56XwltP3fMPG3A0c941AfkHSfVUWoOsoY0bWxbeEE=; b=3vZP6uC0K6IJYU
	h2ZOUaVE9pnqy4kRjBxOWLFHH3nn65HVKIYNleqZV3Dm+OL3aGsrZ0CMRzJFkk5mtb4wzOYBYPDs7
	7k8k+M+DWKsDe5AAwwYfQVbVqs4Ygk7gg9TuXX9LQLL3uPO78QpXyxs4TN0UVCHSuvhvj8+V7GEO/
	t6FY2D+aD5WfBz8qCcIPZAi/1JZGH+AETCGzkA5MreOlsDc1evMm/dFKNinlmFtGj1wRGHPmaolma
	GkolIiMEEPPtMB7TRrVBwCc7BSWbfzweIvkzeG61FGpd1VuGeP9bDBMs0SCEPRI4w3dSlz2Y56IY5
	6E8925x+yc71togczl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVsMo-0050Wj-6Q; Sun, 20 Mar 2022 10:00:54 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVsMd-0050V0-FS
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 10:00:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id t187so8295621pgb.1
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 03:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNRpcSr1HaFOuyEkI71aW2rwKdw2XVGrF5tMoGdemZ8=;
 b=IbNfRmZHJZCE7z4L1cQKmWItxXNZKLG9m1P9OGy57MocjhaYUB39Sa1NsCz+IBDpff
 /VBGPslXIhi7M8zHe/Uh+l0yRC9HyUWVSV1BiJl2pr/AplZ4+KNTb35liEX8kqLvjmP3
 6OqwxlGTaaAl/hZcYBddeNf3H30cfS0LlVcz4i8Xm+eR0rMre13a/ClLEWAJm7gVhIUr
 BHU6SqS7BCn/9vqdmvUjcMxsk0rXiqv76yYt55qR+ceqanNAKuQdrSu+9fgsX0Ne+sEX
 r1xmQuI5DBuyvR0In2fC8Z6ZxcKjo6ioPZPp9gcV+acZ+07Wvr8xu3WLuAKfx6/+DZhl
 i2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNRpcSr1HaFOuyEkI71aW2rwKdw2XVGrF5tMoGdemZ8=;
 b=EFDujYCUIRjoYlFvs0QXdQJty+yeeMJBP1m6cKtE+dXVFXbP4iTfF2tLA80F701uyy
 rHEOphvzXTqhnJ9y4AsgMfpcX6rD1nZlNfA52Do9eZ5ae1H+dveQSNlcBm858ArJM1XT
 YhevjWm+YizYL3fYAZr3a8fBgWdRKtoysA+Pwi6XXyVJkDkd/3OYiAQyICRZRljQi1Mh
 4y51L6MTWLKv3usF7sRY4sbh5EPH9v5OTiUErz97/XYxJxhj1spH32eYilyRTe/ZNJ6n
 aq5wKWKxiNo3yGVlXkKuYADJXIv5FqQcE/QoG3DOfzdcdeYFgQR/OzfuxW/A09IWfkwC
 5edg==
X-Gm-Message-State: AOAM5317e/O438q63YM2QeVHC1zgjAso6OqQakzg7SinexDJVGyZz8bJ
 MYWHKBa+DTD1nD2TZjyo5gSl+9GEJwpduJy9
X-Google-Smtp-Source: ABdhPJy1jAB6M/0BYwvfn+wZFlkzDqzo35ld9EnV9h5hZLUUT+vMKazYpOuKA9o/6uMdR6crPGwp6Q==
X-Received: by 2002:a63:4526:0:b0:380:7c34:fc84 with SMTP id
 s38-20020a634526000000b003807c34fc84mr14539438pga.2.1647770442511; 
 Sun, 20 Mar 2022 03:00:42 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm16597810pfk.171.2022.03.20.03.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 03:00:42 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] mtd: spinand: gigadevice: fix Quad IO for GD5F1GQ5UExxG
Date: Sun, 20 Mar 2022 17:59:57 +0800
Message-Id: <20220320100001.247905-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320100001.247905-1-gch981213@gmail.com>
References: <20220320100001.247905-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_030043_555366_24A9DA1E 
X-CRM114-Status: UNSURE (   9.23  )
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
index 1dd1c5898093..da77ab20296e 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -39,6 +39,14 @@ static SPINAND_OP_VARIANTS(read_cache_variants_f,
 		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(true, 0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(false, 0, 0, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
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
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
