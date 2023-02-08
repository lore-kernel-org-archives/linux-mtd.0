Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F69AC05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4XqWPbCiu2gYvC0ZTrj4o8llITSul2GnUugRoyxIhc8=; b=3XLs5zj/OkG5p6
	WXl63TYHlOsFF+9eRGzStwWU4w3UyH88gR0GxsnwXzFTLXbl77T166NS7Zdh206cPvR9Zve19d2fy
	AeW7sIKX1FThSAz2d8ZcpNYD4HXFHvzRwXyKgQJYjvgT5CDyIeL4ItiQJo7mFPq16IuOYsU+WgRtJ
	EJr5E448PEPaZzfzKX2GGBl3g/86LNEZ/AAGrp6S3a306235JrWNq+c4KyKuYWNzi4oHA1v2FIE24
	/gHwCmauqhgjrCZhpAfniMQ9pN0enblYSywW+F+0/aT/2ITg6TAMq0u/KMPnvSfexo5K+W+CAI+vY
	6Qq3NaZxAzz3bwmg4QvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPk1c-00FfhV-Sr; Wed, 08 Feb 2023 12:58:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPk1Z-00Fff8-M5
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 12:58:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5852ECE217F;
	Wed,  8 Feb 2023 12:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCACC4339B;
	Wed,  8 Feb 2023 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675861083;
	bh=VrbCzxOmy3ybuwWlA7ZbkY+1uA2a/fPo2GEiHFqaUl0=;
	h=From:To:Cc:Subject:Date:From;
	b=rIlTvocDgkpF8y33io5K1nKHrLhuLFhEc02ASgrKCdZaxXRVEKswfLAiqe/ugm03u
	 895TSS/cqANm0zLs0qn/ySYsi6wiWqwHRhTEYr/ibwFTwrfMOPJHZdbOFSy6gy29la
	 8GQgrLZaBruG/XIR7MltHmqrBUos2sb54QbBoDWY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	stable <stable@kernel.org>
Subject: [PATCH v2] mtd: spi-nor: fix memory leak when using debugfs_lookup()
Date: Wed,  8 Feb 2023 13:57:58 +0100
Message-Id: <20230208125758.1515806-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=gregkh@linuxfoundation.org; h=from:subject; bh=VrbCzxOmy3ybuwWlA7ZbkY+1uA2a/fPo2GEiHFqaUl0=; b=owGbwMvMwCRo6H6F97bub03G02pJDMmP54Ryek+ZorD9hV7p6l9CjqdzVNf0XSpOMHpxnaF/7ZOJ zNxzOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiq3czzNNu1r/I6+bHMdeX6U9VjZ IO22RTdYYFl/3mfCr3X3LS9eLdeym7n8tLr/x3CgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_045810_723440_C1783758 
X-CRM114-Status: GOOD (  11.07  )
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

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.

Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: fix up to work when module is removed and added, making the fix
    much simpler.

 drivers/mtd/spi-nor/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index ff895f6758ea..af41fbc09a97 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -242,6 +242,7 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
 
 	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
 	nor->debugfs_root = d;
+	dput(rootdir);
 
 	debugfs_create_file("params", 0444, d, nor, &spi_nor_params_fops);
 	debugfs_create_file("capabilities", 0444, d, nor,
-- 
2.39.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
