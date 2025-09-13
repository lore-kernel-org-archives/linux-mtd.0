Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F78CAC592
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Sep 2025 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wlaw6RKKT7mZnMEAMOZ56OXLbKgF0dC73C7S1TT5K1s=; b=GIIuzmcD5kH4NN
	8l5TkqFOWiKr3dWgwzkLa35zfdaREknhwYTAfWR9BgaMpuBi/3UzX3N75hlSpF6LqeQ2qtwp3c13q
	qXevQkSPdn/3uixXCx8SLvL95b0+sHUxhEvm3vCFzXQWvJbTcOTg6VfSAwA5+x293YHB1ST/gSvp5
	H0Xl1wPX58bIeWV1CJt7baPmTQCUTDIyXcTjKywwaagou/HhYtedQjvsjh2JVzkXjBnsmv9S4MjU6
	xB5WggJpl9bJWcFn1vOaEa47PPE3lgZZD9dgvwU6Qt4KgB4YzhUrRVOHybInS8yLb/T5Umorx5H8s
	TwM4Gz8toroiaJIEXmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxRsZ-0000000FC5s-10cs;
	Sat, 13 Sep 2025 15:09:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxRsU-0000000FC4a-3gJw;
	Sat, 13 Sep 2025 15:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C759243D08;
	Sat, 13 Sep 2025 15:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBA7C4CEEB;
	Sat, 13 Sep 2025 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757776164;
	bh=k3JGm7bgPzqa31QJZlMPgghHEp9L20SNijx437wsPug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qpZ4Xk/0h6acPs74zvOc1NFJ5Jxq3AutOs0wqXl+ci/YlJMKz2qsZ7wQfDFyBvrJR
	 lC9m1DO0QpsyefA0jSIkWLuo+iQ23zEINuTRDSaA1wtEGdp6toKAFNpCnyx76DKAhD
	 8f473nFSEKygwdbTVRQ0yekLJhvrj8dr+zl3mSM/vCPVo8VKdCw6DL3fxtRtA0Ft0O
	 3o7r2ZJ6ajL9TTnimHNSCKl+54t5yx7wumR8QHAEnrT7lZ+4gP4THT1Lemj0kp4sYs
	 VpZOpFhwL/9ivY///QFf3eH7S3btU6e6wo+/NHtYm2A6W/cokalzFhnWNbMK1RbWrt
	 hCobJgwcrm+kQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Jack Wang <jinpu.wang@ionos.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15.y 1/2] mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
Date: Sat, 13 Sep 2025 11:09:16 -0400
Message-ID: <20250913150917.1408380-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025091308-trio-unedited-6b17@gregkh>
References: <2025091308-trio-unedited-6b17@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_080926_939602_D381F48C 
X-CRM114-Status: GOOD (  11.35  )
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

From: Jack Wang <jinpu.wang@ionos.com>

[ Upstream commit 43b81c2a3e6e07915151045aa13a6e8a9bd64419 ]

dma_map_sg return 0 on error, in case of error return -EIO.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>
Cc: linux-mtd@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Reviewed-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20220819060801.10443-5-jinpu.wang@ionos.com
Stable-dep-of: 513c40e59d5a ("mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 1ac8c4887ce03..a65ee2d3c1b3a 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -860,8 +860,8 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 	ret = dma_map_sg(nfc->dev, nfc->dma_data_sg.sgl,
 			 eccsteps, dma_data_dir);
-	if (ret < 0)
-		return ret;
+	if (!ret)
+		return -EIO;
 
 	desc_data = dmaengine_prep_slave_sg(dma_ch, nfc->dma_data_sg.sgl,
 					    eccsteps, dma_transfer_dir,
@@ -891,8 +891,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 
 		ret = dma_map_sg(nfc->dev, nfc->dma_ecc_sg.sgl,
 				 eccsteps, dma_data_dir);
-		if (ret < 0)
+		if (!ret) {
+			ret = -EIO;
 			goto err_unmap_data;
+		}
 
 		desc_ecc = dmaengine_prep_slave_sg(nfc->dma_ecc_ch,
 						   nfc->dma_ecc_sg.sgl,
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
