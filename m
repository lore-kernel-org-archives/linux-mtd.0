Date: Fri, 1 Apr 2016 17:34:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Roger Quadros <rogerq@ti.com>, Tony Lindgren
 <tony@atomide.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu
 <rainyfeeling@outlook.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>,
 linux-omap@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni
 <alexandre.belloni@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@googlegroups.com, Zhou Wang <wangzhou1@hisilicon.com>, Alex
 Smith <alex.smith@imgtec.com>, Harvey Hunt <harvey.hunt@imgtec.com>
Subject: Re: [PATCH 12/12] mtd: nand: move of_get_nand_xxx() helpers into
 nand_base.c
Message-ID: <20160401173448.2a9344c5@bbrezillon>
In-Reply-To: <201604012200.EksFk1z5%fengguang.wu@intel.com>
References: <1459515272-31011-13-git-send-email-boris.brezillon@free-electrons.com>
 <201604012200.EksFk1z5%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 1 Apr 2016 22:13:43 +0800
kbuild test robot <lkp@intel.com> wrote:

> Hi Boris,
> 
> [auto build test WARNING on next-20160401]
> [cannot apply to v4.6-rc1 v4.5-rc7 v4.5-rc6 v4.6-rc1]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Boris-Brezillon/mtd-get-rid-of-of_mtd-c-h-and-of_get_nand_xx/20160401-210220
> reproduce: make htmldocs
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/mtd/nand/nand_base.c:3972: warning: cannot understand function prototype: 'const char * const nand_ecc_modes[] = '
>    drivers/mtd/nand/nand_bbt.c:1: warning: no structured comments found
> >> drivers/mtd/nand/nand_base.c:3972: warning: cannot understand function prototype: 'const char * const nand_ecc_modes[] = '
> 
> vim +3972 drivers/mtd/nand/nand_base.c
> 
>   3956					chip->jedec_params.model);
>   3957		else
>   3958			pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
>   3959					type->name);
>   3960	
>   3961		pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
>   3962			(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
>   3963			mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
>   3964		return type;
>   3965	}
>   3966	
>   3967	/**
>   3968	 * It maps 'enum nand_ecc_modes_t' found in include/linux/mtd/nand.h
>   3969	 * into the device tree binding of 'nand-ecc', so that MTD
>   3970	 * device driver can get nand ecc from device tree.
>   3971	 */

I'll remove this kerneldoc header to avoid this warning.

> > 3972	static const char * const nand_ecc_modes[] = {
>   3973		[NAND_ECC_NONE]		= "none",
>   3974		[NAND_ECC_SOFT]		= "soft",
>   3975		[NAND_ECC_HW]		= "hw",
>   3976		[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
>   3977		[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
>   3978		[NAND_ECC_SOFT_BCH]	= "soft_bch",
>   3979	};
>   3980	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
