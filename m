Received: from smtp008.mail.ukl.yahoo.com ([217.12.11.62])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FjhRl-0004yt-F8
	for linux-mtd@lists.infradead.org; Fri, 26 May 2006 14:54:12 -0400
Message-ID: <44774EBA.8020208@themis.com>
Date: Fri, 26 May 2006 20:53:46 +0200
From: jean-francois simon <jfs@themis.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <44773572.7000809@themis.com>
	<1148664709.28878.67.camel@pmac.infradead.org>
In-Reply-To: <1148664709.28878.67.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mpc8270 and 64bit flash geometry
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

> 
> Show the panic. If you're using floating point registers in the kernel,
> you need to do that carefully and properly.

I have enclosed my map driver below and the "floating point" 
write routine. I think it works, or I will not go very far. 
Strangely  I can no longer trigger a panic now. Instead I get 
input/output errors on "eraseall", although it does its job, as I 
can write to a device and then write to it:


bash-3.00# cat /etc/hosts
127.0.0.1               localhost
bash-3.00# cat /etc/hosts >/dev/mtd1
bash-3.00# dd if=/dev/mtd1 of=/tmp/ppp
2048+0 records in
2048+0 records out
bash-3.00# od -x /tmp/ppp
0000000 3132 372e 302e 302e 3109 096c 6f63 616c
0000020 686f 7374 0aff ffff ffff ffff ffff ffff
0000040 ffff ffff ffff ffff ffff ffff ffff ffff
*
4000000
bash-3.00

ash-3.00# eraseall /dev/mtd1
Erasing 256 Kibyte @ 0 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 256 Kibyte @ 40000 -- 25 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 256 Kibyte @ 80000 -- 50 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 256 Kibyte @ c0000 -- 75 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erased 1024 Kibyte @ 0 -- 100% complete.
bash-3.00#
bash-3.00# dd if=/dev/mtd1 of=/tmp/ppp
2048+0 records in
2048+0 records out
bash-3.00# od -x /tmp/ppp
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
4000000

Also I have joined the boot messages, and the MTD options from 
.config.

I have been working on this for several days. If there is 
anything obvious,  plse let me know.
Thanks a lot,
-jfs




My boot messages:

Linux version 2.6.15 (bmc@Linux188) (gcc version 4.0.0 (DENX ELDK 
4.0 4.0.0)) #433 Fri May 26 11:26:14 PDT 2006
Themis Commputer BMC - (mpc8270) port
Built 1 zonelists
Kernel command line: root=/dev/nfs rw 
nfsroot=192.168.44.8:/home/bmc/tools/eldk4.0/ppc_6xx 
ip=192.168.44.27:192.168.44.8:192.168.44.254:255.255.255.0:bmc8:eth1:off 
panic=1
PID hash table entries: 2048 (order: 11, 32768 bytes)
Warning: real time clock seems stuck!
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 257280k available (1548k kernel code, 628k data, 92k 
init, 0k highmem)
Mount-cache hash table entries: 512
NET: Registered protocol family 16

fs/char_dev.c register_chrdev major=10,misc

fs/char_dev.c register_chrdev major=1,mem
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
Generic RTC Driver v1.07
Serial: CPM driver $Revision: 0.01 $
ttyCPM0 at MMIO 0xf0011a80 (irq = 4) is a CPM UART
ttyCPM1 at MMIO 0xf0011a90 (irq = 5) is a CPM UART
ttyCPM2 at MMIO 0xf0011a00 (irq = 40) is a CPM UART
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize

fs/char_dev.c register_chrdev major=90,mtd
$Id: ftl.c,v 1.59 2005/11/29 14:48:31 gleixner Exp $
bmc82xx.c init_bmc_mtd flash_addr=fc000000, flash_size=4000000
init_bmc_mtd: chip probing count 0
Number of erase regions: 3
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
Vpp Minimum: 11.5 V
Vpp Maximum: 12.5 V
Typical byte/word write timeout: 16 µs
Maximum byte/word write timeout: 256 µs
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 8192 ms
Chip erase not supported
Device size: 0x800000 bytes (8 MiB)
Flash Device Interface description: 0x0002
   - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x40
Number of Erase Block Regions: 3
   Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
   Erase Region #1: BlockSize 0x10000 bytes, 126 blocks
   Erase Region #2: BlockSize 0x2000 bytes, 8 blocks
