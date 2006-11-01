Received: from mail87.messagelabs.com ([216.82.250.19])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gf7DU-00013C-LY
	for linux-mtd@lists.infradead.org; Tue, 31 Oct 2006 22:56:46 -0500
Message-ID: <4548195D.80505@magellan-technology.com>
Date: Wed, 01 Nov 2006 14:49:49 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
Subject: NOR Flash on at91rm9200 status?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

looking at your Linux-2.6-at91 patch status page it shows:
"NOR Flash  	 unknown  	 ?"

Is this still accurate? I understand that the Cogent boards use NOR Flash with
the at91rm9200. Does that mean the NOR Flash drivers are all working fine, or
do they only work with the Strataflash parts?

I was thinking of a design that used the Toshiba TC58FVM7T5 16MBx8 NOR Flash.
Will I be able to use this part with the Linux kernel?


regards,

Aras Vaichas

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
