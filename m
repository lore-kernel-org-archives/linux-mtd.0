Received: from [141.169.254.2] (helo=mio.wago.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178iuU-0005qe-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 15:40:46 +0100
From: olivier.eribon@acterna.com
To: ppcboot-users@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <C1256BBC.005091CD.00@magnus.eni.wago.de>
Date: Fri, 17 May 2002 16:32:06 +0200
Subject: ppcboot load linux kernel on nand flash
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hello,

I tried to port ppcboot 1.1.5 and linux 2.4.19pre1 to our custom 405GP board
with small nor flash and a nand flash memory.
  - NOR  flash  1Mo (512 ko for ppcboot and 512 ko for fpga design),
    (be careful: no more space on NOR flash !) AMD 29DL800BT
  - NAND flash 32Mo (1 Mo for linux kernel, and 31 Mo for root fs and other...)
Samsung K9F5608U0A

Now after reset of this board, ppcboot is load from the nor flash to RAM and
run.

I want to read (read only) nand flash to load linux kernel. I known that some
blocks of nand flash could be invalid.

Has anybody an help whatidea about that could be incorporate to ppcboot in order
to be able to read (only read) a nand flash ?

Or has anyone developped a light nand driver ?

With Regards,
Thanks in advance

Olivier Eribon
