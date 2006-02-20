Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBDQL-00013y-R3
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 10:58:09 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?H=E5kan?= Kvist <hagar@df.lth.se>
In-Reply-To: <20060220153856.GA8027@festis.df.lth.se>
References: <20060217094403.GA20803@festis.df.lth.se>
	<20060217152524.GA21805@festis.df.lth.se>
	<20060220153856.GA8027@festis.df.lth.se>
Content-Type: text/plain; charset=utf-8
Date: Mon, 20 Feb 2006 16:59:03 +0100
Message-Id: <1140451143.2480.737.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with getting a nand-flash chip to work
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-02-20 at 16:38 +0100, Håkan Kvist wrote:
> 00000210  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> *
> 00000410  ff ff ff ff ff ff ff ff  64 93 3c ed 00 00 00 00
				     ^^^^^^^^^^^^^^^^^^^^^^^	
Theres stray data on the FLASH.

Please do a flash_eraseall /dev/mtdX first. Then check the flash content
with nanddump. Its has to be all FF. No need to do more complex stuff
before the basics are not working.

	tglx
