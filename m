Received: from kit-firewall.christiedigital.com ([216.94.43.2])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GZRQu-0007Mq-FO
	for linux-mtd@lists.infradead.org; Mon, 16 Oct 2006 08:19:13 -0400
Message-ID: <BBFE984BA7B87642BCF1C456FD48C1750223100E@kit-mail.christiedigital.com>
From: "Crane, Matt" <Matt.Crane@christiedigital.com>
To: linux-mtd@lists.infradead.org
Subject: CFI support for dual-die (2x256) 512mbit strataflash
Date: Mon, 16 Oct 2006 08:18:59 -0400
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to use a 512mbit intel strataflash chip in a new embedded linux
system we're developing with a 2.6.12 kernel running on a coldfire 5475.  
 
The flash uses two dies on a single chip with virtual chip enable.  I would
like to be able to use the cfi probe on both dies.  Right now probing it
returns the cfi information for the first die, and works fine for that half
of the flash.   The datasheet for the flash refers to the "CFI link field"
at the end of the cfi structure, which I'm thinking is what I need to
access.   
 
Does anybody know the best way to incorporate the 2-die flash with mtd?   Is
there cfi-link support/info/source somewhere maybe?   
