Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ethkf-0002WH-Ku
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 22:41:39 +0000
Date: Wed, 7 Mar 2018 23:40:51 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, cyrille.pitchen@wedev4u.fr,
 marek.vasut@gmail.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, dedekind1@gmail.com,
 tharvey@gateworks.com, stable@vger.kernel.org
Subject: Re: [PATCH] ubi: Reject MLC NAND
Message-ID: <20180307234051.479d9eed@bbrezillon>
In-Reply-To: <20180307214342.GA9852@amd>
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
 <6772577.AmT7QaWTNU@blindfold> <20180307214342.GA9852@amd>
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

On Wed, 7 Mar 2018 22:43:42 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> On Wed 2018-03-07 09:01:16, Richard Weinberger wrote:
> > Pavel,
> >=20
> > Am Mittwoch, 7. M=C3=A4rz 2018, 00:18:05 CET schrieb Pavel Machek: =20
> > > On Sat 2018-03-03 11:45:54, Richard Weinberger wrote: =20
> > > > While UBI and UBIFS seem to work at first sight with MLC NAND, you =
will
> > > > most likely lose all your data upon a power-cut or due to read/write
> > > > disturb.
> > > > In order to protect users from bad surprises, refuse to attach to M=
LC
> > > > NAND.
> > > >=20
> > > > Cc: stable@vger.kernel.org =20
> > >=20
> > > That sounds like _really_ bad idea for stable. All it does is it
> > > removes support for hardware that somehow works. =20
> >=20
> > MLC is not supported and does not work. Full stop.
> > If someone manages to get it somehow work, either with hardware or soft=
ware=20
> > hacks they are on their own.
> > Having it in stable is the only chance we have to get it into vendor
> > kernels. =20
>=20
> Can you show how it meets the stable kernel criteria? They are
> documented in tree. This should not be in stable.
>=20
> And I'd like to see changelog improved. Real reason MLC is not
> supported is upper/lower page parts on MLC. And real fix to work with
> bigger pages in UBI.

Come on! Don't you think this would have been fixed already if it was
that easy?! Have you looked at an MLC datasheet to see how paired pages
are combined? If you had you would now that paired pages are almost all
the time not contiguous, thus preventing the trick you're suggesting
here. Please document yourself before doing such presumptuous
statements (you can have a look at these slides if you want some details
about why this is not so simple [1]).

I'm definitely not saying supporting MLC NANDs in Linux is impossible,
and if you're interested in working on this topic I'd be happy to help.
But please don't block this patch without understanding what supporting
MLC NANDs implies.

[1]https://events.static.linuxfound.org/sites/events/files/slides/ubi-mlc.p=
df

--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
