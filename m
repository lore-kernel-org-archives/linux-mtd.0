Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65D6C5475B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2024 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mfd3C8fjPEMmgyzlIIJfcoIHGXHGVEL+UYA0QHRmq4g=; b=1V78p6OQebE7v4
	3bXxBgO1JmTPcBB+3P2YkNI/yHu8GtIrUI+WP6Cds1nDmCRnlFUVwM+cIN4lKhizNLzOilI2Kc4nB
	OJ+Q0het6esBKWvcf3P1I1wYvEWRLNXOXgg/+Voaa3K8Nc9KmR4FJYXN7OLK0LZpSTv/gIVc7/jlP
	/LWIJS8H5Rujs6hUhee4lBQs+NCXOtkqe7y6BdCdMb0tuTqvxuf3/wczVv5ysZ86SmE2Q6WuAhokC
	t4pJTEokNL+4OXvdw/PMOPaL1rG0LZiY3OAOBb4FiPu3z7hOmwNCo5DvcMH3bJp1iFY1+c0za19/M
	fLFO5K/QdhDJBmvbbEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg48E-00000000llK-3tV2;
	Fri, 01 Mar 2024 14:45:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg48A-00000000lhd-1xQU
	for linux-mtd@lists.infradead.org;
	Fri, 01 Mar 2024 14:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709304297;
	bh=+HDNwzccRkcc9hkZwYDAOt4M5Q55mu65xiChlYxn1dQ=;
	h=From:To:Cc:Subject:Date:From;
	b=pZkNualVekd3oqnVTbyHho7X9a0TfTXMrnaziDRaJuNjpVhtH/ldHxYvBFfjVKGs8
	 nRTXZokimaEUyf8L/HDeFwqHyiNNDD9SIny/tWWzrFRWqi0eCd/z4kTHb5LZLovYv/
	 la1r0v6NgLzIg89PPK8lXJi1Qx/K6rfOnIeB5Dp/REZmZ/rbTHybVUX7/cGS6Mn+DR
	 t8AZo93TmYzPzeYWEfeqslFe+xWaf0d2DVURdIUGlY1eMAGAsCWbbYstJ6/RNW42uQ
	 5XiSJwzhVx4YxHieVKiny3fIds9b51FFRHQnNrAwIdpBlATEOXNCNUYJJTJnU7n6Gr
	 0PSx8sSrce0XA==
Received: from localhost.localdomain (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EA57137803EE;
	Fri,  1 Mar 2024 14:44:53 +0000 (UTC)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Date: Fri,  1 Mar 2024 19:45:16 +0500
Message-Id: <20240301144517.2811370-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_064458_824299_C9DE7ECC 
X-CRM114-Status: GOOD (  10.25  )
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

The i should be signed to find out the end of the loop. Otherwise,
i >= 0 is always true and loop becomes infinite.

Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65b32ea59afc6..46bc45b80883f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3373,7 +3373,7 @@ static u32
 spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
 			     const struct spi_nor_erase_type *erase_type)
 {
-	u8 i;
+	s8 i;
 
 	if (region->overlaid)
 		return region->size;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
