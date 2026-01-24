Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8AD778BF
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jan 2026 00:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8qlU56RW//6TRfA95G+560OX+w4hCMTbb5BNsRFOff8=; b=Bm/GNgE6svRN/R
	wNFzWOhXenwdLG30aEMLWrTZXe7F9/4Vgplu/ma0BkFUw8FZCofJF19gIcimAnL19Zw3Q8n7Ikx/a
	PEZXzDqyBx//i3iVkNFwYt9cvNYN1whoyaucNhpJ9qmIv6Kx4rdvpXV4S94TlqXZTkGnXuAS8gMvS
	TXfqfeY0KRw0Tp8uLAFEPZdr2wU4cM/rivlj07XptwvXxBD35EvfQo2zW12CW0cf+Knnn9434gack
	dJY5dKmdoBu+E4Zdl0O8F+qUV9WOtngl0z76CRjXYr82PNIdaf7fIJ1EN6RlcAzo6JBHZfiYDYJvy
	XQjCD4cLpXKxuXaNJ/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRsq-00000009f2s-2jxb;
	Sat, 24 Jan 2026 00:52:12 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRso-00000009f2O-2VAQ
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jan 2026 00:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769215931; x=1800751931;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mbG+HfQHTOBEjr/iG4I9qoDyiQzFH9/65SOP9bR+ZW4=;
  b=I1/SZROTh+CL8/lrNY9ApYsGyN+OMLdJk2fU+aLFTVSIwwyTCc0CI13U
   pFjIc2Yb+eqMNH2j5EAuLCLY9chOQlbRyLcLGLBuieCodcaLtSDcu/3Ga
   BE8Kb3Xe92ja1ijXXut7IXy2jh60LmJqOT66Cw++xVyVft6iweCKCD1j9
   557izUreU2fJET67IBsvoWiirsvhCanvaIOZJs1GJPHyqNTHi3e5BhKSp
   4Snlsh8sdotE8V+/r4f2EmBArOaStWtJxnqOZ+5cUUyUa/QhAILjClvYT
   NO2f32YMq+SGdhHRz10cVt6T/iTp8K6OBqDCqLdE25uM2b2ydOu7aM1lj
   A==;
X-CSE-ConnectionGUID: c5Kpx41sTa61A58IBAwbcA==
X-CSE-MsgGUID: fVMCK5riRT+hOcWbYJYYlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74318199"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74318199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 16:52:09 -0800
X-CSE-ConnectionGUID: 7y0FyRt3QyWCg3HPnGPf1w==
X-CSE-MsgGUID: 2eserH41TVW5xGCU6x3M7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="238420193"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jan 2026 16:52:07 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 659FB95; Sat, 24 Jan 2026 01:52:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1 1/1] mtd: cfi_cmdset_0001: Factor out do_write_buffer_locked() to reduce stack frame
Date: Sat, 24 Jan 2026 01:52:03 +0100
Message-ID: <20260124005203.3167280-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_165210_676455_33B3669E 
X-CRM114-Status: GOOD (  16.06  )
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

Compiler is not happy about used stack frame:

drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

Fix this by factoring out do_write_buffer_locked().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 77 +++++++++++++++++------------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index c10693ba265b..8e497e0268f7 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1720,40 +1720,24 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 }
 
 
-static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
-				    unsigned long adr, const struct kvec **pvec,
-				    unsigned long *pvec_seek, int len)
+static int __xipram do_write_buffer_locked(struct map_info *map, struct flchip *chip,
+					   unsigned long cmd_adr, unsigned long adr,
+					   const struct kvec **pvec,
+					   unsigned long *pvec_seek, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word status, write_cmd, datum;
-	unsigned long cmd_adr;
-	int ret, wbufsize, word_gap, words;
+	int ret, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
 	unsigned long initial_adr;
 	int initial_len = len;
 
-	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
-	adr += chip->start;
 	initial_adr = adr;
-	cmd_adr = adr & ~(wbufsize-1);
-
-	/* Sharp LH28F640BF chips need the first address for the
-	 * Page Buffer Program command. See Table 5 of
-	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701) */
-	if (is_LH28F640BF(cfi))
-		cmd_adr = adr;
 
 	/* Let's determine this according to the interleave only once */
 	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0xe8) : CMD(0xe9);
 
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, cmd_adr, FL_WRITING);
-	if (ret) {
-		mutex_unlock(&chip->mutex);
-		return ret;
-	}
-
 	XIP_INVAL_CACHED_RANGE(map, initial_adr, initial_len);
 	ENABLE_VPP(map);
 	xip_disable(map, chip, cmd_adr);
@@ -1789,7 +1773,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		xip_enable(map, chip, cmd_adr);
 		printk(KERN_ERR "%s: Chip not ready for buffer write. Xstatus = %lx, status = %lx\n",
 				map->name, Xstatus.x[0], status.x[0]);
-		goto out;
+		return ret;
 	}
 
 	/* Figure out the number of words to write */
@@ -1853,7 +1837,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		chip->state = FL_STATUS;
 		xip_enable(map, chip, cmd_adr);
 		printk(KERN_ERR "%s: buffer write error (status timeout)\n", map->name);
-		goto out;
+		return ret;
 	}
 
 	/* check for errors */
@@ -1866,21 +1850,50 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		map_write(map, CMD(0x70), cmd_adr);
 		xip_enable(map, chip, cmd_adr);
 
-		if (chipstatus & 0x02) {
-			ret = -EROFS;
-		} else if (chipstatus & 0x08) {
+		if (chipstatus & 0x02)
+			return -EROFS;
+
+		if (chipstatus & 0x08) {
 			printk(KERN_ERR "%s: buffer write error (bad VPP)\n", map->name);
-			ret = -EIO;
-		} else {
-			printk(KERN_ERR "%s: buffer write error (status 0x%lx)\n", map->name, chipstatus);
-			ret = -EINVAL;
+			return  -EIO;
 		}
 
-		goto out;
+		printk(KERN_ERR "%s: buffer write error (status 0x%lx)\n", map->name, chipstatus);
+		return -EINVAL;
 	}
 
 	xip_enable(map, chip, cmd_adr);
- out:	DISABLE_VPP(map);
+	return 0;
+}
+
+static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+				    unsigned long adr, const struct kvec **pvec,
+				    unsigned long *pvec_seek, int len)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	unsigned long cmd_adr;
+	int ret, wbufsize;
+
+	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
+	adr += chip->start;
+	cmd_adr = adr & ~(wbufsize - 1);
+
+	/* Sharp LH28F640BF chips need the first address for the
+	 * Page Buffer Program command. See Table 5 of
+	 * LH28F320BF, LH28F640BF, LH28F128BF Series (Appendix FUM00701) */
+	if (is_LH28F640BF(cfi))
+		cmd_adr = adr;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, cmd_adr, FL_WRITING);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	ret = do_write_buffer_locked(map, chip, cmd_adr, adr, pvec, pvec_seek, len);
+
+	DISABLE_VPP(map);
 	put_chip(map, chip, cmd_adr);
 	mutex_unlock(&chip->mutex);
 	return ret;
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
