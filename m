Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14v5ZO-0008D2-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 23:58:06 +0100
Message-ID: <3AF0914A.418BAE6@daniel.com>
Date: Wed, 02 May 2001 17:59:22 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: "Fry, Dan" <dfry@bb.directv.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: /dev/mtdblock missing
References: <617933180D08D311AB500090273F1F96016767D9@storm.corp.directvbroadband.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Are you using devfs?

If not then the MAKEDEV script file in the utils file should do it. (using the
mknod command)

If you are using devfs, then I don't know.

Vipin






"Fry, Dan" wrote:

> Hi List,
>
>         I'm trying to get JFFS2 up and running on an atlas demo board.  The
> flash chip are being found and /dev/mtd0 (char device) is created.  However
> I can't mount a jffs2 because /dev/mtdblock0,1,2 etc. is missing.
> mtdblock.c is compiled in, and cat /proc/devices lists mtdblock under block
> devices.  I tried including ftl.c figuring there may be dependences.
>
> This is the output at boot up:
>
> physmap flash device: 2000000 at 1c000000
>
> <4><6>Physically mapped flash: Found 2 x16 devices at 0x0 in 32-bit mode
>
> Number of erase regions: 1
>
> Erase Region #0: BlockSize 0x20000 bytes, 64 blocks
>
> Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
>
> Primary Algorithm Table at 0031
>
> Alternative Vendor Command Set: 0000 (None)
>
> No Alternate Algorithm Table
>
> Vcc Minimum: 4.5 V
>
> Vcc Maximum: 5.5 V
>
> No Vpp line
>
> Typical byte/word write timeout: 128 탎
>
> Maximum byte/word write timeout: 2048 탎
>
> Typical full buffer write timeout: 128 탎
>
> Maximum full buffer write timeout: 2048 탎
>
> Typical block erase timeout: 1024 탎
>
> Max. bytes in buffer write: 0x20
>
> Number of Erase Block Regions: 1
>
> Physically mapped flash: Found 2 x16 devices at 0x1000000 in 32-bit mode
>
> JEDEC ID: 89 15
>
> 0: offset=0x0,size=0x40000,blocks=64
>
> 1: offset=0x1000000,size=0x40000,blocks=64
>
> <5>ftl_cs: FTL header not found.
>
> Questions:
> 1) How to I get /dev/mtdblock0 created?
>
> 2) Is ftl.c needed -- the HOWTO doesn't include it?
>
> Cheers,
>
>         - Dan
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
