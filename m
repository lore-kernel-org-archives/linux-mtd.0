Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F61CC10F11
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 01:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C7A20835
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 01:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WuMsuh2A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16C7A20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HbvweO/QNevF0eYOL5HIiBPMAn+vGugVyCyDHoJZQg8=; b=WuMsuh2ASTlZDE
	pEXnJ/XJewGEqoE21wS+g00dixC0HvAzb6RuKJAiGEfC3GyC1KOhGx3ceD3exWlkFv+k50FoVz0Cl
	aOjhkdsuowmtkyDNhx/Bz2mmohLS2x0iyQYA0LdPt855j3YSHft2QCYATEFXAG+8fBVOOlKoXUDoB
	dPB6RwG+SZrQ4OUxsndG10RRXpzq7/I1zA113DY9/Y6sFp7aCx1iK5aozVgcbKQm9C0ORuzgS2tEP
	QMW+25PZWpBx0+gfZOdyf01n0iCJJJG/bkIKLuvA0c2pKXvaoq7dxNhOyNBRgkfLQxxo3FSdmrkzW
	nZlMt0HKYrz38x6oFcoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJTcN-0004Ja-6p; Thu, 25 Apr 2019 01:56:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJTcJ-0004J5-Sk; Thu, 25 Apr 2019 01:56:05 +0000
X-UUID: 3f69ee6c623246398235de6dd2437568-20190424
X-UUID: 3f69ee6c623246398235de6dd2437568-20190424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 721637022; Wed, 24 Apr 2019 17:55:56 -0800
Received: from mtkmbs03n1.mediatek.inc (172.21.101.181) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 24 Apr 2019 18:55:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 25 Apr 2019 09:55:54 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 25 Apr 2019 09:55:53 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [RFC PATCH v2 0/1] Re-license MTK NAND driver
Date: Thu, 25 Apr 2019 09:55:51 +0800
Message-ID: <20190425015552.42638-1-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_185603_933213_8CEC44D5 
X-CRM114-Status: UNSURE (   5.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com,
 srv_heupstream@mediatek.com, yellowriver2010@hotmail.com,
 jorge.ramirez-ortiz@linaro.org, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, yingjoe.chen@mediatek.com, rafal@milecki.pl,
 linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

Currently, MTK NAND driver is licensed as GPL. And we would like to
modify and publish it in bootloader with MIT license. So, here we send
this RFC patch to solicit ACKs from MTK NAND driver authors and
contributors whether we can re-license MTK NAND driver as dual MIT/GPL.

Thanks and looking forward to your reply,
Xiaolei

Patch v2:
---------
- Add Ryder, Rafal, Wen in CC list.
- Introduce why we want to re-license MTK NAND driver.

Xiaolei Li (1):
  mtd: rawnand: mtk: Re-license MTK NAND driver as Dual MIT/GPL

 drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
 drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
 drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
 3 files changed, 5 insertions(+), 23 deletions(-)

--
2.18.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
