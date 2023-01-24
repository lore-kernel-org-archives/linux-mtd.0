Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD3C25B4E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Fhy7RZUKJJcMOqe9FBW6w5Q3IOc11cwxhVhCSlRiXQ=; b=ij/J+IGYixLY5v
	HbmoMy6XW5/u8FjmTP53EKIwYZPrYG2hRCeBoLt2qjB1obcO7ehpkRvHomT7W6M5D6GfwPPsXY0rM
	uRTQKg7i+0g03sJvkrTuXg8MdWZdRUgleijPLnKwfm15OAAt/PDvRh0wLLCds5J6gOYOKCMjchDns
	h1QnLOB7HuNaNgBAF9Z4In4es5DL+5dRCeAIVBuEEtmsyrvbzrpmPwYoOf7GMrQeMDOUqa7a2Nets
	jJJYp1ApnhmxK6jiemIB2p+LJGrtJuTSFCWnLNvMnBFj/SEvg5VksEY4ibAK17T0Rs0rfvXYY6FOe
	gaBFvz/H4JWBkT4ZLcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGUN-0037Nd-CZ; Tue, 24 Jan 2023 10:25:15 +0000
Received: from smtp-out-01.comm2000.it ([212.97.32.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGUK-0037LT-5i
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 10:25:13 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id 75F15844930;
	Tue, 24 Jan 2023 11:24:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1674555890;
	bh=DY29sEGIKlX9MUoJj6eAlirZSjuzVAzZZJRHEkgBgFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dNxNFjSguFRD+iVv4xuBGs6unCuju3qiWbC3esi+m/HGjciFG/SwfPyqTwgB9WWAd
	 eqytDTc/R4G7BO+FBUV1p58CRpV3tcd7w7CbelPnReGlZ0rOtINvnVQK4ySWHv8ddr
	 m8jIm1BmBlwBctckd/TdH4L/b0ikOrwnhr1+95vUuVgnoV1YSOYdn5N/bDjritlPdQ
	 RPIZPj81Scv18MHd52njmyWthGmSlI6lUPNdkppXZzlgigD5mDjAKywtLk1wQhl88v
	 /9kvJOnuHLTOgXWt+Et7AFlg++HcrBA4GZiGoFTjzHfwE05hY8oGLQJEnZOaBlHB6f
	 Xq+gGSJt4GjGQ==
Date: Tue, 24 Jan 2023 11:24:34 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	Tom Rini <trini@konsulko.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Message-ID: <Y8+x4gxW7kv6mBfu@francesco-nb.int.toradex.com>
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113184547.487322-2-francesco@dolcini.it>
 <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
 <Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
 <06279fe3-a3b3-f3c4-276f-7cd0d4773875@denx.de>
 <Y8WQsIHXEDuJJuLd@francesco-nb.int.toradex.com>
 <0584cc0e-eacb-ce71-0317-27d10264d3bf@denx.de>
 <20230123105610.38034a11@xps-13>
 <Y8+ZxTu05BEu5knS@francesco-nb.int.toradex.com>
 <20230124095815.21d01af8@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124095815.21d01af8@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_022512_368463_4DA72FA4 
X-CRM114-Status: GOOD (  32.12  )
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

On Tue, Jan 24, 2023 at 09:58:15AM +0100, Miquel Raynal wrote:
> francesco@dolcini.it wrote on Tue, 24 Jan 2023 09:41:41 +0100:
> > On Mon, Jan 23, 2023 at 10:56:10AM +0100, Miquel Raynal wrote:
> > > marex@denx.de wrote on Tue, 17 Jan 2023 01:59:54 +0100:
> > >   
> > > > On 1/16/23 19:00, Francesco Dolcini wrote:  
> > > > > On Mon, Jan 16, 2023 at 06:54:44PM +0100, Marek Vasut wrote:    
> > > > >> On 1/16/23 15:20, Francesco Dolcini wrote:    
> > > > >>> On Sun, Jan 15, 2023 at 03:35:25PM +0100, Marek Vasut wrote:    
> > > > >>>> On 1/13/23 19:45, Francesco Dolcini wrote:    
> > > > >>>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > >>>>>
> > > > >>>>> Fixup #size-cells value when updating the MTD partitions, this is
> > > > >>>>> required to prevent issues in case the MTD parent set #size-cells to
> > > > >>>>> zero.
> > > > >>>>> This could happen for example in the legacy case in which the partitions
> > > > >>>>> are created as direct child of the mtd node and that specific node has
> > > > >>>>> no children. Recent clean-up on Linux device tree files created a boot
> > > > >>>>> regression on colibri-imx7.
> > > > >>>>>
> > > > >>>>> This fixup has the limitation to assume 32-bit (#size-cells=1)
> > > > >>>>> addressing, therefore it will not work with device bigger than 4GiB.
> > > > >>>>>
> > > > >>>>> This change also enforce #address-cells to be the same as #size-cells,
> > > > >>>>> this was already silently enforced by fdt_node_set_part_info(), now this
> > > > >>>>> is checked explicitly and partition fixup will just fail in such case.
> > > > >>>>>
> > > > >>>>> In general board should not generally need nor use this functionality
> > > > >>>>> and should be just deprecated, passing mtdparts= in the kernel command
> > > > >>>>> line is the preferred way according to Linux MTD subsystem maintainer.  
> > > 
> > > Just to be clear, I'm perfectly fine with the partitions being either
> > > on the cmdline or in the DT without preference (well, the cmdline only
> > > works with the simple generic parser, but whatever). What I really
> > > meant is that tweaking the DT from U-Boot should be rare and in no case
> > > the "right thing to add partitions".  
> > 
> > Miquel, should I send a v2 to clarify the commit message or you do not
> > mind keeping it as it is?
> 
> I think it is worth mentioning, also adding Tom's remark:
> - Describing the partitions on the cmdline or in the DT is the right
>   thing to do.
> - Tweaking the DT to add static partitions should be forbidden.
> - In some rare legacy cases, dynamic changes to the partitions might be
>   tolerated.

Agreed, I'll wait a little bit sending a v2 to see how the discussion
progresses and to see if there are concerns on the actual code change.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
