Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBu4e-00078w-PA
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2010 18:53:13 +0000
Received: by wwb17 with SMTP id 17so3340937wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Oct 2010 11:53:10 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 29 Oct 2010 11:53:09 -0700
Message-ID: <AANLkTinLCCw1raGKV+Q8f-5qWMrLiOZMyP1kx5x0ma9X@mail.gmail.com>
Subject: kernel-crash: mounted root (jffs2 filesystem) on device 31:9
From: y bhanu <kernelccrazy@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi have a weird situation.
I have a working 2.6.32 kernel and the nand rootfs which I am able to
boot fine and operate.

I upgrade my kernel to 2.6.35-7 and by keeping rootfs and dtb files are same.
I got everything working except the NAND rootfs working.
I can boot and mount a ramdisk but I need a NAND rootfs working too.

I am using the same dtb file as before.
./arch/powerpc/boot/dts/p1011rdb.dts (which has the NAND layout info)

The only thing that changed is the Linux kernel.
So, are there an other place in the kernel where the nand layout gets
redefined or so forth. somewhere in mtd maps.

Should I change the MTD maps(don't know which one??) too??
How can I debug this?

>From the error, can you figure out something.

Kernel crash log:
unable to open rtc device (rtc0)
JFFS2 notice: (1) jffs2_build_xattr_subsystem: complete building xattr
subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead,
0 orphan) found.
VFS: Mounted root (jffs2 filesystem) on device 31:9.
Freeing unused kernel memory: 176k init
Kernel panic - not syncing: No init found.  Try passing init= option
to kernel. See Linux Documentation/init.txt for guidance.
Call Trace:
[df839f20] [c0007d88] show_stack+0x4c/0x178 (unreliable)
[df839f60] [c03d7604] panic+0xa8/0x130
[df839fb0] [c0002054] init_post+0xe0/0x144
[df839fd0] [c0510260] kernel_init+0x140/0x17c
[df839ff0] [c00104fc] kernel_thread+0x4c/0x68
Rebooting in 180 seconds..
NAND boot... transfering control

Thanks
Mukund
