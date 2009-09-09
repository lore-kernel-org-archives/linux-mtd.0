Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlK6y-0007EE-Sw
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 10:09:16 +0000
Date: Wed, 9 Sep 2009 06:09:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: mismatch in MTD Kconfig variables
In-Reply-To: <4AA7530F.3080401@gmail.com>
Message-ID: <alpine.LFD.2.00.0909090608240.17301@localhost>
References: <alpine.LFD.2.00.0909081448280.11685@localhost>
	<4AA7530F.3080401@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 9 Sep 2009, Artem Bityutskiy wrote:

> On 09/08/2009 09:49 PM, Robert P. J. Day wrote:
> >
> >    result of latest kernel tree scan:
> >
> > $ grep -r MTD_DATAFLASH.*VERIFY  drivers
> > drivers/mtd/devices/mtd_dataflash.c:#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
> > drivers/mtd/devices/mtd_dataflash.c:#endif	/*
> > CONFIG_MTD_DATAFLASH_VERIFY_WRITE */
> > drivers/mtd/devices/Kconfig:config MTD_DATAFLASH_WRITE_VERIFY
> > $
>
> So you have a patch to fix this?

  as long as someone else confirms that, yes, it's just a typo and
those two variables should match, then yes, i can have a patch in
short order.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
