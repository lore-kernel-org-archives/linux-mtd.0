Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1893Sg-0008Lt-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 13:09:43 +0000
Message-ID: <F4608F665DF5D311B231009027B70F70012ED670@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: linux-mtd@lists.infradead.org
Subject: seeking help on JFFS2
Date: Tue, 5 Nov 2002 08:40:31 -0500 
MIME-Version: 1.0
Content-Type: text/plain
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

Hi,

  I am new to MTD/JFFS2. Thanks to Christian Gagnaraud's patch, I got MTD
working, but
everytime I use JFFS2 on top of it, I get a kernel oops: "Oops: kernel
access of 
bad area, sig: 11"

  Here is my setup:
    board:      MPC8260ADS
    bootloader: ppcboot-1.1.6
    kernel:     2.4.18
    MTD/JFFS2:  mtd-snapshot-20021022.tar.bz2
    RAM:        64M
    flash:      8M
    root disk:  ramdisk of 16M
    host:       x86 with cross-compiler

  Here is the message of MTD from kernel startup:
    Found: Intel 28F016S5
    MPC8260ADS Bank 0: Found 4 x8 devices at 0x0 in 32-bit mode
    Using word write method
    MPC8260ADS flash bank 0: Using static image partition definition
    Creating 4 MTD partitions on "MPC8260ADS Bank 0":
    0x00000000-0x00700000 : "jffs2-root"
    mtd: Giving out device 1 to jffs2-root
    0x00700000-0x00740000 : "ppcboot"
    mtd: Giving out device 2 to ppcboot
    0x00740000-0x00780000 : "environment"
    mtd: Giving out device 3 to environment
    0x00780000-0x00800000 : "spare"
    mtd: Giving out device 4 to spare

  Here is how I made oops happen:
    eraseall /dev/mtd1
    mount -t jffs2 /dev/mtdblock1 /mnt/flash
    cp -R sbin /mnt/flash

  Here is the oops message through ksymoops:
    >>NIP; c00e1938 <do_read_onechip+b8/4ec>   <=====
    Trace; c0011480 <printk+15c/1b4>
    Trace; c00df668 <cfi_intelext_read+b4/100>
    Trace; c00e3be8 <part_read+68/a0>
    Trace; c00a2ba0 <jffs2_mark_node_obsolete+468/88c>
    Trace; c00a1fe0 <jffs2_do_reserve_space+264/55c>
    Trace; c00a1b90 <jffs2_reserve_space+1b8/2d8>
    Trace; c009df2c <jffs2_mkdir+54/454>
    Trace; c0041d84 <vfs_mkdir+10c/130>
    Trace; c0041e8c <sys_mkdir+e4/108>
    Trace; c0003ddc <ret_from_syscall_1+0/b4>
    Trace; 1002f4f0 Before first symbol
    Trace; 100056c4 Before first symbol
    Trace; 1002f2c8 Before first symbol
    Trace; 1002ef18 Before first symbol
    Trace; 0fecef70 Before first symbol
    Trace; 00000000 Before first symbol

  Here are what I have tried:
    (a) I tried plain JFFS on MTD, and it works. The steps I use:

        eraseall /dev/mtd1
        mount -t jffs /dev/mtdblock1 /mnt/flash
        
        I can then copy/edit/delete from it, and diff shows that
        the data is consistant.

        So I think MTD layer is fine and the configuration on MTD
        part (.config) is fine.

    (b) I tried mkfs.jffs2 on both target and my x86 host (with
        big-endian option)

        mkfs.jffs2 -dipc -e0x40000 -p0x700000 -b -o /opt/ipc.jffs2

        I then cp it on a mtd device with:
        eraseall /dev/mtd1
        cp /mnt/nfs/ipc.jffs2 /dev/mtd1

        the "cp" goes fine, but when I tried to mount & use the
        JFFS2 system, within one or two commands, it will give me
        the oops with the same reason "kernel access of bad area"

        But if I now boot into ppcboot(with JFFS2 capability compiled
        in), ppcboot can recognize my JFFS2 files just fine, which
        lead me to believe the linux JFFS2 subsystem is the problem.

    (c) I then tried disabling the compression for JFFS2 by forcing
        return of JFFS2_COMPR_NONE from jffs2_compress() to see if 
        zlib is a problem. It doesn't seem to have any effect.

  Any ideas? I have been reading the mailing list archive and could
not find the answer to this.

  Thanks a lot


- Junping
