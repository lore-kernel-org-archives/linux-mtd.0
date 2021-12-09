Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767E2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yc5ayqzLHhvH5Rio9MA5w41cWQ7eJYSS5RxtKDJa2hM=; b=KRHJFtrzYDt3yQ
	J9QH6RKaeD3gN5K7U25gWHCrNYOEhUwffGQ3ewYCuEMdgdwWX2fNHAJLC3D29nL+bvZA0OyeqWr8Z
	TBji5RkhVw8k57jT9a0nUVaOIGba6FR1W3rH/IWLGXfsMPvwUuQtiCkQdmEYDwE94m+zw85FfsG3p
	4OA7kBy/+qLLjOShB05qEM59F9k/fozSZxv0X4h2q+JJl6iLUOR4bcmx3h9aRCzANonfi/LgwJYaT
	0lKyCTR0moUQKKIeMbZZUgDmcmhsxNw2omkaUYVJvcdGqvoxLFa2m/DSAU7brCZz1hICVb2lOJOYR
	fiK7yf7dXaqYep17ZLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvFNv-00FK8p-S3; Thu, 09 Dec 2021 09:06:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvFMe-00FJcz-3z
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 09:05:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC2F3B823D6;
 Thu,  9 Dec 2021 09:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EB7C341CB;
 Thu,  9 Dec 2021 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639040716;
 bh=RreclebAyHQqrP6cf15289fjcLo5PLKZjSo7S8zyp+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O+JhUio54KR611gjeoZ/uV2RbcO6flR5mWFyspAC0QH27/sdcJCR81Lk/VRNyHn8Z
 UbGqgI2jbzn1NrgKHE+LbR2Fw5egU/aP64fuwnAip5IkQOl1U57748SjM0Rg2Gz6Qj
 1xvcXbnTh9WcIuBxLGMTfZGZdNs6yO3jmKaOQM3SZXLqyCs2VjFQZLN1JWiceLBamW
 P7w1ruBHu/amYZ6ZADS/sG5XzjevwqPOkIX4pDnROu+7NpRFwyOdmbC27WiwRkijfv
 NZiZWIlaAd6OtGz3Y7uv4URMEpK0TetLrYkvo71Ic0OE4OMcvvEjF/XJs6Dthfmd/k
 C63lNAN8mCe4w==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 4/6] mtd: rawnand: omap2: Add compatible for AM64 SoC
Date: Thu,  9 Dec 2021 11:04:56 +0200
Message-Id: <20211209090458.24830-5-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209090458.24830-1-rogerq@kernel.org>
References: <20211209090458.24830-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_010520_329802_BBCEF2FC 
X-CRM114-Status: GOOD (  11.39  )
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

AM64 SoC contains the GPMC NAND controller. Add compatible for it.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 224c91282c87..0c7ee26171ad 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2286,6 +2286,7 @@ static int omap_nand_remove(struct platform_device *pdev)
 
 static const struct of_device_id omap_nand_ids[] = {
 	{ .compatible = "ti,omap2-nand", },
+	{ .compatible = "ti,am64-nand", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, omap_nand_ids);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
