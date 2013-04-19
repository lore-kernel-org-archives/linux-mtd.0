Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UT05W-00030T-Sp
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 01:26:07 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Date: Thu, 18 Apr 2013 21:28:16 -0400
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304181630.58886.vapier@gentoo.org> <20130419001259.GA2259@localhost>
In-Reply-To: <20130419001259.GA2259@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2334869.BW6XQeHCiI";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304182128.19518.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2334869.BW6XQeHCiI
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 18 April 2013 20:13:00 Ezequiel Garcia wrote:
> On Thu, Apr 18, 2013 at 04:30:55PM -0400, Mike Frysinger wrote:
> > i wonder if the write support should be put behind a CONFIG option.
> > personally, the write support is kind of neat and semi-useful for
> > development, but i don't plan on shipping anything on that :).  i just
> > want read-only support to load an ext2 fs on top of UBI.
>=20
> Mmm... good input. Maybe putting write support behind a CONFIG and
> showing a big fat warning when the module loads will do?
> (something to prevent regular users from using this carelessly).
>=20
> May I ask why would you want to put ext2 fs? Have you considered f2fs?

well, unless i misread things, f2fs is designed for consumer flash=20
(mmc/cf/etc...) where the flash (e.g. NAND) is behind a FTL.  the device i'=
m=20
interested isn't behind a FTL (the NAND is connected directly to the NAND=20
controller in the SoC), so i want to run UBI on it to handle the bad blocks=
=20
and junk.  otherwise, the ext2 is always read-only, so the write=20
characteristics don't matter.
=2Dmike

--nextPart2334869.BW6XQeHCiI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRcJ2zAAoJEEFjO5/oN/WBiRgP/1bR1ijs3B01LAmPmgt9GZ6a
YGo5gs7zyaH+5OJeMeV6+VmcIzV5LKPcnwGmNlBArmajufN4/Itk7X3IOo37gI7k
lun0P4fBsTth+LogPXZ6FJUt2mNXG1W4u8p5K78R42kgCwGYBXhjklZERNMNpXq+
Tx5z1Alll/s6ZVeS8T+VjUReW00arWQ9zd/aEVzh6frsRH4Opg2SsXyM9FjM/yJd
RxiLA3gKOE04oGZS2923zwvieC9IZIfomcrMCqpiOhFoQUuzTjcK7FlZ5x4P6Q6W
HfSjsCGKUEaMDtpmPsvwiAhOCQAuIPsK5u+JgKrlXv/BOVLT8G4xBXbgY6WWPLz5
t4YBwt7Jzb8Ft3VrhZXIOtyXKst7f+33eI2HuXYJwNjlmdbBkTmeW6AqZ4R2EOwK
mUZfyKElVMa/OhJjzgC3rTAJW8ygRKsV99/usV8zKav1sFAWGyvuOOBL34BfbLTH
Z4hAV+sAXUVgaDQyuGOV6cRkvTIyPdoOBwiW42dbZWR0wQB8MjaR+nXGziW3pJqx
9pFJcAO4tCIQ9+ipIoKvQ/3HFlfPbq+lzj2wAMBgY67t690eCYvx8DljN0E0cpNz
0Pesq/w878dkA0YeNHw/qVZgg3AX3MV1hq0H+tr9wJ39CWh57wN0h/WylohRXp4u
OES53s/a95MTYSbu7j8p
=nJmN
-----END PGP SIGNATURE-----

--nextPart2334869.BW6XQeHCiI--
