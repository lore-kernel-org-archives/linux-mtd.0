Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYoEc-0006nP-UX
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 12:51:00 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Zoltan Sogor <weth@inf.u-szeged.hu>
In-Reply-To: <428B4995.9010103@inf.u-szeged.hu>
References: <1115400358.4422.92.camel@pgrayson1.realmsys.com>
	<42846606.8070108@inf.u-szeged.hu>
	<1116038903.4857.30.camel@pgrayson1.realmsys.com>
	<428B4995.9010103@inf.u-szeged.hu>
Content-Type: text/plain
Date: Thu, 19 May 2005 10:50:40 -0600
Message-Id: <1116521440.4427.199.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Centralized Summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I did some further testing. It looks like the kernel panics may have a
relationship to partition size. I have tried these tests with two
partitions: a 184MB partition and a 64MB partition. I was unable to
reproduce the kernel panics on the 64MB partition, but they were easily
reproducible on the 184MB partition (which is where I found the original
results). The other problem (Crc failure on cent_sum inocache) happens
on both partitions.

The nand part I am using has a 2048 byte page size and 128kB erase block
size.

I would be happy to send jffs2 images, but they are a bit large for
email. Maybe you could give me a place to send them to. Also, how would
you like me to prepare the images? With nanddump?

I have included the MTD and JFFS2 portions of my kernel config below.

Pete

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
# CONFIG_MTD_CONCAT is not set
CONFIG_MTD_PARTITIONS=y
# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set

#
# User Modules And Translation Layers
#
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PLATRAM is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_RAMTD is not set
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
CONFIG_MTD_NAND=y
# CONFIG_MTD_NAND_VERIFY_WRITE is not set
CONFIG_MTD_NAND_IDS=y
# CONFIG_MTD_NAND_DISKONCHIP is not set
# CONFIG_MTD_NAND_NANDSIM is not set
CONFIG_MTD_NAND_REALM_MPS=y
CONFIG_MTD_NAND_REALM_CACHED_BUFFER_ACCESS=y

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_SUMMARY=y
CONFIG_JFFS2_CENT_SUM=y
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
# CONFIG_JFFS2_RUBIN is not set
# CONFIG_JFFS2_CMODE_NONE is not set
CONFIG_JFFS2_CMODE_PRIORITY=y
# CONFIG_JFFS2_CMODE_SIZE is not set


