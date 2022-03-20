Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF94C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Mar 2022 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz0FL3VjxniDpy9t6XnoNhk2v9DRUoPG3bW9AseM/OQ=; b=BpOfDYjFmaQwKE
	VapjHXXW72wHDvl5MA18rsbYmJF+gCK9fQ3wL1xGTJTwqx6ow4P6TUmUijyoJqN2ZU3F+mmK5oD30
	kbDEj6iU0RARXot1KjTC4V3fTtLwggqeQEQD2JOGhAGeuLOW6rIBZZYOFAXcBralwZZpoi519NMHe
	Dystec+bs56Wu4p3UPHWHxkm8wBwEUd8PJ3O4fwvknvJnB7+B4b5kfWLUE0es/VHyri1zJfHfTK9x
	kDftcUauj1T7HJmPuikFC7zMUPAQRRU99XopJvGy2uUddLYtSlXSZfW9/Kd/7EiQ+axeqHsuC5jav
	/YlknHdHyT/g+WzteBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVsMy-0050Ya-VM; Sun, 20 Mar 2022 10:01:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVsMh-0050VT-2J
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2022 10:00:48 +0000
Received: by mail-pg1-x536.google.com with SMTP id o26so8300680pgb.8
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2022 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTwzTKEFt9r8jP7uT4ZdrIfdQ5eoJtObC+eOqWqA/5k=;
 b=pGYJdZ9JGUHqACE7Wo1kH1/4SWHusyLqh7vOs88kB/ANKRJiPeQWbuUhjbD/y+lnVS
 tzzBzXC4gjRl2oNblmq4QK9ok+bnI36pHkw46g5IVLLdSJk8ccfuYLZCiJTs46ipMqiq
 whF44sC6A5eYsxKBn3lv6fIAHXIVA6l5zpUqfYAhmydoKYeXij4Wy18gxdapmqF5cJEC
 zqn0c3VP+A1csESD6B7Hll3y5atjP9mDBh2gtWUPpaEVVUiCU5+YvA6nahYNcPCxT9EB
 hb+2In+w+wgu8SOjngBRLW8trCgmdyJUZuBaANabmmHtk9/hFB4RnxxJHTKcoMHR2obv
 2Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTwzTKEFt9r8jP7uT4ZdrIfdQ5eoJtObC+eOqWqA/5k=;
 b=RL/F6AQl6UJWOu+8jCJHh4gfIse8eOZzetru0pZo3DffcgLaHxZeCoD1hPdfGuKXWa
 QYkx5MC9eiKeFEtqLpQkABcjQhVaXQQwYfAB2irugNpj0NUXMfDz8fElJWpTAbomnUly
 A8zV6qWVjV3u75Bzz097hLEk1Xh3gA2lfXwJX2X2wS3XJFE/I4Slm90FFd2u0K9FJBh0
 3W+kf0EOueEmw9pN3A8Ejqx+i5mN/fD5YdsY8TC6Shm+DIXe/9zozFoA38aGyiVItqEK
 I/TEaTnJ2RCVikB+hs1wip/A+pP6LYRuf7s3Ued6qZ+2DfeNF+UhFe3ZI+LPEB+7Ux/K
 PmRA==
X-Gm-Message-State: AOAM531YGxvOeqTeKGDrlR9WhPmn0xgvSErz567k6OmPUGP3Kp69tNVJ
 sQe9O/9kHGB0jVN/6zQ629fwJObYEp2UzmPn
X-Google-Smtp-Source: ABdhPJzzhsB8eVdLU3zpBDUoZRQHw/S92XAe2joj9yAUpwvC832u0plQ2lx9rIoKi1jxE6IL1aJNkA==
X-Received: by 2002:a05:6a00:3316:b0:4fa:80fd:f3f6 with SMTP id
 cq22-20020a056a00331600b004fa80fdf3f6mr6014005pfb.65.1647770446175; 
 Sun, 20 Mar 2022 03:00:46 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm16597810pfk.171.2022.03.20.03.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 03:00:45 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] mtd: spinand: gigadevice: add support for GD5FxGQ4xExxG
Date: Sun, 20 Mar 2022 17:59:58 +0800
Message-Id: <20220320100001.247905-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320100001.247905-1-gch981213@gmail.com>
References: <20220320100001.247905-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_030047_131608_B3E1C103 
X-CRM114-Status: UNSURE (   8.27  )
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

Add support for:
 GD5F1GQ4RExxG
 GD5F2GQ4{U,R}ExxG

These chips differ from GD5F1GQ4UExxG only in chip ID, voltage
and capacity.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index da77ab20296e..85a61d3d8467 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -333,6 +333,36 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GQ4RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xc1),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GQ4UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xd2),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GQ4RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xc2),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
 	SPINAND_INFO("GD5F1GQ4UFxxG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE, 0xb1, 0x48),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
