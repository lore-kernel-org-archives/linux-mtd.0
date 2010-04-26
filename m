Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6M8X-0002AR-6n
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 11:06:02 +0000
Message-ID: <afe027b8af6429f1eaf61baae36235d3.squirrel@webmail.plus.net>
Date: Mon, 26 Apr 2010 12:05:56 +0100
Subject: Obtaining start/end address of an MTD partition
From: "Matthew Lear" <matt@bubblegen.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: matt@bubblegen.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

Is it possible to obtain an MTD partition's starting address through usage
of the MTD ioctls? I've had a very quick look and from what I can tell,
this doesn't seem to be possible.

To be clear, I'd like to obtain the addresses below (displayed by Linux
when it detects the MTD partitions on boot).

Creating 6 MTD partitions on "physmap-flash.0":
0x00000000-0x00120000 : "RedBoot"
0x00120000-0x01000000 : "foo"
0x01000000-0x01400000 : "bar"

I can obviously use the MEMGETINFO ioctl on a particular MTD device to
return info in struct mtd_info_user, but this doesn't give me all the
information I need for that particular partition (ie start and end offsets
in terms of 'physical' addresses).

Basically, I'm trying to cater for using another flash driver instead of 
the MTD sub-system on some custom hw in order to access the flash device.
I'd like to be able to get the MTD partition start and end addresses so I
know where to operate on this other device. A bit clunky, I know (if it
were my decision MTD would be used).

RedBoot creates the FIS entries above and Linux parses this just fine at
boot. If I were using MTD to access the flash device I could open
/dev/mtd<x> or /dev/mtdblock<x> accordingly. However, there is a
requirement to access the flash through another device (/dev/flash). For
example, if I wanted to write to the area covered by /dev/mtd1, I need to
be able to:

i)  get the start address of /dev/mtd1
ii) open /dev/flash and seek to the offset provided by (i) above.
iii) perform the operation(s).

...so I need the partition start addresses (and end too if possible). Can
these offsets be obtained through the MTD user space ioctls?

Many thanks,
--  Matt
