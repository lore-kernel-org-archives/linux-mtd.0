Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SmSP-0006Xt-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 21:58:25 +0000
To: Jeroen Roose <Jeroen.Roose@chess.nl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel C3 chips
References: <200201211137.MAA19110@enterprise.chess.nl>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 21 Jan 2002 15:09:21 -0700
In-Reply-To: <200201211137.MAA19110@enterprise.chess.nl>
Message-ID: <m3g04z1hm6.fsf@DLT.linuxnetworx.com>
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

Jeroen Roose <Jeroen.Roose@chess.nl> writes:

> Hello,
> 
> We've got a board based on the CDB89712 but using C3 (TE28F320/C3BC90) in
> stead of the B3 version. The C3 chip locks all blocks on chip reset. I've
> patched the bootloader (hermit) to unlock all blocks on boot.
> I've got MTD/JFFS2 working on the board, with the bootloader patch, but I
> think MTD should unlock the blocks.

There is code to do that, usually the command is just
unlock /dev/mtd0

> I'm not familiar with the MTD architecture, so I don't no how/where to
> implement this, can You help me to point this out ?

Unless the unlock needs to happen at mount time trace the unlock command.

Eric
