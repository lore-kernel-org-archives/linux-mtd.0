Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]
 helo=mail.embedded-brains.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIhaN-000424-FB
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 14:34:52 +0000
Received: from [192.168.96.31] (eb0011.eb.z [192.168.96.31])
 by mail.embedded-brains.de (Postfix) with ESMTP id B70096528B6
 for <linux-mtd@lists.infradead.org>; Fri, 13 Apr 2012 16:15:47 +0200 (CEST)
Message-ID: <4F883513.4000301@embedded-brains.de>
Date: Fri, 13 Apr 2012 16:15:47 +0200
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Alternative License for Parts of MTD?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I work with the real-time operating system RTEMS (http://www.rtems.com).  The 
license of this system is GPL with an exception that allows static linking 
without restrictions:

http://www.rtems.com/license/LICENSE

This is very similar to the eCos license:

http://ecos.sourceware.org/license-overview.html

RTEMS has currently no framework for flash devices.  It would be nice if we can 
use parts of the MTD system, e.g. the header files and device independent 
support routines like "drivers/mtd/nand/nand_base.c".  Is it possible to 
release parts of the MTD code under the RTEMS or eCos license, or would you 
categorically refuse this?

Have a nice day!

-- 
Sebastian Huber, embedded brains GmbH

Address : Obere Lagerstr. 30, D-82178 Puchheim, Germany
Phone   : +49 89 18 90 80 79-6
Fax     : +49 89 18 90 80 79-9
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine geschäftliche Mitteilung im Sinne des EHUG.
