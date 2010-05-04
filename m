Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9Jar-0006ss-Hp
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 14:59:30 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Some questions on bit-flips and JFFS2
Date: Tue, 4 May 2010 16:59:26 +0200
References: <201005031505.18604.muehlfelder@enertex.de>
	<4BDFE8D6.1050704@aimvalley.nl>
In-Reply-To: <4BDFE8D6.1050704@aimvalley.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201005041659.26262.muehlfelder@enertex.de>
Cc: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 04 May 2010 11:28:54 schrieb Norbert van Bolhuis:
> Thorsten M=FChlfelder wrote:
> > Hi there,
> >
> > I'm experiencing some problems with bit-flips on devices using NAND and
> > JFFS2: NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron NAND
> > 512MiB 3,3V 8-bit)
> > Creating 2 MTD partitions on "NAND 512MiB 3,3V 8-bit":
> > 0x00000000-0x00a00000 : "Bootloader Area"
> > 0x00a00000-0x20000000 : "User Area"
> >
> > In rare cases 1 or 2 bits in the bootloader area (kernel) flip, so that
> > the system won't boot anymore (kernel checksum error).
> > As the bootloader image is not mounted at all I wonder if this may be
> > caused by these read disturbs I've heard of.
=2E..
> > PS: I could not reproduce the bit-flip problem. It just happens in rare
> > cases. Furthermore some of my devices are using Samsung NAND instead of
> > the Micron NAND and did not show any problems yet. So perhaps my problem
> > are just some bad NAND chip? But still I have to find a solution for the
> > problem.
>
> Maybe, as said check/ask your hardware supplier.
> Maybe "refreshing" the block helps (that is saving the data, erasing the
> block(s) and reprogramming all data). You could try this.

I've already thought about something like this:
1. After first succesful bootup dump a mtd0 image and calculate a md5sum of=
=20
it:
nanddump -o -b -f mtd0.img /dev/mtd0
2. Before each shutdown dump the image again and check if the md5sum has=20
changed.
3. If it has changed write the initial dump back:
flash_eraseall /dev/mtd0
nandwrite -p /dev/mtd0 mtd0.img

Would this be the right method?

> The best solution is of course UBIFS. UBI/UBIFS will handle bad blocks and
> read/write disturbs. Include your kernel partition into the (big) flash
> filesystem partition and start using UBIFS (i.s.o. JFFS2).

Is there any How-To for U-Boot?

Greetings
Thorsten