BMC82xx-0: Found 4 x16 devices at 0x0 in 64-bit bank
  Amd/Fujitsu Extended Query Table at 0x0040
BMC82xx-0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code 
brokenness.
init_bmc_mtd: bank1, name:BMC82xx-0, size:33554432bytes
BMC flash0: Using Static image partition definition
Creating 3 MTD partitions on "BMC82xx-0":
0x00000000-0x00020000 : "bmc1"
mtd: Giving out device 0 to bmc1
rfd_ftl: no RFD magic found in 'bmc1'
ftl_cs: FTL header not found.
0x00100000-0x00200000 : "bmc2"
mtd: Giving out device 1 to bmc2
rfd_ftl: no RFD magic found in 'bmc2'
ftl_cs: FTL header not found.
0x00000000-0x02000000 : "bmc3"
mtd: Giving out device 2 to bmc3
rfd_ftl: no RFD magic found in 'bmc3'
ftl_cs: FTL header not found.

(snip)


................

MTD related OPTIONS:



#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_CONCAT=y
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_FTL=y
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
CONFIG_RFD_FTL=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
CONFIG_MTD_MAP_BANK_WIDTH_8=y
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=y
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_OTP is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_AMDSTD_RETRY=5
# CONFIG_MTD_CFI_STAA is not set
CONFIG_MTD_CFI_UTIL=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
# CONFIG_MTD_SBC8240 is not set
# CONFIG_MTD_PM82X is not set
CONFIG_MTD_BMC82xx=y
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOC2001PLUS is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# OneNAND Flash Device Drivers
#
# CONFIG_MTD_ONENAND is not set


........................
[bmc@Linux188 maps]$
[bmc@Linux188 maps]$ cat bmc82xx.c
/*
  * Handle mapping of the flash memory access routines
  * on THEMIS Computer BMC82xx based devices.
  *
  * Based on tqm82xx.c map driver
  *
  */

/*
  * According to BMC hardware manual, it  has
  * following flash memory organisations:
  *      | capacity |    | chip type |   | bank0 |       | bank1 |
  *          64MiB          M29DW641D      32MiB            32MiB
  * Thus, we choose CONFIG_MTD_CFI_I4 & CONFIG_MTD_CFI_B8 at
  * kernel configuration.
  */

#include <linux/config.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>

#include <asm/io.h>

#define FLASH_BANK_MAX 1


// trivial struct to describe partition information
struct mtd_part_def
{
         int nums;
         unsigned char *type;
         struct mtd_partition* mtd_part;
};

//static struct mtd_info *mymtd;
static struct mtd_info* mtd_banks[FLASH_BANK_MAX];
//jfas static struct map_info* map_banks[FLASH_BANK_MAX];
static struct map_info* map_banks[FLASH_BANK_MAX];
static struct mtd_part_def part_banks[FLASH_BANK_MAX];
static unsigned long num_banks;
static void __iomem *start_scan_addr;


#ifdef CONFIG_MTD_PARTITIONS
/* Currently, BMC82xx has upto 64 MiB flash */

/* partition definition for first flash bank
  */
static struct mtd_partition bmc82xx_partitions[] = {
         {
           .name = "bmc1",
           .offset = 0x00000000,
           .size   = 0x00020000,         /* 128KB           */
           .mask_flags = MTD_WRITEABLE,  /* force read-only */
         },
         {
           .name = "bmc2",
           .offset = 0x00100000,
           .size   = 0x00100000,
         },
         {
           .name = "bmc3",
           .offset = 0x00000000,
           .size   = 0x02000000,
         }
};

#if 0
/* partition definition for second flash bank */
static struct mtd_partition bmc82xx_fs_partitions[] = {
     /* overlapping all flash 1 (32MB) */
         {
           .name  = "bmc4",
           .offset = 0x00000000,
           .size   = 0x02000000,
         }
};
#endif
#endif


static map_word bmc82xx_read64(struct map_info *map, unsigned 
long ofs)
{
         map_word val;
//                printk("bmc82xx_read64 %x\n", map->virt+ofs);

         val.x[0] = *((volatile __u32 *)(map->virt+ ofs));
         val.x[1] = *(((volatile __u32 *)(map->virt + ofs)) + 1);
         return val;
}


