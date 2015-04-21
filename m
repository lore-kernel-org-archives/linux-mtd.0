Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YkSmp-0004Dd-4M
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 07:40:04 +0000
Date: Tue, 21 Apr 2015 09:39:36 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150421073936.GI2552@pengutronix.de>
References: <20150420045614.GC5428@tarshish>
 <20150420073702.GA2552@pengutronix.de>
 <20150420091130.GD5428@tarshish>
 <20150420154818.GE2552@pengutronix.de>
 <20150421062428.GJ5428@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150421062428.GJ5428@tarshish>
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

On Tue, Apr 21, 2015 at 09:24:28AM +0300, Baruch Siach wrote:
> On Mon, Apr 20, 2015 at 05:48:18PM +0200, Uwe Kleine-König wrote:
> > On Mon, Apr 20, 2015 at 12:11:30PM +0300, Baruch Siach wrote:
> > > On Mon, Apr 20, 2015 at 09:37:02AM +0200, Uwe Kleine-König wrote:
> > > > On Mon, Apr 20, 2015 at 07:56:14AM +0300, Baruch Siach wrote:
> > > > > I'm trying to get nand_ecclayout right on i.MX25 with the Micron 
> > > > > MT29F8G08ABABA (page size: 4096, oob size: 224). The large OOB size 
> > > > > allows using hardware ecc strength of 8bit per ecc step (512 bytes). 
> > > > > The mxc_nand driver code (get_eccsize()) and the reference manual 
> > > > > seems to indicate that enabling 8 bit ecc mode requires 26 oob bytes 
> > > > > per ecc step. However, this seems to contradict the actual hardware 
> > > > > test as the shown in the dump
> > > > > below of a zero filled page + oob:
> > > > > 
> > > > > # hexdump -C dump4
> > > > > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > > > *
> > > > > 00001000  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> > > > > 00001010  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> > > > > 00001020  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> > > > > 00001030  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
> > > > > 00001040  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
> > > > > 00001050  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
> > > > > 00001060  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
> > > > > 00001070  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
> > > > > 00001080  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
> > > > > 00001090  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
> > > > > 000010a0  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
> > > > > 000010b0  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
> > > > > 000010c0  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
> > > > > 000010d0  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
> > > > > 
> > > > > As you can easily see, ecc steps start at 28 bytes interval, with 18
> > > > > bytes for ecc (matches documentation), and 10 bytes free.
> > > > How did you extract this page+oob from the nand flash? From Linux I
> > > > assume?
> > > 
> > > Got it form nanddump using:
> > > 
> > > 	nanddump -s 5238784 -f dump4 -o /dev/mtd2
> > OK, then there is also the driver in between the hardware and your
> > image. Can you show the changes you did to mxc_nand?
> 
> I generated the dump above on an old kernel (v2.6.36.4) that includes a number 
> of changes needed to support 4K pages and large OOB.
> 
> I have generated an almost exact same dump using v4.0-rc1 based l2-mtd master 
> as of d09957fbb4d (which includes your mxc_nand ONFI support code; works 
> perfectly, BTW). My only local change is commenting out the copy_spare() call 
> in the NAND_CMD_PAGEPROG case at mxc_nand_command().
> 
> > > > Can you try from barebox something like:
> > > > 
> > > > 	mw -w 0xbb001e08 0x0000 # READ0
> > > > 	mw -w 0xbb001e1c 0x01 # CMD cycle
> > > > 	mw -w 0xbb001e06 0x00 # Address = 0
> > > > 	mw -w 0xbb001e1c 0x02 # Address cycle
> > > > 	mw -w 0xbb001e1c 0x02 # Address cycle
> > > > 	mw -w 0xbb001e1c 0x02 # Address cycle (do we need three? [1])
> > > > 	mw -w 0xbb001e04 0x00
> > > > 	mw -w 0xbb001e1c 0x08 # NAND OUTPUT
> > > > 	md -w 0xbb000000+0x10f0
> > > > 
> > > > with ecc being disabled (i.e. CONFIG1, bit 3 = 0). Does this show the 28
> > > > bytes offset, too?
> > > 
> > > I (hopefuly) disabled ECC with:
> > > 
> > > 	mw -w 0xbb001e1a 0x0010
> > looks ok.
> > 
> > > Then, for the same page (using three address cycles, 0xff, 0x04, 0x00), I got 
> > > all zeros up to 0xbb001000 (inclusive), and then:
> > > 
> > > bb001010: 0000 0000 0000 0000 0000 ffff 28a7 428a            .............(.B
> > > bb001020: 89fa 2cd4 4640 560a 2634 ac7e e5d8 20ea            ...,@F.V4&~.... 
> > > bb001030: caaa c809 0195 8411 6972 6bfc 84d6 10af            ........ri.k....
> > > bb001040: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> > > bb001050: 0000 0000 0000 0000 0000 ffff f1da 19c3            ................
> > > bb001060: 21b2 0832 09c6 3c55 638c 3bb8 fd54 2983            .!2...U<.c.;T..)
> > > bb001070: 8325 6d98 0814 0d64 ee73 675e 1943 5cf2            %..m..d.s.^gC..\
> > > bb001080: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> > > bb001090: 0000 0000 0000 0000 0000 ffff c1bc 31fe            ...............1
> > > bb0010a0: 16ee ab6b 34a5 acad 0771 048c ac58 3f19            ..k..4..q...X..?
> > > bb0010b0: b699 a88f eb5a 00ae 7e3c 9c6d 2ba8 d72e            ....Z...<~m..+..
> > > bb0010c0: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> > > bb0010d0: 0000 0000 0000 0000 0000 ffff ae14 06c7            ................
> > > bb0010e0: 89b9 eb67 00d0 3648 daeb 15f5 77ca 8c09            ..g...H6.....w..
> > 
> > This is more or less expected. The "more" part is: Matching the hardware
> > description the (virtual) spare area is sorted into the spare area
> > buffers, so the first spare area is written to 0xbb001000, the 2nd to
> > 0xbb001040 etc. (See table 36-3 in the manual.) So probably it's the
> > driver who doesn't get the sorting right. 
> 
> OK. I see what you mean. The 28 bytes interval has noting to do with hardware. 
> It comes from this line in copy_spare():
> 
> 	j = (mtd->oobsize / n >> 1) << 1;
> 
> In my case oobsize = 224, and n = 8 (512 bytes steps), so j == 28. This means 
> that we must generate nand_ecclayout at run time according to the actual 
> oobsize. This is probably also true for the 4 bit ecc case.
I think you're only partly right here. The NFC only supports 128 or 218
bytes spare area for 4k NAND flashes (initialized by BT_SPARE_SIZE). For
you chip the controller uses the 218 bytes setting, so 26 bytes are read
for the first 7 oob chunks each (last one: 36) As the driver assumes the
real oob size of 224 bytes you get that offset of 28 instead.

