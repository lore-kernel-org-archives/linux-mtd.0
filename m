Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59249C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLr6jIx3JZoiHgruFSNoi8JYorUrZdthN/Y9JBRC3iE=; b=NOVE0+IA0TgafN
	v3hOtSS+rXzyw1qRgSGEhj06SitSBiu+wptgwYcorA9EQ4sVVGbRUUx9soK6uGQ0W1ANxbkIp5XSB
	25o3V4CPP93amMxCAHlYmRgQBHXuwjvAJP9TGQ8LRfMwaoi89Hy7sqLYToRvcL5+Ke+g8z1fMftxo
	riUvn9sl8gHOdm0xVQKuc5byKX7ZDMqN1FXXn2M6VcTOA/2YT1KEwE/NBidyIpWuCxXHtgxBKCSwM
	3IpiTjZE17X9LcHiZGbBFLyNRN2gNh/vwM4c6/vyjX3vHC254pUKjck4W937FJw2CMUknJ8ZkxXeq
	D8+wSSfJf/Rdt2jVzZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFPL-00FKbY-FC; Thu, 09 Dec 2021 09:08:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFMk-00FJgM-Mf
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:05:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E37CB8235A;
 Thu,  9 Dec 2021 09:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597A7C341C8;
 Thu,  9 Dec 2021 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639040722;
 bh=LBmhnf0dVpaCEhWvKn4Yu0weT1lsq5kGXmqi1azjEcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Auni7Z2cL/8AjhnGEUBqK9u57c+Vya/MAbCPZ4siy3xeTcHU7chBUM8s2qGEIGn1G
 uJrAiD4VCYTNNGMINYH5pQE+x4QWBxAVQAc5hWEFYoYS7xHFX6AA66VD+hc1VWCjUL
 0lM68eUI9Vk5kcjB0CcdEIC3ze+G9ZBIdNvumEJiwlL5QlDR/K3O+rvT7bTM8ZeXh+
 QfymTXc1z9eetyvy0ziojn/0W7ydemRlMnTGJ6ER1/uue/FYi4QJFj8tdIdDz0/RWP
 YzU8VUvIfxMMYItElcPiSM1aZXka4/gm1DARMw0euPNfZQe/imBAVs+8GmlqqsCPz8
 fTWhO59Ckja5g==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 6/6] mtd: rawnand: omap2: drop unused variable
Date: Thu,  9 Dec 2021 11:04:58 +0200
Message-Id: <20211209090458.24830-7-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209090458.24830-1-rogerq@kernel.org>
References: <20211209090458.24830-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_010526_907159_75242B53 
X-CRM114-Status: GOOD (  11.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

devsize is not used anywhere in code. Drop it.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 2b58ddea3b01..cc61f4858a3b 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -148,7 +148,6 @@ struct omap_nand_info {
 	int				gpmc_cs;
 	bool				dev_ready;
 	enum nand_io			xfer_type;
-	int				devsize;
 	enum omap_ecc			ecc_opt;
 	struct device_node		*elm_of_node;
 
@@ -2246,9 +2245,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (info->flash_bbt)
 		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
 
-	/* scan NAND device connected to chip controller */
-	nand_chip->options |= info->devsize & NAND_BUSWIDTH_16;
-
 	/* default operations */
 	info->data_in = omap_nand_data_in;
 	info->data_out = omap_nand_data_out;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
