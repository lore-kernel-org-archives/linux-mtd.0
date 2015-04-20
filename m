Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Yk6Gn-0003C4-2f
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2015 07:37:29 +0000
Date: Mon, 20 Apr 2015 09:37:02 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150420073702.GA2552@pengutronix.de>
References: <20150420045614.GC5428@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150420045614.GC5428@tarshish>
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Baruch,

On Mon, Apr 20, 2015 at 07:56:14AM +0300, Baruch Siach wrote:
> I'm trying to get nand_ecclayout right on i.MX25 with the Micron 
> MT29F8G08ABABA (page size: 4096, oob size: 224). The large OOB size allows 
Just for me to understand your plan: To support the big ecc variant you
need another set of struct nand_ecclayout. The expectation for your
flash would be:

	.eccpos = { 8, ... 25,
			34, ... 51,
			60, ... 77,
			86, ... 103,
			112, ... 129,
			138, ... 155,
			164, ... 181,
			190, ... 207 }

right?

> using hardware ecc strength of 8bit per ecc step (512 bytes). The mxc_nand 
> driver code (get_eccsize()) and the reference manual seems to indicate that 
> enabling 8 bit ecc mode requires 26 oob bytes per ecc step. However, this 
> seems to contradict the actual hardware test as the shown in the dump
> below of a zero filled page + oob:
> 
> # hexdump -C dump4
> 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00001000  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> 00001010  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> 00001020  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> 00001030  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
> 00001040  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
> 00001050  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
> 00001060  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
> 00001070  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> 00001080  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> 00001090  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> 000010a0  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
> 000010b0  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
> 000010c0  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
> 000010d0  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
> 
> As you can easily see, ecc steps start at 28 bytes interval, with 18
> bytes for ecc (matches documentation), and 10 bytes free.
How did you extract this page+oob from the nand flash? From Linux I
assume? Can you try from barebox something like:

	mw -w 0xbb001e08 0x0000 # READ0
	mw -w 0xbb001e1c 0x01 # CMD cycle
	mw -w 0xbb001e06 0x00 # Address = 0
	mw -w 0xbb001e1c 0x02 # Address cycle
	mw -w 0xbb001e1c 0x02 # Address cycle
	mw -w 0xbb001e1c 0x02 # Address cycle (do we need three? [1])
	mw -w 0xbb001e04 0x00
	mw -w 0xbb001e1c 0x08 # NAND OUTPUT
	md -w 0xbb000000+0x10f0

with ecc being disabled (i.e. CONFIG1, bit 3 = 0). Does this show the 28
bytes offset, too?

> Has anyone ever tried using 8 bit ecc mode with any variant of the
> i.MX NFC?
I'm not aware we at Pengutronix already did.

Best regards
Uwe
	
[1] it doesn't seem trivial to get a datasheet from Micron for your
    chip. On the webpage I end up at a "Document Request Form" where I
    need to fill out quantities per month with a minimal value of 1k and
    if we have an NDA.

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
