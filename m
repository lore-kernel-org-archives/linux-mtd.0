Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F0KH-0006p4-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 22:24:50 +0100
Received: from spoinky.secret.org.uk ([194.154.178.212])
	by ultra with esmtp (Exim 3.03 #1)
	id 15F0Zk-0006Zy-00
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2001 22:40:48 +0100
Received: from localhost ([127.0.0.1] helo=spoinky.secret.org.uk)
	by spoinky.secret.org.uk with esmtp (Exim 2.02 #1)
	id 15EzJQ-0008Px-00
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2001 21:19:52 +0100
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: Block device as MTD 
In-reply-to: Your message of "Tue, 26 Jun 2001 11:33:04 BST."
             <E15Eq9Y-0005cF-00@spoinky.secret.org.uk>
Date: Tue, 26 Jun 2001 21:19:52 +0100
Message-Id: <E15EzJQ-0008Px-00@spoinky.secret.org.uk>
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

I have checked this into CVS now. The following files are affected:

drivers/mtd/devices/blkmtd.c  - the driver itself
drivers/mtd/devices/Config.in
drivers/mtd/devices/Makefile
patches/Configure.help

Please consider this alpha software. It uses raw/io to the disk (not via
the buffer cache). Basic usage is:

modprobe blkmtd device=/dev/floppy/0  etc

If you are going to put a JFFS2 fs on the device, please note that
it can take quite a while to mount because JFFS2 scans every block.
A 96MB CF card took about 2 minutes.

On the plus side, if you have more memory then the size of the device,
you should find the whole device in the page cache ;)

cheers
si
