Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jjze-0008UT-Fl
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 19:23:38 +0100
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 19jjzE-0005lg-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2003 20:23:12 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Mon, 04 Aug 2003 11:10:20 -0700
Message-ID: <m3oez59tv7.fsf@bfnet.com>
References: <m3ispeb4cp.fsf@bfnet.com> <200308041040.11475.tglx@linutronix.de>
Mime-Version: 1.0
Sender: news <news@main.gmane.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: zlib patch doesn't take?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas> zlib.h is obviously not updated.
Thomas> Can you provide the output of ./patchin.sh ?

$ ./patchin.sh -c -j ~/C/perforce/source/deschutes/kernel/metro-X225-M14.0
Patching /home/dave/C/perforce/source/deschutes/kernel/metro-X225-M14.0
Include Filesytems: yes
Zlib-Patch needed: yes
Method: Copy
Can we start now ? [y/N]y

Patching MTD
drivers/mtd
drivers/mtd/chips
drivers/mtd/devices
drivers/mtd/maps
drivers/mtd/nand
include/linux/mtd
Patching JFFS(2)
fs/jffs
fs/jffs2
include/linux
Patching ZLIB
lib/zlib_deflate
lib/zlib_inflate
patching file lib/Makefile
Hunk #1 succeeded at 20 (offset 1 line).
Patching done
Please update Documentation/Configure.help from /home/dave/C/perforce/source/deschutes/kernel/mtd/Documentation/Configure.help
$ 
