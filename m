Received: from igloo.df.lth.se ([194.47.250.47] helo=df.lth.se)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FA29s-0005Oc-35
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2006 04:44:34 -0500
Received: from festis.df.lth.se (UNKNOWN@festis.df.lth.se [194.47.250.37])
	by df.lth.se (8.13.1/8.13.1) with ESMTP id k1H9i4Fo017451
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Feb 2006 10:44:04 +0100 (CET)
Received: from festis.df.lth.se (hagar@localhost.localdomain [127.0.0.1])
	by festis.df.lth.se (8.13.4/8.13.4/Debian-3) with ESMTP id
	k1H9i4gQ020917
	for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2006 10:44:04 +0100
Received: (from hagar@localhost)
	by festis.df.lth.se (8.13.4/8.13.4/Submit) id k1H9i3Hg020916
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2006 10:44:03 +0100
Date: Fri, 17 Feb 2006 10:44:03 +0100
From: =?iso-8859-1?Q?H=E5kan?= Kvist <hagar@df.lth.se>
To: linux-mtd@lists.infradead.org
Message-ID: <20060217094403.GA20803@festis.df.lth.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Problems with getting a nand-flash chip to work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

Sorry that I can't be more specific in the topic, but I really don't
know which part that fails.

I'm trying to get a nand flash chip to work on a at91rm9200-ek
development board from atmel, featuring an atmel at91rm9200 (arm9
based) SoC.

We have tried to different Nand flash chips:
* A 4 Gbit, 8-bit bus nand flash chip from Micron
* A 512 Mbit, 8-bit bus nand flash chip from STMicroelectronics

We are using the 2.6.14 kernel, with the mtd and jffs2 patches taken
from cvs on the 15 of february.

Both chips behave in the same way, so faulty hardware is most likely
not the case.

The nand flashes are correctly identified during the boot, voltage, erase
block size etc.

The nand flash memory is mapped at /dev/mtd1, since we got a
physically mapped flash memory aswell (at /dev/mtd0).

The chipdelay time is set to 120, to be on the safe side, but we have
also enabled reading of the read/busy signal.

I hope that i have provied enough information so that someone with
more insight in the mtd-subsystem might get a clue of what might be
wrong.

best regards
Håkan Kvist

-------------------------------------------------------------------------
When issuing:
#flash_eraseall -j /dev/mtd1

MTD_open
MTD_ioctl
MTD_ioctl
MTD_ioctl
nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
ErMTD_ioctl
asinnand_erase: start = 0x00000000, len = 16384
g 1nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
6 Kibyte @ 0 --  0 % complete.MTD_ioctl
nand_write_oob: to = 0x00000008, len = 8
MTD_ioctl
nand_write_oob: to = 0x00000208, len = 8
MTD_ioctl
nand_write_oob: to = 0x00000408, len = 8
MTD_ioctl
nand_isbad_bbt(): bbt info for offs 0x00004000: (block 1) 0x00
 ClMTD_ioctl
eannand_erase: start = 0x00004000, len = 16384
marnand_isbad_bbt(): bbt info for offs 0x00004000: (block 1) 0x00
ker written at 0.Erasing 16 Kibyte @ 4000 --  0 % complete.MTD_ioctl
nand_write_oob: to = 0x00004008, len = 8
MTD_ioctl
nand_write_oob: to = 0x00004208, len = 8
MTD_ioctl
nand_write_oob: to = 0x00004408, len = 8
MTD_ioctl
nand_isbad_bbt(): bbt info for offs 0x00008000: (block 2) 0x00
 ClMTD_ioctl
eanmanand_erase: start = 0x00008000, len = 16384
rknand_isbad_bbt(): bbt info for offs 0x00008000: (block 2) 0x00
er written at 4000.Erasing 16 Kibyte @ 8000 --  0 % complete.MTD_ioctl
nand_write_oob: to = 0x00008008, len = 8
MTD_ioctl
nand_write_oob: to = 0x00008208, len = 8
MTD_ioctl
nand_write_oob: to = 0x00008408, len = 8
MTD_ioctl

