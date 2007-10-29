Received: from [212.176.242.38] (helo=vaxon.spb.rtsoft.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ima9L-0000bB-Hz
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 19:19:49 +0000
Date: Mon, 29 Oct 2007 23:17:38 +0300
From: Valentine Barshak <vbarshak@ru.mvista.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 0/3] Add device-tree aware NDFC driver
Message-ID: <20071029201738.GA2022@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tglx@linutronix.de, sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds a device-tree aware PowerPC 44x NanD Flash Controller driver
The code is based on the original NDFC driver by Thomas Gleixner, but
since it's been changed much and has initialization/clean-up completely
reworked it's been put into a separate ndfc_of.c file. This version
supports both separate mtd devices on each chip attached to NDFC banks and
single mtd device spread across identical chips (not using mtdconcat) as well.
The choice is selected with device tree settings. This has been tested
on PowerPC 440EPx Sequoia board.
Any comments are greatly appreciated.
Thanks,
Valentine.
