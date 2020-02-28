Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7410AC3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 13:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42FD6246B2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 13:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwTrh4ZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42FD6246B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJwXkioMSRbw71l5/xR3cB7AxLSscblsju26rBMnfCs=; b=kwTrh4ZCqXWeYy
	fu9m63Sy68PxMEp42KYtCWtt19vZkJn/YuydfJodkwfyUr/JgO8LdSauZvK09zB5Nb9Hj/3cw3ZmP
	4IKtitHWsV/fAk0eZIajXDxgME7OWa3PTfmaD0AxHm43wxyMtVNVrpIMe0NAf9xdzNnz123pUDzs7
	sm+aIldYQLls5wV6lORYl+/2aFCV/x+PV+kuxWROkTEJbrTKL0hl05UMCPhMTKnZuLcQIyipE0x0y
	WN48QE9uGEf83UdQT2b/vHad+EvW6EdWdLa0O/ubk/pMZhprYAfxX8LgLPb8CwIhQa20NbslRZ5xa
	sTKyJlMC2+843tD4GPDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7fYQ-0003ub-Cw; Fri, 28 Feb 2020 13:19:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7fYN-0003tj-T8
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 13:19:45 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B0434296B9F;
 Fri, 28 Feb 2020 13:19:40 +0000 (GMT)
Date: Fri, 28 Feb 2020 14:18:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 06/11] mtd: spi-nor: add support for DTR protocol
Message-ID: <20200228141814.633c7195@collabora.com>
In-Reply-To: <20200228120750.hstohetdnqja2g2p@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-7-p.yadav@ti.com>
 <20200227175841.51435e3f@collabora.com>
 <20200228093658.zc3uifqg4zruokq3@ti.com>
 <20200228115355.5033798f@collabora.com>
 <20200228120750.hstohetdnqja2g2p@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_051944_075971_AB4EE1F8 
X-CRM114-Status: GOOD (  22.67  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 28 Feb 2020 17:37:50 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

 
> > Isn't there an EXIT sequence that allows NORs to return to a single 
> > SPI state?  
> 
> Yes there is, but it comes with a lot of strings attached. There is a 
> hardware reset pin on some flashes that puts the flash in Power-on-Reset 
> (POR) mode. But that pin is not mandatory. It also might not be 
> connected on a given board.
> 
> The other option is a "Soft Reset" (also optional), which puts the flash 
> in POR mode after it is given the soft reset command. But to send the 
> command you need to know the mode the device is in. On top of that, the 
> Soft Reset opcode differs between flashes. According to the xSPI spec, 
> some flashes can have the opcode as 0xF0 and some others can have it as 
> a two command sequence of 0x66 and 0x99.
> 
> And the cherry on top is the fact that these reset operations return to 
> a state based on the value of the non-volatile bits. So, if the 
> non-volatile configuration is 8D-8D-8D mode, then all these resets 
> achieve nothing.

Looks like flash vendors don't learn from their mistakes, they keep
adding more features without really thinking about backward
compatibility :-(.

> >   
> > > 
> > >     So, the only solution I can now think of is having the flash name in 
> > >     its compatible string in the device tree. This way we can skip all 
> > >     the Read ID ugliness and can have flash-specific hooks to make it 
> > >     easier to detect the mode it is in (though I wonder if it is even 
> > >     possible to detect the mode in a flash that doesn't have SFDP in 
> > >     8D-8D-8D).  
> > 
> > Hm, I'd really like to avoid that if possible.  
> 
> Unfortunately, I don't really see a better alternative. Just so I 
> understand this better, why do you think it is something worth avoiding?

There are 2 main reasons:

1/ board manufacturers usually source their flashes from different
vendors so they're not tied to one of them. That means you can't really
make the compatible too specific or you'd have to deal with DT variants
(one variant per-flash).

2/ I feel like once we start accepting specific compats, people will
try to abuse it and decide that they need one for their flash too,
before even trying to see if there's not a different way to detect the
flash.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
