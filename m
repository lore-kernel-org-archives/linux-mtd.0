Date: Thu, 9 Jan 2014 17:33:26 +0100
From: Rodolfo Giometti <giometti@enneenne.com>
Sender: giometti@enneenne.com
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Message-ID: <20140109163326.GD17831@enneenne.com>
References: <20140102124407.GF10251@enneenne.com>
 <20140102144236.270c4a6a@skate>
 <20140103112926.GP10251@enneenne.com>
 <20140103145336.GA9618@localhost>
 <20140106153438.GX10251@enneenne.com>
 <20140108233603.GB2595@localhost>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <20140108233603.GB2595@localhost>
Subject: Re: NAND support for Armada 370
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Michele Dionisio <michele@cynny.com>, linux-mtd@lists.infradead.org,
 Gregory =?iso-8859-15?Q?Cl=E9ment?= <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2014 at 08:36:03PM -0300, Ezequiel Garcia wrote:
> Hi Rodolfo,
> 
> Sorry for being so unresponsive these days, I've been on vacation.
> I'll review your patch on Monday.

Ok.

> In fact, already took a quick look and it looks good. I have a few
> doubts:
> 
> 1. Do we need the ECC layout? (MTD already provides defaults)

Ok, I did some testes and we can safely remove it! :)

> 2. Is this compatible with Marvell's U-Boot? (can you write from U-Boot,
> and read from Linux, and viceversa?)

Till now all our tests are ok! :)

Attached is the new patch release.

Ciao,

Rodolfo

-- 

GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
Freelance ICT Italia - Consulente ICT Italia - www.consulenti-ict.it

--zYM0uCDKw75PZbzx
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-mtd-pxa3xx_nand.c-add-support-for-2048-bytes-page-si.patch"

>From 4463f70a77f6aaea216b53e620171c37fb1d4eb3 Mon Sep 17 00:00:00 2001
From: Rodolfo Giometti <giometti@linux.it>
Date: Mon, 6 Jan 2014 16:18:49 +0100
Subject: [PATCH] mtd pxa3xx_nand.c: add support for 2048 bytes page size
 layout

Tested-by: Michele Dionisio <michele@cynny.com>
Signed-off-by: Rodolfo Giometti <giometti@linux.it>
---
 drivers/mtd/nand/pxa3xx_nand.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 31aae53..fdc179c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1360,6 +1360,16 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 	 * Required ECC: 4-bit correction per 512 bytes
 	 * Select: 16-bit correction per 2048 bytes
 	 */
+	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 2048) {
+		info->ecc_bch = 1;
+		info->chunk_size = 2048;
+		info->spare_size = 32;
+		info->ecc_size = 32;
+		ecc->mode = NAND_ECC_HW;
+		ecc->size = info->chunk_size;
+		ecc->strength = 16;
+		return 1;
+
 	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
-- 
1.8.1.2


--zYM0uCDKw75PZbzx--
