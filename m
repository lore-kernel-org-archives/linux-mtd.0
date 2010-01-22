Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYLUX-0008QS-BO
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 15:32:13 +0000
Received: by fxm22 with SMTP id 22so1320128fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 07:32:07 -0800 (PST)
Subject: [PATCH 0/4] Cleanups for mtd translation layer
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Jan 2010 17:31:56 +0200
Message-ID: <1264174316.24012.17.camel@maxim-laptop>
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

I have broken up the patch series that I created for proper
SmartMedia/xD support.

This patch series contain patches that fix hotplug & suspend/resume in
mtd translation layer.

Patches are (almost) unmodified from last submission, and well tested on
real hotplugable card.
I can say that for a long time (even before last submission) I had no
issues regarding hotplug and/or suspend resume even in exterme cases.
(like suspending the system while doing 'dd if=/dev/zero of=/dev/smblka'
or yanking the card out while read or write is performed)

First two patches, prepare ground for real work and don't add new
functionality.

Third patch adds everything needed to common translation layer to make
the hotplug work.

Last patch makes suspend/resume work much better by allowing to freeze
the IO thread, thus avoiding situation you suspend in middle of IO.


Best regards,
Maxim Levitsky
