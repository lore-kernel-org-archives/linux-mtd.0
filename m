Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19azEH-0004Iz-Tu
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2003 15:50:33 +0100
Received: from merkur.eurodsn.de (merkur.eurodsn.de [192.168.0.7])
	ESMTP id h6BEeEl01045
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2003 16:40:14 +0200
From: Juergen Beisert <jbeisert@eurodsn.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 11 Jul 2003 16:49:26 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200307111649.26591.jbeisert@eurodsn.de>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Additional arguments to <struct nand_chip.hwcontrol> and .dev_ready
 functions
Reply-To: jbeisert@eurodsn.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have written a driver for my NAND flash chip application using the mtd 
framework. It works fine when there is only one chip in one memory area 
present.
But if there are more than one NAND chip, you need more than one function for
    struct nand_chip.hwcontrol,
because this function don't know which chips control lines it should change.
Same with
    struct nand_chip.dev_ready.
For which chip it should wait?

Is it possible to add arguments, like a pointer to the struct nand_chip, to 
these functions? Then one of this function could handle more than one chip.

--JB
