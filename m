Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1811XY-0004vH-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 10:29:33 +0100
Received: from neuber by jupiter with local (Exim 3.35 #1 (Debian))
	id 1811Vi-0005XE-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 Oct 2002 11:27:38 +0200
Date: Mon, 14 Oct 2002 11:27:38 +0200
From: Frank Neuber <neuber@convergence.de>
To: linux-mtd@lists.infradead.org
Subject: Virtual MTD-Device
Message-ID: <20021014092738.GA21251@jupiter>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi,
I work on a MIPS based platform with different types of flash chips.
So it is possible that one board has a 4MB flash and a 8MB flash bank
with different size of sectors. Also the flash is not linear mapped. I
will say there are holes between the 4MB and the 8MB chips.
What I wish to do is to use this flash as one virtual MTD so that I can
place a filesystem on both chips.
I'm looking for things like LVM or Softraid what only support striping 
in the MTD-Driver. Also it should be simple enough that the bootloader
can handle this.
Has anyone thought about this problem, maybe there is a ready to run solution :-))

Regards,
 Frank 
-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
