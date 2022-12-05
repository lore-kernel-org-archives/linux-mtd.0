Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AACC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDqHqw8tp7lp2P/E/jha2414RVI/wneq0Zugbrv9ZFM=; b=HJMWpcxoML+7VN
	WJspBO6CmsjtYQvEAMZUCnIt7g6+KPbYLYUgBOqfCACgNC6fq75wqVUV0OD7qvBG+vZycCaH0wjFe
	L9vqRRNxXGK3z7n2i2QEhZno1Lb8GSF5S8QX4kzyHFTVPvICLsQmKgdKgVwNymqMjuxPzepbWWIDW
	SYLsWiVQ1cSP521y5tPhLSHRSoMh0njUkjmuR5BfaGj0FhPhysIk6wa5AwoNL+G4yU4RI3X6Wav4k
	MH/IyI0bvXfSxZywg0xQpFEjZXXPFb8sVZ4KjzwNlpHmXD04DFPTU/q1IqApzBH0DaYkEmm961zUb
	lY+bcXeEWQzoPcFuEE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29cw-001dtD-Ef; Mon, 05 Dec 2022 11:27:14 +0000
Received: from smtp-out-07.comm2000.it ([212.97.32.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p29cj-001dd6-T4; Mon, 05 Dec 2022 11:27:04 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-07.comm2000.it (Postfix) with ESMTPSA id 04B633C2104;
	Mon,  5 Dec 2022 12:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670239612;
	bh=T5iUgqLM5/wTl1bWy1r9VQ72eZ+xJCXi7OjAOJZLSnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJSptKx3by6D7wAt+PgUu1Zi/Hmuo16Cpn5Yr8io+VGfuAVwzAxZ3fGCeG+XscN4U
	 KVBM+qNDjWoBjjF9BOpXet8hlQmnV3l9Q1umhpFEYiY8BLeON7xn99fJAjjOrIK7dB
	 JaE8o5dYiAddCRYqUi2N1a7YwNgChD5ANyk6yshdjpRZgSMjgRw1iI8xZl/50U4XD9
	 IA1nHrULn1lUHlqdlTzXkhhc8zC9Y5i1OrsXS3dwvyeDUk016Zm6UUzegTH2lGFPnP
	 tD7swS4nDZHnyb8SjSJxhAJoHjr3X49unF7SbXOYKS8L+h2jgnFQDUVNyKUHbrcIRL
	 VVtdZoIFqidRA==
Date: Mon, 5 Dec 2022 12:26:44 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y43VdPftDbq6cD2L@francesco-nb.int.toradex.com>
References: <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
 <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
 <20221202174255.2c1cb2ff@xps-13>
 <e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
 <20221202175730.231d75d5@xps-13>
 <7afd364c-33b8-38a9-65a6-015b4360db6b@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7afd364c-33b8-38a9-65a6-015b4360db6b@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_032702_922694_37E0B466 
X-CRM114-Status: GOOD (  15.59  )
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

On Fri, Dec 02, 2022 at 06:08:22PM +0100, Marek Vasut wrote:
> But here I would say this is a firmware bug and it might have to be handled
> like a firmware bug, i.e. with fixup in the partition parser. I seem to be
> changing my opinion here again.

I was thinking at this over the weekend, and I came to the following
ideas:

 - we need some improvement on the fixup we already have in the
   partition parser. We cannot ignore the fdt produced by U-Boot - as
   bad as it is.
 - the proposed fixup is fine for the immediate need, but it is
   not going to be enough to cover the general issue with the U-Boot
   generated partitions. U-Boot might keep generating partitions as direct
   child of the nand controller even when a partitions{} node is
   available. In this case the current parser just fails since it looks
   only into it and it will find it empty.
 - the current U-Boot only handle partitions{} as a direct child of the
   nand-controller, the nand-chip is ignored. This is not the way it is
   supposed to work. U-Boot code would need to be improved.

With all of that said I think that Miquel is right

> When a patch breaks a board and there is no straight fix, you revert
> it, then you think harder. That's what I am saying. This is a temporary
> solution.

?

Francesco



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
