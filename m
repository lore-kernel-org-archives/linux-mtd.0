Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F4cOT-000224-55
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2006 06:13:06 -0500
From: Wolfgang =?iso-8859-15?q?M=FCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 2 Feb 2006 12:12:43 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602021212.43995.wolfgang.mues@auerswald.de>
Subject: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I want to use JFFS2/MTD in an embedded Linux device with frequent
writes (worst case is 15 KBytes per 10 seconds, typical case is less than 10% 
of the worst case). The device will be a 512 MBit NAND SLC type from Hynix,
Samsung or STM. We have a working prototype, and we have read many NAND flash
papers available on the net, and the recent MTD mailing list archives.

Beside of wear leveling questions, there are program disturb errors 
(programming a page flips a bit in another page) and read disturb errors 
(reading a page flips a bit). Rates for these single-bit-errors are available
in publications from M-systems and Toshiba. 

But since single bit errors are easily corrected by ECC, I am more interested 
in errors where more than 1 bit is flipped in a 256 byte ECC area. We cannot 
calculate these error numbers from the single bit errors because we don't 
know if these errors are unrelated to each other. 

Is there any information available to estimate/calculate the remaining errors
after ECC correction? Or is there any information about first hand experience
of NAND stress tests or other real world experience?

Maybe the NAND project is terminated if I don't find anything about practical
reliability...

best regards
Wolfgang Muees
-- 
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
