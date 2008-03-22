Received: from mk-filter-2-a-1.mail.uk.tiscali.com ([212.74.100.53]
	helo=mk-filter-2-a-4.mail.uk.tiscali.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jd7lB-0005SY-Vl
	for linux-mtd@lists.infradead.org; Sat, 22 Mar 2008 17:44:02 +0000
Subject: [PATCH] 0/3 - Add support for VMU flash memory and update maple
	bus driver on the SEGA Dreamcast
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: dwmw2 <dwmw2@infradead.org>, Greg KH <greg@kroah.com>
Content-Type: text/plain
Date: Sat, 22 Mar 2008 17:43:25 +0000
Message-Id: <1206207805.6324.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, Paul Mundt <lethal@users.sourceforge.net>,
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

OK, second iteration of this - have added more comments and, I hope,
addressed all or nearly all of people's comments.

This adds support for the flash memory portion of the "visual memory
unit" on the SEGA Dreamcast.

Changelogs on the patches but, in summary:

On the maple bus side: 

- adds a mutex to ensure device is only addressed once per maple bus
cycle (and so avoiding corruption of the linked list of packets waiting
for transmission).

- properly uses the existing lock on the waiting packet queue and cleans
up the way the linked lists (of waiting and processed packets) are
handled.

For the device:

- relies on the mutex to ensure block reads and writes are handled
properly - normally the bus driver will unlock the mutex once a waiting
packet has been processed

- implements support for partitions. There are rumours such devices
exist - they are supported in the specification. But I've never seen
one!


There is code to follow (eventually) to implement the FAT based
filesystem used by the Dreamcast to save to these devices, but they
should be usable as small flash devices with other filesystems too.

(See http://mc.pp.se/dc/vms/flashmem.html for more details on the
hardware etc)

Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>
