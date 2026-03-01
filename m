Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78716FD0049
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2026 01:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WC1jknIidSygj4wTZJovLlryE7578b+swNpwOFiXw4E=; b=mTEWNReQh6pGDt
	lmp1msGt5y9qedXQdJ4yXYVRb/Zu9koH5+nKE6UCc/t22qrQ5SMHT0hVBVCZn1JaEr2J8Lt4frSal
	phLBTQ4Uo81IYxZOj8/XHQZa/hWxV4G77/MVRutCoIB1yhGJNI25VT9t9jq3RHIShb0Z7d21G7jtN
	shP3TW5nmTQShPBNuT181c39zYLbLkJwsqSp/+09/hodHEEe2DHIIl2K1AZKXd0Z29On76HFu2BN6
	4S/eBUoTlfViEyOO67nK7c51awpubzySF0/0/ScOKtSDRt2QGZA5Uosi0uv/pW89FyF8pkOR3Y5Ot
	MAe6p8niCFaHzGFDXbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVY7-0000000AVqt-1s3s;
	Sun, 01 Mar 2026 01:24:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVXy-0000000AVqK-48WJ
	for linux-mtd@lists.infradead.org;
	Sun, 01 Mar 2026 01:24:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FE3660008;
	Sun,  1 Mar 2026 01:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68288C19421;
	Sun,  1 Mar 2026 01:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328278;
	bh=UZtwMz5sW1+hrbJWun+5atmQ1Rt3jEw+JR/O8wl6ogo=;
	h=From:To:Cc:Subject:Date:From;
	b=NnDdYycJ/yJpxOgBPT0QLaRGfMTLhoJNvRM3RzVNqBKEYmN9+O3BQEFaJp8q6rWcY
	 Y0UvAnQl/LZfpJsBt3ySIREucVzn8z9XkIuPlx/T3Iq7XzON6g71PmE9M3DEZNfj4R
	 DZTWxbqJ/gs+dIAlcNWHSC5/Z3Ce5s6N9jxobGsLHOwMujcjf5MoDwM++AcMc824yx
	 xUzA5ZE7N2rixd6OKWY5K4NwCKElRRuJaanKOihEEjECGCIpBeeaLimS1R+B4ktm+k
	 aSfc9xBuSf01ncRr8h7nPpo++GzApmQfValnA6+nS8SEplqN6lNnP4ne0aIJfVYS/b
	 nfsoevsIhlGVQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	dalaport@amazon.com
Cc: Gunnar Kudrjavets <gunnarku@amazon.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: FAILED: Patch "mtd: spinand: Disable continuous read during probe" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:24:35 -0500
Message-ID: <20260301012436.1681493-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From b4af7d194dc879353829f3c56988a68fbba1fbdd Mon Sep 17 00:00:00 2001
From: David LaPorte <dalaport@amazon.com>
Date: Thu, 29 Jan 2026 17:33:22 -0800
Subject: [PATCH] mtd: spinand: Disable continuous read during probe

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
Cc: stable@vger.kernel.org
Signed-off-by: David LaPorte <dalaport@amazon.com>
Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
Reviewed-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 21a980e626eb2..514f653f27f3e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -940,6 +940,14 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
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
2.51.0





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
