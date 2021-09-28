Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D312BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FFF56115A
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FFF56115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sE373sBq0r/1IMMVc4POtDsHbAIl4Qj32QIUyqr5tVQ=; b=rCjJkqEV79mL1h
	AsjRDER+iwbJ64/mVGpqUNLp3f2kwO68QoHToo9dYziySgbE0X50R+qIjnSMx5f2r5Dwdzn/LJnOu
	knyIO44E+CuoIRfyMAXMhkkYi6IphXWZigTq46Jbofg4XbEdtkSiwgvYelg2kGTFK1fC3SOMuhsVI
	xFqW52Cei1SlA3lOKvIqqDB12Wy2Uhc63zLeI3tk+LAxEY5eCIj4Hf8zz7VWWs9yrwETvs4xbFcR2
	0q7SKI3Jt17pywYRQz0RkqM7Z6V9Hp31NRZU8J+T2mEdc87jLUYDijjvcyaOlgo23FZSc2qdx6YhK
	ahHJekxnFEWbNiDTnLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLd4-0095iM-Kh; Tue, 28 Sep 2021 22:31:14 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLV8-0092vb-Nz
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 22:23:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1133F100004;
 Tue, 28 Sep 2021 22:22:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/9] Keep on-die ECC engines compatibility
Date: Wed, 29 Sep 2021 00:22:39 +0200
Message-Id: <20210928222258.199726-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_152302_994119_D161B758 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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

Recent changes broke the possibility to set the desired ECC engine type
from DT, this is of course an error and needed to be fixed. The fix
applies to all drivers which already received a previous incomplete fix
(about SW support). Hopefully this time we should be good. Sorry for the
noise.

Miquel Raynal (9):
  mtd: rawnand: ams-delta: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: au1550nd: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: gpio: Keep the driver compatible with on-die ECC engines
  mtd: rawnand: mpc5121: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: orion: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: pasemi: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: plat_nand: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: socrates: Keep the driver compatible with on-die ECC
    engines
  mtd: rawnand: xway: Keep the driver compatible with on-die ECC engines

 drivers/mtd/nand/raw/ams-delta.c     | 12 +++++++++---
 drivers/mtd/nand/raw/au1550nd.c      | 12 +++++++++---
 drivers/mtd/nand/raw/gpio.c          | 12 +++++++++---
 drivers/mtd/nand/raw/mpc5121_nfc.c   | 12 +++++++++---
 drivers/mtd/nand/raw/orion_nand.c    | 12 +++++++++---
 drivers/mtd/nand/raw/pasemi_nand.c   | 12 +++++++++---
 drivers/mtd/nand/raw/plat_nand.c     | 12 +++++++++---
 drivers/mtd/nand/raw/socrates_nand.c | 12 +++++++++---
 drivers/mtd/nand/raw/xway_nand.c     | 12 +++++++++---
 9 files changed, 81 insertions(+), 27 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
