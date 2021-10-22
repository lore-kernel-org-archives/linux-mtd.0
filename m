Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A52C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 02:51:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF86E61362
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 02:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF86E61362
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7z4ChGfdE9Mn1c2O6V6+519h9iL7+ihxuPjgvdKkBg=; b=4Mv8umcQi3NhYU
	p3tCwZ916/3oJtEwLVjtlpHInR4VEJB+oQuGfL/sjcA8AuJbdCA3HZqN14VIs6ZzbL22zxEGflO/y
	T02VNlyh8wN7nldgRwVdtKQDAvag3erxcktCRHSoVzEK6Sx2NtueW7Rv+TML+eDUuKPqBgwS+MbJd
	4gjFiTc5c/UPUVfpte8Lej/oQg58TD0sy4hxSfpHi7qcQTUTMZm4yHKKM2M8UPQCMNSKvscKi4stl
	WUEeSG0+IP7CLj+pFkah8KlbMg7tDdVAwingu16W4UmrxpSJGCV8G2XuC9U3pqw09Vw/R+M3nu5Dy
	cDxpJIheTVBeCgHldHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdkdt-009cYO-Q4; Fri, 22 Oct 2021 02:50:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkdq-009cXb-Nr; Fri, 22 Oct 2021 02:50:48 +0000
X-UUID: a46d7ec0c59749d684c0d63755b2bf16-20211021
X-UUID: a46d7ec0c59749d684c0d63755b2bf16-20211021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 751290898; Thu, 21 Oct 2021 19:50:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 19:40:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 10:40:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 10:40:48 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,
 v3 5/5] mtd: spinand: skip set/get oob data bytes when interleaved
 case
Date: Fri, 22 Oct 2021 10:40:21 +0800
Message-ID: <20211022024021.14665-6-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_195046_810881_DF8AC5D3 
X-CRM114-Status: GOOD (  11.84  )
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

For syndrome layout, ECC/free byte in oob layout and main
data are interleaved. For this case, it is better to set/get
oob data bytes in ECC engine.

For MTK ECC engine, although it can auto place data as sector +
oob free + oob ecc for one page in pipelined. However, the bad
mark will be not fit with nand spec. Therefore, there have bad
mark swap operation in ecc engine.

But, the swap opeation(between bbm 0xff with 1byte main data) will
lead to more one byte than oobavailable. Set oob databytes after
bad mark swap will lead to lost one oob free byte.

Therefore, just try to modify the spi nand framework for review.
And this may be common for the interleaved case.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/spi/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2c8685f1f2fa..32a4707982c5 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -401,7 +401,8 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		       req->datalen);
 
 	if (req->ooblen) {
-		if (req->mode == MTD_OPS_AUTO_OOB)
+		if (req->mode == MTD_OPS_AUTO_OOB &&
+			nand->ecc.user_conf.placement != NAND_ECC_PLACEMENT_INTERLEAVED)
 			mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
 						    spinand->oobbuf,
 						    req->ooboffs,
@@ -442,7 +443,8 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 		       req->datalen);
 
 	if (req->ooblen) {
-		if (req->mode == MTD_OPS_AUTO_OOB)
+		if (req->mode == MTD_OPS_AUTO_OOB &&
+			nand->ecc.user_conf.placement != NAND_ECC_PLACEMENT_INTERLEAVED)
 			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
 						    spinand->oobbuf,
 						    req->ooboffs,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
