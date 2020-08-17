Return-Path: <SRS0=2ZLh=B3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17BDC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 18:42:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6CF9204EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Aug 2020 18:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CwmOfaHv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHawPRZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6CF9204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7PGmFYTtU9NvdRZJQHAZxtSUxNz4Q/rmTXqDpw8UsI=; b=CwmOfaHveaRmPms+NoZPDyPCI2
	30LIT5yzCvmIgMi6Z57C2BWDkDMcT4MspWn83ZxA65SskgNgr2BXEV/0KWrwz7383kb2tft6TW5AC
	v5EwN5VJWYaoORXlRWiskj/ej1XsH221esRnpaZ1r5641Ez7x5a6bv39cv2aflAxOYPeDMTyAKbPV
	rpT8861Vyh5rEjSypXsoJcznUP8MBan/9pohuoaxGyNqzNksgyyIaEps62KEvyVDeeT1jjf3Lv0pp
	bP67ELNFlz5ygpK+5hIrRjdpzdgxN6S89LOXTZ0hZcNHnhnQq3N5JugBdxIpeEk8swMhHZjJXD6cA
	Zmy/TihQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7k4k-0002dF-TT; Mon, 17 Aug 2020 18:41:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7k4i-0002cX-SD
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2020 18:41:41 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73123204EC;
 Mon, 17 Aug 2020 18:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597689700;
 bh=XGnEgmFBVdyc/oUXakYFZiKhW4THFttuZ2JyUOkUtJw=;
 h=From:To:Cc:Subject:Date:From;
 b=jHawPRZQrrd5xxfRQtHweKENED5UFeclNEs/TU/nUtthQQZGnCL0R1AJ+Sk46mDyQ
 icRCngDuUc/ZyulO0k04YaBQYT5wRmJvOyTh0Yqj/ernE9YH+1S6cpkWclCHRgMYQA
 3d20KnUo5XBAY2DvCeRAvg2R4oADhEYrn4Kfvg4k=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
Date: Mon, 17 Aug 2020 20:41:30 +0200
Message-Id: <20200817184131.907-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_144141_009167_EE352769 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The entry for MIPS Ingenic JZ4780 DMA driver is not up to date anymore.
Zubair Lutfullah Kakakhel's email bounces and no maintenance is
provided.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 MAINTAINERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0a742ce8f2c..9ab3a7fd6451 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8580,11 +8580,6 @@ F:	include/uapi/rdma/
 F:	samples/bpf/ibumad_kern.c
 F:	samples/bpf/ibumad_user.c
 
-INGENIC JZ4780 DMA Driver
-M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
-S:	Maintained
-F:	drivers/dma/dma-jz4780.c
-
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
