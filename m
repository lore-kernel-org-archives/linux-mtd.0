Received: from web41706.mail.yahoo.com ([66.218.93.123])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19qrVo-0002Vu-K6
	for <linux-mtd@lists.infradead.org>; Sun, 24 Aug 2003 10:50:16 +0100
Message-ID: <20030824094921.98467.qmail@web41706.mail.yahoo.com>
Date: Sun, 24 Aug 2003 02:49:21 -0700 (PDT)
From: John Praveen <ijpraveen1@yahoo.com>
To: MTD <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: JFFS-help!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

	I have an embedded device based on ARM processor.

	My device has 32 Flash memory, 64MB SDRAM. The OS is
linux OS. My linux OS will be in Flash memory. I need
to have a file system for Flash memory. Hope I shall
use jffs2 filesystem.

	I dont have the target system right now. So i have to
create the filesystem in my host system now and use
that filesystem in my target device later.

     mkfs.jffs -d /home/jffsstuff -o /tmp/jffs.image

     /home/jffsstuff - stuff to put in flash

	Is this jffs.image to be put in the Flash memory in
the target?

	What confuses me is, is the command mkfs.jffs is to
be executed with the target flash in the host system?
or is this to be executed without the
target solely on the host system and later the image
file can be put in the target when the target is
ready?

Regards,
John.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
