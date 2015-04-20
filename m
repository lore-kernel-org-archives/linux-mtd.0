Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yk3lE-0000XL-MW
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2015 04:56:46 +0000
Date: Mon, 20 Apr 2015 07:56:14 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: i.MX25 NFC with 8 bit ecc strength
Message-ID: <20150420045614.GC5428@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shawn, Sascha, all,

I'm trying to get nand_ecclayout right on i.MX25 with the Micron 
MT29F8G08ABABA (page size: 4096, oob size: 224). The large OOB size allows 
using hardware ecc strength of 8bit per ecc step (512 bytes). The mxc_nand 
driver code (get_eccsize()) and the reference manual seems to indicate that 
enabling 8 bit ecc mode requires 26 oob bytes per ecc step. However, this 
seems to contradict the actual hardware test as the shown in the dump below of 
a zero filled page + oob:

# hexdump -C dump4
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
00001010  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
00001020  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
00001030  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
00001040  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
00001050  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
00001060  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|
00001070  ff ff ff ff ff ff ff 91  c4 45 be 32 45 6f 5d b1  |.........E.2Eo].|
00001080  b1 b9 13 61 59 7d 42 58  eb ff ff ff ff ff ff ff  |...aY}BX........|
00001090  ff ff ff 91 c4 45 be 32  45 6f 5d b1 b1 b9 13 61  |.....E.2Eo]....a|
000010a0  59 7d 42 58 eb ff ff ff  ff ff ff ff ff ff ff 91  |Y}BX............|
000010b0  c4 45 be 32 45 6f 5d b1  b1 b9 13 61 59 7d 42 58  |.E.2Eo]....aY}BX|
000010c0  eb ff ff ff ff ff ff ff  ff ff ff 91 c4 45 be 32  |.............E.2|
000010d0  45 6f 5d b1 b1 b9 13 61  59 7d 42 58 eb ff ff ff  |Eo]....aY}BX....|

As you can easily see, ecc steps start at 28 bytes interval, with 18 bytes for 
ecc (matches documentation), and 10 bytes free.

So who should I believe? Has anyone ever tried using 8 bit ecc mode with any 
variant of the i.MX NFC?

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
