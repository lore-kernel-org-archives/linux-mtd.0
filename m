Received: from river-bank.demon.co.uk ([62.49.20.162] helo=badger.river-bank.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wknz-0002mh-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2002 15:48:51 +0100
Received: from ratty.river-bank.demon.co.uk (ratty.river-bank.demon.co.uk [192.168.1.5])
	by badger.river-bank.demon.co.uk (8.12.6/8.12.6) with ESMTP id g92EmZHF027579
	for <linux-mtd@lists.infradead.org>; Wed, 2 Oct 2002 15:48:45 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: Phil Thompson <phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Current CVS and Linux 2.4
Date: Wed, 2 Oct 2002 15:48:36 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200210021548.36663.phil@river-bank.demon.co.uk>
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

This is probably a FAQ...

What are the plans for updating Linux 2.4.x with the current CVS code?

I'm stuck with 2.4, but need some of the changes to the NAND code. I also need 
to make further changes to the NAND code - my chip's I/O lines are also on 
GPIO pins so I need a function interface rather than IO_ADDR_R and IO_ADDR_W. 
Are you interested in patches to support this - or is it too disgusting to 
support in the main code?

Thanks,
Phil
