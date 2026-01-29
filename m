Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EE0D73E87
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eGt6yaJRHUjx8pmzvBtN8PsiFUGwWm23Klm0NnT8dLM=; b=EMXycTMf1wscFF
	FrcJnKtBBDiAdqE/zzkSfZWXRzpNwK/kdejTm6ponA9ncP1yeEoGGs5tmKnDktpqzCEmUjOYzcemR
	8pFQzlyALUkad5z3jGt5JFBSg914N3fnJ1wSBMubvMGozZ0UzErTCNQohqP636pX3j8TLS4sMlf67
	0EznDAk+lLJwlXyCp925kaCGNd5MJJmWOnmi4CV5d27IVGf/hTCGAnkuHQaF8X5wU8x4oTsuEl6uG
	csnj0jUMiW0dFDqadv0GWJyBUJSVSCucCpMuylIH0u8HfGxC3KY+1GSBCwDnwEpGFfTuowU6znQD8
	h7/KL1TlD6YbYM8tZ2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlaJH-00000000igm-2td5;
	Thu, 29 Jan 2026 22:16:19 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlaJF-00000000igK-2A4X
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 22:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1769724977; x=1801260977;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hWdvUWW0Ad9qhyIEDQ11OCPpgS4C9PUnHfqSA+NtbDU=;
  b=SkWTmRbBsc6ATbh+rT7y1PyJNVETxhrzO63KUoivXpEbW53Na+HhVfv9
   ZR8Us9cqrCJRPebI6RwrVTtqfDi4K61vZKuXaVgdyIxkltAA5WEivyvic
   HRj+SKAoBcOG+qnxkwqyug+FANA4i8Na2xjU7y/vHGh6PfL0+ZMe9wl2L
   8JqvqFb1EGI/oAtMejJAVMDIT+54Mzvw/QyX+JB/1qgfZ0M5CoI0Ia88I
   YCtEpLj/bOVTozdBaO8GnwtHFMR9VYpfkr96E/JPjMnXTovIdUV7ywLyA
   HhisN4467LicmavRygfClVqnL1vU3szVsFzlkUw5RkOhbFVtNVkXX/uva
   A==;
X-CSE-ConnectionGUID: U46w1vRmQVOJAD4cbTOGMg==
X-CSE-MsgGUID: 8kpImQZ0ROO3naXyL9pmLw==
X-IronPort-AV: E=Sophos;i="6.21,261,1763424000"; 
   d="scan'208";a="11871847"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 22:16:13 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:4250]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.45.176:2525] with esmtp (Farcaster)
 id 7a772041-cd17-4e57-9f7d-f39ae12f9983; Thu, 29 Jan 2026 22:16:13 +0000 (UTC)
X-Farcaster-Flow-ID: 7a772041-cd17-4e57-9f7d-f39ae12f9983
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 29 Jan 2026 22:16:13 +0000
Received: from 842f574e803f.amazon.com (10.187.171.32) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 29 Jan 2026 22:16:12 +0000
From: David LaPorte <dalaport@amazon.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>, Pratyush Yadav <pratyush@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: David LaPorte <dalaport@amazon.com>, Gunnar Kudrjavets
	<gunnarku@amazon.com>
Subject: [PATCH] mtd: spinand: Disable continuous read during probe
Date: Thu, 29 Jan 2026 14:15:59 -0800
Message-ID: <20260129221606.35158-1-dalaport@amazon.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Originating-IP: [10.187.171.32]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_141617_760011_661E3418 
X-CRM114-Status: GOOD (  13.33  )
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

Macronix serial NAND devices with continuous read support do not
clear the configuration register on soft reset and lack a hardware
reset pin. When continuous read is interrupted (e.g., during reboot),
the feature remains enabled at the device level.

With continuous read enabled, the OOB area becomes inaccessible and
all reads are instead directed to the main area. As a result, during
partition allocation as part of MTD device registration, the first two
bytes of the main area for the master block are read and indicate that
the block is bad. This process repeats for every subsequent block for
the partition.

All reads and writes that reference the BBT find no good blocks and
fail.

The only paths for recovery from this state are triggering the
continuous read feature by way of raw MTD reads or through a NAND
device power drain.

Disable continuous read explicitly during spinand probe to ensure
quiescent feature state.

Fixes: 631cfdd0520d ("mtd: spi-nand: Add continuous read support")
Signed-off-by: David LaPorte <dalaport@amazon.com>
Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
---
Testing details:
- Instrumented feature enablement and verified fix with affected Macronix
  serial NAND device:  warm reboot without patch marks all blocks bad
  during partition allocation; with patch applied, device registers
  cleanly with no bad blocks marked
- Patch cherry-picks cleanly to mainline v6.19-rc6 and builds without
  warnings
- Boot tested mainline + patch on aarch64 host without SPI interface
---
 drivers/mtd/nand/spi/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d207286572d8..1fb05ac8678b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -859,6 +859,7 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 	    (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
 	     engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
 		spinand->cont_read_possible = true;
+		spinand_cont_read_enable(spinand, false);
 	}
 }

--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
