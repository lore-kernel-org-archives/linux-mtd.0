Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkeVK-0000dQ-TP
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 03:48:39 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Pathompong Puengrostham <jay4mail@yahoo.com>
In-Reply-To: <40F4BD37.4090500@yahoo.com>
References: <40F4B205.6060902@yahoo.com>  <40F4BD37.4090500@yahoo.com>
Content-Type: text/plain
Message-Id: <1089790912.5274.61.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 09:41:52 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on NAND, Magic bitmask 0x1985 not found
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-14 at 06:57, Pathompong Puengrostham wrote:
> Hi,
> 
> I just found the problem. It is that my NAND flash CE pin is not driven 
> by GPIO. It is driven by CS from the CPU. Here is the change that I made.

Ok, I accept the change in nand_verify_pages. I expected this to break,
as it was stated in the comment. But for sure we will not invent a new
CONFIG_ switch, we have an options field for such stuff already, also
using a wait for ready there in any case will be enough.

> I also had to add the following to my nand_init().
> 
> for (i = 0; nand_flash_ids[i].name != NULL; i++)
> 	nand_flash_ids[i].options |= NAND_NO_AUTOINCR;

Sorry, thats crap. The options are defined in nand_ids.c and are not a
subject to be modified anywhere else. If you want to have the
NO_AUTOINCR option set for your board, then set it in the options field
before calling nand_scan. The bit is not overwritten by the option init
in nand_scan.

Which chiptype are you using exactly? 

The changes you made make not really sense as you put in delays which
are neccecary for chips, which do autoincrement. Those chips which can
not autoincrement do neither need a wait nor a deselect/select after a
page is read.

tglx
