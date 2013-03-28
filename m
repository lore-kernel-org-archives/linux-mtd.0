Received: from mailserver6.natinst.com ([130.164.80.6]
 helo=spamkiller06.natinst.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULHwv-0008Kd-Fq
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2013 18:53:22 +0000
Received: from mailserv58-us.natinst.com (nb-hsrp-1338.natinst.com
 [130.164.19.133])
 by spamkiller06.natinst.com (8.14.5/8.14.5) with ESMTP id r2SIrIo1031747
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2013 13:53:18 -0500
Date: Thu, 28 Mar 2013 13:53:55 -0500
From: Josh Cartwright <josh.cartwright@ni.com>
To: linux-mtd@lists.infradead.org
Subject: UBI(FS) issues: how to debug?
Message-ID: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey everyone-

We're looking for some help and guidance on how to further
debug/investigate several UBIFS problems we've had our internal users
report.

The issues we have run into are proving to be very difficult to
reproduce, and each has a slightly different failure mode.  We suspect
at this point they share the same underlying root cause, but don't have
enough information to confirm or deny.

The failures break down into two categories: those seen during normal
system runtime, and those seen during system boot (failures in u-boot).

The most verbose message we've gotten from the kernel is this one (which
we've only seen reported once):

  [ 4551.355726] UBIFS error (pid 777): ubifs_read_node: bad node type (0 but expected 2)
  [ 4551.363509] UBIFS error (pid 777): ubifs_read_node: bad node at LEB 4278:92920, LEB mapping status 1
  [ 4551.373349] UBIFS warning (pid 777): ubifs_ro_mode: switched to read-only mode, error -22
  [ 4551.381590] [<c0013f00>] (unwind_backtrace+0x0/0xec) from [<c0384d28>] (dump_stack+0x20/0x24)
  [ 4551.390671] [<c0384d28>] (dump_stack+0x20/0x24) from [<c01bf914>] (ubifs_ro_mode+0x74/0x80)
  [ 4551.399393] [<c01bf914>] (ubifs_ro_mode+0x74/0x80) from [<c01b6c5c>] (ubifs_jnl_update+0x444/0x470)
  [ 4551.408781] [<c01b6c5c>] (ubifs_jnl_update+0x444/0x470) from [<c01baa80>] (ubifs_unlink+0x13c/0x1c4)
  [ 4551.418243] [<c01baa80>] (ubifs_unlink+0x13c/0x1c4) from [<c00d9ed0>] (vfs_unlink+0x74/0xf4)
  [ 4551.427031] [<c00d9ed0>] (vfs_unlink+0x74/0xf4) from [<c00db9b8>] (do_unlinkat+0xb8/0x144)
  [ 4551.435340] [<c00db9b8>] (do_unlinkat+0xb8/0x144) from [<c00dd020>] (sys_unlink+0x20/0x24)
  [ 4551.444018] [<c00dd020>] (sys_unlink+0x20/0x24) from [<c000ddc0>] (ret_fast_syscall+0x0/0x48)
  [ 4556.446694] UBIFS error (pid 352): make_reservation: cannot reserve 160 bytes in jhead 1, error -30
     ... plus many more failures with -EROFS

We've also seen this error shortly after userspace boots up:

  [  113.841633] UBIFS error (pid 1065): ubifs_read_node: bad node type (255 but expected 6)
  [  113.855771] UBIFS error (pid 1065): ubifs_read_node: bad node at LEB 0:0, LEB mapping status 0

(Side question, but presumably UBIFS makes special use of LEB 0:0 ?)

But likely the most troublesome case for us is u-boot failing to load
the kernel/dtb/initramfs FIT image at bootup from a UBI volume.  In the
limited number of cases we _have_ been able to reproduce, the failure
looks like this:

  Loading file '.safe/linux_safemode.itb' to addr 0x08000000 with size 29085407 (0x01bbcedf)...
  UBIFS error (pid 0): ubifs_check_node: bad CRC: calculated 0x60c5bc7f, read 0x26c2f675
  UBIFS error (pid 0): ubifs_check_node: bad node at LEB 237:49728
  UBIFS error (pid 0): ubifs_read_node: expected node type 1
  UBIFS error (pid 0): do_readpage: cannot read page 7097 of inode 66, error -117
  Error reading file '.safe/linux_safemode.itb'

For what it's worth, the only cases we've been able to successfully
reproduce the above is by doing automated powercycle testing in a
temperature chamber with industrial temp-screened Zynq silicon at -40C
(at the bottom end of the NAND chips' operating spec).  Of the 6-boards
subjected to this environment, 3 eventually failed (one 'got better'
when brought back up to room temp).

Some more information about our setup in case it's useful:
   - ARM SoC: Zynq
   - NAND controller - ARM Primecell PL353 Static Memory Controller (Zynq peripheral)
       - Driver currently out-of-tree, see [1]
   - NAND chip - Micron 8GB, on-die 4-bit ECC
   - Kernel: 3.2.35-rt52, with vendor patches
   - u-boot 2012.10, with vendor patches

Things we've done for testing so far:
   - mtdtests, we've run the full test suite; currently sacrificing two
     boards for the mtd_torturetest at room temp
   - Weeks of aggregate automated power-cycle testing, at both room temp
     and in a temp chamber at -40C, as mentioned above

My questions are:
   - Where should we go from here?  Are there tools we're missing that
     might help us stress UBIFS/UBI/the NAND controller driver/the NAND
     chip itself in the hopes of reproducing the above issues?
   - Has anyone seen similar issues?
   - Are there currently users out there leveraging UBIFS with a
     PREEMPT_RT kernel?

Thanks for any help you can provide!

  Josh

1: http://git.xilinx.com/?p=linux-xlnx.git;a=blob_plain;f=drivers/mtd/nand/xilinx_nandps.c;hb=04d9378881401e71f83b8b4fea0abd71d33b4052
