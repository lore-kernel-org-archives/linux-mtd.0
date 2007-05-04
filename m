Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hk71e-0007NY-DG
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 19:17:23 -0400
Date: Fri, 4 May 2007 23:42:52 +0100 (BST)
From: John Smith <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: UBI: Can I boot with an UBI volume holding a root file system?
Message-ID: <Pine.LNX.4.33.0705042323250.30567-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am hoping to build a root file system and store it as a squashfs
image in a static UBI volume. What command line should I should pass
to the kernel at boot time?

There are likely to be other UBI volumes in the UBI partition which
will each get mapped to a /dev/mtdblock device. Is it going to be
difficult to identify the major/minor numbers of the device which will
mapped to my squashfs image?

I think that I need to add some initramfs logic, but I am very
uncertain of the details. I will be grateful for any ideas,

Regards,
John

John Smith
Blackburn
England
