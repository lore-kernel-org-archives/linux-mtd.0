Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CC3C43217
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ko0ZES1Kw31VJF0kZBkpkWKrNJ7mkd2MBpkdhoKOBe4=; b=lsZ6TQbyUQnjWu
	swnOSx897JWq6EWhGqTNQeOSpnMcZCjQfCAITE15f7MWQt6TC+CRlfAmm9+fpWoAbjlfnTqpNDHJZ
	LqRUzRRtslV5JGTTNXGMMVG+sQoDGuqCf8foSvNZcYFmmqAYZROrQHIFj0jOaV6RUn+hJdXMni1sx
	tA1iVWhdV3amc2wxTp1hodOU+zZV1J6rEhSN2Rzc5l8zjqLC+gD7w2hbxVZCaSLF/wtWpcGeKH8Lx
	axFX37/KSC2L9iH9ddazwUQDZjr26JbJOcsow9jfCBpDaOnpV4v/pe9bd/TREDTaAVlauvinChJA8
	MSGw//OlJMCvHgOdNDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0llk-008KYX-58; Thu, 01 Dec 2022 15:46:36 +0000
Received: from smtp-out-03.comm2000.it ([212.97.32.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0llW-008KU3-Vp; Thu, 01 Dec 2022 15:46:25 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id 10EDAB4ADB8;
	Thu,  1 Dec 2022 16:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1669909578;
	bh=MpoeK/SVoG4QpF0S5JGnpX9gBKGENx9957gTXLHgZpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pLs+K9RJaACcee8bsgicL0FTI1HERRpymVb828paH+hJDTf2GOxGGBVLqa3515BxJ
	 Hov/Zjv/4xC/tUcmXiy/X+qkTerfOjHHG8yn4e9hJPQs6RffRcGlE0BPx4MxxP38XE
	 IOp2l8MnOB74JsdWSZ3NcleHfXSASMzFNYQEMSKjGX0+v7Mb3HW0nXYVIGBDgCwRi6
	 axSeO71hcPTsiY4V8mdmbP2wl4Qgx77s1vPtIp8bwBECdweO4Wj/s5UHWt37OkQR8H
	 53uEBjwpFyB1HbrddlzM0bDWKQ6TUlE/LhgutLsWkzk0MjSq8d79SMyWgDaO0v9rOZ
	 uJyzCD8opB46w==
Date: Thu, 1 Dec 2022 16:45:53 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, u-boot@lists.denx.de
Subject: Re: Boot failure regression on 6.0.10 stable kernel on iMX7
Message-ID: <Y4jMMeyktJLHb9ji@francesco-nb.int.toradex.com>
References: <Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com>
 <12f7fbb7-8252-4520-89c2-c5138931a696@denx.de>
 <Y4fCZmjDMtMMyu+E@francesco-nb.int.toradex.com>
 <fef2598e-e5fc-c4fc-0530-2d3c380ed39a@denx.de>
 <Y4iKAUav9ktuxncE@francesco-nb.int.toradex.com>
 <b5080dd6-40b3-a8f2-0c4e-4c1e52e67fe8@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5080dd6-40b3-a8f2-0c4e-4c1e52e67fe8@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_074623_492242_38A1984B 
X-CRM114-Status: GOOD (  36.65  )
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

+ u-boot list

On Thu, Dec 01, 2022 at 12:25:34PM +0100, Marek Vasut wrote:
> On 12/1/22 12:03, Francesco Dolcini wrote:
> > On Wed, Nov 30, 2022 at 11:59:04PM +0100, Marek Vasut wrote:
> > > On 11/30/22 21:51, Francesco Dolcini wrote:
> > > > On Wed, Nov 30, 2022 at 03:41:13PM +0100, Marek Vasut wrote:
> > > > > On 11/30/22 14:52, Francesco Dolcini wrote:
> > > > > > [    0.000000] Booting Linux on physical CPU 0x0
> > > > > > [    0.000000] Linux version 6.0.10 (francesco@francesco-nb) (arm-linux-gnueabihf-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.
> > > > > > 4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #36 SMP Wed Nov 30 14:07:15 CET 2022
> > > > > > ...
> > > > > > [    4.407499] gpmi-nand: error parsing ofpart partition /soc/nand-controller@33002000/partition@0 (/soc/nand-controller
> > > > > > @33002000)
> > > > > > [    4.438401] gpmi-nand 33002000.nand-controller: driver registered.
> > > > > > ...
> > > > > > [    5.933906] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0): error -19
> > > > > > [    5.946504] Please append a correct "root=" boot option; here are the available partitions:
> > > > > > ...
> > > > > > 
> > > > > > Any idea? I'm not familiar with the gpmi-nand driver and I would just revert it, but
> > > > > > maybe you have a better idea.
> > > > > 
> > > > ...
> > > > OF partition are created by U-Boot from
> > > >     mtdparts=mtdparts=gpmi-nand:512k(mx7-bcb),1536k(u-boot1)ro,1536k(u-boot2)ro,512k(u-boot-env),-(ubi)
> > > > env variables calling fdt_fixup_mtdparts from colibri_imx7.c
> > > > 
> > > > This is generated by U-Boot, I would need to dump what he did generate
> > > > from the standard fdt_fixup_mtdparts(). I will try to do it tomorrow
> > > > unless what I wrote here is already enough to understand what's going
> > > > on.
> > > 
> > > Oh drat ... I see. It's the u-boot fdt_node_set_part_info() which checks the
> > > current NAND controller #size-cells and uses that when generating MTD
> > > partitions 'reg' properties. Since #size-cells is now zero, the reg
> > > properties would be malformed.
> > 
> > I think the issue is slightly different, the u-boot code checks it and
> > if not set it defaults to #size-cells = <1>. Said that u-boot
> > never set #size-cells anywhere.
> 
> Which it really should, can you send a patch there too ?

I guess that it is slightly more complicated.

U-Boot directly updates the nand-controller root node with the
partitions, unless there is already a partitions child node present. In
the first case (legacy OF partition definition) setting the #size-cells
does not seems that correct, while in the second case I agree it should
really do it. I'll see what I can come-up with.

> > diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> > index 192190c42fc8..fffd60acd926 100644
> > --- a/drivers/mtd/parsers/ofpart_core.c
> > +++ b/drivers/mtd/parsers/ofpart_core.c
> > @@ -122,6 +122,8 @@ static int parse_fixed_partitions(struct mtd_info *master,
> > 
> >                  a_cells = of_n_addr_cells(pp);
> >                  s_cells = of_n_size_cells(pp);
> > +               if (s_cells == 0)
> > +                       s_cells = 1; // for backward compatibility
> >                  if (len / 4 != a_cells + s_cells) {
> >                          pr_debug("%s: ofpart partition %pOF (%pOF) error parsing reg property.\n",
> >                                   master->name, pp,
> 
> You might want to print a warning too, so users would fix their DTs, since
> once there is MTD partition > 4 GiB, this would break. Otherwise I like this
> option.

I tested it and it's working as expected, I'll send a proper patch soon.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
