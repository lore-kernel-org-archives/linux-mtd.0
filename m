Received: from ip10.savigear.adsl.uk.xo.com ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PONf-0003xl-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 15:11:47 +0100
Received: from spoinky.renegade.org.uk ([192.168.1.2])
	by xerp.secret.org.uk with esmtp (Exim 3.33 #1)
	id 17POOZ-0006pu-00
	for linux-mtd@lists.infradead.org; Tue, 02 Jul 2002 15:12:43 +0100
Received: from localhost ([127.0.0.1] helo=secret.org.uk)
	by spoinky.renegade.org.uk with esmtp (Exim 3.35 #1 (Debian))
	id 17PONb-0006pj-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 15:11:43 +0100
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: [ANN] Driver for PCMCIA Flash memory cards 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Jul 2002 15:11:43 +0100
Message-Id: <E17PONb-0006pj-00@spoinky.renegade.org.uk>
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

Hi,

I have written an MTD driver for PCMCIA flash memory cards. These are the
older type of PCMCIA memory cards (usually 4-16MB in size) NOT Compact Flash
cards. The driver works by mapping out the cards and providing read/write
routines then calling the chip probe functions. In this way it just acts
as a mapping driver and doesnt care about the chips used. 

It is still quite alpha and should be treated with caution,
but I have successfully tested it on 2.4.19-rc1,2.4.17(i386) and
2.4.17-rmk5(ipaq/arm) with a few different memory cards.
I have been able to setup jffs2 and transfer files between a laptop and
Ipaq successfully.

Once the code is more stable I may put it into the MTD CVS, however I'm
still figuring out some things with PCMCIA initialisation code so it
is still subject to large rewrites ;)

Anyway, if anyone is interested, it is at: http://si.org/pcmciamtd/

bugs & comments welcome ;) 

cheers
si
