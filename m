Received: from web13602.mail.yahoo.com ([216.136.175.113])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15a0GM-0001nx-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 20:35:34 +0100
Message-ID: <20010823194128.72225.qmail@web13602.mail.yahoo.com>
Date: Thu, 23 Aug 2001 12:41:28 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: ZFMicro MachZ modification of physmap.c
To: Vipin Malik <vipin@embeddedlinuxworks.com>, linux-mtd@lists.infradead.org
In-Reply-To: <5.1.0.14.0.20010823095635.00b00ca0@mail.spewey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello,

--- Vipin Malik <vipin@embeddedlinuxworks.com> wrote:
> 
> Normally, one map's the entire flash as far as the chip select's are 
> concerned, and set's the start/length logically in the map driver (in your 
> case physmap.c).
> Of course you don't want to start/stop in the middle of a sector. Only on 
> sector boundaries please :)
> 

It seems that the standard physmap.c just takes the 3 CONFIG_* inputs of start (of the physical
memory address to look for the flash),length, and bus width.  To change the offset of the flash to
access do you modify the return from ioremap() ?

For example, if I have an 8 Mbyte flash chip that I want to access with MTD and I only want to map
from byte offset 0x300000 to 0x700000 of the flash I should set my CONFIG_MTD_PHYSMAP_LEN to 4
Mbytes and inside the physmap.c code add an offset of 0x300000 to something?

Sorry for being a slow learner on this one,
Luke


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
