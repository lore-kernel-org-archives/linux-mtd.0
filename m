Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bia4d-0006li-Rc
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2004 10:40:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Cosmin Cremarenco <cosmin.cremarenco@inria.fr>
In-Reply-To: <33642.128.93.9.76.1089295764.squirrel@smis.inria.fr>
References: <33642.128.93.9.76.1089295764.squirrel@smis.inria.fr>
Content-Type: text/plain
Message-Id: <1089297660.2704.21.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Thu, 08 Jul 2004 16:41:00 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: optimize number of erases on nand
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-08 at 16:09, Cosmin Cremarenco wrote:
> Hello
> 
> I am trying to optimize the number of necessary erases on a nand flash
> memory.
> In fact I want to write many times the same page without deleting the
> outer erase unit, that contains it, everytime.

The number of consecutive writes to a page are restricted. The number
depends on the chip type and varies from 1-4. On chips which allow
consecutive writes it may be required to write in fixed subpage slices.
Many chips require a sequential order of page programming in a block
too. Bitwise reprogramming is not allowed at all. The result of ignoring
this is data loss. Also partial (re)programming does not allow to use
the ECC mechanism properly. In case of an bit error you can neither
detect it nor correct it.

Due to the above we allow only full page writes and we are not going to
change this.

NAND flash aware filesystems take this into account and handle this
properly.

> Quote from /usr/src/linux2.6/drivers/mtd/nand/nand.
>         * The NAND device assumes that it is always writing to
>         * a cleanly erased page. Hence, it performs its internal
>         * write verification only on bits that transitioned from
>         * 1 to 0. ....
That's how the fail/success check works on NAND chips and does not
affect the consecutive write limitations.

--
tglx
