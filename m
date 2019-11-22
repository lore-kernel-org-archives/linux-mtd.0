Return-Path: <SRS0=TlnG=ZO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3042C432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 06:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C95D42070B
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2019 06:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T8583nF/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9EK+83F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C95D42070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2H8NpYLeiJIaS2gURXMK9HsSDgW632tw83aFieWOcU=; b=T8583nF/VPnx5u
	PPncdd83jT49YbOdeU9eTBA09/r5TC5BwNSU4oiHe6dDzi0mIXmbzT1P02Yz+7ya4I7H1xXNvbVhF
	+vDxRxkR4ej1hkEkadaNjWJf3+LiEm48ZhK+AMNFZssdqhmzT6UcD0TgMREFY9F2S2NHYa6zIiASa
	kZR3sCE/YhvV1U7IDP66HETkZ7FpTPp/0riip7P5Zgz3ZB3rfo5bEmvit0+4yWc9PlHlgfN4P06ah
	JV/JPs6Hu1HhLbDwsaM/xLk/P4P8tTwpWvVMtU/N7+MxeKln77FD5Zd7LDcwwPuJW+DW40gdssEpk
	SOhVhrGMc1OpybJfuMxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY21E-0007Gt-Rk; Fri, 22 Nov 2019 06:02:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY1vX-0000AR-SC; Fri, 22 Nov 2019 05:56:22 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F57E20717;
 Fri, 22 Nov 2019 05:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574402179;
 bh=i3OiJAVeEM0iaNfq2u0wBwNrMPqsr8N9vfgbPm+77kE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r9EK+83FNMlV3XkVMl2NaXnmNsBQDJlGY4AUADcVDpZcsCbR41a0K7qnnpNV+9dP/
 NsEdxES+pyYs36PovFOvt2lbrphvk6Lmhzy+4o6Fxzpgsr2WQ44hanxUaj5rv0azX/
 1RyJ79VHQC3K3EPWcC1LwGqnf4EaHBRw6aKZ8xvI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 030/127] mtd: rawnand: sunxi: Write pageprog
 related opcodes to WCMD_SET
Date: Fri, 22 Nov 2019 00:54:08 -0500
Message-Id: <20191122055544.3299-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_215619_986430_3155E4EA 
X-CRM114-Status: GOOD (  11.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

[ Upstream commit 732774437ae01d9882e60314e303898e63c7f038 ]

The opcodes used by the controller when doing batched page prog should
be written in NFC_REG_WCMD_SET not FC_REG_RCMD_SET. Luckily, the
default NFC_REG_WCMD_SET value matches the one we set in the driver
which explains why we didn't notice the problem.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index 9589748215821..8e52314823976 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1435,7 +1435,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct mtd_info *mtd,
 	sunxi_nfc_randomizer_enable(mtd);
 
 	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
-	       nfc->regs + NFC_REG_RCMD_SET);
+	       nfc->regs + NFC_REG_WCMD_SET);
 
 	dma_async_issue_pending(nfc->dmac);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
