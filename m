Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6296C38A02
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ac9EL8ZUX2U3VgPSbEuhX0aMUONg3DK7UzSsUX01Nm8=; b=rkMfP0pxuPOm+P
	locYxlSVQxSuEkeTnGAZv9EjWJEYuxvE5UJJ/KHHPiPeENPeCtgaLSWCGxh/CIZS5aT4RzTV/Ckes
	yYnu7oo8VvOav5xSbDVCCqwSRmW9vwbIB6sJ8coreQQ0E6uagGbIhl8by5VAkmh9tr82UZLvBDQl9
	ShjxD3Vau31VoxB4KQ0oCRCZbi9+RtLyab2TRMcDUaegwNLwGnvkh7mgZUHsp9Q0c23uVHGbDLduO
	IZcaUQCuMpMdte5jvpobIE7doVURVW8zWfd4GdJtxv+ILDYv9nGdGvVqe2CwhjErg+y3ZDTvkugjF
	jCH4CouMSt6C4x+I1qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opULf-00Bs51-JL; Mon, 31 Oct 2022 12:57:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opULT-00Bs1u-7K; Mon, 31 Oct 2022 12:56:52 +0000
X-UUID: 1d0431569ca74bce9cb382744789ae10-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0eyPwIID5QTj89ySOKRfQtfyf9Um1CmzCups6XoDQNc=;
	b=GqCl7f9mh0Oy5KQWzuF8l/zeDd648Tb7sPd951Dbhvsgyla2NgY9ROGcC919saKOUEFNsz/2BRnlwuiaDGIe0VWWJBdCuB/l6N5sdthKbrcVsuOIdCb/0MJ0MSLFTTF6tKdR/V0FYH9YaVjXLgmCqe/wWfOLhN/S8L44da5k764=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:62b4d37e-3b97-4351-be7d-aa9e65fc4f0f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:86c82090-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1d0431569ca74bce9cb382744789ae10-20221031
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 501407580; Mon, 31 Oct 2022 05:56:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 31 Oct 2022 20:46:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 Oct 2022 20:46:35 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-mtd@lists.infradead.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>
Subject: [PATCH] mtd: spi-nor: Fix the number of bytes for the dummy cycles
Date: Mon, 31 Oct 2022 20:46:33 +0800
Message-ID: <20221031124633.13189-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_055651_287976_2E455E59 
X-CRM114-Status: GOOD (  10.80  )
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

The number of bytes used by spi_nor_spimem_check_readop() may be
incorrect for the dummy cycles. Since nor->read_dummy is not initialized
before spi_nor_spimem_adjust_hwcaps().

We use both mode and wait state clock cycles instead of nor->read_dummy.

Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
Co-developed-by: Bayi Cheng <bayi.cheng@mediatek.com>
Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6c921eb3fadb..8b9c318a0ad4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1914,7 +1914,8 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	spi_nor_spimem_setup_op(nor, &op, read->proto);
 
 	/* convert the dummy cycles to the number of bytes */
-	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
+	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
+			  op.dummy.buswidth / 8;
 	if (spi_nor_protocol_is_dtr(nor->read_proto))
 		op.dummy.nbytes *= 2;
 
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
