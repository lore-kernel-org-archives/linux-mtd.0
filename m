Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE34C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STsvdp7BE50WODoaivngzlkWB25NN+HpwpHqlyQm8Sc=; b=QvQEmOhA41G/KG
	sukOC++j020dNrabpVVAzAkSnM3etN90ESFPR3PTQlkEcfySqU+k9vitucs1quxmVoNR+G7UG8Tfo
	VbuWYO0LcXqJyJs76MkjDFG2KkuoufXY4vfqTr73m7u+buu8ZjOJ94cjAQaLr9ZCCYDW05Y/TO5Qe
	uszs3zzq1cRGDYqRF2i6/pMiGy/8v7yNjr18ooQqWKRgk0MJtMBdF0d2zDpnJER3x96durKWsHfwa
	MmsBgp+2GY7MydwP+0AY1/EN25/83+Dj0CmbxJsMj8xLmwLel0XPJbIBKNCvaOv/G+cL0ptDxJUIu
	eXKr+PlcznWfu21jPiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVsNA-0050cA-G8; Sun, 20 Mar 2022 10:01:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVsMk-0050Vv-Nq
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 10:00:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 mm17-20020a17090b359100b001c6da62a559so2344948pjb.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 03:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XaXs2uUeTlaaN4Zoh4ZKfv8MCTbeO7CY8CWLQW7X/3Y=;
 b=Kl7J0NfPNj1Q7lFrfFQesn3uV7mMpCe/gMmoNkEemB4LwrkgelZ5yJAao3wLWaB8kp
 yXf0jb4i8cd2bSvseYEI67tExQf8zoysPvg6aq9XfWA6DWl6WYdoumqGedCJRssKBbub
 NkT+1RDTaL7RG1+3Kbpvjt/nYjSb1JmgxEZvqFcRE+QKrODHANiZe7s3+P/vW9TgfgKV
 HqPzy8wr2CvMBEojRzrF9snaIRhiJ9qJklbSds3j7ejjFcskVD8flYSSqLYiqix3dqo/
 Ry/WfHfJyqjEcycKggLQ2As271Ug6ci31bTjk8PZdLDBZbZ1I3hY+bHdWd4v4eQ+jTto
 rU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaXs2uUeTlaaN4Zoh4ZKfv8MCTbeO7CY8CWLQW7X/3Y=;
 b=3whva/tn+Kcg6/p2PKuFAO8S5YodPgV1ucZaJS8ljTtdr4Z5JAeciX6nRichGsE91D
 PmMC9HMe0Gohv5SPybTkhuR1j1XFz0Mzfclg6Bdamyp/7sfZkKPOpZd0FRLH9FRChQ2w
 yUk2H2TpKgx6ZATF1GNKSyx74aDDSGPdX75q2Ks0mgdDyAMMiN9j9YX2W/0ihdzM0uGa
 NjFxqnI4EG3C3SihO1vX7lcHNCYb3adDoQOuAxrtFeUYzr6PvllBdjFkJCzsv4WYrHjZ
 Fv6OzH0mY2uQv3cZ8MNH5KLntdcQMBNACD8OFh5mMbvG0bVTptQA7luScx7yRNfiwVGW
 QP6Q==
X-Gm-Message-State: AOAM531y11y0yk5USC/DeBYLRh9hezfNDdAy+yFGwwLgk1iMFTMypkGj
 P7AxPv0yV6YIwj+bVnL14lf+vIhNkwixrJII
X-Google-Smtp-Source: ABdhPJyslDhbeWkQlq0iPyds0Frtwv/X7cV805UOtmZFyfhNGADfYMg+3NysuGyMFVJYg5zmKiK3Tg==
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id
 s16-20020a17090302d000b0014d8a8d0cb1mr7753086plk.50.1647770449860; 
 Sun, 20 Mar 2022 03:00:49 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm16597810pfk.171.2022.03.20.03.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 03:00:49 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] mtd: spinand: gigadevice: add support for GD5F1GQ5RExxG
Date: Sun, 20 Mar 2022 17:59:59 +0800
Message-Id: <20220320100001.247905-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320100001.247905-1-gch981213@gmail.com>
References: <20220320100001.247905-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_030050_802339_0FF7F74E 
X-CRM114-Status: UNSURE (   9.00  )
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

This chip is the 1.8v version of GD5F1GQ5UExxG.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 85a61d3d8467..d519bb85f0e7 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -383,6 +383,16 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq5xexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GQ5RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x41),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq5xexxg_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
