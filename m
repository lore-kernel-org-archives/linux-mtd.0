Received: from hoemail2.lucent.com ([192.11.226.163]
	helo=hoemail2.firewall.lucent.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3wov-0005YU-3J
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 12:40:21 +0000
Message-ID: <405998A2.3060107@lucent.com>
Date: Thu, 18 Mar 2004 05:40:02 -0700
From: Mike Wellington <wellington@lucent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Mike Wellington Failsafe Account <platform@whirlwind.he.net>
Subject: Strataflash  standard and  LinearFlash vs ATA Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   I am new to Flash memory.  I have just ported
linux to the PPC405.   Here is my question:

Our final hw will have Intel Strataflash.  Our
development board does not have any flash.  We
would like to write flash drivers for the Intel
Strataflash family on the development board.
I think this can be done by purchasing a PCMCIA
Linear Flash card.  You can get 20MB for $110. 
However ATA flash seems to be larger and cheaper:
160MB for $80.

If I want to talk to the memory using the same
Strataflash interface that I will have to use
on the final hw, do I have to buy a linear
flash, or can I just buy an ATA flash?

-- 

=mike wellington
wellington@lucent.com
303.920.6412  Desk
720.434.7559  Cell
