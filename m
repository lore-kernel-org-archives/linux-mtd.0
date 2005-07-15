Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtVNV-0000M5-Fc
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 14:57:42 -0400
Message-ID: <42D80720.6030207@mvista.com>
Date: Fri, 15 Jul 2005 11:57:36 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <DE88BDF02F4319469812588C7950A97E931034@ussunex1.palmsource.com>
In-Reply-To: <DE88BDF02F4319469812588C7950A97E931034@ussunex1.palmsource.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Martin Fouts <Martin.Fouts@palmsource.com>
Subject: Re: NAND bbt build reads wrong oob data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Verified this fixes my board, many thanks, Thomas!

From: gleixner@infradead.org
Date: Fri, 15 Jul 2005 14:53:51 +0100
Subject: mtd/drivers/mtd/nand nand_bbt.c,1.34,1.35

Modified Files:
	nand_bbt.c
Log Message:
[MTD] NAND: Fix broken bad block scan for 16 bit devices

The previous change to read a single byte from oob breaks the
bad block scan on 16 bit devices, when the byte is on an odd
address. Read the complete oob for now

-- 
Todd
