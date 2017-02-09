Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cbvXe-00041e-CR
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 20:42:13 +0000
Date: Thu, 9 Feb 2017 21:41:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Sascha Hauer
 <s.hauer@pengutronix.de>, Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH] mtd: Add partition device node to mtd partition devices
Message-ID: <20170209214138.004d482f@bbrezillon>
In-Reply-To: <20170209201404.fsokiexnj7xvukyd@pengutronix.de>
References: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
 <20170209163458.41b3bea7@bbrezillon>
 <20170209193940.vd63higxuowsxj3d@pengutronix.de>
 <20170209205922.5ba01ee1@bbrezillon>
 <20170209201404.fsokiexnj7xvukyd@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 9 Feb 2017 21:14:04 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> Hello Boris,
>=20
> On Thu, Feb 09, 2017 at 08:59:22PM +0100, Boris Brezillon wrote:
> > On Thu, 9 Feb 2017 20:39:40 +0100
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:
> >  =20
> > > On Thu, Feb 09, 2017 at 04:34:58PM +0100, Boris Brezillon wrote: =20
> > > > +Moritz
> > > >=20
> > > > On Thu,  9 Feb 2017 11:50:24 +0100
> > > > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:
> > > >    =20
> > > > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > > >=20
> > > > > The user visible change here is that mtd partitions get an of_nod=
e link
> > > > > in sysfs.   =20
> > > >=20
> > > > The same patch has already been posted last year [1].
> > > > Brian, can we take one of these?
> > > >=20
> > > > [1]https://patchwork.ozlabs.org/patch/625978/   =20
> > >=20
> > > Moritz' patch is more lame, it even updates the documentation (ok, one
> > > point for Moriz :-) Other than that the only difference is "node" vs.
> > > "of_node" (half a point for Sascha) and the position of the assignment
> > > in mtdpart.c has a different position (another half point for Sascha).
> > >=20
> > > If that would be liked to be seen I can volunteer to create a patch
> > > picking the best from both sources. =20
> >=20
> > Sure, you can also add my ack (which I already put on Moritz patch).
> > BTW, is the of_node link in sysfs the only motivation for this change?
> > I know Moritz had bigger plans (nvmem blocks on top of MTD devices), and
> > I also considered advanced stuff (like per-partition ECC config) which
> > required having a valid ->of_node on slave MTD devices. =20
>=20
> The motivation for Sascha to create this patch and now me to mainline
> it, is that we specify some non-volatile state space in dts (to store
> for example hardware revision, serial number and mac addresses). See
> http://barebox.org/doc/latest/devicetree/bindings/barebox/barebox,state.h=
tml
> for some details.
>=20
> For the userspace part we read the dtb, something like
>=20
> 	state {
> 		compatible =3D "barebox,state";
> 		backend =3D &mtdstatepartition;
> 		...
> 	}
>=20
> , and with the symlink introduced by the patch under discussion it gets
> much simpler to find the device file (in /dev) that contains our state
> data.

Okay. Looks like an advanced nvmem [1] implementation. Anyway, having
the of_node populated for MTD partition devs sounds reasonable, no
matter the reason you need that for.

[1]http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/n=
vmem/nvmem.txt
