Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Daw9a-0000D1-Lc
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 09:42:36 -0400
Received: from pajko (helo=localhost)
	by kukac.halom.u-szeged.hu with local-esmtp (Exim 4.34)
	id 1Daw9U-0001sK-BG
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 15:42:29 +0200
Date: Wed, 25 May 2005 15:42:28 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.61.0505251538550.7178@kukac.halom.u-szeged.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Subject: [PATCH] nandsim own geometry using module parameters
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi!

I!ve added several module parameters for setting a geometry. The first entry of 
the nand_ids table is modified based on the given values. Hope this way is 
better.

Tested with

insmod nandsim.ko idbytes=4 page_size=2048 oob_size=64 block_size=128 \
   flash_size=32

and

insmod nandsim.ko idbytes=2 page_size=512 block_size=16 flash_size=32

Bye,

   Patrik Kluba

--

diff -Naur mtd-work/drivers/mtd/nand/nandsim.c mtd-nandsim/drivers/mtd/nand/nandsim.c
--- mtd-work/drivers/mtd/nand/nandsim.c	2005-05-23 07:48:34.000000000 +0200
+++ mtd-nandsim/drivers/mtd/nand/nandsim.c	2005-05-25 15:37:39.000000000 +0200
@@ -96,6 +96,14 @@
  static uint log            = CONFIG_NANDSIM_LOG;
  static uint dbg            = CONFIG_NANDSIM_DBG;

+static uint idbytes        = 2;
+static uint flash_size     = 0;
+static uint block_size     = 0;
+static uint page_size      = 0;
+static uint oob_size       = 0;
+
+static char *chipname = "NANDSIM";
+
  module_param(first_id_byte,  uint, 0400);
  module_param(second_id_byte, uint, 0400);
  module_param(third_id_byte,  uint, 0400);
@@ -110,6 +118,12 @@
  module_param(log,            uint, 0400);
  module_param(dbg,            uint, 0400);

+module_param(idbytes,        uint, 0400);
+module_param(flash_size,     uint, 0400);
+module_param(block_size,     uint, 0400);
+module_param(page_size,      uint, 0400);
+module_param(oob_size,       uint, 0400);
+
  MODULE_PARM_DESC(first_id_byte,  "The fist byte returned by NAND Flash 'read ID' command (manufaturer ID)");
  MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
  MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command");
@@ -124,9 +138,15 @@
  MODULE_PARM_DESC(log,            "Perform logging if not zero");
  MODULE_PARM_DESC(dbg,            "Output debug information if not zero");

+MODULE_PARM_DESC(idbytes,        "Number of ID bytes of the simulated chip");
+MODULE_PARM_DESC(flash_size,     "Size of the simulated flash in megabytes");
+MODULE_PARM_DESC(block_size,     "Block size of the simulated chip in kilobytes");
+MODULE_PARM_DESC(page_size,      "Page size of the simulated chip in bytes");
+MODULE_PARM_DESC(oob_size,       "OOB size of the simulated chip in bytes");
+
  /* The largest possible page size */
  #define NS_LARGEST_PAGE_SIZE	2048
- 
+
  /* The prefix for simulator output */
  #define NS_OUTPUT_PREFIX "[nandsim]"

@@ -1496,7 +1516,74 @@
  		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
  		return -EINVAL;
  	}
- 
+
+	if (flash_size || block_size || page_size) {
+	  if (!((flash_size && block_size && page_size && oob_size && (idbytes==4)) ||
+	        (flash_size && block_size && page_size && (idbytes == 2)))) {
+	    NS_ERR("you have to specify all of flash_size, block_size, page_size, "
+	           "oob_size, if you specify one of them.\n");
+	    return -EINVAL;
+	  }
+	  if (idbytes == 4) {
+	    int oobmul, pageval, blockval, buswval, oobval;
+	    oobmul = page_size / oob_size;
+	    if ((oobmul != 8) && (oobmul != 16) && (oobmul != 32) && (oobmul != 64)) {
+	      NS_ERR("OOB size has a non-standard value. should be pagesize/8, "
+	             "pagesize/16, pagesize/32 or pagesize/64.\n");
+	      return -EINVAL;
+	    }
+	    if ((block_size != 64) && (block_size != 128) && (block_size != 256) &&
+	        (block_size != 512)) {
+	      NS_ERR("block size has a non-standard value. should be 64, "
+	             "128, 256 or 512.\n");
+	      return -EINVAL;
+	    }
+	    if ((flash_size << 10) % block_size) {
+	      NS_ERR("flas size is not a multiple of block size.\n");
+	      return -EINVAL;
+	    }
+	    if ((page_size != 1024) && (page_size != 2048)) {
+	      NS_ERR("page size is invalid.\n");
+	      return -EINVAL;
+	    }
+	    oobmul >>= 3;
+	    oobval = 0;
+	    while (oobmul) {
+	      oobmul >>= 1;
+	      oobval++;
+	    }
+	    oobval--;
+	    oobval = ((~oobval) & 3) << 2;
+	    blockval = 0;
+	    block_size >>= 6;
+	    while (block_size) {
+	      block_size >>= 1;
+	      blockval++;
+	    }
+	    blockval--;
+	    blockval <<= 4;
+	    page_size >>= 10;
+	    pageval = 0;
+	    while (page_size) {
+	      page_size >>= 1;
+	      pageval++;
+	    }
+	    pageval--;
+	    buswval = (bus_width & 16) << 2;
+	    fourth_id_byte = buswval + blockval + oobval + pageval;
+	    nand_flash_ids[0].pagesize = 0;
+	    nand_flash_ids[0].erasesize = 0;
+	  } else {
+	    nand_flash_ids[0].pagesize = page_size;
+            nand_flash_ids[0].erasesize = block_size << 10;
+	  }
+	  nand_flash_ids[0].name = chipname;
+	  nand_flash_ids[0].options = 0;
+	  nand_flash_ids[0].chipsize = flash_size;
+          nand_flash_ids[0].id = second_id_byte;
+          if (bus_width == 16) nand_flash_ids[0].options |= NAND_BUSWIDTH_16;
+	}
+
  	/* Allocate and initialize mtd_info, nand_chip and nandsim structures */
  	nsmtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip)
  				+ sizeof(struct nandsim), GFP_KERNEL);