[...]

marnand_isbad_bbt(): bbt info for offs 0x03ff8000: (block 4094) 0x00
ker written at 3ff4000.Erasing 16 Kibyte @ 3ff8000 -- 99 %
complete.MTD_ioctl
nand_write_oob: to = 0x03ff8008, len = 8
MTD_ioctl
nand_write_oob: to = 0x03ff8208, len = 8
MTD_ioctl
nand_write_oob: to = 0x03ff8408, len = 8
MTD_ioctl
nand_isbad_bbt(): bbt info for offs 0x03ffc000: (block 4095) 0x00
 ClMTD_ioctl
eannand_erase: start = 0x03ffc000, len = 16384
marknand_isbad_bbt(): bbt info for offs 0x03ffc000: (block 4095) 0x00
er written at 3ff8000.Erasing 16 Kibyte @ 3ffc000 -- 99 %
complete.MTD_ioctl
nand_write_oob: to = 0x03ffc008, len = 8
MTD_ioctl
nand_write_oob: to = 0x03ffc208, len = 8
MTD_ioctl
nand_write_oob: to = 0x03ffc408, len = 8
 Cleanmarker written at MTD_close
3fnand_sync: called
fc000.
-------------------------------------------------------------------------
So that seems to look quite ok to me.

However When I issue the following, directly after doing a 
erase_all:
#mount -t jffs2 /dev/mtdblock1 /mnt

nand_isbad_bbt(): bbt info for offs 0x00000000: (block 0) 0x00
nand_read_oob: from = 0x00000000, len = 48
nand_read_ecc: from = 0x00000000, len = 1024
nand_read_ecc: Failed ECC read, page 0x00000000
mtd->read(0x400 bytes from 0x0) returned ECC error
nand_read_oob: from = 0x00000000, len = 64
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
nand_isbad_bbt(): bbt info for offs 0x00004000: (block 1) 0x00
nand_read_oob: from = 0x00004000, len = 48
jffs2_check_nand_cleanmarker_ebh(): Cleanmarker node not detected in
block at 00004000
nand_read_ecc: from = 0x00004000, len = 1024
nand_read_ecc: Failed ECC read, page 0x00000020
nand_read_ecc: Failed ECC read, page 0x00000021
mtd->read(0x400 bytes from 0x4000) returned ECC error
nand_read_oob: from = 0x00004000, len = 64
JFFS2: Erase block at 0x00004000 is not formatted. It will be erased

[...]

nand_isbad_bbt(): bbt info for offs 0x03ff8000: (block 4094) 0x00
nand_read_oob: from = 0x03ff8000, len = 48
jffs2_check_nand_cleanmarker_ebh(): Cleanmarker node not detected in
block at 03ff8000
nand_read_ecc: from = 0x03ff8000, len = 1024
nand_read_ecc: Failed ECC read, page 0x0001ffc0
mtd->read(0x400 bytes from 0x3ff8000) returned ECC error
nand_read_oob: from = 0x03ff8000, len = 64
JFFS2: Erase block at 0x03ff8000 is not formatted. It will be erased
nand_isbad_bbt(): bbt info for offs 0x03ffc000: (block 4095) 0x00
nand_read_oob: from = 0x03ffc000, len = 48
nand_read_ecc: from = 0x03ffc000, len = 1024
nand_read_oob: from = 0x03ffc000, len = 64
Cowardly refusing to erase blocks on filesystem with no valid JFFS2
nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 4096
mount: Mounting /dev/mtdblock1 on /mnt failed: Input/output error

-----------------------------------------------------------------------

This is our glue-layer file:
-----------------------------------------------------------------------
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>
#include <asm/arch/hardware.h>
#include <asm/sizes.h>

#include <asm/arch/pio.h>

/* Based on the kmalloc example found on www.linux-mtd.infradead.org
*/

