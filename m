Received: from web20728.mail.yahoo.com ([216.136.226.118])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArMw3-0007AX-1y
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2004 19:55:43 +0000
Message-ID: <20040212195532.38851.qmail@web20728.mail.yahoo.com>
Date: Thu, 12 Feb 2004 11:55:32 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: linuxmtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: JFFS2: No space left on a blank mtd device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I mounted a blank mtd device at /mnt with type JFFS2. (I erased everything
before mounting the device.) But I cannot create any files in it. 'df -k'
shows there is no available space left.

Is it mandatory to make a 'blank' JFFS2 filesystem image even for a blank
mtd device?

Thanks a lot,
-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html
