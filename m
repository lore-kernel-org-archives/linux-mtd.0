Received: from mail.free-electrons.com ([88.190.12.23])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScLbM-0002TG-Dj
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 19:09:07 +0000
Date: Wed, 6 Jun 2012 21:08:41 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Q: Cramfs Vs. Ubifs
Message-ID: <20120606210841.615fdd6a@skate>
In-Reply-To: <Pine.LNX.4.64.1206051122380.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhK0isouNBTzMEXPvRLAjFFcSCzWn_gvszrgt1_6Nvw13A@mail.gmail.com>
 <Pine.LNX.4.64.1206051122380.4247@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ran Shalit <ranshalit@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Le Tue, 5 Jun 2012 11:29:08 +0200 (CEST),
Ricard Wanderlof <ricard.wanderlof@axis.com> a =C3=A9crit :

> I should make it clear that cramfs can not be run directly on NAND flash=
=20
> as it has no concept of bad blocks. But neither can ubifs, which requires=
=20
> UBI. So both require UBI.
>=20
> As a matter of fact, come to think of it, I'm not sure how to run cramfs=
=20
> on UBI as it requires a block device which UBI doesn't supply. But I have=
=20
> tested it in some way, so it's probably just my mind drawing a blank righ=
t=20
> now. :-)

You can use gluebi+mtdblock on top of a MTD volume to use a read-only
block filesystem on top of MTD. Or, you can use the ubiblk driver,
which isn't mainline for now, but has been posted multiple times last
year by one of my colleagues.

> The only real advantage I can see with cramfs is that it does use up less=
=20
> space in the flash for the same amount of data. On the other hand, flash=
=20
> space is usually not a big concern in NAND flash systems anyway.

cramfs is kind of useless now that we have squashfs that overcomes the
limitations of cramfs (in number of files and filesystem size) and
provides an even higher compression ratio.

So definitely, if you had to use a read-only block filesystem, you
should go with squashfs. But as Ricard pointed, you cannot directly use
either cramfs or squashfs on top of MTD partitions, since those
filesystems do not handle bad blocks.

Best regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
