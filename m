Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IOWn6-0006TZ-9M
	for linux-mtd@lists.infradead.org; Fri, 24 Aug 2007 11:53:27 +0100
Date: Fri, 24 Aug 2007 06:43:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: [PATCH 09/30] mtd: Don't cast kmalloc() return value in
	drivers/mtd/maps/pmcmsp-flash.c
In-Reply-To: <200708241141.06358.vda.linux@googlemail.com>
Message-ID: <Pine.LNX.4.64.0708240642500.18301@localhost.localdomain>
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
	<5ebfb93eca0dd43cf17876e643079cbcfeb3111c.1187912217.git.jesper.juhl@gmail.com>
	<200708241141.06358.vda.linux@googlemail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>, Jesper Juhl <jesper.juhl@gmail.com>,
	linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Aug 2007, Denys Vlasenko wrote:

> On Friday 24 August 2007 00:52, Jesper Juhl wrote:
> > kmalloc() returns a void pointer.
> > No need to cast it.
>
> > -	msp_flash = (struct mtd_info **)kmalloc(
> > -			fcnt * sizeof(struct map_info *), GFP_KERNEL);
> > -	msp_parts = (struct mtd_partition **)kmalloc(
> > -			fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> > -	msp_maps = (struct map_info *)kmalloc(
> > -			fcnt * sizeof(struct mtd_info), GFP_KERNEL);
> > +	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
> > +	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
> > +	msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
> >  	memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));
>
> This one wants kzalloc.
>
> > -		msp_parts[i] = (struct mtd_partition *)kmalloc(
> > -			pcnt * sizeof(struct mtd_partition), GFP_KERNEL);
> > +		msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
> > +			GFP_KERNEL);
> >  		memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
> >
> >  		/* now initialize the devices proper */
>
> Same

actually, i would think kcalloc would be more appropriate here, no?

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
