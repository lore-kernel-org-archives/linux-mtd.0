Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFd7M-0004Ps-UT
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 01:03:09 +0000
Received: by fg-out-1718.google.com with SMTP id e21so537389fga.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 May 2010 18:03:07 -0700 (PDT)
Subject: [PATCH] [R852] Few fixes
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 May 2010 04:03:05 +0300
Message-ID: <1274490185.15285.22.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is patch series that implement few fixes in regard to
suspend/resume that I finally (after 2 years) managed to fix on my
notebook.

Currently there are exactly 3 problems, and I am investigating the
solutions.

1) I am finally confident that CONFIG_MMC_RICOH_MMC causes the SD/MMC
portion of the controller to die  (and trigger an interrupt storm).
I don't know if this is a regression, because all I did was to execute
the code that disables MMC controller a bit earlier, because otherwise
my xD driver will bind to wrong pci function.
I still continue to investigate this issue, and maybe the only solution
to it, is to write a full driver for the MMC controller 
(this is done in windows).

When this happens (it doesn't depend on whether card was in slot or not,
controller causes interrupt storm, and continues it till sdhci-pci is
reloaded, at which point it refuses to load.)
Since r852 shares (at least here) the interrupt with sdhci-pci, if I
attempt to reload it, it gets interrupt immediately, and accesses
uninitialized spinlock.
First patch in that series addresses that issue.


2) For some yet unknown to me reason, DMA stops working on r852 after
resume IF the card was inserted during time system was sleeping.
Just card reload works around that issue, but my driver still oopses
when it tries to complete() an completion that time-outed.
The second patch fixes that oops.

3) This is the weirdest problem, and it might be a cause of
CONFIG_MMC_RICOH_MMC too. I didn't yet managed to fully understand when
it happens.
Again when card is inserted during suspend (maybe even in other cases),
the controller stops reporting card insert/remove events.
You can go ahead, remove the xD card, insert SD card, etc, it still
thinks it has xD card.
A suspend/resume cycle allows it to detect the card state 'once', for
example suspending without card makes it finally understand that there
is no card, and allow to insert other cards, but insert of an xD card
doesn't make any difference.

The above is for reference, I will try soon to fix these problems.
(Especially the 2nd).


In addition to that i send a patch to fix problem in Kconfig.
All nand entries weren't shown under mtd menu + at least for now this
driver should depend on smartmedia byte order.
(Technically the SM_FTL should depends on it, but this way is safer)

Best regards,
Maxim Levitsky
