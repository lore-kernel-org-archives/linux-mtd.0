Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NetPU-00032c-7w
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 16:58:04 +0000
Received: by bwz20 with SMTP id 20so2398450bwz.20
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Feb 2010 08:57:56 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/17 V7] Work to enable SmartMedia/xD support in mtd subsystem
Date: Tue,  9 Feb 2010 18:57:28 +0200
Message-Id: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is next version of my work.


Patches #1-#8 fix hotplug in mtd block translation layer
(Patch #7 adds minor feature for FTL drivers to be able to export sysfs attributes)

Patches #9-#13 fix several issues in NAND subsystem

Patch #16 adds a driver for my xD card reader.
I hope that writing drivers for other readers won't be that hard now.

Patch #17 adds generic SmartMedia/xD FTL

Best regards,
	Maxim Levitsky
