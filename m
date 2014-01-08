Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::6])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0oC9-0005tD-4b
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 08:08:58 +0000
Message-ID: <52CD077F.8080203@denx.de>
Date: Wed, 08 Jan 2014 09:08:31 +0100
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 0/4] mtd: nand: omap: optimize chip->ecc.calculate()
 for H/W ECC schemes
References: <1389102346-1455-1-git-send-email-pekon@ti.com>
In-Reply-To: <1389102346-1455-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07.01.2014 14:45, Pekon Gupta wrote:
> This patch series is split version of earlier patch:
> http://lists.infradead.org/pipermail/linux-mtd/2013-November/050240.html
> 
> chip->ecc.calculate() is used for calculating and fetching of ECC syndrome by
> processing the data passed during Read/Write accesses.
> Though all H/W ECC schemes in OMAP NAND use GPMC controller for ECC calculation
> But each of them implements its own callback to process and fetch ECC syndrome.
> 
> This patch tries to merge common code for different BCHx_ECC schemes into single
> omap_calculate_ecc_bch(). This imporves scalability for future ecc-schemes.
>  +----------------------+----------------------------+
>  | ecc-scheme           | nand_chip->ecc.calculate   |
>  +----------------------+----------------------------+
>  | HAM1_ECC             | omap_calculate_ecc()       |
>  | BCH4_HW_DETECTION_SW | omap3_calculate_ecc_bch4() |
>  | BCH4_HW              | omap3_calculate_ecc_bch()  |
>  | BCH8_HW_DETECTION_SW | omap3_calculate_ecc_bch8() |
>  | BCH8_HW              | omap3_calculate_ecc_bch()  |
>  +----------------------+----------------------------+
> 
> 
> Pekon Gupta (4):
>   mtd: nand: omap: ecc.calculate: rename omap3_calculate_ecc_bch to
>     omap_calculate_ecc_bch
>   mtd: nand: omap: ecc.calculate: refactor omap_calculate_ecc_bch for
>     BCHx_HW ecc-scheme
>   mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4 in
>     omap_calculate_ecc_bch
>   mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch8 in
>     omap_calculate_ecc_bch
> 
>  drivers/mtd/nand/omap2.c | 187 +++++++++++++++--------------------------------
>  1 file changed, 60 insertions(+), 127 deletions(-)

Thanks Pekon. This works just fine on our AM335x based board. So, for
the complete patch series:

Tested-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
