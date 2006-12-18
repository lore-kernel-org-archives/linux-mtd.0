Received: from bay0-omc1-s28.bay0.hotmail.com ([65.54.246.100])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gw9Ey-0004ED-4L
	for linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 03:32:40 +0000
Message-ID: <BAY20-F2195C6D140002973FC53A3A2C90@phx.gbl>
From: "li jie" <cqdxlijie@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: samsung nand 'error with jffs2_flush_wbuf() : Write failed with -5 
Date: Mon, 18 Dec 2006 11:32:25 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
 
 I have mips board au1200 with a Samsung K9D1208V 64MB NAND flash which
is 528bytes/page and nor flash with 31M. 
 i have established a jffs2 filesystem as root filesystem in nor flash with 
31M ,
my sytem is ok if only use nor flash . now i plan to mount nand flash under 
jffs2 filesystem .
 
 ¡ø1. start my board using jffs2 filesystem as root filesystem 
 # cat /proc/mtd 
 dev:    size   erasesize  name
 mtd0: 03c00000 00020000 "User11 FS"
 mtd1: 00100000 00020000 "YAMON"
 mtd2: 002c0000 00020000 "raw kernel"
 mtd3: 00800000 00004000 "NAND FSa 0"
 mtd4: 03800000 00004000 "NAND FSa 1"
 
 ¡ø2. using the tools "flash_eraseall -j /dev/mtd6 " //,passed
 
 ¡ø3. # mount -tjffs2 /dev/mtdblock3 /mnt/ ,         // passed   
      
    # mount -tjffs2 /dev/mtdblock4 /mnt4/          //warning 
     jffs2: Erase block size too small (16KiB). Using virtual blocks size 
(32KiB) instead
    
    when i copy data to /mn4 or /mnt ,   I got the error messagesat the 
end:
     
