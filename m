Received: from mail-qy0-f31.google.com ([209.85.221.31])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2N4M-0001k7-5o
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 09:40:26 +0000
Received: by qyk12 with SMTP id 12so251411qyk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Nov 2008 01:40:23 -0800 (PST)
Message-ID: <c69bda8c0811180140i3e3ac35ai306fbd4dfcf976d3@mail.gmail.com>
Date: Tue, 18 Nov 2008 10:40:23 +0100
From: "Peter Jolasson" <peter.jolasson@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: read-only problem with mtd
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a tricky problem that I really could need some input on.

I have an "embedded linux" device which has a flash that are divided
into 4 mtd partitions

31:0    bootloader
31:1    kernel (ro)
31:2    upgrade root file system
31:3    normal root file system

The interesting parts of the cmdline that the bootloader passes to the
kernel at startup are:
root=31:3 rootfstype=jffs2
mtdparts=phys_mapped_flash:256k(boot),1280k(kernel)ro,4096k(upgrade_rfs),-(normal_rfs);



To make an upgrade of the normal root file system I make a pivot
_root() to my upgrader root file system and from there I can replace
the normal root file system. This works without problems and are
programatically done via network.

But now I need to upgrade the kernel, and as you can see the kernel
partition is read only.
I cannot find out any way to solve the problem that the kernel mtd
partition is read only. (I really do regret setting it to read only)
Is there some way to "undo" the (ro) that were specified on the cmdline?
(Something like reboot and specifying a new cmdline would be nice)

My problem is that I have a lot of devices at customer location, and I
would like to be able upgrade them via network.
Otherwise I have to send them an special RS232 cable and use the
builtin bootstrap in the ARM chip.

Regards
/Peter/

PS
I have no problems with replacing the whole root file system to be
able to upgrade the kernel partition
DS
