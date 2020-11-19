Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832E9C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:07:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D2C4223BE
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTwX5/r0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D2C4223BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TVjUiPVhrdQW6WUTr8T2ezwXWaXegz7Bq3DoAVzL9ek=; b=bTwX5/r0sFGEgEcQz2O1EikKU
	iBAlrZQ3M2EYl2FCUVuHXg9PNZvjpXVu6dUBI//cL7t/konJBUTh5eS95ZXw9SA/Jdno795SyOCXs
	bNmvPookbBlHEyxhyApWbAD8Ti2EGZYwsTmiYZ3Q7mIYiDiUaxMR5MosbcQ1b65NOv0PObzIJ8bB5
	67maVS0IiziffQKjOCtQLc56Jgp2wUKZtrHPJxG70Lvzhp4fHEl6SZNUXxLDzunbZyE8Q8r3jA59H
	KkLCsETUJ8Z5u1Pk7nKZBjPk90Lf3cS0uLC52AavT2CBFcJpjdjIqnHKPLLWB2fJN1ICFrFz1xxxx
	Fmxh7iEmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfr92-0001Xe-Og; Thu, 19 Nov 2020 21:07:08 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr8z-0001Vj-MN
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:07:06 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6AB42E0006;
 Thu, 19 Nov 2020 21:07:02 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace
 removal warning
Date: Thu, 19 Nov 2020 22:07:01 +0100
Message-Id: <20201119210701.24856-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112180037.6754-1-Sergey.Semin@baikalelectronics.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 0bf23a17d54fb09bea4dd3ecaee6c2d81d7dd965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160705_894703_5CA269A7 
X-CRM114-Status: GOOD (  11.26  )
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
 linux-mtd@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-12 at 18:00:37 UTC, Serge Semin wrote:
> sparse is unhappy with us casting the __iomem address space pointer to
> a type with no address space attribute specified:
> 
> "sparse warnings: (new ones prefixed by >>)"
> >> drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast removes address space '__iomem' of expression
> 
> Indeed we perform the __iomem-less type casting but to an integer
> variable. The integer variable isn't dereferenced then, so the casting is
> safe and won't cause any problem. But in order to make sparse happy let's
> fix the warning just by converting the local "shift" and "chunk" variables
> to the "unsigned int" type. Add the same fix to the bt1_rom_map_read()
> method for unification.
> 
> Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
> Link: https://lore.kernel.org/lkml/202011021254.XC70BaQT-lkp@intel.com/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