On Wed, 2005-05-18 at 15:56 +0200, Zoltan Sogor wrote:
> Hi Peter!
> 
> We've tried to reproducate your problem but we was not succesfull yet.
> 
> Can you send us:
> - a JFFS2 image before the things go wrong
> - a JFFS2 image after went wrong
> - erase block size
> - kernel config
> 
> Thanks for bug reports.
> 
> Zoltan
> 
> 
> Peter Grayson wrote:
> 
> >I have applied the new patch. By the way, the patch does not apply
> >cleanly to the latest mtd from cvs, but it doesn't take to much to fix
> >it up (this was true for the previous patch also).
> >
> >This version of the patch seems to take care of the previous problems I
> >reported. I can now mount and unmount a previously empty partition just
> >fine.
> >
> >There are some new problems that I am running into though. The first
> >seems benign, but it ruins the CS mount performance. When mounting, I
> >will occasionally see this message:
> >
> >jffs2_cs_process_inocache_node: Crc failure on cent_sum inocache:
> >cache_crc!
> >
> >It looks like when this happens, the CS is abandoned and the mount time
> >goes from super-fast to regular-slow. I have found that this error can
> >be readily reproduced by running the following command-line once or
> >twice. Seems more likely to happen if there is some data in the
> >filesystem.
> >
> >  # mount /mnt/mtdb3 && touch /mnt/mtdb3/foo && umount /mnt/mtdb3
> >
> >The other problems I am seeing are more severe. A kernel panic
> >occasionally happens at mount time. There is also a kernel panic that
> >happens at unmount time. I have included stack traces below. The failure
> >modes seem consistent. The test I am running to make these problems
> >happen is to write a summarized jffs2 image to a partition and then
> >repeatedly mount and unmount the partition (like above, but without the
> >touch).
> >
> ># mount /mnt/mtdb3
> >Oops: kernel access of bad area, sig: 11 [#1]
> >PREEMPT
> >NIP: C00B0884 LR: C00B10D8 SP: C3F21C30 REGS: c3f21b80 TRAP: 0300    Not
> >tainted
> >MSR: 00029030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
> >DAR: C423FFCC, DSISR: 00800000
> >TASK = c3eb2ab0[97] 'mount' THREAD: c3f20000
> >Last syscall: 21
> >GPR00: 000005B7 C3F21C30 C3EB2AB0 C3EBD600 C3F21C50 C3EBD6C8 00000000
> >C033A810
> >GPR08: C3F00000 0033FFCC C3F00000 C423FFCC 39008039 000066A4 00000000
> >00000000
> >GPR16: 10079130 10070000 00020000 00000001 0B440000 00000003 C3EEEDE0
> >C3EEEE0B
> >GPR24: C01C0000 000003B5 C036964C 00000012 C01C0000 C01DFC4C C01C0010
> >C3EBD600
> >NIP [c00b0884] jffs2_cs_process_list+0x38/0x5c
> >LR [c00b10d8] jffs2_cs_build_filesystem+0x830/0xcd0
> >Call trace:
> > [c00a8238] jffs2_do_mount_fs+0x220/0x8a4
> > [c00aaa24] jffs2_do_fill_super+0x1ac/0x2b8
> > [c00aae68] jffs2_get_sb_mtd+0xb4/0x13c
> > [c00ab0fc] jffs2_get_sb+0x19c/0x1dc
> > [c004edbc] do_kern_mount+0x5c/0x124
> > [c0067458] do_mount+0x6c0/0x71c
> > [c0067938] sys_mount+0x9c/0xf0
> > [c0002a20] ret_from_syscall+0x0/0x48
> >
> ># mount /mnt/mtdb3 && umount /mnt/mtdb3
> >dumping centsum data
> >jffs2_flash_writev(): Non-contiguous write to 00000000
> >kernel BUG in jffs2_flash_writev
> >at /home/pgrayson/project/realmlinux1/linux-2.6/fs/jffs2/wbuf.c:690!
> >Oops: Exception in kernel mode, sig: 5 [#1]
> >PREEMPT
> >NIP: C00AC5AC LR: C00AC58C SP: C0369CE0 REGS: c0369c30 TRAP: 0700    Not
> >tainted
> >MSR: 00029030 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
> >TASK = c3eb3190[854] 'umount' THREAD: c0368000
> >Last syscall: 22
> >GPR00: 00000000 C0369CE0 C3EB3190 0000003A 00002F4C FFFFFFFF 00002F12
> >C0190000
> >GPR08: C0195C43 C01B0000 00000008 C0369C10 52000095 000066A4 00000000
> >00000000
> >GPR16: 10000140 C0369DB0 C3EBD114 00000000 00000000 100743A8 FFFFFFFF
> >00000002
> >GPR24: C0369D80 00000000 C3FC0000 00000000 00000000 C3880000 00000CB4
> >C3EBD000
> >NIP [c00ac5ac] jffs2_flash_writev+0x1cc/0x61c
> >LR [c00ac58c] jffs2_flash_writev+0x1ac/0x61c
> >Call trace:
> > [c00b024c] jffs2_cs_write_inocache+0xcc/0x174
> > [c00b04e4] jffs2_cs_dump_ic+0x1f0/0x284
> > [c00ab198] jffs2_put_super+0x5c/0x184
> > [c004d828] generic_shutdown_super+0xc8/0x1bc
> > [c00ab2d8] jffs2_kill_sb+0x18/0x3c
> > [c004d72c] deactivate_super+0xa0/0xd4
> > [c0065abc] __mntput+0x30/0x44
> > [c0055560] path_release_on_umount+0x4c/0x60
> > [c0066390] sys_umount+0x2bc/0x2d4
> > [c0002a20] ret_from_syscall+0x0/0x48
> >
> >Thanks for your efforts.
> >
> >Pete
> >
> >On Fri, 2005-05-13 at 10:32 +0200, Ferenc Havasi wrote:
> >  
> >
> >>Hi Pete,
> >>
> >>We updated the summary patches.
> >>
> >>Erase block summary:
> >>- fix a small bug, may cause problem only in debug mode
> >>
> >>Centralized summary:
> >>- fix a small bug, may cause problem only in debug mode
> >>- fix locking problem on empty fs
> >>- fix bad block size accounting (and counting free space)
> >>
> >>You can download the patches from our site.
> >>
> >>Bye,
> >>Ferenc
> >>
> >>    
> >>
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >  
> >
> 
> 
