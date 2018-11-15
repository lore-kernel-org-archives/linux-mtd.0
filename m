Received: from userp2130.oracle.com ([156.151.31.86])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNKmc-0005im-OD
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 16:46:24 +0000
Date: Thu, 15 Nov 2018 19:45:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@01.org, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: kbuild-all@01.org, boris.brezillon@bootlin.com, miquel.raynal@bootlin.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, michals@xilinx.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nagasuresh12@gmail.com, robh@kernel.org,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20181115164552.GB14069@unbuntlaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541739641-17789-4-git-send-email-naga.sureshkumar.relli@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Naga-Sureshkumar-Relli/dt-bindings-mtd-arasan-Add-device-tree-binding-documentation/20181110-034106
base:   git://git.infradead.org/linux-mtd.git nand/next

smatch warnings:
drivers/mtd/nand/raw/arasan_nand.c:353 anfc_rw_dma_op() warn: right shifting more than type allows 32 vs 32
drivers/mtd/nand/raw/arasan_nand.c:1032 anfc_setup_data_interface() warn: unsigned 'sdr->mode' is never less than zero.

# https://github.com/0day-ci/linux/commit/8db68ae6047a392d3e4092cbd6d3051eec1edd47
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 8db68ae6047a392d3e4092cbd6d3051eec1edd47
vim +353 drivers/mtd/nand/raw/arasan_nand.c

8db68ae6 Naga Sureshkumar Relli 2018-11-09  325  
8db68ae6 Naga Sureshkumar Relli 2018-11-09  326  static void anfc_rw_dma_op(struct mtd_info *mtd, u8 *buf, int len,
8db68ae6 Naga Sureshkumar Relli 2018-11-09  327  			   bool do_read, u32 prog, int pktcount, int pktsize)
8db68ae6 Naga Sureshkumar Relli 2018-11-09  328  {
8db68ae6 Naga Sureshkumar Relli 2018-11-09  329  	dma_addr_t paddr;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  330  	struct nand_chip *chip = mtd_to_nand(mtd);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  331  	struct anfc_nand_controller *nfc = to_anfc(chip->controller);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  332  	struct anfc_nand_chip *achip = to_anfc_nand(chip);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  333  	u32 eccintr = 0, dir;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  334  
8db68ae6 Naga Sureshkumar Relli 2018-11-09  335  	if (pktsize == 0)
8db68ae6 Naga Sureshkumar Relli 2018-11-09  336  		pktsize = len;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  337  
8db68ae6 Naga Sureshkumar Relli 2018-11-09  338  	anfc_setpktszcnt(nfc, pktsize, pktcount);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  339  
8db68ae6 Naga Sureshkumar Relli 2018-11-09  340  	if (!achip->strength)
8db68ae6 Naga Sureshkumar Relli 2018-11-09  341  		eccintr = MBIT_ERROR;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  342  
8db68ae6 Naga Sureshkumar Relli 2018-11-09  343  	if (do_read)
8db68ae6 Naga Sureshkumar Relli 2018-11-09  344  		dir = DMA_FROM_DEVICE;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  345  	else
8db68ae6 Naga Sureshkumar Relli 2018-11-09  346  		dir = DMA_TO_DEVICE;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  347  	paddr = dma_map_single(nfc->dev, buf, len, dir);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  348  	if (dma_mapping_error(nfc->dev, paddr)) {
8db68ae6 Naga Sureshkumar Relli 2018-11-09  349  		dev_err(nfc->dev, "Read buffer mapping error");
8db68ae6 Naga Sureshkumar Relli 2018-11-09  350  		return;
8db68ae6 Naga Sureshkumar Relli 2018-11-09  351  	}
8db68ae6 Naga Sureshkumar Relli 2018-11-09  352  	writel(paddr, nfc->base + DMA_ADDR0_OFST);
8db68ae6 Naga Sureshkumar Relli 2018-11-09 @353  	writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
                                                               ^^^^^^^^^^^^^
This is zero.  Which is probably intended and fine...  I was hoping it
would have the other line 1032 warning in the email...

8db68ae6 Naga Sureshkumar Relli 2018-11-09  354  	anfc_enable_intrs(nfc, (XFER_COMPLETE | eccintr));
8db68ae6 Naga Sureshkumar Relli 2018-11-09  355  	writel(prog, nfc->base + PROG_OFST);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  356  	anfc_wait_for_event(nfc);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  357  	dma_unmap_single(nfc->dev, paddr, len, dir);
8db68ae6 Naga Sureshkumar Relli 2018-11-09  358  }
8db68ae6 Naga Sureshkumar Relli 2018-11-09  359  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