So looking again on your hexdump:

	00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
	*
This is the data part, everything in order

	00001000  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
	00001010  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
Up to the 26th byte --------------------------^^ this is data coming
from the flash. The following two 0xff are just what happened to be
written in the NFC buffer. Starting with the four last 0xff in that line
we have real data again.

	00001020  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
which makes the first ecc byte again the 8th of the oob chunk similar to
the one above.

> > The "less" part however is that the data doesn't match what you see in
> > linux with nanddump. Hmm.
> > 
> > Can you retry the above commands after initializing the NFC buffer with
> > some pattern:
> > 
> > 	memset -w 0xbb000000 0x55 0x1200
> 
> With this I get:
> 
> bb001010: 0000 0000 0000 0000 0000 5555 5555 5555            ..........UUUUUU
> bb001020: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> bb001030: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> bb001040: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> bb001050: 0000 0000 0000 0000 0000 5555 5555 5555            ..........UUUUUU
> bb001060: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> bb001070: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> bb001080: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> bb001090: 0000 0000 0000 0000 0000 5555 5555 5555            ..........UUUUUU
> bb0010a0: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> bb0010b0: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> bb0010c0: 0000 0000 0000 0000 0000 0000 0000 0000            ................
> bb0010d0: 0000 0000 0000 0000 0000 5555 5555 5555            ..........UUUUUU
> bb0010e0: 5555 5555 5555 5555 5555 5555 5555 5555            UUUUUUUUUUUUUUUU
> 
> with anything else zero filled. This is probably misleading, since I get the 
> same output (i.e. all zeros) even for pages that contain data.
I assume some setting is wrong/missing. But I saw enough to understand
the issue (at least I'm convinced that I did :-)

While understanding the problem I produced the following (untested)
patch:


diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index dca63a70e783..fc835d352e1c 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -807,32 +807,49 @@ static void mxc_nand_select_chip_v2(struct mtd_info *mtd, int chip)
 }
 
 /*
- * Function to transfer data to/from spare area.
+ * The controller splits a page into data chunks of 512 bytes + partial oob.
+ * There are writesize / 512 such chunks, the size of the partial oob parts is
+ * oobsize / #chunks rounded down to a multiple of 2. The last oob chunk then
+ * contains additionally the byte lost by rounding (if any).
+ * This function handles the needed shuffling between host->data_buf (which
+ * holds a page in natural order, i.e. writesize bytes data + oobsize bytes
+ * spare) and the NFC buffer.
  */
 static void copy_spare(struct mtd_info *mtd, bool bfrom)
 {
 	struct nand_chip *this = mtd->priv;
 	struct mxc_nand_host *host = this->priv;
 	u16 i, j;
-	u16 n = mtd->writesize >> 9;
+
+	u16 num_chunks = mtd->writesize / 512;
+
 	u8 *d = host->data_buf + mtd->writesize;
 	u8 __iomem *s = host->spare0;
-	u16 t = host->devtype_data->spare_len;
+	u16 sparebuf_size = host->devtype_data->spare_len;
 
-	j = (mtd->oobsize / n >> 1) << 1;
+	/* size of oob chunk for all but possibly the last one */
+	oob_chunk_size = (mtd->oobsize / num_chunks >> 1) << 1;
 
 	if (bfrom) {
-		for (i = 0; i < n - 1; i++)
-			memcpy32_fromio(d + i * j, s + i * t, j);
+		for (i = 0; i < num_chunks - 1; i++)
+			memcpy32_fromio(d + i * oob_chunk_size,
+					s + i * sparebuf_size,
+					oob_chunk_size);
 
 		/* the last section */
-		memcpy32_fromio(d + i * j, s + i * t, mtd->oobsize - i * j);
+		memcpy32_fromio(d + i * oob_chunk_size,
+				s + i * sparebuf_size,
+				mtd->oobsize - i * oob_chunk_size);
 	} else {
-		for (i = 0; i < n - 1; i++)
-			memcpy32_toio(&s[i * t], &d[i * j], j);
+		for (i = 0; i < num_chunks - 1; i++)
+			memcpy32_toio(&s[i * sparebuf_size],
+				      &d[i * oob_chunk_size],
+				      oob_chunk_size);
 
 		/* the last section */
-		memcpy32_toio(&s[i * t], &d[i * j], mtd->oobsize - i * j);
+		memcpy32_toio(&s[oob_chunk_size * sparebuf_size],
+			      &d[i * oob_chunk_size],
+			      mtd->oobsize - i * oob_chunk_size);
 	}
 }

What is needed now on top of this (untested and noop) change is to use
the oob size the controller assumes instead of the real one and somehow
explain that to the mtd layer and maintainers :-)
 
Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
