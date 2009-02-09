Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWS9z-0007bn-Rd
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 09:10:38 +0000
Date: Mon, 9 Feb 2009 10:10:24 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Michal Ludvig <mludvig@logix.net.nz>
Subject: Re: Writing Linux kernel to MTD
In-Reply-To: <498FAE9A.4030208@logix.net.nz>
Message-ID: <Pine.LNX.4.64.0902091007480.19761@lnxricardw.se.axis.com>
References: <498FAE9A.4030208@logix.net.nz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 9 Feb 2009, Michal Ludvig wrote:

> I've got some problems writing a linux kernel image to /dev/mtd1 both
> using 'dd of=3D/dev/mtd1' or using nandwrite. In either case the kernel i=
s
> not bootable after such a write.
> ...
> When I write the kernel image directly from u-boot using 'nandw' command
> it works fine and can be booted. However all attempts to write the image
> from a running Linux to /dev/mtd1 failed so far. I always ended up with
> an unbootable system:
> ...
> Interestingly even when I dump /dev/mtd1 using 'dd if=3D/dev/mtd1' or
> 'nanddump -o' I get something very close to the originally written
> kernel but not exactly the same. A number of bits here and there are
> slightly different:
> ---

My instinctive reaction is that there may be a difference in the way the=20
Linux and u-boot drivers access the NAND device in terms of bus timing=20
etc, so that the Linux driver breaks the timing causing bad communication=
=20
with the device. I.e., the timing setup of the Linux driver is at fault=20
here.

Another similar condition I have experienced is that due to a=20
misconfiguration one of the control bits to the NAND flash was=20
inadvertently mapped to a network indicator LED, causing NAND read/write=20
to fail if network traffic occurred at the same time.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
