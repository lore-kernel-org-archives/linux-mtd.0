Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYM7w-00053x-8k
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 16:12:56 +0000
Received: by bwz4 with SMTP id 4so1312997bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 08:12:51 -0800 (PST)
Subject: [PATCH 0/2] Smartmedia/xD support
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Jan 2010 18:12:45 +0200
Message-ID: <1264176765.24012.59.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, joern <joern@logfs.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is final patch series that depends on two former series and consist
of two patches.

First adds a driver for my xD card reader. Patch is almost unchanged
from previous submission.
I fixed few problems with suspend/resume. Device just works now.

Second patch, is a new SmartMedia/xD FTL support.
This version reverts many things I did in last version.
Driver again doesn't use mtd badblock handling.
Due to all kinds of problems I deciced it will be better to do it here.

I added support for 256 byte nand devices, thus now the FTL covers
everything. This is tested with nandsim.

I added lots of error checking. Driver is now very carefull and not
erase happy as it was. I decided that repairing the card should be done
by fsck like utility and not the driver.

Driver does some checks for device fails, by rereading the CIS.

Everything works now, and I think ready for use.

Best regards,
Maxim Levitsky
