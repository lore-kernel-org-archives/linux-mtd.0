Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITCiC-00025c-Or
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 04:27:44 -0400
Subject: Re: General performance of NAND operations i.e mount and ls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20070906081215.GA5693@anita.doom>
References: <20070906081215.GA5693@anita.doom>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Sep 2007 11:27:21 +0300
Message-Id: <1189067241.14370.23.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2007-09-06 at 10:12 +0200, Konstantin Kletschke wrote:
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron NAND 1GiB 3,3V
> 8-bit)
> 2 NAND chips detected
> Scanning device for bad blocks
> Bad eraseblock 1838 at 0x0e5c0000
> Bad eraseblock 2697 at 0x15120000
> Bad eraseblock 3888 at 0x1e600000
> Bad eraseblock 4338 at 0x21e40000
> Bad eraseblock 4501 at 0x232a0000
> Bad eraseblock 8534 at 0x42ac0000
> Bad eraseblock 14308 at 0x6fc80000
> Bad eraseblock 14329 at 0x6ff20000
> Bad eraseblock 16142 at 0x7e1c0000
> Creating 1 MTD partitions on "NAND 1GiB 3,3V 8-bit":
> 0x00000000-0x80000000 : "NAND Flash"

If you useed on-flash BBT, you'd avoid scanning and make this phase
faster. But the improvement would be nothing comparing to JFFS2's delay.

> Mounting lasts 20 seconds, is that a reasonable time for jffs2 on 2GiB
> NAND? May be...

Well, JFFS2 scans on mount, so no wonder it is that long. Summary should
improves the situation - do you have it enabled?

> # time mount -t jffs2 /dev/mtdblock4 /mnt
> JFFS2 notice: (186) jffs2_build_xattr_subsystem: complete building xattr =
subsystem, 0
> of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
> real    0m 19.03s
> user    0m 0.01s
> sys     0m 19.01s
>=20
> But the fist/initital ls takes half an hour, is this okay or are your
> faster?

It's because you use -a, which causes stat() to be called for each file.
Stat causes read_inode(), which is slow. It builds file's fragtree,
which means it reads and checks each of its nodes. So the larger is the
file the longer it takes to stat() it for the first time (the second and
later are cached).

> What are your experiences on flash devices?

I do not think you may make JFFS2 work faster on such big flash with
such big files, at least it will be difficult and would require core
jffs2 changes.

I'd suggest you to try UBIFS - it must be faster. We would also be
interested to get a feedback.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
