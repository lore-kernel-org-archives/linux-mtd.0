Received: from cs242740-33.austin.rr.com ([24.27.40.33] helo=dzuylt)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Vzcs-0007H3-00
	for <linux-mtd@lists.infradead.org>; Sat, 20 Jul 2002 20:10:47 +0100
Received: from infinity-studios.com (localhost.localdomain [127.0.0.1])
	by dzuylt (8.11.6/8.11.6) with ESMTP id g6KJAgM01503
	for <linux-mtd@lists.infradead.org>; Sat, 20 Jul 2002 14:10:42 -0500
Message-ID: <3D39B5B2.1060309@infinity-studios.com>
Date: Sat, 20 Jul 2002 14:10:42 -0500
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskonModule and grub
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This may be off topic or not correct list, but since it deals with small 
storage
drives and grub so I thought I'd ask.

I have a 16MB DiskOnModule from PQI which plugs right into the IDE 
controller
and behaves just like an IDE disk.  I've partitioned it OK and mke2fs 
and mount, etc.,
and so far it works just like an IDE drive on /dev/hdd.  However, I'm 
having problem
booting from it.  I've installed grub (0.90) on /dev/hdd and it says 
it's successful but
everytime I boot from it, all I've got is "GRUB Geom error".

I realize that the DOM is probably another flash device and the geometry 
is not the same
as a spinning IDE drive so some grub modification may be required.  I 
see that there are
some of us in this list who has done grub modification (Mark, Ilguiz, 
etc.) so any tip from
you on how to get started would be much appreciated.  Thanks.

Dzuy
