Received: from nwd2mail10.analog.com ([137.71.25.55])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8ZFN-0006BT-4F
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 06:16:39 -0400
Subject: Re: [Yaffs] Is mkyaffs util avaible in CVS?
From: Bryan Wu <bryan.wu@analog.com>
To: Nobin Mathew <nobin.mathew@gmail.com>
In-Reply-To: <8d6898730707110206m22c4fc92n2e7c248d41c1722@mail.gmail.com>
References: <1184127257.1234.3.camel@roc-desktop>
	<8d6898730707102337q63b975dftc302daa6afcb7565@mail.gmail.com>
	<1184136654.24983.5.camel@roc-desktop>
	<8d6898730707102359s15ab389co2687b23203e1a024@mail.gmail.com>
	<1184140731.24983.12.camel@roc-desktop>
	<8d6898730707110112j5f284f9an96f8e8e3547559d7@mail.gmail.com>
	<1184143321.24983.21.camel@roc-desktop>
	<8d6898730707110206m22c4fc92n2e7c248d41c1722@mail.gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 11 Jul 2007 18:11:51 +0800
Message-Id: <1184148711.24983.32.camel@roc-desktop>
Mime-Version: 1.0
Cc: bryan.wu@analog.com, linux-mtd@lists.infradead.org,
	yaffs@lists.aleph1.co.uk
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-07-11 at 14:36 +0530, Nobin Mathew wrote:
> For using jffs2 following are the instructions,
> 
> for creating jffs2 image
> 
> mkfs.jffs2 --eraseblock=blocksize --pad=pagesize --no-cleanmarkers -d
> rootdirectory -o imagename
> 
> example
> mkfs.jffs2 --eraseblock=0x20000 --pad=2048 --no-cleanmarkers -d
> $HOME/work -o jffs2_nand
> 
> 

Oh, I think it should be 
mkfs.jffs2 --pagesize=2048 --eraseblock=0x20000 --pad=0x200000 --no-cleanmarkers -d rootfs/ -o rootfs.jffs2

This will produce a 2Mbytes jffs2 image which is aligned with 2048
pagesize. Then the nandwrite can write it to NAND chip.

> Erasing flash partition use
> #flash_eraseall -j /dev/mtdX
> 
> Burning the image
> 
> #nandwrite /dev/mtdX jffs2_nand
> 
> And mount the partition using
> mount -t jffs2 /dev/mtdblockX /mnt
> 
> 

root:~> mount -t jffs2 /dev/mtdblock2 /mnt/
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0
jffs_check_nand_cleanmarker returned 1
jffs2_check_oob_empty returned 0

Endless message and finally system hang.
Here is my JFFS2 configuration:

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=2
CONFIG_JFFS2_FS_WRITEBUFFER=y
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set

Sorry for asking this JFFS2 question on YAFFS2 maillist.

