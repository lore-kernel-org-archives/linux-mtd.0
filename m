Received: from fencepost.gnu.org ([199.232.76.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187Qjl-0004P3-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 01:36:37 +0000
Received: from proski by fencepost.gnu.org with local (Exim 4.10)
	id 187RD1-0006s6-00
	for linux-mtd@lists.infradead.org; Thu, 31 Oct 2002 21:06:51 -0500
Date: Thu, 31 Oct 2002 21:06:51 -0500 (EST)
From: Pavel Roskin <proski@gnu.org>
To: linux-mtd@lists.infradead.org
Subject: Adding devices at runtime
Message-ID: <Pine.LNX.4.44.0210312045360.17700-100000@marabou.research.att.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hello!

If I understand correctly, the MTD driver allows to define two devices in
predefined memory areas - one using the CFI driver (CONFIG_MTD_PHYSMAP),
the other using the MTDRAM driver (CONFIG_MTD_MTDRAM).

What if I want more MTD devices in the known memory areas?  Can I register
them at runtime, when the kernel is loaded?  Is it possible to do it
without using modules?  Can I do it without changing the kernel (I mean 
something like "echo 200000 20000 2 >/proc/mtd").

I realize that the question is very basic, but my search for "add" and
"register" in the HOWTO from CVS didn't bring any positive results.

Can it be that I want something wrong?  I simply want to boot from one
flash device and be able to access (and possibly rewrite) that device and
another device.  Both are supported by the JEDEC driver
(CONFIG_MTD_JEDECPROBE), but they use different (not adjacent) memory
areas.  (Of course I hacked drivers/mtd/maps/physmap.c to probe
"jedec_probe", but I know that it's already done right in MTD CVS.)

Right now I have to use the MTDRAM driver on the boot device, so the I
cannot rewrite it (I haven't tried, but I don't expect it to work).  I can
only rewrite the other chip.

-- 
Regards,
Pavel Roskin
