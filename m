Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZZ8Y-0000PV-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 14:00:54 +0100
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZZ8X-0000PP-00
	for mtd@infradead.org; Mon, 27 Mar 2000 14:00:53 +0100
Received: from zentropix.com ([195.166.67.91])
	by colo.asti-usa.com (8.9.3/8.9.3) with ESMTP id IAA06131
	for <mtd@infradead.org>; Mon, 27 Mar 2000 08:06:30 -0500
Message-ID: <38DF5BE8.1700BEE8@zentropix.com>
Date: Mon, 27 Mar 2000 14:02:32 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: GRUB vs LILO
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Does anyone know if GRUB has an in-built limit to the size of DOC you
can use it with?

I've got a 4MB DOC2000 and a 24MB DOC2000, both with very similar
filesystems & kernels on. I can boot my system (from hard-disk or DOC)
using LILO (with Dvir Oren's patch applied) with either device installed
but GRUB will only allow me to use the smaller one.

My command line is:
grub> kernel (hd0,0)/mtd/bzImage root=/dev/hda5

and I get:

  [Linux-bzImage, setup=0x800, size=0x88440]

Selected item cannot fit into memory

Any help much appreciated.

Thanks

Trevor.
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
