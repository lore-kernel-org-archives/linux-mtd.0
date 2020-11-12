Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E02C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 18:02:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B232068D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 18:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEmUVJyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B232068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vAxZoOXlSvlGkU/xSI1sRrBU6j65S7XRD01vvvGHpQQ=; b=DEmUVJyKbqR54W+8P1Z9qHlqXt
	K8op76vvjiu9Udws8nWYt9Quh3kymex52SJymUKJ/XxFPmnkLwq+R/bUTDnggbjIA0GTI/mXgMegZ
	DESEarXU8o7vGwC/LuwX3Z+j/CdYuHQXsRu5kB6k4TmwKmeme08kxmO+o8YW7HJy05a36CaHwNFfU
	hyWGBGcgfXoDxC1C8Ugw0bHaYEjDHbWSs5+iv6fgelFmJe/2B80zH3qSsg6esZo1FqsEWlOCXjJrA
	sxD8kLcbHJkONi6CSpFy3gMm21C5pCdw2TSIkndH43YJy/CFqkRHYwjognStrAoQjeJITs51F6IbW
	8dEUZxhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdGuS-0005nc-Ri; Thu, 12 Nov 2020 18:01:24 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdGuP-0005lu-NP
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 18:01:22 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 8D0848030802;
 Thu, 12 Nov 2020 18:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-wSVDMUJXmP; Thu, 12 Nov 2020 21:01:18 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace removal
 warning
Date: Thu, 12 Nov 2020 21:00:37 +0300
Message-ID: <20201112180037.6754-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_130121_929983_8FE7B220 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, linux-mtd@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

sparse is unhappy with us casting the __iomem address space pointer to
a type with no address space attribute specified:

"sparse warnings: (new ones prefixed by >>)"
>> drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast removes address space '__iomem' of expression

Indeed we perform the __iomem-less type casting but to an integer
variable. The integer variable isn't dereferenced then, so the casting is
safe and won't cause any problem. But in order to make sparse happy let's
fix the warning just by converting the local "shift" and "chunk" variables
to the "unsigned int" type. Add the same fix to the bt1_rom_map_read()
method for unification.

Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
Link: https://lore.kernel.org/lkml/202011021254.XC70BaQT-lkp@intel.com/
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
---
 drivers/mtd/maps/physmap-bt1-rom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
index 27cfe1c63a2e..b7fd5a3759d0 100644
--- a/drivers/mtd/maps/physmap-bt1-rom.c
+++ b/drivers/mtd/maps/physmap-bt1-rom.c
@@ -31,12 +31,12 @@ static map_word __xipram bt1_rom_map_read(struct map_info *map,
 					  unsigned long ofs)
 {
 	void __iomem *src = map->virt + ofs;
-	unsigned long shift;
+	unsigned int shift;
 	map_word ret;
 	u32 data;
 
 	/* Read data within offset dword. */
-	shift = (unsigned long)src & 0x3;
+	shift = (unsigned int)src & 0x3;
 	data = readl_relaxed(src - shift);
 	if (!shift) {
 		ret.x[0] = data;
@@ -60,7 +60,7 @@ static void __xipram bt1_rom_map_copy_from(struct map_info *map,
 					   ssize_t len)
 {
 	void __iomem *src = map->virt + from;
-	ssize_t shift, chunk;
+	unsigned int shift, chunk;
 	u32 data;
 
 	if (len <= 0 || from >= map->size)
@@ -75,7 +75,7 @@ static void __xipram bt1_rom_map_copy_from(struct map_info *map,
 	 * up into the next three stages: unaligned head, aligned body,
 	 * unaligned tail.
 	 */
-	shift = (ssize_t)src & 0x3;
+	shift = (unsigned int)src & 0x3;
 	if (shift) {
 		chunk = min_t(ssize_t, 4 - shift, len);
 		data = readl_relaxed(src - shift);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
