Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128FED73EAA
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 01:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TeA5sWGtm3gME5Iu8B/T0sqYPAgb0H2Rj3xk1IUklfc=; b=PNXTnDYmo/qX7o
	yJUKIXGzmeYtVe5+vLlf/QkDCFngvWFcg7tGFuUzucYLJkX0bD90sxVdxE0OYUWfxe/UxN1CYex/4
	S4O8XC/MkhdaKwb12XHd3QbLOiRViaYaQW+EWYN6JCp74fwHw8Hxv8c38hhJ4MWJA8IPVRKABsig6
	Xif9UIVcrSf3LRnCYWJ4orM1B3PfKTtbqhm+Z0ALMQkbOipLY4zKYTwRVKCHtiNp5FTQBRsezEQ/i
	ErwhHkUfAeEXfrCBkT5M90PzgiqFxvVhJGP4gGOHzlmDTDTNzTpQRFBdpoP/U2GrjA9Ds1QcL2aJv
	5WgCEUWx6ClknOSYOb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldOO-00000000rOc-3cFE;
	Fri, 30 Jan 2026 01:33:48 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vldOL-00000000rNu-3jch
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 01:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1769736825; x=1801272825;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PC3sh08XqknfE1Fy9RIuBcYqxa7ZpUJE3jkTRSUpshc=;
  b=kmRCTfaiYitL0eW6K8px/Cglm/xoyE0WfDgccBta8nfe0rSFXYLgVNkL
   Br7o1WyodtSfS9T69zLIs5aMtyNvRmJ/OKc7PcuQQ+byC3gjQlqpQyMzR
   r/r+nHxm473Sc3sHu5aMp/JLfOX7WfCbO7Qpb2M9yxuofl7KKqJBZHV0o
   u3ZtsU4ueu/zUhmVRCLFnRChp5RhqrJ5m/hkd3m9nqxWJsbxrEBR5S5lv
   w8LaJoOxLiXAiPqHUiqOJGs4Nrp9cqd6chtK9pxp3uWj4j6U1fwjcGZVo
   V4sprlJMGv4JeX3LdpxbgnHBEB7Wg8NtnfL6iUKeiM0E6ZBHfZh+QdT17
   A==;
X-CSE-ConnectionGUID: GZL0syTtSAypUj0mcRqMrw==
X-CSE-MsgGUID: ROnXOPF3Tc+c9kZ2ZTilog==
X-IronPort-AV: E=Sophos;i="6.21,262,1763424000"; 
   d="scan'208";a="11883224"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 01:33:41 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:18786]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.147:2525] with esmtp (Farcaster)
 id be9bdce5-5bcc-4da0-aac5-543c5eac1b37; Fri, 30 Jan 2026 01:33:41 +0000 (UTC)
X-Farcaster-Flow-ID: be9bdce5-5bcc-4da0-aac5-543c5eac1b37
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Fri, 30 Jan 2026 01:33:41 +0000
Received: from 842f574e803f.amazon.com (10.142.151.209) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Fri, 30 Jan 2026 01:33:40 +0000
From: David LaPorte <dalaport@amazon.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>, Pratyush Yadav <pratyush@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: David LaPorte <dalaport@amazon.com>, Gunnar Kudrjavets
	<gunnarku@amazon.com>
Subject: [PATCH v2] mtd: spinand: Disable continuous read during probe
Date: Thu, 29 Jan 2026 17:33:22 -0800
Message-ID: <20260130013334.72135-1-dalaport@amazon.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Originating-IP: [10.142.151.209]
X-ClientProxiedBy: EX19D044UWA001.ant.amazon.com (10.13.139.100) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_173345_991946_F191040D 
X-CRM114-Status: GOOD (  15.42  )
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
Changes in V2:
- Added comments to explain why cont_read is disabled here
- Link to v1: https://lore.kernel.org/all/20260129221606.35158-1-dalaport@amazon.com/
---
Testing details:
- Instrumented feature enablement and verified fix on internal kernel
  v6.12.64 build with affected Macronix MX35UF4GE4AD-Z4I hardware:
  warm reboot without patch marks all 2048 blocks bad during partition
  allocation; with patch applied, device registers cleanly with no bad
  blocks marked
- Patch cherry-picks cleanly to mainline v6.19-rc6 and builds without
  warnings
- Boot tested mainline + patch on aarch64 host without SPI interface
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d207286572d8..9540fd04156c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -859,6 +859,14 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 	    (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
 	     engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
 		spinand->cont_read_possible = true;
+
+		/*
+		 * Ensure continuous read is disabled on probe.
+		 * Some devices retain this state across soft reset,
+		 * which leaves the OOB area inaccessible and results
+		 * in false positive returns from spinand_isbad().
+		 */
+		spinand_cont_read_enable(spinand, false);
 	}
 }

--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
