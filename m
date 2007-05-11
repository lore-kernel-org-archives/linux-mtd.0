Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HmW8L-0007w9-RP
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 10:30:17 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l4BEU4UF002203
	for <linux-mtd@lists.infradead.org>; Fri, 11 May 2007 16:30:04 +0200
Date: Fri, 11 May 2007 16:31:12 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: NAND flash write goes wrong
In-Reply-To: <200705111656.24216.borasah@gmail.com>
Message-ID: <Pine.LNX.4.64.0705111621430.3951@lnxricardw.se.axis.com>
References: <200705102150.31171.borasah@gmail.com>
	<Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
	<200705111656.24216.borasah@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 11 May 2007, borasah@gmail.com wrote:

> Thanks for the infos. OK, this means
> =09./mkfs.jffs2 -e 0x4000 -r rootfs -o img -l -n
> or
> =09./mkfs.jffs2 -s 0x1000 -e 0x4000 -r rootfs -o img -l -n
> right? I checked the target .config, it uses 4K as page size. But I gave
>
> =09Input file is not page aligned
> =09Data did not fit into device, due to bad blocks
> =09: Success
>
> In fact, I tried without -p and with -n before. Without -p nandwrite give=
s the
> above message. Then I put -p and nandwrite started to write...

Sorry, I didn't get it completely right last time. It is good practice to=
=20
pad the image to a complete eraseblock size, but it shouldn't fill the=20
whole nand flash partition space available, in case there are bad blocks.

So yes, it should be padded with -p, but not to the full size of the=20
partition, but a couple of eraseblocks less.

-p specified to nandwrite should also work as it pads the image with 0xff.

>> If there indeed are bad blocks it is correct to skip them both when
>> erasing and writing.
>
> OK. What I wanted to learn was different. In the begining there was no ba=
d
> sector but by the passage of time, when I tried different combinations, b=
ad
> sector numbers started to increase. Is this normal? Or are there some
> fundamentally different things between kernel version and mtd-utils so th=
ese
> marks them as bad?

Blocks (nand flash terminology rejects the name 'sectors' in favor of=20
'blocks' and 'pages') can go bad with time, but we're talking about=20
thousands if not tens of thousands of erase/write cycles here. So it seems=
=20
there's something wrong here.

There was a patch posted just a week or so ago here which fixed a problem=
=20
with bad block marking and recognition when not using a flash-based bad=20
block table.

My (limited) experience is that when the jffs2 driver detects more and=20
more bad blocks over a short period of time, it is the result of a=20
hardware problem i.e. the communication with the nand flash doesn't work=20
properly, causing some reads, writes or erase operations to fail. (Case in=
=20
point: during debugging of one of our products I accidentally allocated a=
=20
network traffic indicator output pin to one of the nand flash signals,=20
which caused all sorts of weird nand flash problems if the flash was=20
accessed at the same time as the network. As long as the network was=20
silent, there were no problems whatsoever).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
