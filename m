Received: from cmsrelay03.mx.net ([165.212.11.112])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgRL3-0002Eg-CD
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 12:56:38 -0400
Message-ID: <040801c46055$cbfae280$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <03c201c46041$57b3fa10$fd0ba8c0@briantpc>
Date: Fri, 2 Jul 2004 11:58:27 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: 2.6.x nettel.c compile problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> NET: Registered protocol family 1
> NET: Registered protocol family 17
> Kernel panic: VFS: Unable to mount root fs on mtdblock1
>
> I also tried enabling INITRD without the headers I added at the top, but
> with the same result.
>

I added some debugging output to do_mounts.c and got this on boot:

Loading................................................................
Linux version 2.6.2 (root@FedoraCore1) (gcc version 3.3.2 20031022 (Red Hat
Linux 3.3.2-1)) #35 Fri Jul 2 11:20:05 CDT 2004
.......
Linux Kernel Card Services
  options:  [pci] [cardbus]
PCI: Probing PCI hardware
PCI: Probing PCI hardware (bus 00)
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
......
VFS: name=/dev/root, p=ext2, root_mount_data=<NULL>, err=-22,
VFS: name=/dev/root, p=minix, root_mount_data=<NULL>, err=-22,
Kernel panic: VFS: Unable to mount root fs on mtdblock1

Now, I have JFFS2 support compiled into the kernel.  Any ideas on why it is
only trying to mount the root fs as ext2 or minix?  I use ext2 for a ram
disk, and minix is used for 128k BRAM.

Any help is appreciated.

-Brian
