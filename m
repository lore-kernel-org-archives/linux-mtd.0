Received: from mk-filter-1-a-1.mail.uk.tiscali.com ([212.74.100.52])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LU8oq-0001TG-8x
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 00:07:14 +0000
Subject: [PATCH] sh: maple: Add support for VMU devices (v2) [0/3]
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: greg KH <greg@kroah.com>, Paul Mundt <lethal@linux-sh.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, dwmw2 <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 03 Feb 2009 00:06:09 +0000
Message-Id: <1233619569.13918.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-input <linux-input@vger.kernel.org>,
	MTD <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-sh <linux-sh@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series of patches adds support for the Dreamcast Visual Memory
Unit, reworking the maple bus code to ensure it supports asynchronous
reads and writes. A consequential amendment to the keyboard driver is
also included.

The VMU is a 'smart' flash chip where access is controlled by a
microcontroller so that, for instance, flash erases appear to be
transparent to the end user. The VMU does, however, show typical
flash-type behaviour (eg phased writes) and the MTD layer and the chip
work well together (eg in the way they handle apparent hotplug events
during a block write).

Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>
---
