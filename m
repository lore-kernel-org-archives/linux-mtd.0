Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905EEC4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:16:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AEF722D0A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AEF722D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y+QqK1+fPvNMGSCFtt83iHQbWOIhb9ZEffonNKYofh8=; b=JnOuHInns6ePOq0MSJwx6CXFt
	9RikkcnAzsufPAit2TIsk+mNF1elfoIrcTv/yduOWeljd95+h61zTXcQW59LW3LTFffqbhlEjmsgR
	jHroCSorphgh/uu5qgcM8jBQZTrIt2Mud6tyAyR7rCKs99vD3dhBHjnn6AFoObdLYRwH3xHHU1KWM
	hQMbV9KlpexTXaxa8fzhvLHb9ILuD1a+2eDzrSIE3yCd5IgrIzUf7YYYXUz8ctrbhr90uwCZUZXVD
	m84GLY1+52sNAOv0GgYzKZp8/EfDWkh1ki08MjEtWxSSyiweqCfkAUA7e9etZGoHRz1yAE8W0GdDj
	ov0aYosjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEUv-00068A-Hq; Mon, 07 Dec 2020 11:16:05 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEUs-00066x-GV
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 11:16:03 +0000
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id BDDB7200010;
 Mon,  7 Dec 2020 11:15:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace
 removal warning
Date: Mon,  7 Dec 2020 12:15:58 +0100
Message-Id: <20201207111558.9012-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201125072640.23516-1-Sergey.Semin@baikalelectronics.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 18b9c9403758ff68d93ee2f593096778d58e6f76
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_061602_714122_3685B89F 
X-CRM114-Status: GOOD (  12.11  )
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

On Wed, 2020-11-25 at 07:26:40 UTC, Serge Semin wrote:
> sparse is unhappy with us casting the __iomem address space pointer to
> a type with no address space attribute specified:
> 
> "sparse warnings: (new ones prefixed by >>)"
> >> drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast removes address space '__iomem' of expression
> 
> Indeed we perform the __iomem-less type casting but to an integer
> variable. The integer variable isn't dereferenced then, so the casting is
> safe and won't cause any problem. But in order to make sparse happy and
> keep the code coherent let's fix the warning by converting the local
> "shift" and "chunk" variables to the "unsigned int" type (since their
> value won't ever exceed three) and cast the __iomem-pointers to uintptr_t.
> Add the same fix to the bt1_rom_map_read() method for unification.
> 
> Fixes: b3e79e7682e0 ("mtd: physmap: Add Baikal-T1 physically mapped ROM support")
> Link: https://lore.kernel.org/lkml/202011021254.XC70BaQT-lkp@intel.com/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
