Received: from post-23.mail.nl.demon.net ([194.159.73.193])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1ImXG2-0001pH-Jl
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 12:14:37 -0400
Message-ID: <472606D2.7020709@m8.nl>
Date: Mon, 29 Oct 2007 17:14:10 +0100
From: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: bank switching
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

hello linux mtd-guys,

I use the blackfin embedded uClinux environment. I want to change a 
flash chip-driver to support all four memory banks which are available. 
Right now, I have a driver which supports 1 memory bank of 2MB. I want 
to be able to use the other three memory banks also 2-4Mb, 4-6MB and 6-8MB.

Memory bank selection is done by using general io pf4 and pf5. For 
instance: when  pf4 is enabled and pf5 is disabled I am writing in the 
region 2-4MB.

What would be the correct way to change the chip driver? Do you have a 
template or tutorial on bank switching?

The driver I want to change is: cfi_cmdset_0001.c

I hope someone can help me.

regards,
Servaes Joordens





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
