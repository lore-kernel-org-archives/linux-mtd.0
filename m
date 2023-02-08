Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493F3C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRu/b3GLcUCPt8SmC3OrPUwJeqAKwU3skpR+Ayi8Qe8=; b=rZxVVOwkT8CfwW
	FQzvmJnc4htMn9FBPSxM4m5FOcfqF+5lCbpx6tfOcIs+Bv7VOlgQeBMs/POGwYNP+tKB4c55tAAie
	mRlHGJohZMjC/F7Rj2c2jgNB0gd8QEP1aUHT4y+HfRktX//8luKitKNru2SuvEGaPaBLktxFg3nAU
	nc3JZnaqB5d6kKpqo1n3U8BYl45U4k0WecROLcEfGZQKQ0DY/h3fIAsuJS14if/ozjzaTX2f3cAj2
	wnLX3MMw1DxorxS9MIJINUBnS3v36bGg2mJes6MQLd+whBTZU2saHuPA4GyHt/d4aCMFUOZwlaEru
	P6sTCjWc2FBuHlp0nnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlmD-00Fxgk-PX; Wed, 08 Feb 2023 14:50:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlmB-00Fxg9-Is
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 14:50:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 273FA616CC;
	Wed,  8 Feb 2023 14:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026F9C433D2;
	Wed,  8 Feb 2023 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675867822;
	bh=m5QL9wztspwk9ruYxx8Ax1G0XbtJWwi/fFephgmEwvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdhpgef8oOvQVk0BGrBAo912jU76isaPpPLd3z3V7j6xpKJ2DWSFB+Vm0CoF/eFIf
	 NGFXMO5kSKjv0n9Sb0SHRuIg2IiazBbOIxTrUPmKVkF2vLIs6wKTT3irqo9lfDi4NW
	 g5OwWc4Ujq1N9zEv8NyPRvV63Hdqgw30MNOWdUD8=
Date: Wed, 8 Feb 2023 15:50:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, stable <stable@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <Y+O2q1BnuqCRNYeD@kroah.com>
References: <20230208125758.1515806-1-gregkh@linuxfoundation.org>
 <69fbf8b55dcb9c5c0a1a5d59b2248670@walle.cc>
 <Y+Ot0FXLgrSoLy7Q@kroah.com>
 <e9c24836696de76959bbf808b2a90863@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9c24836696de76959bbf808b2a90863@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_065023_717707_57935BED 
X-CRM114-Status: GOOD (  28.75  )
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

On Wed, Feb 08, 2023 at 03:24:31PM +0100, Michael Walle wrote:
> Am 2023-02-08 15:12, schrieb Greg Kroah-Hartman:
> > On Wed, Feb 08, 2023 at 02:36:23PM +0100, Michael Walle wrote:
> > > Am 2023-02-08 13:57, schrieb Greg Kroah-Hartman:
> > > > When calling debugfs_lookup() the result must have dput() called on it,
> > > > otherwise the memory will leak over time.
> > > >
> > > > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > > > Cc: Pratyush Yadav <pratyush@kernel.org>
> > > > Cc: Michael Walle <michael@walle.cc>
> > > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > Cc: Richard Weinberger <richard@nod.at>
> > > > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > > > Cc: linux-mtd@lists.infradead.org
> > > > Cc: stable <stable@kernel.org>
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > > v2: fix up to work when module is removed and added, making the fix
> > > >     much simpler.
> > > >
> > > >  drivers/mtd/spi-nor/debugfs.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/mtd/spi-nor/debugfs.c
> > > > b/drivers/mtd/spi-nor/debugfs.c
> > > > index ff895f6758ea..af41fbc09a97 100644
> > > > --- a/drivers/mtd/spi-nor/debugfs.c
> > > > +++ b/drivers/mtd/spi-nor/debugfs.c
> > > > @@ -242,6 +242,7 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
> > > >
> > > >  	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
> > > >  	nor->debugfs_root = d;
> > > > +	dput(rootdir);
> > > 
> > > rootdir might either be the return value of debugfs_lookup() or
> > > debugfs_create_dir(). dput() is probably wrong for the latter,
> > > right? Also there is an early return, where the dput() is missing,
> > > too.
> > 
> > {sigh}
> > 
> > Yeah, this is all wrong, sorry.  Let me fix this up again, properly.
> > And to do it properly, let's have the module remove the directory if it
> > is unloaded, like a good module should :)
> 
> There were some complications. IIRC you'd need to do reference counting,
> to determine whether you are the last user of the rootdir. Other subsys
> create an empty rootdir in their .init(). But that was hard to do in MTD.
> Again memory is hazy.. Therefore, I resorted to create it on the fly if
> there isn't already one.
> 
> Maybe you got some better/simpler idea :)

Yup, just do it normally like other drivers, I'll send a v3 now.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
