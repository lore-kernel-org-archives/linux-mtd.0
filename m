Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d96TW-0001n7-DB
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 09:03:04 +0000
Date: Fri, 12 May 2017 11:02:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mario Rugiero <mrugiero@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170512110230.56e6250d@bbrezillon>
In-Reply-To: <CAKKQwLQueea6G4B-cng9QdpjtRWyBWHw1Mq9ai3DVp31xswANg@mail.gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
 <CAKKQwLTVpsu8j50BkqkgBwk9A3rPfrYDUTYDXbAn_OiA-tUd7g@mail.gmail.com>
 <20170512104554.5670bb4d@bbrezillon>
 <CAKKQwLQueea6G4B-cng9QdpjtRWyBWHw1Mq9ai3DVp31xswANg@mail.gmail.com>
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

On Fri, 12 May 2017 05:56:40 -0300
Mario Rugiero <mrugiero@gmail.com> wrote:

> El may. 12, 2017 5:46, "Boris Brezillon" <boris.brezillon@free-electrons.=
com>
> escribi=C3=B3:
>=20
> On Fri, 12 May 2017 05:34:10 -0300
> Mario Rugiero <mrugiero@gmail.com> wrote:
>=20
> > 2017-05-12 5:24 GMT-03:00 Boris Brezillon <boris.brezillon@free-
> electrons.com>: =20
> > > On Fri, 12 May 2017 05:16:08 -0300
> > > Mario Rugiero <mrugiero@gmail.com> wrote:
> > > =20
> > >> 2017-05-12 5:12 GMT-03:00 Richard Weinberger < =20
> richard.weinberger@gmail.com>: =20
> > >> > Mario,
> > >> >
> > >> > On Fri, May 12, 2017 at 7:39 AM, Mario J. Rugiero <mrugiero@gmail.=
com> =20
> wrote:
> > >> >> Some chips used under a custom vendor driver can get their blocks
> > >> >> incorrectly detected as bad blocks, out of incompatibilities
> > >> >> between such drivers and MTD drivers.
> > >> >> When there are too many misdetected bad blocks, the device becomes
> > >> >> unusable because a bad block table can't be allocated, aside from
> > >> >> all the legitimately good blocks which become unusable under these
> > >> >> conditions.
> > >> >> This adds a build option to workaround the issue by enabling the
> > >> >> user to free up space regardless of what the driver thinks about
> > >> >> the blocks. =20
> > >> >
> > >> > Hmm, this sounds like a gross hack. =20
> > >> It is, but I see no other solution. The NAND chips were used in an
> > >> incompatible way by a hack-n-slash driver made by allwinner, and
> > >> trying to load them with a proper MTD driver fails miserably if this
> > >> is not done.
> > >> If anyone can propose a better solution I'll more than happily =20
> implement it.
> > >> I'm open to suggestions, and of course I'm open to rejection of my
> > >> patches if needed. =20
> > >
> > > u-boot provides the nand.scrub command, which does exactly what you're
> > > looking for. And no, I don't think it's a good idea to allow erasing
> > > bad blocks, at least not by default.
> > >
> > > If we really want to support this feature in linux, this should be
> > > explicitly enabled through debugfs. =20
> > If I do this, does it stand a chance at getting upstream?
> > If so, I'll have it done soon.
> > Note however that the build option is disabled by default. I get that
> > there should also be one runtime option, disabled by default, exposed
> > through debugfs. Does that sound right? =20
> > > =20
> > >> > =20
> > >> >> Example usage: recovering NAND chips on sunxi devices, as explain=
ed
> > >> >> here: http://linux-sunxi.org/Mainline_NAND_Howto#Known_issues =20
> > >> >
> > >> > What this wiki suggests is not wise.
> > >> > How can you know which blocks are really bad and which not? =20
> > >> You don't, at least not without an even grosser hack implementing re=
ad
> > >> support for their incompatible format.
> > >> Would that be better? I might attempt it if desired. =20
> > >
> > > No, please don't do that, at least not in the kernel. If you really
> > > want to parse the old format, you should develop a tool that reads NA=
ND
> > > pages in raw mode, stores the list of bad blocks somewhere and then
> > > re-use this list to select which blocks should be forcibly erased.
> > >
> > > Not sure it's worth the pain :-). =20
> > It's worth the pain to me. I'm dealing with a bit rotten 3.4 based
> > pile of cr*p on production because of this. Whatever I have to do to
> > get those machines running the mainline kernel is worth it. =20
>=20
> No, I meant, doing that vs scrubbing the NAND. Note that MLC support is
> not reliable in mainline, so I'd strongly discourage to use a mainline
> kernel right now, unless you have an SLC NAND.
>=20
> I know. Sunxi's driver doesn't seem stable either, though, and I've read
> using an MLC chip as SLC by half The storage capacity was a viable
> solution.

Well, yes, but it's not supported either (at least not in mainline).

> If it isn't implemented right now, I might implement that
> solution in The meantime to a proper fix. Sadly, I'm not skilled enough f=
or
> that final solution.

I have a branch containing the work we did we Richard to reliably
support MLC NANDs. It's still WIP, but should give a rough idea of the
solution we're heading to [1].

[1]https://github.com/bbrezillon/linux-sunxi/commits/bb/4.7/ubi-mlc