=============================================================================================

 /mnt1 # cp /usr/flash_eraseall* .
 jffs2_flush_wbuf(): Write failed with -5
 Write of 1733 bytes at 0x00e3c01c failed. returned -5, retlen 0
 Not marking the space at 0x00e3c01c as dirty because the flash 
 driver returned retlen zero
 jffs2_flush_wbuf(): Write failed with -5
 Write of 1733 bytes at 0x00e30038 failed. returned -5, retlen 0
 Not marking the space at 0x00e30038 as dirty because the flash 
 driver returned retlen zero
 cp: Write Error: Input/output error
 jffs2_flush_wbuf(): Write failed with -5
 Recovery of wbuf failed due to a second write error
 Write of 2054 bytes at 0x00e2e608 failed. returned -5, retlen 0
 Not marking the space at 0x00e2e608 as dirty because the flash 
 driver returned retlen zero
 jffs2_flush_wbuf(): Write failed with -5
 Recovery of wbuf failed due to a second write error
 Write of 2054 bytes at 0x00e20000 failed. returned -5, retlen 0
 Not marking the space at 0x00e20000 as dirty because the flash 
 driver returned retlen zero
 cp: Write Error: Input/output error
 /mnt # Erase at 0x00e30000 failed immediately: errno -5
 jffs2_flush_wbuf(): Write failed with -5
 CPU 0 Unable to handle kernel paging request at virtual address 
 00200200, epc == 801f3350, ra == 801f3568
 Oops in arch/mips/mm/fault.c::do_page_fault, line 167[#1]:
 Cpu 0
 $ 0   : 00000000 1000fc00 00100100 00200200
 $ 4   : 00100100 00200200 0000612a 804688f8
 $ 8   : 0000000a 00004001 00000000 00000000
 $12   : fffffffa ffffffff 0000000a 00000000
 $16   : 8d3054f0 8f63a000 8f63a000 8d3054f0
 $20   : 00e20000 00000000 00000000 00000002
 $24   : 8055bab0 804688eb                  
 $28   : 8055a000 8055bb20 ffffffff 801f3568
 Hi    : 00006600
 Lo    : 000001c5
 epc   : 801f3350 jffs2_block_refile+0x38/0x1e8     Not tainted
 ra    : 801f3568 jffs2_wbuf_recover+0x68/0x828
 Status: 1000fc03    KERNEL EXL IE 
 Cause : 0080000c
 BadVA : 00200200
 PrId  : 04030200
 Modules linked in:
 Process pdflush (pid: 9, threadinfo=8055a000, task=80526be8)
 Stack : 0000612a 80123760 ffffffff 00000002 00000400 8055bbbc 1000fc01 
ffffffa0
         1000fc01 0000000a fffffffb 8f63a000 801f3568 8f63a400 00000020 
00000000
         80468518 00000001 80123b8c 801239f8 00e20000 00000000 00000000 
00000002
         fffffffb 8f63a000 00000001 8f63a000 fffffffb 8f63a000 00000001 
8f63a000
         00e20000 00000000 00000000 00000002 ffffffff 801f3ec4 00000000 
fffffffb
         ...
 Call Trace:
  [<80123760>] call_console_drivers+0x88/0x170
  [<801f3568>] jffs2_wbuf_recover+0x68/0x828
  [<80123b8c>] vprintk+0x200/0x248
  [<801239f8>] vprintk+0x6c/0x248
  [<801f3ec4>] __jffs2_flush_wbuf+0x19c/0x4c8
  [<801f4b00>] jffs2_flash_writev+0x568/0x624
  [<801e9660>] jffs2_write_dnode+0x144/0x6d8
  [<801e9d74>] jffs2_write_dirent+0x180/0x6a4
  [<801ef4bc>] jffs2_garbage_collect_dnode+0x2a8/0x55c
  [<801e72ac>] jffs2_reserve_space_gc+0x4c/0x74
  [<801ee954>] jffs2_garbage_collect_dirent+0x1ac/0x1ec
  [<8018b224>] iget_locked+0x7c/0x10c
  [<8011f0d4>] __wake_up_common+0x68/0xc0
  [<801ede0c>] jffs2_garbage_collect_live+0x310/0x384
  [<8011f16c>] __wake_up+0x40/0x7c
  [<80123760>] call_console_drivers+0x88/0x170
  [<801ed740>] jffs2_garbage_collect_pass+0x3b0/0x76c
  [<8011f16c>] __wake_up+0x40/0x7c
  [<801239f8>] vprintk+0x6c/0x248
  [<801f05f4>] jffs2_erase_failed+0x98/0x11c
  [<80123980>] printk+0x1c/0x28
  [<8011f16c>] __wake_up+0x40/0x7c
  [<801f0240>] jffs2_erase_block+0x160/0x1b8
  [<801f01a8>] jffs2_erase_block+0xc8/0x1b8
  [<801f4388>] jffs2_flush_wbuf_gc+0x198/0x358
  [<801f44ec>] jffs2_flush_wbuf_gc+0x2fc/0x358
  [<801f2094>] jffs2_write_super+0x50/0x58
  [<801f2088>] jffs2_write_super+0x44/0x58
  [<80172718>] sync_supers+0x164/0x17c
  [<8014ce50>] wb_kupdate+0x54/0x180
  [<8014dfb0>] __pdflush+0x130/0x26c
  [<8014df60>] __pdflush+0xe0/0x26c
  [<8014e0ec>] pdflush+0x0/0x28
  [<8014e108>] pdflush+0x1c/0x28
  [<8014cdfc>] wb_kupdate+0x0/0x180
  [<8013c334>] kthread+0xdc/0xe4
  [<8013c2d0>] kthread+0x78/0xe4
  [<801056c0>] kernel_thread_helper+0x10/0x18
  [<801056b0>] kernel_thread_helper+0x0/0x18
 Code: 3c030020  34420100  34630200 <aca40000> ac850004  ae020000  ae030004 
 8e020024  10400056 
 
 why ... 
 what is somthing wrong ?
 
============================================================================================

then 
  According to dedekind's advice I have  adjusted my NAND driver to make 
its OOB layout match YAFFS2 OOB layout.
the following oob placements defined in /driver/mtd/nand/nand_base
 --------------------------------------------------------------------------
 : NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 
3,3V 8-bit)

 /* Define default oob placement schemes for large and small page devices 
*/

static struct nand_oobinfo nand_oob_16 = {
        .useecc = MTD_NANDECC_AUTOPLACE,
        .eccbytes = 6,
        .eccpos = {0, 1, 2, 3, 6, 7},
        .oobfree = { {8, 8} }
};
--------------------------------------------------------------------------
 
 While oob placements definition in fs/jffs2/wbuf.c 
 
 
static struct nand_oobinfo jffs2_oobinfo_docecc = {
	.useecc = MTD_NANDECC_PLACE,
	.eccbytes = 6,
	.eccpos = {0,1,2,3,4,5}
};
 
 
 then i change the struct " nand_oobinfo nand_oob_16" into 
 static struct nand_oobinfo nand_oob_16 = {
        .useecc = MTD_NANDECC_PLACE, //equal to " 1 "
        .eccbytes = 6,
        ..eccpos = {0,1,2,3,4,5}
};
 
but the errors is the same as before.  Anyclues what
could be wrong ..
Any help will be highly appreciated.

 
 regards

please help me out .. 
 
============================================================================================


_________________________________________________________________
Ãâ·ÑÏÂÔØ MSN Explorer:   http://explorer.msn.com/lccn/  