/* CE driven by adress bit */
/* CLE */
#define CLE_ADRR_BIT (1<<23)
/* ALE */
#define ALE_ADRR_BIT (1<<25)
/* Base address, in order to trigger chip-select 3 */
#define TAC_NAND_BASE_ADDRESS 0x40000000
/* define how much of the memory which we need to remap */
/* We need to remap an area that covers
   TAC_NAND_BASE_ADDRESS
   TAC_NAND_BASE_ADDRESS + CLE_ADDR_BIT
   TAC_NAND_BASE_ADDRESS + ALE_ADDR_BIT

   so we remap MAX(CLE_ADDR_BIT, ALE_ADDR_BIT) << 1 bits
   to be on the safe side.
*/
#define TAC_NAND_REMAP_AMOUNT (1<<26)

/* Please note that the memory area used by the nand-chip
   at address 0x40000000
   is remapped by the command "ioremap" further down.

   We currently remap 0x10000000 bytes, this can most
   likely be decreased to 0x0400 0000 (ALE_ADRR_BIT << 1)
*/


/* If we use partitions */
#ifdef CONFIG_MTD_PARTITIONS
/*#define NUM_PARTITIONS 2
static struct mtd_partition partition_info[] = {
  { .name = "Flash partition 1",
    .offset =  0,
    .size =    8 * SZ_1M},
  { .name = "Flash partition 2",
    .offset =  8 * SZ_1M,
    .size =    248 * SZ_1M },
  { .name = "Flash partition 3",
    .offset =  256 * SZ_1M,
    .size =    256 * SZ_1M },
    };*/
#define NUM_PARTITIONS 1
static struct mtd_partition partition_info[] = {
  { .name = "Flash partition 1",
    .offset =  0,
    /*    .size =    512 * SZ_1M},*/
    .size =    64 * SZ_1M},
};

#endif /* CONFIG_MTD_PARTITIONS */

static struct mtd_info *tac_at91_mtd;
static unsigned long tac_at91_baseaddr;

/*
  Since the memory areas is remapped we CAN NOT use the
  bit operations as in the example refered to above.

  ************* EXAMPLE **************

  Assuming base address 0x40000000
           ALE  offset  0x00200000
           CLE  offset  0x01000000

  If the remapping would be
           0x40000000>>>0xF1200000

  Doing operations like 0xF1200000 & ~0x01000000
  would make the address go OUTSIDE of the remapped area!

  ************ END EXAMPLE ***********

  Since ALE and CLE must not be set at the same time when
  performing operations on the chip,
  the CLRCLE and CLRALE operations can most PROBABLY just
  reset IO_ADDR_W to the base address.
*/

static void tac_at91_hwcontrol (struct mtd_info *mtd, int cmd)
{
  struct nand_chip *this = (struct nand_chip *) mtd->priv;
  switch(cmd){
  case NAND_CTL_SETCLE:
    this->IO_ADDR_W =
        (void __iomem *)(tac_at91_baseaddr + CLE_ADRR_BIT);
    break;
  case NAND_CTL_CLRCLE:
    this->IO_ADDR_W = (void __iomem *)(tac_at91_baseaddr);
    break;
  case NAND_CTL_SETALE:
    this->IO_ADDR_W =
      (void __iomem *)(tac_at91_baseaddr + ALE_ADRR_BIT);
    break;
  case NAND_CTL_CLRALE:
    this->IO_ADDR_W = (void __iomem *)(tac_at91_baseaddr);
    break;
  }
}

/*
 * Read the Device Ready pin.
 */
static int tac_at91_device_ready (struct mtd_info *mtd)
{
  /* Read value from PB29 */
  /* this function works independent of GPIO mode*/
  if (at91_get_gpio_value( AT91_PIN_PB29 ) != 0 ){
    return 1;
  }
  return 0;
}

/*
 * Init function
 */
