Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYekP-0007z8-En
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 18:00:46 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Andrea Marson <andrea.marson@dave.eu>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Thu, 19 Mar 2015 18:00:02 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973EFED@NTXBOIMBX03.micron.com>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu>
In-Reply-To: <550A8D19.90404@dave.eu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea
 Scian <rnd4@dave-tech.it>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




Jeff Lauruhn
NAND Application Engineer

-----Original Message-----
From: Andrea Marson [mailto:andrea.marson@dave.eu]=20
Sent: Thursday, March 19, 2015 1:47 AM
To: Jeff Lauruhn (jlauruhn); Boris Brezillon
Cc: linux-mtd@lists.infradead.org; Andrea Scian; Richard Weinberger; dedeki=
nd1@gmail.com
Subject: Re: RFC: detect and manage power cut on MLC NAND

> Disturb is a block level affect, as long as partition A and B are in diff=
erent blocks there will be no disturb between them.   Disturbs, does not da=
mage cells; ERASE returns cells to undisturbed levels.
I think there are two options here: MTD partitioning and UBI partitioning. =
AFAIK one should prefer UBI partitioning to preserve device-wide wear level=
ing. Boris, am I right?

> Officially I would say don't use SLC emulation, but technically I know wh=
at your doing.   The reason I say no is because we have very precise recipe=
s designed to create very tight distibutions, and although the first pass d=
istributions might look like an SLC, they are really designed with the expe=
ctation of the upper page being programmed.  Not a true SLC.
> With MLC lithography of 25 nm and less  the difference between each level=
 (L0, L1, L2 and L3) is just a few 10's of electrons.  The distribution hav=
e to be very tight, in order to meet retention requirements.
This is quite interesting, however I'm afraid I have not fully understood i=
t. Let me try to rephrase it. Please correct me if I'm wrong.

1) Technically speaking, it is possible to use an MLC memory in SLC mode, e=
ven if this is not recommended because MLC is not designed for this usage.
	There are devices that support SLC Mode.  You can set a feature and treat =
blocks like SLC, this is the preferred method, because the P/E recipes used=
 to set the values are SLC specific. =20

	Also, there are people who program just to lower pages of MLC device which=
 could be referred to SLC like.  This is not the preferred method because t=
he P/E recipes would be set for MLC specifics assuming all pages would be u=
sed.=20

2) As indicated by Boris, the easiest way to implement this thing is to avo=
id the use of paired pages, according to paired page table provided by data=
sheet.
	Boris has a good understanding of NAND. =20

3) This technique does not transform an MLC NAND to an SLC magically.=20
Thus data retention and lifetime are not increased. However all paired page=
s issues disappear. It is not clear if there are further drawbacks that red=
uce flash reliability if used this way.

	True.  This is SLC like, half the capacity of MLC, data retention and life=
 time expectations could be in the range of SLC but it would be hard to kno=
w for sure.=20

Thank you,
Andrea
