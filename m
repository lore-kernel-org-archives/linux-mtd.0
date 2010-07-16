Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZiAL-0007ga-F3
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2010 10:29:14 +0000
Received: by pvf33 with SMTP id 33so903885pvf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jul 2010 03:29:09 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Jul 2010 15:59:08 +0530
Message-ID: <AANLkTincY7XUC7X83YSbC7Gt8q6QTU67yejqbYv1ewgq@mail.gmail.com>
Subject: JFFS2 image mount but ls fails??
From: Manish Aggarwal <manish@circuitsutra.com>
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

Hi All,

I am running linux kernel version 2.6.32 on ARM RealView based virtual
platform (from ARM fastmodel).

I am able to boot the kernel successfully and able to get cramfs based
root file system loaded on to it.

There are two flash in the system which are partitioned (using MTD
subsystem) like this using the kernel command line:

armflash.0 -> First 2M for Kernel and next 2 MB for busybox
based cramfs image
armflash.1 -> Full 64 MB for another root (JFFS2 based) file system

(The flash is  Intel Strata Flash J3, a nor flash )

Now after that I have to mount the jffs2 image on some mount point,
which I do using the following command

mount -t jffs2 /dev/mtdblock2  /tmpfs/new_dir

The command executes successfully abd "df -h" actually shows the
expected output, but when I run "ls /tmpfs/new_dir", system seems to
go into infinite loop and the prompt never comes back.

Any ideas on this why it is happening so and what I can do to rectify it??

Other details are:
=================

I created the jffs2 based rootfs using the following command.

mkfs.jffs2  -n  -s 128 -r _install -o root_jffs2.img

where _install is my rootfs directory and root_jffs2.img is
the output image. The size of root_jffs2.img is around 48MB.


Other observations are:
===================

When I keep the the partition size of rootfs on armflash.1 to
be 32 MB the "ls" commands succeeds. But due to obvious reasons when I
run "chroot /tmpfs/new_dir  /int", I got segmentation fault.

I don't understand why the ls commands works (for the same image) when
the partition size is equal to 32 MB but not when partition size is
64MB and what should I do to correctly mount the jffs2 rootfs.

Any help in this regard will be highly appreciated.

Regards,
Manish

-- 
CircuitSutra Technologies
Software Partner to Semiconductors
manish@circuitsutra.com