Thanks
- Bryan Wu
> So there is difference in procedure for jffs2 and yaffs2
> 
> Nobin Mathew
> 
> On 7/11/07, Bryan Wu <bryan.wu@analog.com> wrote:
> > On Wed, 2007-07-11 at 13:42 +0530, Nobin Mathew wrote:
> > > What all YAFFS2 options are enabled in the kernel.
> > > Can you try disabling the autoselect.
> > >
> >
> > Here is my config
> >
> > ---
> > CONFIG_YAFFS_FS=y
> > CONFIG_YAFFS_YAFFS1=y
> > # CONFIG_YAFFS_DOES_ECC is not set
> > CONFIG_YAFFS_YAFFS2=y
> > # CONFIG_YAFFS_AUTO_YAFFS2 is not set
> > # CONFIG_YAFFS_DISABLE_LAZY_LOAD is not set
> > CONFIG_YAFFS_CHECKPOINT_RESERVED_BLOCKS=10
> > # CONFIG_YAFFS_DISABLE_WIDE_TNODES is not set
> > # CONFIG_YAFFS_ALWAYS_CHECK_CHUNK_ERASED is not set
> > # CONFIG_YAFFS_SHORT_NAMES_IN_RAM is not set
> > ---
> >
> > > Can you check the page size the driver returns.
> > >
> > > If you are developing a new driver then you first try jffs2.
> > >
> >
> > can I use nandwrite to program the jffs2 image to nand flash chip?
> > nandwrite -a -o /dev/mtdX jffs2_image
> >
> > Could you please help me to use the mkfs.jffs2 for make a jffs2 image?
> >
> > #mkfs.jffs2 -s 2KiB -e 128KiB -n -d rootfs -o rootfs.jffs2
> > the file size of rootfs.jffs2 will be 88Mbytes, while
> >
> > #mkfs.jffs2 -e 128KiB -n -d rootfs -o rootfs.jffs2
> > file size is 1.6Mbytes
> >
> > Did I miss something?
> >
> > Thanks a lot for your help.
> >
> > - Bryan Wu
> > > That is much more stable, and then we will come back to YAFFS2.
> > >
> > > In my case i also developed a nand controller driver. and it was
> > > working perfectly with above mentioned options with YAFFS2.
> > >
> > > Nobin Mathew
> > >
> > > On 7/11/07, Bryan Wu <bryan.wu@analog.com> wrote:
> > > > On Wed, 2007-07-11 at 12:29 +0530, Nobin Mathew wrote:
> > > > > Which is your NAND chip?
> > > > >
> > > > NAND device: Manufacturer ID: 0x20, Chip ID: 0xda (ST Micro NAND 256MiB
> > > > 3,3V 8-bit)
> > > >
> > > > > Is it 2k page chip?
> > > >
> > > > yes, it is.
> > > > >
> > > > > Then use
> > > > > #flash_eraseall /dev/mtdX
> > > > > #nandwrite -a -o /dev/mtdX yaffs2_image
> > > > > #mount -t yaffs2 /dev/mtdblockX /mnt
> > > > >
> > > >
> > > > Here is the command log on my board:
> > > > ---
> > > > root:~> flash_eraseall /dev/mtd2
> > > > Erasing 128 Kibyte @ fbe0000 -- 99 % complete.
> > > > root:~>
> > > > root:~>
> > > > root:~> nandwrite -a -o /dev/mtd2 rootfs.yaffs2
> > > > Writing data to block 0
> > > > Writing data to block 20000
> > > > Writing data to block 40000
> > > > Writing data to block 60000
> > > > Writing data to block 80000
> > > > Writing data to block a0000
> > > > Writing data to block c0000
> > > > Writing data to block e0000
> > > > Writing data to block 100000
> > > > Writing data to block 120000
> > > > Writing data to block 140000
> > > > Writing data to block 160000
> > > > Writing data to block 180000
> > > > Writing data to block 1a0000
> > > > Writing data to block 1c0000
> > > > Writing data to block 1e0000
> > > > Writing data to block 200000
> > > > Writing data to block 220000
> > > > Writing data to block 240000
> > > > Writing data to block 260000
> > > > Writing data to block 280000
> > > > Writing data to block 2a0000
> > > > Writing data to block 2c0000
> > > > Writing data to block 2e0000
> > > > root:~> mount -t yaffs /dev/mtdblock2 /mnt/
> > > > yaffs: dev is 32505858 name is "mtdblock2"
> > > > yaffs: Attempting MTD mount on 31.2, "mtdblock2"
> > > > yaffs: auto selecting yaffs2
> > > > root:~> cd /mnt/
> > > > root:/mnt> ls
> > > > lost+found
> > > > root:/mnt>
> > > > root:/mnt> cat /proc/yaffs
> > > > YAFFS built:Jul 11 2007 15:32:43
> > > > $Id: yaffs_fs.c 2682 2007-01-22 03:19:29Z aubrey $
> > > > $Id: yaffs_guts.c 2682 2007-01-22 03:19:29Z aubrey $
> > > >
> > > > Device 0 "File System"
> > > > startBlock......... 0
> > > > endBlock........... 2015
> > > > chunkGroupBits..... 1
> > > > chunkGroupSize..... 2
> > > > nErasedBlocks...... 1992
> > > > nTnodesCreated..... 300
> > > > nFreeTnodes........ 35
> > > > nObjectsCreated.... 600
> > > > nFreeObjects....... 29
> > > > nFreeChunks........ 127542
> > > > nPageWrites........ 0
> > > > nPageReads......... 0
> > > > nBlockErasures..... 0
> > > > nGCCopies.......... 0
> > > > garbageCollections. 0
> > > > passiveGCs......... 0
> > > > nRetriedWrites..... 0
> > > > nRetireBlocks...... 0
> > > > eccFixed........... 0
> > > > eccUnfixed......... 0
> > > > tagsEccFixed....... 0
> > > > tagsEccUnfixed..... 0
> > > > cacheHits.......... 0
> > > > nDeletedFiles...... 0
> > > > nUnlinkedFiles..... 0
> > > > nBackgroudDeletions 0
> > > > useNANDECC......... 1
> > > > isYaffs2........... 1
> > > > ---
> > > >
> > > > The rootfs.yaffs2 is made by mkyaffs2image tool from a rootfs dir.
> > > > Why there is no rootfs subdirs such as bin/ lib/ etc/ ...?
> > > >
> > > > Thanks
> > > > - Bryan Wu
> > > >
> > > > > Nobin Mathew
> > > > >
> > > > > On 7/11/07, Bryan Wu <bryan.wu@analog.com> wrote:
> > > > > > On Wed, 2007-07-11 at 12:07 +0530, Nobin Mathew wrote:
> > > > > > > This is the link to yaffs2 source
> > > > > > > http://www.aleph1.co.uk/cgi-bin/viewcvs.cgi/yaffs2/
> > > > > >
> > > > > > Yeah, I got this source. But there is no mkyaffs
> > > > > > >
> > > > > > > You can use flash_eraseall and nandwrite tools from mtd_utils
> > > > > >
> > > > > > I am not sure my method, please help me to point out some wrong:
> > > > > > $ flash_eraseall /dev/mtd2
> > > > > > $ nandwrite -y -p /dev/mtd2 rootfs.yaffs2
> > > > > >
> > > > > > right?
> > > > > >
> > > > > > I use mkyaffs as this:
> > > > > >
> > > > > > $ eraseall /dev/mtd2    /* old mtd-utils provide eraseall */
> > > > > > $ mkyaffs -e /dev/mtd2
> > > > > > $ mount -t yaffs /dev/mtdblock2 /mnt
> > > > > > $ cp "necessary files" /mnt
> > > > > > $ umount /mnt
> > > > > >
> > > > > > Then I can reboot my board mounting /dev/mtdblock2 yaffs2 as rootfs.
> > > > > >
> > > > > > Thanks
> > > > > > - Bryan Wu
> > > > > >
> > > > > > >
> > > > > > > On 7/11/07, Bryan Wu <bryan.wu@analog.com> wrote:
> > > > > > > > Hi folks,
> > > > > > > >
> > > > > > > > I am developing Blackfin NAND Flash Controller driver.
> > > > > > > >
> > > > > > > > YAFFS2 should be OK on our platform. I can't found the mkyaffs tool in
> > > > > > > > the CVS now, how can I format a NAND partition as YAFFS2 without mkyaffs
> > > > > > > > tool?
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > > - Bryan Wu
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > yaffs mailing list
> > > > > > > > yaffs@lists.aleph1.co.uk
> > > > > > > > http://lists.aleph1.co.uk/cgi-bin/mailman/listinfo/yaffs
> > > > > > > >
> > > > > >
> > > >
> >
