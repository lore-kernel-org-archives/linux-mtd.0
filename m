Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBAEC4345F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2024 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OMhsac0jssudxAsjv9vV6fZ1fWqWtVpcEtSmjCGrkM8=; b=agmhVWrP/0LN1i
	u8cirsB1CLVm521aXSOy2HMVrHI2UygrqTFPGmZG/IPTyWRoN8+5maeG2ck7zn99BsVc08yGdIhNC
	5eTD+iiDBVexN8OqpACMgbvMEZBwjAXN3S9CE2zD63Hv2KDUFA3lPe70Xu+n++5GJdhzx08mzyJ0W
	k0Jw1f+V4OlHEKfRxljiDcqg1gAGCpswiITB9N/g0wXq7qro4+WRDd8dWzsbKklwPfYk2ee+Ihjto
	ypqVgt+Ylv6lUVVOQE7Bbo+NdjrR425VKyZ6bcisC8fBjHKatcRZ9DGX5eM43ZqVI1iwNPSMqvT4d
	N/gfE+BoVN7mVQJQa1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xrj-000000002ps-1I6B;
	Fri, 03 May 2024 18:42:39 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xrg-000000002p8-2VbO
	for linux-mtd@lists.infradead.org;
	Fri, 03 May 2024 18:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714761757; x=1746297757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q4xkNgHhMhLTgKFwLy/peK8W9gb/1njcDFxZND/a0m0=;
  b=AcTpvgg12LzGwooZjMTaOXn1k6mhR2+Vimb0r/hqSU+aMUmUWL3X26rq
   ORxFCX017AfCJDufaSlNDqiYQuc9DL5jpL05tomtMXA3N0E5UAqMbZTUU
   5iD9qlJnbB2fg69QC83Ag6KqtWM17Vq7cMoKrIPGBqsIWvctyNJD0sJ/n
   u1duZcXrAvVqdnXFA0VwF+HCFyRnGnn1Qvf79++FejxVGKyAeIdVsKhDa
   9fdu4ygcvuuMG0iPAGlRHk4znNmeCSEDMvH45CE6PrSBQ5ZK0Qap6UGG4
   hy4ESczKpMUIb8kMjwfhStBWnHQroR5Bj4oaLDyLP7L/Z2hKMW0M3J/Em
   A==;
X-CSE-ConnectionGUID: WgrdW9SGSXSV5Vj8oG2GOA==
X-CSE-MsgGUID: jY96YmsVSBK7MWp10eGHYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10415184"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10415184"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 11:42:36 -0700
X-CSE-ConnectionGUID: L7Jb2MVnRRqBAFDbvzalPg==
X-CSE-MsgGUID: jsIjoHonTVqgZoTeH/PC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27634376"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2024 11:42:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3FCBE19E; Fri,  3 May 2024 21:42:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1 1/1] mtd: cfi: Get rid of redundant 'else'
Date: Fri,  3 May 2024 21:42:30 +0300
Message-ID: <20240503184230.2927283-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_114236_722735_C352455C 
X-CRM114-Status: GOOD (  11.20  )
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

In the snippets like the following

	if (...)
		return / goto / break / continue ...;
	else
		...

the 'else' is redundant. Get rid of it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mtd/cfi.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 947410faf9e2..35ca19ae21ae 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -308,32 +308,32 @@ static inline uint8_t cfi_read_query(struct map_info *map, uint32_t addr)
 {
 	map_word val = map_read(map, addr);
 
-	if (map_bankwidth_is_1(map)) {
+	if (map_bankwidth_is_1(map))
 		return val.x[0];
-	} else if (map_bankwidth_is_2(map)) {
+	if (map_bankwidth_is_2(map))
 		return cfi16_to_cpu(map, val.x[0]);
-	} else {
-		/* No point in a 64-bit byteswap since that would just be
-		   swapping the responses from different chips, and we are
-		   only interested in one chip (a representative sample) */
-		return cfi32_to_cpu(map, val.x[0]);
-	}
+	/*
+	 * No point in a 64-bit byteswap since that would just be
+	 * swapping the responses from different chips, and we are
+	 * only interested in one chip (a representative sample)
+	 */
+	return cfi32_to_cpu(map, val.x[0]);
 }
 
 static inline uint16_t cfi_read_query16(struct map_info *map, uint32_t addr)
 {
 	map_word val = map_read(map, addr);
 
-	if (map_bankwidth_is_1(map)) {
+	if (map_bankwidth_is_1(map))
 		return val.x[0] & 0xff;
-	} else if (map_bankwidth_is_2(map)) {
+	if (map_bankwidth_is_2(map))
 		return cfi16_to_cpu(map, val.x[0]);
-	} else {
-		/* No point in a 64-bit byteswap since that would just be
-		   swapping the responses from different chips, and we are
-		   only interested in one chip (a representative sample) */
-		return cfi32_to_cpu(map, val.x[0]);
-	}
+	/*
+	 * No point in a 64-bit byteswap since that would just be
+	 * swapping the responses from different chips, and we are
+	 * only interested in one chip (a representative sample)
+	 */
+	return cfi32_to_cpu(map, val.x[0]);
 }
 
 void cfi_udelay(int us);
-- 
2.43.0.rc1.1336.g36b5255a03ac


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
