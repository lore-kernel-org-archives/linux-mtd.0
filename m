Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78275C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 07:28:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD13E20665
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 07:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2zWxXl0o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD13E20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yaH7pp++US774/TnaucCxBwuVkynnIOa7v1zw/94NkM=; b=2zWxXl0oV75rNPXpHjjlGLaN1
	c1xJp+5iq3Oqc9NhOeeTrywcPQrwAuvKCNScQ6ftG3a/WsxNr/wyY+nRFvKfkhk6ZPujlHVTdzZ/d
	uc1VEFtoJP8bXrKSRY3/VhL87Ehm6vGnWdf6QjNISPkXxIIpe3ixkjYtyP6Mwvfp0iuBrswdZ6SJP
	W2ZOQm4N7MqzqK+Ym7RS3erNFk9Vl1FTPLVY8d7QidcWbAaKDh83yksr8kdnd9U2bqsgTF2vTAFaJ
	86dL1TzuIlvXV+9tba7Qt0HMQrHqZQBg/OjqqF1m8PUG7goYxh7cB1olgd7CwhaLDbXKK9Oranq+W
	/Cw7Wu5aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khpCn-0007ei-Ot; Wed, 25 Nov 2020 07:27:10 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khpCk-0007dk-BS
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 07:27:07 +0000
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2] mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace
 removal warning
Date: Wed, 25 Nov 2020 10:26:40 +0300
Message-ID: <20201125072640.23516-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201112180037.6754-1-Sergey.Semin@baikalelectronics.ru>
References: 
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_022706_559771_977BA582 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: kernel test robot <lkp@intel.com>,
 Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-mtd@lists.infradead.org,
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
safe and won't cause any problem. But in order to make sparse happy and
keep the code coherent let's fix the warning by converting the local
"shift" and "chunk" variables to the "unsigned int" type (since their
value won't ever exceed three) and cast the __iomem-pointers to uintptr_t.
Add the same fix to the bt1_rom_map_read() method for unification.

Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
Link: https://lore.kernel.org/lkml/202011021254.XC70BaQT-lkp@intel.com/
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>

---

Link: https://lore.kernel.org/lkml/20201120113929.0aff2f32@canb.auug.org.au/
Changelog v2:
- Cast the pointers to uintptr_t instead of unsiged int so not to
  cause the "cast from pointer to integer of different size" warning on
  64-bits platforms.
---
 drivers/mtd/maps/physmap-bt1-rom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap-bt1-rom.c b/drivers/mtd/maps/physmap-bt1-rom.c
index 27cfe1c63a2e..a35450002284 100644
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
+	shift = (uintptr_t)src & 0x3;
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
+	shift = (uintptr_t)src & 0x3;
 	if (shift) {
 		chunk = min_t(ssize_t, 4 - shift, len);
 		data = readl_relaxed(src - shift);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
