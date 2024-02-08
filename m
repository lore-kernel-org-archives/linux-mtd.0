Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4566C48260
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Feb 2024 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vzcSttHkqgXuM0UYgWoWaD+dMr1n27ed+9xBUwq7OTY=; b=Mp/uDVJJumFWu7
	uSzhbWohpnSknsxLfP/NZ7x96FS1NSDA4AYdtz7zCHGgzToWrMgB9oF3ICK1Zj4WXI85Tc10khtN1
	rSkr2Qrpt338caEaZQq7FvsN8VEa1nEQUB87i20Qxchx4OTxiMEDPSzh4JR1SCvP2odUlwd40RPiF
	G/Odbp7KAOro1C3aO7+QzhDsx2GT9CERKdfu4TZV8M+49YPgZEaAD+/j8FOcrfNlTBlc2tHF77rz4
	HJkQTwjUIKU0nTeC1bpganAwOWtzwLtdEX3V2A40aUusP3tv/RBCzC0TPBM5eR+d17+HOrUL4FQZF
	IJLlhVOxPQmabVKoZNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY1jv-0000000DNZV-3YGA;
	Thu, 08 Feb 2024 10:34:43 +0000
Received: from hours.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY1jr-0000000DNWT-265O
	for linux-mtd@lists.infradead.org;
	Thu, 08 Feb 2024 10:34:41 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 0C6A1440845;
	Thu,  8 Feb 2024 12:34:02 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707388442;
	bh=7MnagXtg2z0/24kmKnqJUzaIdXtEvTQnZq3B9mcsi4o=;
	h=From:To:Cc:Subject:Date:From;
	b=krO/MZraSCkOVw4uGvWyiLF2L3NQ61O3kYc/JUr78iXSchZDV2k16/tswMERPnPuz
	 IaRx1Wh/KugZowVpEMBkXYzP6vrbXmU8K/l6SV2215y2x0qq7AoaB4Yl2ALRrCExqA
	 lbKKAhoiFIehPw2+74Fvl3ObD6AQ5spruOWK0WCcnlmHOu1lWPG2Ij3XOrLlAE9m8C
	 hSRlV73m8m1CMljtvsae9n2BYgVz/VgCB6k6SA2wE3raPqhfeRT7JMyu5gl1pfXufy
	 s8WaspVHAxWHRIl91lWaYzDwHlHi8Wr4iw55VAX9RZi8hIwxIQFEUIpCHc0rXcPPHH
	 ExOhtA6PdSEkA==
From: Baruch Siach <baruch@tkos.co.il>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] mtd: maps: physmap-core: fix flash size larger than 32-bit
Date: Thu,  8 Feb 2024 12:34:18 +0200
Message-ID: <9fbf3664ce00f8b07867f1011834015f21d162a5.1707388458.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_023440_087820_29CA5A7D 
X-CRM114-Status: GOOD (  10.51  )
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

mtd-ram can potentially be larger than 4GB. get_bitmask_order() uses
fls() that is not guaranteed to work with values larger than 32-bit.
Specifically on aarch64 fls() returns 0 when all 32 LSB bits are clear.
Use fls64() instead.

Fixes: ba32ce95cbd987 ("mtd: maps: Merge gpio-addr-flash.c into physmap-core.c")
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/maps/physmap-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 746a27d15d44..96eb2e782c38 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -518,7 +518,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 		if (!info->maps[i].phys)
 			info->maps[i].phys = res->start;
 
-		info->win_order = get_bitmask_order(resource_size(res)) - 1;
+		info->win_order = fls64(resource_size(res)) - 1;
 		info->maps[i].size = BIT(info->win_order +
 					 (info->gpios ?
 					  info->gpios->ndescs : 0));
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
