Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTefX-0003AH-5u
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 06:32:57 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: Andy Hawkins <a.hawkins@cabletime.com>,
 linux-mtd@lists.infradead.org
Date: Fri, 28 May 2004 12:27:34 +0200
References: <1085737289.5617.3.camel@adh>
In-Reply-To: <1085737289.5617.3.camel@adh>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405281227.34312.tglx@linutronix.de>
Cc: 
Subject: Re: Large flash concatenation
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 28 May 2004 11:41, Andy Hawkins wrote:
> Hi,
>
> I'm trying to add support to the kernel for concatenating a number of
> large flash devices (1Gb Samsung K9F1G08).
>
> I've added the following line to nand_ids.c:
>
> 	{"NAND 1GiB 3,3V", 0xf1, 30, 0x4000, 0},
>
> and the devices are correctly detected (I've also written the required
> code in drivers/mtd/nand), showing a size of 0x40000000 for each device.

The device size is not 1GiB in words: One GigaByte.
The device size for chips with the id code 0xf1 is
1 GigaBit which is 128 MegaByte

The erasesize is wrong, as it is 64KiB and not 16KiB, but see below (1.)

> However, when I concatenate 15 of these devices, I end up with a
> partition of size 0xc000000. I assume that this is because the total
> size is stored in 32 bits, and as such is overflowing.

15 * 128 Megabyte =3D  2013265920 Bytes =3D 0x78000000
which fits into 32 bit

1. Please use the latest NAND code, as the support for the larger devices i=
s=20
already there and the old code does not handle the large page devices.
We have actually problems with CVS access (is IPV6 only). I can provide a=20
current snapshot on request.

2. The nand driver itself can handle multiple chips now. The scan function
supports multiple chip detection. Do not use the concat function for this=20
purpose. The chips are provided as one big device to the MTD layer if you d=
o=20
not use partitions.

> I want to be able to use these multiple chips as a single flash
> filesystem (probably JFFS2).

It might turn out that JFFS2 is not the first choice for this concatenated=
=20
device size, but it should work. Maybe YAFFS2 would be more suitable. It's=
=20
not released yet AFAIK, but it should be available soon.=20

You can join #mtd on irc.freenode.net if you want.

=2D-=20
Thomas
________________________________________________________________________
Steve Ballmer quotes the statistic that IT pros spend 70 percent of their=20
time managing existing systems. That couldn=E2=80=99t have anything to do w=
ith=20
the fact that 99 percent of these systems run Windows, could it?
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
