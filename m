Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE89C4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 02:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3633206B7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 02:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K1m9Gmzd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="xdEsreoz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3633206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zOxjy4LbdILFisGr4EceOupQGoIVdA7NNfCkZtDYAI=; b=K1m9GmzdDB97Ak
	E/46Okttz8bjQgFjv2VRajEYs/YSGfYARn/DX++KHX4OvDocp2HlMSYCXGGKpXaSV+Q/kt3QJBs0k
	Q2SU5zytptMnQ9Y9169/MMOZ//u+28nme0xpY0onkfQIFWCXJSRrwatgWVYmFlB9MmN+QS5fvL8YL
	lBPJU+uLRgW110Qc1uYEv9hq7aoDjOgeuS37o8eU3SubP6sIusMXV1xj5dQbthBJj7KDJJAFn0HGM
	6CDTJGWaJvs0jvqJBDp/LhBgCzAoivfUQJOCxChQPgmEVUH9Vcy/ibt2IKpisL6VE9Hidb+8T7LW8
	WaLon1e6FjHmlReJHFlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBVF3-0000Lz-8d; Wed, 03 Apr 2019 02:03:05 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBVEz-0000Kb-Vn
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 02:03:03 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B330E891AC;
 Wed,  3 Apr 2019 15:02:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1554256969;
 bh=8MqUdDV3wuxihxDbnF1UPslcnC0z3vg1faWfT8YNfyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=xdEsreozd90tILKjT538IoZpnViDq/hqyuwYHE1k63F0jWwaXdgB/0u/gX8F6boZI
 e4N1TEmAdsvvd9R4gGOquhcYGzJvepXR1AgXcF7w/3HYobv5C/kcaqTbO/wBew88la
 jro1kl9g+kluYbEwJCbRhzhhKiWWc0ztVt0ZAQdS6ZO9CU5PDXqm+7mmLrQMl93VlQ
 anRsTFen5HHhSzYpScZQ/1N8tu1Ha13X/CY44Ov96J8UVxLf7scbsesWDQhlHRUGZ8
 b+Y0XkYx3FysLQZ9UCAtzb1klLtGsVtt4q2W9J7mQjpTawO1B8yO8Iisjy73QgIR/V
 SGeEDWDYSbFNQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5ca4144a0000>; Wed, 03 Apr 2019 15:02:50 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 9B40013EC40;
 Wed,  3 Apr 2019 15:02:49 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 750031E0893; Wed,  3 Apr 2019 15:02:49 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org,
 marek.vasut@gmail.com, richard@nod.at
Subject: [PATCH] mtd: maps: Allow MTD_PHYSMAP with MTD_RAM
Date: Wed,  3 Apr 2019 15:02:40 +1300
Message-Id: <20190403020240.10764-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <10efc9a0980f4bc2b06b4149d9a4ff90@svr-chch-ex1.atlnz.lc>
References: <10efc9a0980f4bc2b06b4149d9a4ff90@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_190302_216012_B973B58B 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When the physmap_of_core.c code was merged into physmap-core.c the
ability to use MTD_PHYSMAP_OF with only MTD_RAM selected was lost.
Restore this by adding MTD_RAM to the dependencies of MTD_PHYSMAP.

Fixes: commit 642b1e8dbed7 ("mtd: maps: Merge physmap_of.c into physmap-core.c")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 drivers/mtd/maps/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index e0cf869c8544..544ed1931843 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -10,7 +10,7 @@ config MTD_COMPLEX_MAPPINGS
 
 config MTD_PHYSMAP
 	tristate "Flash device in physical memory map"
-	depends on MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_LPDDR
+	depends on MTD_CFI || MTD_JEDECPROBE || MTD_ROM || MTD_RAM || MTD_LPDDR
 	help
 	  This provides a 'mapping' driver which allows the NOR Flash and
 	  ROM driver code to communicate with chips which are mapped
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
