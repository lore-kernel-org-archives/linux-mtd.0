Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GZXX-00021K-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 06:49:48 +0000
Received: from localhost (saturn@localhost)
	by structure.biochem.nchu.edu.tw (8.11.6/8.11.6) with ESMTP id gAPJYRZ20257
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 03:34:27 +0800
Date: Tue, 26 Nov 2002 03:34:27 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: SmartMedia Card need to create fs before mounting it ?
Message-ID: <Pine.LNX.4.44.0211260227090.20149-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi.
When I mount a partition on the SmartMedia card, if I must need to put a
jffs2's image on it before mounting it ? Or existed a tool that can 
directly make jffs2 on the nand flash ?

That is my procedures that can't make it work in the below.
--------------------
1.
I downloaded the latest MTD CVS code and link to my kernel src directory.
My linux kernel is 2.4.19 with rmk-4 patched.   

2.
Then according to NAND's document, I modified the Config.in and .config.
Added "bool 'JFFS2 support for NAND chips' CONFIG_JFFS2_FS_NAND" to 
fs/Config.in
and make menuconfig to choose these.

CONFIG_MTD=Y
CONFIG_MTD=PARTITIONS=Y
CONFIG_MTD=CHAR=Y
CONFIG_MTD=BLOCK=Y
CONFIG_MTD_NAND=Y
CONFIG_MTD_NAND_ECC=Y
CONFIG_MTD_NAND_EDB7312=Y
CONFIG_JFFS2_FS=Y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=Y

3.
I didn't modifty the control function because I think it is right!
static void ep7312_hwcontrol(int cmd)
{
        switch(cmd) {

        case NAND_CTL_SETCLE:
                clps_writeb(clps_readb(ep7312_pxdr) | 0x10, ep7312_pxdr);
                break;
        case NAND_CTL_CLRCLE:
                clps_writeb(clps_readb(ep7312_pxdr) & ~0x10, ep7312_pxdr);
                break;

        case NAND_CTL_SETALE:
                clps_writeb(clps_readb(ep7312_pxdr) | 0x20, ep7312_pxdr);
                break;
        case NAND_CTL_CLRALE:
                clps_writeb(clps_readb(ep7312_pxdr) & ~0x20, ep7312_pxdr);
                break;

        case NAND_CTL_SETNCE:
                clps_writeb((clps_readb(ep7312_pxdr) | 0x80) & ~0x40, 
ep7312_pxdr);
                break;

        case NAND_CTL_CLRNCE:
                clps_writeb((clps_readb(ep7312_pxdr) | 0x80) | 0x40, 
ep7312_pxdr);
                break;
        }
}


I ALSO don't modify edb7312_init(void). Then I made kernel and it can 
passed to create a kernel image.

4.
I put kernel to Intel Nor flash(4MB) on the board, the used 
bootloader(hermit) to load linux kernel. In the meanwhile, the kernel 
messages show it found the SmartMedia card. The message is in the below.
----------------------------------- 
NAND device: Manufacture ID: 0xec, Chip ID: 
0xe6 (Samsung KM29U64000)
page size=512, erase size=8192, total size=83886388608
-----------------------------------

And kernel added one partition(static) that defined in the edb7312.c into 
the SmartMedia card. 
-----------------------
Using static partition definition
Creating 1 MTD partitions on "Samsung KM29U64000":
0x00000000-0x00800000 : "EP7312 Nand Flash"
-----------------------

5.
After logining into system, I manually mount nand's partition but it can't 
work. My SmartMedia is 8 MB.
---------------------
/root>mount -t jffs2 /dev/mtdblock/6 /dll
jffs2_scan_empty(): Empty block at 0x0000000c ends at 0x00000200 (with 
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000208 ends at 0x00000400 (with 
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x0000040c ends at 0x00000600 (with 
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000608 ends at 0x00000800 (with 
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000808 ends at 0x00000a00 (with 
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000a08 ends at 0x00000c00 (with 
0x00000000)! Marking dirty
jffs2_scan_empty(): Empty block at 0x00000c08 ends at 0x00000e00 (with 
0x00000000)! Marking dirty
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000e08: 
0xff00 instead
............................. skip
JFFS2: Erase block at 0x007fe000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
mount: Mounting /dev/mtdblock/6 on /dll failed: Invalid argument
----------------------

Can anybody point what's wrong ?
I had fought it for one week..

Many thanks,
Brian Lee