int __init tac_at91_init (void)
{
  struct nand_chip *this;
  int err = 0;

  /* Allocate memory for MTD device structure and private data */
  tac_at91_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct
  nand_chip),
                          GFP_KERNEL);
  if (!tac_at91_mtd) {
    printk ("Unable to allocate NAND MTD device structure.\n");
    err = -ENOMEM;
    goto out;
  }

  /* Initialize structures */
  memset ((char *) tac_at91_mtd, 0,
          sizeof(struct mtd_info) + sizeof(struct nand_chip));

  /* map physical adress */
  tac_at91_baseaddr = (unsigned long)ioremap(TAC_NAND_BASE_ADDRESS,
                                             TAC_NAND_REMAP_AMOUNT);
  if(!tac_at91_baseaddr){
    printk("Ioremap to access NAND chip failed\n");
    err = -EIO;
    goto out_mtd;
  }

  /* Get pointer to private data */
  this = (struct nand_chip *) ( &tac_at91_mtd[1] );
  /* Link the private data with the MTD structure */
  tac_at91_mtd->priv = this;

  /* Set address of NAND IO lines */
  printk("tac_at91_baseaddr %x\n", (unsigned int) tac_at91_baseaddr);
  this->IO_ADDR_R = (void __iomem *) tac_at91_baseaddr;
  this->IO_ADDR_W = (void __iomem *) tac_at91_baseaddr;
  /* Reference hardware control function */
  this->hwcontrol = tac_at91_hwcontrol;
  /* Set command delay time, see datasheet for correct value */
  /* Lets try 40 us delay time */
  /*  this->chip_delay = 40;*/
  this->chip_delay = 120;
  /* Assign the device ready function, if available */
  this->dev_ready = tac_at91_device_ready;
  this->eccmode = NAND_ECC_SOFT;

  /* Scan to find existance of the device */
  if (nand_scan (tac_at91_mtd, 1)) {
    err = -ENXIO;
    goto out_ior;
  }

#ifdef CONFIG_MTD_PARTITIONS
  add_mtd_partitions(tac_at91_mtd, partition_info, NUM_PARTITIONS);
#endif /*CONFIG_MTD_PARTITIONS*/

  goto out;

 out_ior:
  iounmap((void *)tac_at91_baseaddr);
 out_mtd:
  kfree (tac_at91_mtd);
 out:
  return err;
}

/*
 * Clean up routine
 */
static void __exit tac_at91_cleanup (void)
{
  /* Unregister partitions */
  del_mtd_partitions(tac_at91_mtd);

  /* Unregister the device */
  del_mtd_device (tac_at91_mtd);

  /* unmap physical adress */
  iounmap((void *)tac_at91_baseaddr);

  /* Free the MTD device structure */
  kfree (tac_at91_mtd);
}


module_init(tac_at91_init);
module_exit(tac_at91_cleanup);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Hakan Kvist");
MODULE_DESCRIPTION("GLUE LAYER FOR EXTRA NAND FLASH MEMORY");

-------------------------------------------------------------------
The initialization of the memory controller is performed by this code:

static void __init ek_setup_nand_tac(){

  /* at91_set_X_periph( pin, use pullup) */

  /* PIO C1 => A -- nSMOE (nRE) */
  at91_set_A_periph(AT91_PIN_PC1, 0 );
  /* PIO C3 => A -- nSMWE (nWE) */
  at91_set_A_periph(AT91_PIN_PC3, 0);
  /* PIO B29 => B -- PB29 (RnB) */
  /* set as input, enable built in pull up */
  at91_set_gpio_input(AT91_PIN_PB29, 1);

  /* make sure that CS3A enables the NAND logic */
  /* nSMWE, nSMOE */
  AT91_SYS->EBI_CSA |= 0x8;

  /* setup timings for CS3 */
  /* AT91_SYS->EBI_SMC2_CSR[3] = 0x44004088; */
  /* THIS IS A "NICE" COPY OF THE ABOVE */
  AT91_SYS->EBI_SMC2_CSR[3] =
    AT91C_SMC2_RWHOLD  & 0x40000000 |
    AT91C_SMC2_RWSETUP & 0x04000000 |
    AT91C_SMC2_ACSS_STANDARD |
    AT91C_SMC2_DBW_8 |
    AT91C_SMC2_WSEN | AT91C_SMC2_NWS & 0x8;
}





-- 
Håkan Kvist                  el-post: hagar@df.lth.se
telefon: 0703-14 21 14       hemsida: www.df.lth.se/~hagar