static void bmc82xx_write64 (struct map_info *map, map_word map_d,
                 unsigned long adr)
{
         ulong flags;
         volatile ulong msr;
         ulong saved_msr;
         volatile long saved_fr[2];
         uint32_t addr = (uint32_t)map->virt + adr;      //jfas!!
         uint32_t* data;

#define ALIGNUP(x,y)            (((x) + ((y) - 1)) & ~((y) - 1))

         data = kmalloc(0x100, GFP_KERNEL);
         if(data == NULL) {
                 printk("bmc82xx_write64: kmalloc failed\n");
                 return;
         }
         data = ALIGNUP( (uint32_t)data, 0x8);

         data[0] = (map_d.x[0]);
         data[1] = + map_d.x[1];


         local_irq_save (flags);
         __asm__ __volatile__ ("mfmsr %0" : "=r" (msr):);
         saved_msr = msr;
         msr |= MSR_FP;
         msr &= ~(MSR_FE0 | MSR_FE1);

         __asm__ __volatile__ (
                 "mtmsr %0\n"
                 "isync\n"
                 :
                 : "r" (msr));
         __asm__ __volatile__ (
                 "stfd 1, 0(%2)\n"
                 "lfd  1, 0(%0)\n"
                 "stfd 1, 0(%1)\n"
                 "lfd 1, 0(%2)\n"
                  :
                  : "r" (data), "r" (addr), "b" (saved_fr)
         );

         __asm__ __volatile__ (
                 "mtmsr %0\n"
                 "isync\n"
                 :
                 : "r" (saved_msr));


         kfree(data);
         local_irq_restore (flags);
}


