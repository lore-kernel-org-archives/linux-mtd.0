Received: from [208.101.48.4] (helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hz53Q-0002rO-HA
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 07:13:05 +0100
Received: from bravegnu by chtn01.999servers.com with local (Exim 4.63)
	(envelope-from <vijaykumar@bravegnu.org>) id 1Hz53K-00010K-0N
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 01:12:58 -0500
Message-ID: <15361.202.144.30.226.1181887978.squirrel@www.bravegnu.org>
Date: Fri, 15 Jun 2007 11:42:58 +0530 (IST)
Subject: Read/Busy as Interrupt 
From: "Vijay Kumar" <vijaykumar@bravegnu.org>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: vijaykumar@bravegnu.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Everyone,
we have a custom MPC8560 board with a Micron NAND flash (MT29F4G08AAA).
The flash has the following specification with regards to the ready/busy
pin.

Block Erase - Max: 2ms, Typical: 1.5ms
Page Prog - Max: 600us, Typical: 220us

The MPC8560 does not have a NAND flash controller, and the NAND flash is
interfaced through the local bus controller (UPM).

In a 2.6 linux kernel, is it better to implement a polling mechanism for
the ready/busy pin or is it better to use interrupt (sleep/wake)
mechanism.

The block erase seems to be a good candidate for interrupt mechansim. But
it is not very clear for the page prog operation. Please let us know your
suggestions on this.

Please let me know if further details are required.

Thanks in advance.

Regards,
Vijay
