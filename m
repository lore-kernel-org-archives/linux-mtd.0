Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deIpI-0007Mt-2Q
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 10:30:29 +0000
Received: by mail-wm0-x22d.google.com with SMTP id t201so48683002wmt.0
 for <linux-mtd@lists.infradead.org>; Sun, 06 Aug 2017 03:30:07 -0700 (PDT)
From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 5/5] ubi: Allow to use read-only UBI volume with not
 enough PEBs
Date: Sun, 6 Aug 2017 12:30:02 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <20170725142729.GL30901@pali> <0527d020-95aa-80e5-978c-fa9b6761a273@nod.at>
In-Reply-To: <0527d020-95aa-80e5-978c-fa9b6761a273@nod.at>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1676084.rBHTOKRZuN";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201708061230.02997@pali>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1676084.rBHTOKRZuN
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 06 August 2017 11:43:25 Richard Weinberger wrote:
> Pali,
>=20
> Am 25.07.2017 um 16:27 schrieb Pali Roh=C3=A1r:
> >> I fear this is not correct, it will disable a legit self-check of
> >> UBI volumes. If the read-only volume is corrupted/truncated and
> >> you miss PEBs, this check will no longer
> >> trigger.
> >>=20
> >> Especially when dealing with nanddumps, truncation is a common
> >> problem.
> >=20
> > Any idea how to fix it? Or how to handle read-only images which are
> > marked for auto-resize?
>=20
> I'd vote for rejecting images that have auto-resize set when the MTD
> is read-only. In fact, using UBI on top of a read-only MTD is very
> uncommon and not recommended (for NAND). The auto-resize flag should
> be also only set when you just have created it using mkfs.ubifs. Why
> would you inspect such an image with the kernel UBIFS unless you're
> hunting down a bug in mkfs.ubifs?
>=20
> Thanks,
> //richard

E.g. because when I get UBIFS image and I want to unpack it.

IMO UBIFS image which have auto-resize set is also valid UBIFS image and=20
kernel should be able to read it too, even in R/O mode.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1676084.rBHTOKRZuN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlmG76oACgkQi/DJPQPkQ1LSjwCfffCHL9wwkppFScy5slbndr1D
zmYAoLYlG4N4QTdZwNyn2jw/VMGHAx7L
=DHYv
-----END PGP SIGNATURE-----

--nextPart1676084.rBHTOKRZuN--