static void bmc82xx_copy_to(struct map_info *map,
                 unsigned long to, const void *from, ssize_t len)
{
         map_word val;
         uint32_t *ptr = (uint32_t*)from;


printk("bmc82xx_copy_to: \n");
         if (len % 8){
                 printk("bmc82xx_copy_to: Error length not 
multiple of 8\n");
                 return;
         }

         while (len){
                 val.x[0] = *((volatile __u32 *)(*ptr++));
                 val.x[1] = *((volatile __u32 *)(*ptr++));
                 bmc82xx_write64(map, val, to);
                 len -= 8;
                 to += 8;
         }

}


int __init init_bmc_mtd(void)
{
         int idx = 0, ret = 0;
         unsigned long flash_addr, flash_size, mtd_size = 0;
         /* pointer to BMC82xx board info data */
         bd_t *bd = (bd_t *)__res;


         flash_addr = bd->bi_flashstart;
         flash_size = bd->bi_flashsize;

#if 1 /* debug -> bmc */
         printk(KERN_INFO "bmc82xx.c init_bmc_mtd flash_addr=%lx, 
flash_size=%lx\n", flash_addr, flash_size);
#endif

         //request maximum flash size address space
         start_scan_addr = ioremap(flash_addr, flash_size);
         if (!start_scan_addr) {
                 printk(KERN_WARNING "%s:Failed to ioremap 
address:0x%x\n", __FUNCTION__, (unsigned int)flash_addr);
                 return -EIO;
         }

         for (idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
                 if(mtd_size >= flash_size)
                         break;

                 printk(KERN_INFO "%s: chip probing count %d\n", 
__FUNCTION__, idx);

                 map_banks[idx] = (struct map_info 
*)kmalloc(sizeof(struct map_info), GFP_KERNEL);
                 if(map_banks[idx] == NULL) {
                         ret = -ENOMEM;
                         /* FIXME: What if some MTD devices were 
probed already? */
                         goto error_mem;
                 }

                 memset((void *)map_banks[idx], 0, sizeof(struct 
map_info));
                 map_banks[idx]->name = (char *)kmalloc(16, 
GFP_KERNEL);

                 if (!map_banks[idx]->name) {
                         ret = -ENOMEM;
                         /* FIXME: What if some MTD devices were 
probed already? */
                         goto error_mem;
                 }
                 sprintf(map_banks[idx]->name, "BMC82xx-%d", idx);

                 map_banks[idx]->size = flash_size / 2;
                 map_banks[idx]->bankwidth = 8;

                 simple_map_init(map_banks[idx]);
//BMC - jfas: We patch the write methods from simple_map_init() 
to a new one to make up for the fact that the FLASH is 64b wide, 
w/ all 4 FLASH chips sharing the same WE signal. It seems only 
assembly can generate a true 64b wide access.

                 map_banks[idx]->write = bmc82xx_write64;
                 map_banks[idx]->read = bmc82xx_read64;
                 map_banks[idx]->copy_to = bmc82xx_copy_to;

                 map_banks[idx]->virt = start_scan_addr;
                 map_banks[idx]->phys = flash_addr;
                 /* FIXME: This looks utterly bogus, but I'm 
trying to
                    preserve the behaviour of the original (shown 
here)...

                 map_banks[idx]->map_priv_1 =
                 start_scan_addr + ((idx > 0) ?
                 (mtd_banks[idx-1] ? mtd_banks[idx-1]->size : 0) 
: 0);
                 */

                 if (idx && mtd_banks[idx-1]) {
                         map_banks[idx]->virt += 
mtd_banks[idx-1]->size;
                         map_banks[idx]->phys += 
mtd_banks[idx-1]->size;
                 }

                 //start to probe flash chips
                 mtd_banks[idx] = do_map_probe("cfi_probe", 
map_banks[idx]);

                 if (mtd_banks[idx]) {
                         mtd_banks[idx]->owner = THIS_MODULE;
                         mtd_size += mtd_banks[idx]->size;
                         num_banks++;

                         printk(KERN_INFO "%s: bank%d, name:%s, 
size:%dbytes \n", __FUNCTION__, (int)num_banks,
                         mtd_banks[idx]->name, 
(int)mtd_banks[idx]->size);
                 }
         }

         /* no supported flash chips found */
         if (!num_banks) {
                 printk(KERN_NOTICE "TQM82xx: No support flash 
chips found!\n");
                 ret = -ENXIO;
                 goto error_mem;
         }

#ifdef CONFIG_MTD_PARTITIONS
         /*
          * Select Static partition definitions
          */
         part_banks[0].mtd_part = bmc82xx_partitions;
         part_banks[0].type = "Static image";
         part_banks[0].nums = ARRAY_SIZE(bmc82xx_partitions);
#if 0
         part_banks[1].mtd_part = bmc82xx_fs_partitions;
         part_banks[1].type = "Static file system";
         part_banks[1].nums = ARRAY_SIZE(bmc82xx_fs_partitions);
#endif

         for(idx = 0; idx < num_banks ; idx++) {
                 if (part_banks[idx].nums == 0) {
                         printk(KERN_NOTICE "BMC flash%d: no 
partition info available, registering whole flash at once\n", idx);
                         add_mtd_device(mtd_banks[idx]);
                 } else {
                         printk(KERN_NOTICE "BMC flash%d: Using 
%s partition definition\n",
                                         idx, part_banks[idx].type);
                         add_mtd_partitions(mtd_banks[idx], 
part_banks[idx].mtd_part,
 
part_banks[idx].nums);
                 }
         }
#else
         printk(KERN_NOTICE "BMC flash: registering %d whole 
flash banks at once\n", num_banks);
         for(idx = 0 ; idx < num_banks ; idx++)
                 add_mtd_device(mtd_banks[idx]);
#endif
         return 0;
error_mem:
         for(idx = 0 ; idx < FLASH_BANK_MAX ; idx++) {
                 if(map_banks[idx] != NULL) {
                         kfree(map_banks[idx]->name);
                         map_banks[idx]->name = NULL;
                         kfree(map_banks[idx]);
                         map_banks[idx] = NULL;
                 }
         }
//error:
         iounmap(start_scan_addr);
         return ret;
}

static void __exit cleanup_bmc_mtd(void)
{
         unsigned int idx = 0;
         for(idx = 0 ; idx < num_banks ; idx++) {
                 /* destroy mtd_info previously allocated */
                 if (mtd_banks[idx]) {
                         del_mtd_partitions(mtd_banks[idx]);
                         map_destroy(mtd_banks[idx]);
                 }
                 /* release map_info not used anymore */
                 kfree(map_banks[idx]->name);
                 kfree(map_banks[idx]);
         }

         if (start_scan_addr) {
                 iounmap(start_scan_addr);
                 start_scan_addr = 0;
         }
}

module_init(init_bmc_mtd);
module_exit(cleanup_bmc_mtd);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("THEMIS COMPUTER ");
MODULE_DESCRIPTION("MTD map driver for THEMIS BMC boards");
[bmc@Linux188 maps]$



	

	
		
___________________________________________________________________________ 
Faites de Yahoo! votre page d'accueil sur le web pour retrouver directement vos services préférés : vérifiez vos nouveaux mails, lancez vos recherches et suivez l'actualité en temps réel. 
Rendez-vous sur http://fr.yahoo.com/set
