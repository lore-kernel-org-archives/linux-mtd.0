Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAC0C43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 08:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 375A42184C
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 08:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZDwRf7Jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 375A42184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e+40G/YkJW2ZQ2BxtOZmGbO5u/R5kfw3UZFNFAShcyc=; b=ZDwRf7JvZt3+3h
	5XbJsJa7bfl/OlhfUwJymEy+sbaWZPVMu9pInZZGQKgi62kBJEqre7rxvI4sKUfTAIvSlSPtrgegh
	z32pDF/vu+2lUTs/pgVi8xa4WvzjZzcCM9i2FE/oOwi1LlFJgjaHFKRqz2ZEFGziZ96NcdWVJPZWV
	KIRTXxzKQiTjS4eFYO8wkCBCQg3HkruuD3B3RxgZB3J6IyXAbaMOLFgp9RQh6vMwldQXwG6Kdy+p2
	8utHZBGSVsgPzoOhL8aFrdHxqDB6ydPjywc++7zol6jZN5A6v5eWTD1IGAIIdi5JIZ/mdGuQYX/Ar
	X+8YDN5jiBpdM4XtMu5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA9Mv-0004Po-QW; Sat, 30 Mar 2019 08:29:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA9Ms-0004PI-DR
 for linux-mtd@lists.infradead.org; Sat, 30 Mar 2019 08:29:36 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EED1D284180;
 Sat, 30 Mar 2019 08:29:28 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Remove my name from the MTD and NAND entries
Date: Sat, 30 Mar 2019 09:29:25 +0100
Message-Id: <20190330082925.2362-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_012934_587040_7F511B78 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I am less and less active on the MTD/NAND fronts, and I don't think
it will get any better in the future. Let's remove my name so that
people don't expect me to review/merge their patches.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Hello,

After 3 years as a maintainer of the MTD and NAND subsystems I think
it's time for me to hand the torch to someone else. Not because I'm
tired of doing it, but because I don't have the necessary time to do
it correctly and I think it's unfair to keep my position and impose
the extra review/merge latency to contributors.

I hope I served the community well during those three years (I know
things have not been perfect, but I think it worked reasonably well)
and would like to wish good luck to the people that will take over my
responsibilities (most likely Miquel and/or Richart at first).
Anyway, I'll stay around and will help getting things in place during
the transition, so, if you want my opinion or review on something don't
hesitate to Cc me.

Regards,

Boris
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..9e099f2cbdf9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9997,7 +9997,6 @@ F:	mm/
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	David Woodhouse <dwmw2@infradead.org>
 M:	Brian Norris <computersforpeace@gmail.com>
-M:	Boris Brezillon <bbrezillon@kernel.org>
 M:	Marek Vasut <marek.vasut@gmail.com>
 M:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
@@ -10611,7 +10610,6 @@ S:	Supported
 F:	drivers/net/ethernet/myricom/myri10ge/
 
 NAND FLASH SUBSYSTEM
-M:	Boris Brezillon <bbrezillon@kernel.org>
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 R:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
