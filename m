Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A3AC87FCB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GcVYdqjEH15lg4A5K40BlrmQHHcT6N6UjTNOCLUlHn4=; b=Lid2AQAFdA2hBC
	eRB3o/3Uz3G8ayUFWYrlrikjBDm4lM2xW3pfE+16Wl5XrOr+iQd6BiuMb15m/G/hCPixXc0sIf8sI
	j/WbIKOgF3XsepeJ98Pxe3xCDSdta5d2cnjcVLM95WEiPEd2hoSpo/cPUhlaoyA3V9yfMBZerZ0ow
	xQtTfeomee3I7AlYrWVUsmGkutEEM9gHPGPrHO5jNehgmtxo2x+OTHqyf94PBXnFnnL/5OOMLiVws
	G4jNJZfgVJl6xQVtvK1TZSw2TX1g4uVtSFWy7BqqA+INSkLlrLtF8jg73VxSeIbyjEa1jZrDgUbNF
	olTXAwJrY8HvOJ0qZMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Yo-00000001huB-2wwI;
	Wed, 30 Jul 2025 14:13:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7LH-00000001g3w-1Lh5
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 13:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EE336113A;
	Wed, 30 Jul 2025 13:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17DAC4CEE3;
	Wed, 30 Jul 2025 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753883978;
	bh=N3+NIbm5eiDev1M+UzrXcz/aTODki3H4qf2X/mq2JzU=;
	h=From:To:Cc:Subject:Date:From;
	b=U3TOXbtVl6wxmpHXPj4zmgqZHrEbB0UeMs5FY0LVR3iDlJ1NVNNeXxlOwovBrnyD4
	 GW/yRVZFNUxtmw+0pm9H491HTmFyEsLfbV23THcTNPhIfjU7yioP3qnhNLDnQW5JW3
	 Gkq0ilv9VAlJ/ZQas0MoQjjgyoTZonO7vK5r/HMqHgrnSNOPInheXuU694Jg9FPtfv
	 pIfYCRwZsyGmPYW+w6+G789nzBgXd/7JDBbHkC134sD5xmzPrrGA4YjXVFB67LHhlh
	 YNRtwNrisSprnh/av5slh8r0QSzEmuPaImkWjzPFZD7zp/3UvkLWYg8Swjb97icOS8
	 yeBpUlVf64JUQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: map: add back asm/barrier.h inclusion
Date: Wed, 30 Jul 2025 15:59:24 +0200
Message-Id: <20250730135934.1712198-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

The mb() macro is used in this header:

In file included from include/linux/mtd/qinfo.h:5,
                 from include/linux/mtd/pfow.h:8,
                 from drivers/mtd/lpddr/lpddr_cmds.c:14:
include/linux/mtd/map.h: In function 'inline_map_write':
include/linux/mtd/map.h:428:9: error: implicit declaration of function 'mb' [-Wimplicit-function-declaration]

Fixes: 56eb7c13b97c ("mtd: map: Don't use "proxy" headers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/mtd/map.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 288ef765a44e..75b0b2abc880 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -14,6 +14,7 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
+#include <asm/barrier.h>
 
 struct device_node;
 struct module;
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
