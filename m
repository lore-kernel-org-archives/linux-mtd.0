Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACn9V-0003Bk-MU
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 22:37:53 +0100
Received: from mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id OAA06588
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 14:36:46 -0700
Sender: ahennessy@mvista.com
Message-ID: <3F984931.E6409ED7@mvista.com>
Date: Thu, 23 Oct 2003 14:33:38 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I need some advice on how to support a board that has a hardware state
machine
that creates a parallel bus style interface to the NAND chip.  It is
totally
different from the standard 8 IO signal controls.   It can do write_byte
and read_byte
put requires the offset into the flash as a parameter.    nand.c is
fairly modular, allowing
several functions to be coded in the hardware file but there is no
current method of
passing an offset into, say, read_byte and write_byte unless the
nand_chip priv field
can be used (via mtd->priv).   Do you think the standard nand.c can be
used in this
case or should I create a specific one for this board?

Any advice would be appreciated.

Alice
