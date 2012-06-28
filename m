Message-ID: <4FEC16BF.5060905@atmel.com>
Date: Thu, 28 Jun 2012 10:33:03 +0200
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>, <linux-mtd@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH v12 0/2] MTD: at91: Add PMECC support for at91 nand flash
 driver
References: <1340871698-477-1-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1340871698-477-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: hongxu.cn@gmail.com, richard.genoud@gmail.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/28/2012 10:21 AM, Josh Wu :
> Those patches is based on the l2-mtd.git three.
> 
> Since there are two patches of v11 already pushed, so this version v12 only includes the left two patches.
> which includes the modification according to Richard Genoud's review suggestion.
> 
> Changes since v11,
> 	add documentation for atmel nand reg parameter and one example for PMECC support.
> 	fix the bug: no error reported when fail to get resoures of PMECC ERRLOC or ROM.
> 	fix the bug: no correction when ecc data has bit flipped.
> 	add clearer debug information for data correction.
> 
> Josh Wu (2):
>   MTD: at91: add dt parameters for Atmel PMECC
>   MTD: at91: atmel_nand: Update driver to support Programmable Multibit
>     ECC controller
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |   40 +-
>  drivers/mtd/nand/atmel_nand.c                      |  801 +++++++++++++++++++-
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  114 ++-
>  3 files changed, 951 insertions(+), 4 deletions(-)

Nice work for making this append Josh!

Thanks, I will add my "Acked-by" line but I guess that it is not so
important as many people kindly already reviewed and tested the patch
series: a big thanks to all of you!

Best regards,
-- 
Nicolas Ferre
