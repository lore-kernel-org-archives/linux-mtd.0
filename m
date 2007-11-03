Received: from post-25.mail.nl.demon.net ([194.159.73.195])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IoGdr-0000ur-UB
	for linux-mtd@lists.infradead.org; Sat, 03 Nov 2007 06:54:23 -0400
Message-ID: <472C5368.3060306@m8.nl>
Date: Sat, 03 Nov 2007 11:54:32 +0100
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: mtd-forum <linux-mtd@lists.infradead.org>
Subject: address lines
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I took a closer look at the bank-switching problem. The situation is:

- I have an 4Mb Flash chip MT28F320J3FS-11
- A0-A19 are connected to the data-bus
- A20 is connected to GPIO PF4

So the hardware probe detects 4MB flash in 1 chip and tries to access it 
in a normal manner. How should I solve this? I got a patch from the 
manufacturer of the hardware for the file cfi_cmdset_0001.c, but I do 
wonder if that is the correct way to do it?

regards
Servaes



-- 

Servaes Joordens

-------------------------------------------
M8
Tappersweg 29
2031ET	Haarlem
The Netherlands
Tel:	+31 23 5311122
Mob:	+31 6 51183379
Fax:	+31 23 5322388

VAT-ID: nl-813029090B01
kvk:	34131430 Haarlem
