Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPsmg-0004Gm-Pc
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 09:57:15 +0000
Message-ID: <1336039230.13013.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 00/10] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 03 May 2012 13:00:30 +0300
In-Reply-To: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-y/KH0aGhxrr+yd9N448U"
Mime-Version: 1.0
Cc: eric miao <eric.miao@marvell.com>, Bryan Wu <cooloney@kernel.org>,
 Mike Dunn <mikedunn@newsguy.com>, Mike Frysinger <vapier.adi@gmail.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>, Lei Wen <leiwen@marvell.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, Florian Fainelli <ffainelli@freebox.fr>,
 Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
 Thomas Gleixner <tglx@linutronix.de>, Li Yang <leoli@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-y/KH0aGhxrr+yd9N448U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-02 at 10:14 -0700, Brian Norris wrote:
> Hello,
>=20
> This is the fourth version of my patches to change the nand_chip and
> nand_ecc_ctrl interfaces so that the nand_ecc_ctrl functions have informa=
tion
> about whether the higher layers actually need OOB data to be read/written
> from/to the NAND device.

Pushed patches 1,2,6,7,8,9 to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-y/KH0aGhxrr+yd9N448U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPolc+AAoJECmIfjd9wqK0D9MP/0ENbRtZVS++g85zlLpWbiyr
/kHLPHp7i8ZvwFRjxPLOYAkdUruLfCMfuEroEx4F+1MVrkB4PATqHeS41HHvmrF6
BQmBDL4BUle8x6XKDgKaMWaf71LIorXhYVv3NtCgVRIMwfn+TKAUEdjXDtwWBtlT
tu58VCNch3mj5mx8O2hCvrN0wcUB6a74TSsSe1a+Pbs6vWMldJ6XVB0VY5MZIEST
v+HNYX9BPPpG1AblQZZtmqGbbHdBqD0E0kDCr5PDZjG+05IsKpZ/MEtEl4nVLxg4
yD9BVwECYZ2bJ3c10Sq7Z2FCyochF9/StihhVyxomr7p8l88FzHdTOM4k70khZkv
t30lLYCp9inb11SLC9xAESDwmPmCGzRxha0f679950zT3QKgJ3/n4hUTErh+gV6k
Sn5Tq9qqGx4sAaed8yRqXr3FPHTgWorYSw0GmwTseKZ4bXJoBsuAJa9cRROTyiEP
v/6Rq0JnCdklb4zjze3Gd4XnvqVzEuFRHdwJpf1sIXVBqHAW1KPCevvlVtcLRG6l
fSChTmojeC1PhGry8sun7NhBEDjxHADiE7ju2OSB3kDxnzERVEj8lgNTQL6lwQI2
soSP93053erN5HJ6Xi/2FD9fX0UrRhs4/RxOsixVpp+pJTeZt1hMVttteD5OmEV3
iJFq5YaB/+p04N7c1Opk
=xaLd
-----END PGP SIGNATURE-----

--=-y/KH0aGhxrr+yd9N448U--
