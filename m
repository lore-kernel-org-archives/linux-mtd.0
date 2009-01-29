Received: from mk-filter-1-a-1.mail.uk.tiscali.com ([212.74.100.52])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSKW1-0000FC-TB
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2009 00:12:20 +0000
Received: from [192.168.62.105] (bossclass.local [192.168.62.105])
	by newgolddream.info (8.14.3/8.14.3/Debian-4) with ESMTP id
	n0T0BY9p015487
	for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2009 00:11:49 GMT
Subject: [Fwd: [PATCH RFC] sh: maple: Add support for SEGA Dreamcast VMU
	and clean up maple bus driver (0/3)]
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 29 Jan 2009 00:10:37 +0000
Message-Id: <1233187837.6734.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Apologies, sent this to the wrong address. Here it is for completeness

-------- Forwarded Message --------
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: Paul Mundt <lethal@linux-sh.org>, Greg KH <greg@kroah.com>, Dmitry
Torokhov <dmitry.torokhov@gmail.com>, dwmw2 <dwmw2@infradead.org>
Cc: linux-sh <linux-sh@vger.kernel.org>, LKML
<linux-kernel@vger.kernel.org>, linux-input
<linux-input@vger.kernel.org>, linux-mtd <linux-mtd@vger.kernel.org>
Subject: [PATCH RFC] sh: maple: Add support for SEGA Dreamcast VMU and
clean up maple bus driver (0/3)
Date: 	Wed, 28 Jan 2009 23:47:36 +0000

These patches add support for the SEGA Dreamcast VMU and clean up the
maple bus driver, allowing it to support block devices and ensuring it
supports concurrent reads and writes eg no more mixing up which thread
locks and unlocks a mutex etc.

A consequential fix for the maple keyboard driver is also attached.

The VMU is added as an MTD (mapping) device. It's flash but its is also
"smart" so could have conceivably been added as a general block device
but it transpires that as well as actually being based on flash, it
displays behaviour on plugging and unplugging and on writing that make
the MTD block layer a good fit (namely the MTD block layer's insistence
on carrying on after a perceived hotplug event).

I posted an earlier set of patches in Spring 2008 and given the
difficulties with them these are posted here for review and comment
rather than as a simple request for inclusion as is.

Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>
---
