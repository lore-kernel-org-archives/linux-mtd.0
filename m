Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15BzxL-0002Xm-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 15:24:44 +0100
Date: Mon, 18 Jun 2001 10:29:58 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>
cc: Abraham vd Merwe <abraham@2d3d.co.za>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
In-Reply-To: <20010618142215.M12246@arthur.ubicom.tudelft.nl>
Message-ID: <Pine.LNX.4.33.0106181019310.24663-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Mon, 18 Jun 2001, Erik Mouw wrote:

> On Mon, Jun 18, 2001 at 01:13:15PM +0200, Abraham vd Merwe wrote:
>
> [note that I didn't have a proper look at your patch yet]
>
> > I've added a standalone driver for the 28F160xx chips on LART. I've also
> > removed the LART definitions in the sa1100 maps driver (it's wasn't used in
> > anycase and it's obsolete now anyway). Same for the LART endian definitions
> > in cfi_endian.h and the cfi chip driver Config file.
>
> Why? If I understood the MTD stuff properly it is layered with the chip
> drivers at the lowest level, the maps driver on that, and the device
> drivers on top of the maps driver. As far as I can see (and what my
> plan was before you started) you only need a new chip driver for LART
> and reuse the other parts. Because the LART is an sa1100 design we
> should avoid special casing and just use the sa1100 maps driver.

I suggested for a separate driver some time ago because the LART is indeed a
special case because of its funky flash routing.

>From the LART mailing list archive:
http://www.lart.tudelft.nl/list/list.php3?arc=lart&sd=1&sm=6&sy=2001&ed=30&em=6&ey=2001&sort=t&inl=&mid=Pine.LNX.4.33.0106011249300.1312-100000%40xanadu.home#body


Nicolas
