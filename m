Date: Sun, 17 Dec 2017 22:46:17 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Willy Tarreau <w@1wt.eu>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171217224617.1f9b8b84@xps13>
In-Reply-To: <20171217222611.59f9031b@bbrezillon>
References: <20171217120503.GA3323@1wt.eu>
 <CAAEAJfBUyhvi68A6QEJRywq9hxMBYuJ4m+O6ogBtV1nkeBR_og@mail.gmail.com>
 <20171217155305.16c5bb4f@bbrezillon> <20171217150043.GA1403@1wt.eu>
 <CAAEAJfD47bGTSppEqcRszjAgBUjiCevmdYLKfsQTPYMcVu8VDA@mail.gmail.com>
 <20171217162342.GA1833@1wt.eu> <20171217190746.2a61232c@bbrezillon>
 <20171217190056.GA1107@1wt.eu>
 <CAAEAJfArtxcWgcjHAb__3BQxWEBgWU8uWtHGYETc-m9eUs91nA@mail.gmail.com>
 <20171217211650.GA6815@1wt.eu> <20171217222611.59f9031b@bbrezillon>
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

Hello Willy,

On Sun, 17 Dec 2017 22:26:11 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> +Miquel
>=20
> On Sun, 17 Dec 2017 22:16:50 +0100
> Willy Tarreau <w@1wt.eu> wrote:
>=20
> > On Sun, Dec 17, 2017 at 06:01:29PM -0300, Ezequiel Garcia wrote: =20
> > > On 17 December 2017 at 16:00, Willy Tarreau <w@1wt.eu> wrote:   =20
> > > > On Sun, Dec 17, 2017 at 07:07:46PM +0100, Boris Brezillon
> > > > wrote:   =20
> > > >> > > This would guarantee that devices with factory bad blocks,
> > > >> > > (and no BBT), would be OK with this patch.   =20
> > > >> >
> > > >> > I see. I'm fine with trying provided I have reasonably good
> > > >> > assurance that I won't have to go through the kwboot pain
> > > >> > again :-/   =20
> > > >>
> > > >> There's a easy test you can do without scrubing the NAND:
> > > >> 1/ comment the nand-on-flash-bbt property in your DT (this
> > > >> will trigger a full scan)
> > > >> 2/ from u-boot (before booting the kernel), erase a block that
> > > >> you know contains nothing important
> > > >> 3/ during the kernel scan, make sure this block is not
> > > >> reported as bad   =20
> > > >
> > > > OK so I tried and never faced any error. Thus I also attempted
> > > > to mark a bad block in u-boot, it appeared in the bad blocks
> > > > table, then I had to scrub the whole table to get rid of it.
> > > > Each time when I booted I saw the message "Scanning device for
> > > > bad blocks" but no error ever happened. So I hope it's OK.
> > > >   =20
> > >=20
> > > Nice. Thanks a lot Willy. I think this acks Boris' patch.   =20
> >=20
> > You're welcome, you and Boris fixed my problem very quickly
> > allowing me to continue to prepare my new router :-)
> >=20
> > BTW, Boris please don't forget to mark your fix for -stable. =20
>=20
> Actually, if things go well it will only be applied to stable
> releases (I really hope we'll be able to switch to Miquel's driver in
> 4.16). BTW, if you have some time, maybe you can test Miquel's [1]
> branch and let us know if it still works properly.

As Boris said, we would really welcome a test of this branch, because
you almost have the same setup as Sean in the thread "pxa3xx: wait time
out when scanning for bb" and I am running out of explanation for his
problem unless it is related to U-Boot. So if you could try booting
with and without the on-flash-bbt property and report whether it fails
or not it would be of great help!

Thanks,
Miqu=C3=A8l

>=20
> Thanks,
>=20
> Boris
>=20
> [1]https://github.com/miquelraynal/linux/tree/marvell/nand-next/nfc
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
