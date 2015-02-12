Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YM1Re-00061N-Ts
 for linux-mtd@lists.infradead.org; Thu, 12 Feb 2015 21:37:11 +0000
Received: by pdbnh10 with SMTP id nh10so10449775pdb.11
 for <linux-mtd@lists.infradead.org>; Thu, 12 Feb 2015 13:36:49 -0800 (PST)
Date: Thu, 12 Feb 2015 13:36:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: kbuild test robot <fengguang.wu@intel.com>,
 Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [next:master 8896/9415] drivers/mtd/nand/hisi504_nand.c:375:26:
 sparse: cast removes address space of expression
Message-ID: <20150212213645.GZ18140@ld-irv-0074>
References: <201502111555.q8V9IcSN%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201502111555.q8V9IcSN%fengguang.wu@intel.com>
Cc: Zhou Wang <wangzhou1@hisilicon.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd

Hi,

On Wed, Feb 11, 2015 at 03:49:56PM +0800, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   5721f7f0f14b682d2e86e9a4aa9025acaf69399d
> commit: 54f531f6e332875bd8a604871532f7f1174adc0e [8896/9415] mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
> reproduce:
>   # apt-get install sparse
>   git checkout 54f531f6e332875bd8a604871532f7f1174adc0e
>   make ARCH=x86_64 allmodconfig
>   make C=1 CF=-D__CHECK_ENDIAN__
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
> >> drivers/mtd/nand/hisi504_nand.c:375:26: sparse: cast removes address space of expression
> >> drivers/mtd/nand/hisi504_nand.c:380:26: sparse: cast removes address space of expression
>    drivers/mtd/nand/hisi504_nand.c:490:28: sparse: incorrect type in argument 1 (different address spaces)
>    drivers/mtd/nand/hisi504_nand.c:490:28:    expected void *s
>    drivers/mtd/nand/hisi504_nand.c:490:28:    got void [noderef] <asn:2>*mmio
>    drivers/mtd/nand/hisi504_nand.c:502:28: sparse: incorrect type in argument 1 (different address spaces)
>    drivers/mtd/nand/hisi504_nand.c:502:28:    expected void *s
>    drivers/mtd/nand/hisi504_nand.c:502:28:    got void [noderef] <asn:2>*mmio
>    drivers/mtd/nand/hisi504_nand.c:625:20: sparse: incorrect type in argument 1 (different address spaces)
>    drivers/mtd/nand/hisi504_nand.c:625:20:    expected void *s
>    drivers/mtd/nand/hisi504_nand.c:625:20:    got void [noderef] <asn:2>*mmio
>    drivers/mtd/nand/hisi504_nand.c:890:1: sparse: symbol '__UNIQUE_ID_author__COUNTER__' has multiple initializers (originally initialized at drivers/mtd/nand/hisi504_nand.c:889)
> 
> vim +375 drivers/mtd/nand/hisi504_nand.c
> 
>    369	static uint8_t hisi_nfc_read_byte(struct mtd_info *mtd)
>    370	{
>    371		struct nand_chip *chip = mtd->priv;
>    372		struct hinfc_host *host = chip->priv;
>    373	
>    374		if (host->command == NAND_CMD_STATUS)
>  > 375			return *(uint8_t *)(host->mmio);

Yeah, this probably should be readb() or __raw_readb().

Zhou, why did you change this, again? I believe you made this change
somewhere in the several revisions of your driver. I'm inclined to patch
this before sending a pullreq to Linus.

>    376	
>    377		host->offset++;
>    378	
>    379		if (host->command == NAND_CMD_READID)
>  > 380			return *(uint8_t *)(host->mmio + host->offset - 1);

Same here.

>    381	
>    382		return *(uint8_t *)(host->buffer + host->offset - 1);
>    383	}
> 

Brian
