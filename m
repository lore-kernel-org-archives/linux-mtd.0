Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFKFj-0005dB-Hj
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 09:12:41 +0000
Date: Mon, 17 Feb 2014 10:11:52 +0100
From: Albert ARIBAUD <albert.u.boot@aribaud.net>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [U-Boot] [PATCH v3 1/3] mtd: nand: omap: fix ecclayout to be in
 sync with u-boot NAND driver
Message-ID: <20140217101152.1fb2dd50@lilith>
In-Reply-To: <1392622885-8415-2-git-send-email-pekon@ti.com>
References: <1392622885-8415-1-git-send-email-pekon@ti.com>
 <1392622885-8415-2-git-send-email-pekon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Stefan Roese <sr@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Felipe Balbi <balbi@ti.com>, u-boot@lists.denx.de,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, stable@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Mon, 17 Feb 2014 13:11:23 +0530, Pekon Gupta <pekon@ti.com> wrote:

> Fixes: commit a919e51161b58ed7e6e663daba99ab7d558808f3
>        mtd: nand: omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in device_probe
> 
> Fixes ecclayout mismatch introduced in above commit for following ecc-schemes:
>  - OMAP_ECC_BCH4_CODE_HW_DETECTION_SW
>  - OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
>  However, this patch also touches other ecc-schemes as the fix required
>  refactoring common code, into ecc-scheme specific code.
> 
> This patch aligns ecc-layout for below ecc-schemes as per reference [1],[2],[3]
> 
>  +---+------------+-------------++-------------+-------------+
>  |OOB|BCH8_CODE_HW|BCH8_CODE_HW_||HAM1_CODE_HW |HAM1_CODE_HW |
>  |pos|            | DETECTION_SW||(x8 device)  |(x16 device) |
>  +---+------------+-------------++-------------+-------------+
>  | 0 |BADBLK_MARK | BADBLK_MARK || BADBLK_MARK | BADBLK_MARK |
>  | 1 |BADBLK_MARK | BADBLK_MARK || eccpos[0]   | BADBLK_MARK |
>  | 2 | eccpos[0]  | eccpos[0]   || eccpos[1]   | eccpos[0]   |
>  | 3 | eccpos[1]  | eccpos[1]   || eccpos[2]   | eccpos[1]   |
>  | 4 | eccpos[2]  | eccpos[2]   || eccpos[3]   | eccpos[2]   |
>  | 5 | eccpos[3]  | eccpos[3]   || eccpos[4]   | eccpos[3]   |
>  | 6 | eccpos[4]  | eccpos[4]   || eccpos[5]   | eccpos[4]   |
>  | 7 | eccpos[5]  | eccpos[5]   || eccpos[6]   | eccpos[5]   |
>  | 8 | eccpos[6]  | eccpos[6]   || eccpos[7]   | eccpos[6]   |
>  | 9 | eccpos[7]  | eccpos[7]   || eccpos[8]   | eccpos[7]   |
>  |10 | eccpos[8]  | eccpos[8]   || eccpos[9]   | eccpos[8]   |
>  |11 | eccpos[9]  | eccpos[9]   || eccpos[10]  | eccpos[9]   |
>  |12 | eccpos[10] | eccpos[10]  || eccpos[11]  | eccpos[10]  |
>  |13 | eccpos[11] | eccpos[11]  || oobfree[0]  | eccpos[11]  |
>  |14 | eccpos[12] | eccpos[12]  || oobfree[1]  | oobfree[0]  |
>  |15 | eccpos[13] | <reserved>  || oobfree[2]  | oobfree[1]  |
>  +---+------------+-------------++-------------+-------------+
>  |16 | eccpos[14] | eccpos[13]  || oobfree[3]  | oobfree[2]  |
>  |...| [...]      | [...]       || [...]       | [...]       |
>  |56 | eccpos[54] | eccpos[51]  || oobfree[43] | oobfree[42] |
>  |57 | eccpos[55] | <reserved>  || oobfree[44] | oobfree[43] |
>  +===+============+=============+==============+=============+
>  |58 | oobfree[0] | oobfree[0]  || oobfree[45] | oobfree[44] |
>  |59 | oobfree[1] | oobfree[1]  || oobfree[46] | oobfree[45] |
>  |60 | oobfree[2] | oobfree[2]  || oobfree[47] | oobfree[46] |
>  |61 | oobfree[3] | oobfree[3]  || oobfree[48] | oobfree[47] |
>  |62 | oobfree[4] | oobfree[4]  || oobfree[49] | oobfree[48] |
>  |63 | oobfree[5] | oobfree[5]  || oobfree[50] | oobfree[49] |
>  +---+------------+-------------+--------------+-------------+
> 
> [1] ecc-layout expected by ROM code, as specified in SoC TRM under:
>       Chapter="Initialization"
>         Section="Device Initialization by ROM code"
>             Sub-Section="Memory Booting"
>                 Heading="NAND"
>                 Figure="ECC Locations in NAND Spare Areas"
> 
> [2] ecc-layout updates in u-boot
>     http://lists.denx.de/pipermail/u-boot/2013-November/167551.html
> 
> [3] u-boot configurations to match above ecc-layout are documented at
>     https://processors.wiki.ti.com/index.php/Linux_Core_NAND_User%27s_Guide
> 
> CC: <stable@vger.kernel.org> # 3.13.x+
> Reported-by: Enric Balletbo Serra <eballetbo@iseebcn.com>
> Tested-by: Enric Balletbo i Serra <eballetbo@gmail.com>
> Tested-by: Stefan Roese <sr@denx.de>
> Signed-off-by: Pekon Gupta <pekon@ti.com>

Seems to me that the commit message above could actually be placed in
a doc/README.* file, making the commit message itself less bulky.

> ---
>  drivers/mtd/nand/omap2.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)

Amicalement,
-- 
Albert.
