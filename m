Received: from concorde.inria.fr ([192.93.2.39])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiZaY-0006ZY-5O
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2004 10:09:27 -0400
Received: from wanda.inria.fr (wanda.inria.fr [128.93.2.54])
	by concorde.inria.fr (8.12.10/8.12.10) with ESMTP id i68E9OSH029924
	for <linux-mtd@lists.infradead.org>; Thu, 8 Jul 2004 16:09:24 +0200
Received: from wanda.inria.fr (localhost.localdomain [127.0.0.1])
	by wanda.inria.fr (8.12.8/8.12.8) with ESMTP id i68E9Oa7011468
	for <linux-mtd@lists.infradead.org>; Thu, 8 Jul 2004 16:09:24 +0200
From: Cosmin Cremarenco <cosmin.cremarenco@inria.fr>
Message-ID: <33642.128.93.9.76.1089295764.squirrel@smis.inria.fr>
Date: Thu, 8 Jul 2004 16:09:24 +0200 (CEST)
To: <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: optimize number of erases on nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I am trying to optimize the number of necessary erases on a nand flash
memory.
In fact I want to write many times the same page without deleting the
outer erase unit, that contains it, everytime.

I looked at the Linux MTD driver and it seems possible
(at that abstraction level, at least).

Quote from /usr/src/linux2.6/drivers/mtd/nand/nand.
 /*
        * The NAND device assumes that it is always writing to
        * a cleanly erased page. Hence, it performs its internal
        * write verification only on bits that transitioned from
        * 1 to 0. ....
        */

Is this hardware dependent or it should work on every
NAND type flash memory?

Thanks a lot,
  Cosmin
