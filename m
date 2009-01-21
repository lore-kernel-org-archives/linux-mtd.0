Received: from chilli.pcug.org.au ([203.10.76.44] helo=smtps.tip.net.au)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPlNu-0004gF-3r
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 22:17:21 +0000
Date: Thu, 22 Jan 2009 09:17:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] powerpc: more printing warning fixes for the l64 to
	ll64 conversion
Message-Id: <20090122091705.2010ed70.sfr@canb.auug.org.au>
In-Reply-To: <20090121181324.GA32224@ld0162-tx32.am.freescale.net>
References: <20090121111651.7d6e87ec.sfr@canb.auug.org.au>
	<20090121181324.GA32224@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__22_Jan_2009_09_17_05_+1100_oX88Uq5GcTzb4WMo"
Cc: Nick Spence <nick.spence@freescale.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, David,
	linuxppc-dev@ozlabs.org, Egor, Paul Mackerras <paulus@samba.org>,
	Doug Thompson <dougthompson@xmission.com>,
	Olof Johansson <olof@lixom.net>, linux-mtd@lists.infradead.org,
	Woodhouse <dwmw2@infradead.org>, bluesmoke-devel@lists.sourceforge.net,
	Martovetsky <egor@pasemi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Thu__22_Jan_2009_09_17_05_+1100_oX88Uq5GcTzb4WMo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Jan 2009 12:13:24 -0600 Scott Wood <scottwood@freescale.com> wro=
te:
>
> On Wed, Jan 21, 2009 at 11:16:51AM +1100, Stephen Rothwell wrote:
> > -	printk(KERN_INFO "eLBC NAND device at 0x%zx, bank %d\n",
> > +	printk(KERN_INFO "eLBC NAND device at 0x%llx, bank %d\n",
> >  	       res.start, priv->bank);
>=20
> This won't work if resource_size_t is 32-bit; it needs a cast.

Right.  Rats!  I'll fix and repost.

> ACK the other two fsl_elbc fixes.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__22_Jan_2009_09_17_05_+1100_oX88Uq5GcTzb4WMo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkl3nuEACgkQjjKRsyhoI8zSJgCdEX6lkSSAMqa/IYrYqgPvuX4c
VskAoKDTeaXNFx/c57gqqpgLWewXEdAU
=MynJ
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Jan_2009_09_17_05_+1100_oX88Uq5GcTzb4WMo--
