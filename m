Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hkogu-0001FL-9i
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 17:54:53 -0400
Date: Sun, 6 May 2007 22:20:17 +0100 (BST)
From: John Smith <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: Mounting JFFS2 partitions as root file systems
Message-ID: <Pine.LNX.4.33.0705062154410.5488-100000@arrows.demon.co.uk>
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

I am slowly finding out how to use kernel command line parameters
to specify an MTD partition holding a root file system.

When the JFFS2 FAQ answers the question

  "Do I need to use mtdblock to mount my JFFS2 filesystem?"

it includes a remark

 "when JFFS2 is used as a root filesystem ... this requires the mtdblock
  device to be specified for root= on the kernel commandline."

But I now think this restriction went away in Kernel 2.6.18, so that it is
now possibly to put

   root=mtd:jffs2_image  rootfstype=jffs2

on the kernel command line to get the MTD partition "jffs2_image"
mounted as a root file system.

Similarly, the function jffs2_get_sb() includes the remark

  /* FIXME: How to do the root fs this way? */

which appears to have been fixed by the mtd logic in
the function prepare_namespace() in do_mounts.c.

Have I understood correctly?

John
