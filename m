Received: from mail2.racnet.net ([213.144.11.11])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3d9b-0006GT-N7
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2005 11:44:56 -0500
Received: from neptun1.office.rac.de ([10.0.0.102])
	by mail2.racnet.net with esmtp (Exim (Debian)) id 1D3d9J-0002Wt-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2005 17:44:37 +0100
Message-ID: <90EB974D9BCBE2499D2C4B234F9EEDEB3AFEFD@neptun1.office.rac.de>
From: Marcus Mikolaiczyk <m.mikolaiczyk@rac.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Feb 2005 17:44:36 +0100
MIME-Version: 1.0
Content-Type: text/plain
Subject: Where to put hardware related informations?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

we got an embedded device using the microcontroller tc1130(infineon), NOR
and NAND Flash. The Nor flash is working fine with mtd driver an jffs2. The
next thing is to implement the NAND support for the Hardware in the sources.
I'm new to this and need assistance where to add hardware related
information like memory adresses...
We use a Samsung 2Gbit NAND (8bit)K9E2G08U0M-YIB0 . The hardware is
connected in the folowing way:

TC1130	CPLD		NAND
------	-----		-----
CS2----------/CE--------/CE
A0-----------CLE--------CLE
A1-----------ALE--------ALE
/WR----------/WE--------/WE
/RD----------/RD--------/RD

P0.4(GPIO)--------------RB
TD[0:7]-----------------D[0:7]

Where do I need to add/change things like the RB for NAND support. P0.4
means something like Port 0 Pin 4 with the address range 0xF000 0C00 -
0xF000 0CFF. P0_In Register at 0xF000 0C14 Pin 4 is Bit 4. If the NAND is
working RB ist high? So the P0.4 is high which means 0xF000 0C14 is
something like 0000 0000 0000 1000 (Bit 4 is high).
Again for A0/A1... 

As I mentioned the Nor flash is working fine, so I hope changes to do don't
influence the Nor flash.

Marcus Mikolaiczyk
 
-------------------------------------------------------
RA Consulting GmbH
Zeiloch 6a
76646 Bruchsal
Germany
Tel.: +49 7251 3862 32
Fax.: +49 7251 3862 11
Mobil.: +49 176 18 3862 32
Email: m.mikolaiczyk@rac.de
-------------------------------------------------------
 
