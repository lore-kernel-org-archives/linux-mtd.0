Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE4EC7EE30
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jun 2025 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sAqUSoiWWvCevuIWiU4tjYLaQEyYWcIm33B/QkY1rLI=; b=A1eY6F09BzwVRF
	RoYC2Bg5I5o0ajNqFD8JpQT2DiXPQlq1km0WYdMAQJHR+N4yuct/BQT23zuhLrD/pdOgnraybdtrO
	wS5nLqmfFZls6ndRT9EiNo4anolWBHL7g8CMEy+L9j4fh7RqHAhMgRc86De0o3wrcA5/o6IPv48Fe
	6oSU1zJy/w+LJA20Oub5mZClfeMenKI1ryN6zS7SSMG9mciF39ntEYW1tMblqpZUvc2cnRdSLiQMa
	kkQbAcpgLr7vZJ13JabIvlneG3ikp1W64UrTnI1z2t++fGVka29LNqOopxn7KJPn9qbn/GNhTFWmW
	oRy3TZGr+k3H4RDkgNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpPu-0000000CGlz-3ZgA;
	Thu, 26 Jun 2025 16:25:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUp9B-0000000CDuz-3DyF
	for linux-mtd@bombadil.infradead.org;
	Thu, 26 Jun 2025 16:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=x73qXEI1Wf3alylGYnrwwT+6dklEGHmFft22leoM+1o=; b=R5jT7oyvfd8SYrwo5AgJZJXh4m
	InaZfWfiokJNCKi5X2/Y0JTg0tNJo5prU5RrqvfEEdrE2nBH9u5aZhmuZpCEEAjBjxMk0WztNVIy7
	AIQKoGvSrcK8ehySedx0lqqQAcMBAi5lLQEWJcsqTHxtyccO3nS7QLQ/lvPD8IeLqKXk1RAoLkvg/
	H7mbjhQSg+bSd57tHNlthiRBN6Wj5bzY7c+nkzAButBTcboy1MuLlbJ2yR3fqjV+kBXhxezQPuPVJ
	bH40wTjppmBC3XV0kwaJJZhTeCl0c+SBb1lc5PLe8s9pmhxFpayO0K+dZj7HOiGRnHEGyK+c3F7Tt
	ETAWoK8A==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUp98-000000068hH-2DGh
	for linux-mtd@lists.infradead.org;
	Thu, 26 Jun 2025 16:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750954099; x=1782490099;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hs/476mhcCpv+gaONl8TV/ZYzZ1wj/qme9tA+4SJZ0M=;
  b=cmGvUNyFS8LgAT0XwRQ1aJeueqRqXcT3demxt123o7cJhoAeI17hK7tM
   NnGY0GuhwcK2akimAhR7HXkIrplKf/GarAgfXuJXjqxSCDPblRRDO4lN/
   JHPWoKbBFEUY3aaNw5F0n7oCoxIi7WzS+drx7nQ7zh9tgsdI7MxBZHEDU
   PfYJP7Ikpv7IYV9nBPcgMoojH/T6v9Of2kxaR15+8Pj2bBgsgg+7xgAAt
   DXp48ti2WFa1y39P/qlZY5dFuvR3k7vdshr1Nsj0Lb/Z6qK5rDIyZQGiO
   kj83Y9lD6Ic4RF9QdVHUz9PdLYsepJqPDWqSxr1O9PD3MBx1vrReB7/VZ
   g==;
X-CSE-ConnectionGUID: 7KrA17OwR42A9nfj0i+9LA==
X-CSE-MsgGUID: kKSAPs7RQmatjiCu9N8bLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="56938808"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="56938808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 09:08:16 -0700
X-CSE-ConnectionGUID: SmwA0tmeTIOFTS3Y66ijMQ==
X-CSE-MsgGUID: rh0dcOWMRXSj1pRBTdkfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156845298"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 09:08:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EA2022AD; Thu, 26 Jun 2025 19:08:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1 1/1] mtd: map: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 19:08:12 +0300
Message-ID: <20250626160812.325940-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_170819_029315_536B115C 
X-CRM114-Status: UNSURE (   8.80  )
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mtd/map.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 1b56796f6cb3..288ef765a44e 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -8,15 +8,15 @@
 #ifndef __LINUX_MTD_MAP_H__
 #define __LINUX_MTD_MAP_H__
 
-#include <linux/types.h>
-#include <linux/list.h>
-#include <linux/string.h>
 #include <linux/bug.h>
-#include <linux/kernel.h>
 #include <linux/io.h>
-
+#include <linux/ioport.h>
+#include <linux/string.h>
+#include <linux/types.h>
 #include <linux/unaligned.h>
-#include <asm/barrier.h>
+
+struct device_node;
+struct module;
 
 #ifdef CONFIG_MTD_MAP_BANK_WIDTH_1
 #define map_bankwidth(map) 1
@@ -188,6 +188,7 @@ typedef union {
    of living.
 */
 
+struct mtd_chip_driver;
 struct map_info {
 	const char *name;
 	unsigned long size;
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
