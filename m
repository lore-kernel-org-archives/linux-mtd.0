Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19K6mN-0003L4-0f
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 02:27:59 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19K6l8-0005Iz-00
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 03:26:42 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Sun, 25 May 2003 18:28:41 -0700
Message-ID: <m31xymzeba.fsf@bfnet.com>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: Looking for mkfs.jffs2 source that compiles against 2.4.18
 (redhat+patches)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a highly-patched 2.4.18 kernel from my CPU vendor that includes
JFFS2 support, but I've been unable to get the latest CVS mkfs.jffs2
to compile against it.  The reason seems to be my kernel's jffs2.h not
having defined the jint16_t and jint32_t.  I have tried to follow the
instructions in the latest mtd CVS for patching the kernel, but my
kernel has a lot of special code in the mtd/nand directory that gets
clobbered by mtd's patchin.sh.  I have tried working around this but
it is just too tangled of a mess.

My kernel's jffs2.h says:

 * $Id: jffs2.h,v 1.22 2002/01/09 13:27:58 dwmw2 Exp $

This looks almost identical to the version of jffs2.h in my stock
RH7.3 development system's kernel source.

Can anyone tell me how to check out a version of mtd/util from CVS
that will compile against my kernel's existing JFFS2 support?

Thanks,
Dave
