Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YkDwC-0002VJ-2R
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2015 15:48:45 +0000
Date: Mon, 20 Apr 2015 17:48:18 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150420154818.GE2552@pengutronix.de>
References: <20150420045614.GC5428@tarshish>
 <20150420073702.GA2552@pengutronix.de>
 <20150420091130.GD5428@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150420091130.GD5428@tarshish>
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

On Mon, Apr 20, 2015 at 12:11:30PM +0300, Baruch Siach wrote:
> On Mon, Apr 20, 2015 at 09:37:02AM +0200, Uwe Kleine-König wrote:
> > On Mon, Apr 20, 2015 at 07:56:14AM +0300, Baruch Siach wrote:
> > > I'm trying to get nand_ecclayout right on i.MX25 with the Micron 
> > > MT29F8G08ABABA (page size: 4096, oob size: 224). The large OOB size allows 
> > Just for me to understand your plan: To support the big ecc variant you
> > need another set of struct nand_ecclayout. The expectation for your
> > flash would be:
> > 
> > 	.eccpos = { 8, ... 25,
> > 			34, ... 51,
> > 			60, ... 77,
> > 			86, ... 103,
> > 			112, ... 129,
> > 			138, ... 155,
> > 			164, ... 181,
> > 			190, ... 207 }
> > 
> > right?
> 
> According to the dump below (28 bytes interval) it should be off by one:
> 
> 	eccpos = { 7, ... 24,
> 		35, ... 52,
> 		63, ... 80,
> 		91, ... 108,
> 		119, ... 136,
> 		147, ... 164,
> 		175, ... 192,
> 		203, ... 220 };
ok.

> > > using hardware ecc strength of 8bit per ecc step (512 bytes). The mxc_nand 
> > > driver code (get_eccsize()) and the reference manual seems to indicate 
> > > that enabling 8 bit ecc mode requires 26 oob bytes per ecc step. However, 
> > > this seems to contradict the actual hardware test as the shown in the dump
> > > below of a zero filled page + oob:
> > > 
> > > # hexdump -C dump4
> > > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > *
> > > 00001000  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> > > 00001010  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> > > 00001020  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> > > 00001030  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
> > > 00001040  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
> > > 00001050  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
> > > 00001060  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
> > > 00001070  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> > > 00001080  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> > > 00001090  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> > > 000010a0  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
> > > 000010b0  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
> > > 000010c0  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
> > > 000010d0  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
> > > 
> > > As you can easily see, ecc steps start at 28 bytes interval, with 18
> > > bytes for ecc (matches documentation), and 10 bytes free.
> > How did you extract this page+oob from the nand flash? From Linux I
> > assume?
> 
> Got it form nanddump using:
> 
> 	nanddump -s 5238784 -f dump4 -o /dev/mtd2
OK, then there is also the driver in between the hardware and your
image. Can you show the changes you did to mxc_nand?
 
> > Can you try from barebox something like:
> > 
> > 	mw -w 0xbb001e08 0x0000 # READ0
> > 	mw -w 0xbb001e1c 0x01 # CMD cycle
> > 	mw -w 0xbb001e06 0x00 # Address = 0
> > 	mw -w 0xbb001e1c 0x02 # Address cycle
> > 	mw -w 0xbb001e1c 0x02 # Address cycle
> > 	mw -w 0xbb001e1c 0x02 # Address cycle (do we need three? [1])
> > 	mw -w 0xbb001e04 0x00
> > 	mw -w 0xbb001e1c 0x08 # NAND OUTPUT
> > 	md -w 0xbb000000+0x10f0
> > 
> > with ecc being disabled (i.e. CONFIG1, bit 3 = 0). Does this show the 28
> > bytes offset, too?
> 
> I (hopefuly) disabled ECC with:
> 
> 	mw -w 0xbb001e1a 0x0010
looks ok.

> Then, for the same page (using three address cycles, 0xff, 0x04, 0x00), I got 
> all zeros up to 0xbb001000 (inclusive), and then:
> 
> bb001010: 0000 0000 0000 0000 0000 ffff 28a7 428a            .............(.B
> bb001020: 89fa 2cd4 4640 560a 2634 ac7e e5d8 20ea            ...,@F.V4&~.... 
> bb001030: caaa c809 0195 8411 6972 6bfc 84d6 10af            ........ri.k....
> bb001040: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> bb001050: 0000 0000 0000 0000 0000 ffff f1da 19c3            ................
> bb001060: 21b2 0832 09c6 3c55 638c 3bb8 fd54 2983            .!2...U<.c.;T..)
> bb001070: 8325 6d98 0814 0d64 ee73 675e 1943 5cf2            %..m..d.s.^gC..\
> bb001080: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> bb001090: 0000 0000 0000 0000 0000 ffff c1bc 31fe            ...............1
> bb0010a0: 16ee ab6b 34a5 acad 0771 048c ac58 3f19            ..k..4..q...X..?
> bb0010b0: b699 a88f eb5a 00ae 7e3c 9c6d 2ba8 d72e            ....Z...<~m..+..
> bb0010c0: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> bb0010d0: 0000 0000 0000 0000 0000 ffff ae14 06c7            ................
> bb0010e0: 89b9 eb67 00d0 3648 daeb 15f5 77ca 8c09            ..g...H6.....w..

This is more or less expected. The "more" part is: Matching the hardware
description the (virtual) spare area is sorted into the spare area
buffers, so the first spare area is written to 0xbb001000, the 2nd to
0xbb001040 etc. (See table 36-3 in the manual.) So probably it's the
driver who doesn't get the sorting right. 

The "less" part however is that the data doesn't match what you see in
linux with nanddump. Hmm.

Can you retry the above commands after initializing the NFC buffer with
some pattern:

	memset -w 0xbb000000 0x55 0x1200

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
