Return-Path: <SRS0=mbSa=ZF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A48C43331
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 01:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96BC22473
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 01:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aXixWt5d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ5xYXxs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96BC22473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2b/KAn7K9v8EBduPQB7A5Tu9KPDMCHVdcBCzoFB8Cg=; b=aXixWt5dZpqURR
	agu4/zVrY8hE12zHrImgKTO9G0c8Gaam4emhOWRCi8X65tmBu+kTDwdYNg4C177Pg7WhPPPSOZKYM
	0lVYBvSQVG4A3pxzrigtT1QRLBpIHvaPFsQd2UtPIwoIhiUh5aWGQgfbtKg42o38sOTtV1ynt2r2i
	LNPgeN1vIbZ2mNTRlaNB5HddTFZlEhTCAK2wQpg61nlub7J6m1pPmyN98s89r00uPWDkt7AYDpjuP
	98DLDjUvgu1ImYjqU/ZvRxg7o3RZsuKLz+Ux//6BQTI3RcfHNL6oPzqaUZRmNH6X3ih24u8WfpHOM
	ydUK3fIsSbmL/2NuxlPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUhuJ-0007SF-0u; Wed, 13 Nov 2019 01:57:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUhuG-0007Rc-5n
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2019 01:57:17 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07BFC22474;
 Wed, 13 Nov 2019 01:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610235;
 bh=nV3Afj2p0AljyImMjr0YVmZVcER+1VWGOKDMdHq3Q3o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JJ5xYXxs0v8N3QUVz7xlVY48gs3E145OFK77xcRM7Vrfsh/zWptrT6BgnLqByAKAB
 kKOE2V8OI/Qp010CWGgPHDd6blkA1NxV5oVp7uP9ze5QnIfqk2EuiK1pADYptaBynR
 fIXRso1g8JIz1J2EAAddD52Ubvl3k0AhK/FOQ2Uo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 036/115] mtd: rawnand: sh_flctl: Use proper enum
 for flctl_dma_fifo0_transfer
Date: Tue, 12 Nov 2019 20:55:03 -0500
Message-Id: <20191113015622.11592-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015622.11592-1-sashal@kernel.org>
References: <20191113015622.11592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_175716_237369_6B1B99F1 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Nathan Chancellor <natechancellor@gmail.com>

[ Upstream commit e2bfa4ca23d9b5a7bdfcf21319fad9b59e38a05c ]

Clang warns when one enumerated type is converted implicitly to another:

drivers/mtd/nand/raw/sh_flctl.c:483:46: warning: implicit conversion
from enumeration type 'enum dma_transfer_direction' to different
enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) > 0)
                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
drivers/mtd/nand/raw/sh_flctl.c:542:46: warning: implicit conversion
from enumeration type 'enum dma_transfer_direction' to different
enumeration type 'enum dma_data_direction' [-Wenum-conversion]
                flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
2 warnings generated.

Use the proper enums from dma_data_direction to satisfy Clang.

DMA_MEM_TO_DEV = DMA_TO_DEVICE = 1
DMA_DEV_TO_MEM = DMA_FROM_DEVICE = 2

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/nand/sh_flctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index e7f3c98487e62..43db80e5d994f 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -480,7 +480,7 @@ static void read_fiforeg(struct sh_flctl *flctl, int rlen, int offset)
 
 	/* initiate DMA transfer */
 	if (flctl->chan_fifo0_rx && rlen >= 32 &&
-		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_DEV_TO_MEM) > 0)
+		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_FROM_DEVICE) > 0)
 			goto convert;	/* DMA success */
 
 	/* do polling transfer */
@@ -539,7 +539,7 @@ static void write_ec_fiforeg(struct sh_flctl *flctl, int rlen,
 
 	/* initiate DMA transfer */
 	if (flctl->chan_fifo0_tx && rlen >= 32 &&
-		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_MEM_TO_DEV) > 0)
+		flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_TO_DEVICE) > 0)
 			return;	/* DMA success */
 
 	/* do polling transfer */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
