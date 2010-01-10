Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NTvU7-0003Ty-Ge
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 10:57:31 +0000
Date: Sun, 10 Jan 2010 05:56:40 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: what's with CONFIG_MTD_PISMO?
In-Reply-To: <1263114340.7315.135.camel@localhost.localdomain>
Message-ID: <alpine.LFD.2.00.1001100555580.7717@localhost>
References: <alpine.LFD.2.00.1001030716270.13494@localhost>
	<1263114340.7315.135.camel@localhost.localdomain>
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

On Sun, 10 Jan 2010, Artem Bityutskiy wrote:

> On Sun, 2010-01-03 at 07:18 -0500, Robert P. J. Day wrote:
> > at the moment, there is a Makefile reference to a non-existent
> > Kconfig variable:
> >
> > ./drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_PISMO)    += pismo.o
> >
> >   but there is no definition of Kconfig variable MTD_PISMO.  should
> > this be defined in a Kconfig file somewhere?
>
> Yeah, the driver and Kconfig part were forgotten somehow. They are
> simply absent.

  so should i just submit a patch to remove the superfluous bit until
such time as that driver is added in its entirety?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
