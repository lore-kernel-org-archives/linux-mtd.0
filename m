Received: from pd953a2b0.dip.t-dialin.net ([217.83.162.176] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qHu0-0001ye-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 18:12:04 +0000
Message-Id: <200203271816.g2RIGSB30367@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "John Hall" <John.Hall@optionexist.co.uk>, <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 NAND flash support
Date: Wed, 27 Mar 2002 19:16:27 +0100
References: <541025071C7AC24C84E9F82296BB9B950804C4@OPTEX1.optex.local>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950804C4@OPTEX1.optex.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wednesday, 27. March 2002 18:42, John Hall wrote:
> I'm wanting to get JFFS2 to go on some NAND flash (it's actually
> Smartmedia, but it's pretty much just NAND flash) with a 2.4.17 kernel.
It is exactly NAND flash, molded in thin plastic

> I've adapted the NAND flash driver in the kernel tree and that now seems
> to work for me.
maybe you have done duplicated work . See below.

> The jffs2 stuff in my kernel sources doesn't seem very up to date so
> I've got the latest CVS stuff. Which branch of cvs do I need to use?
> Should I update the whole of the mtd subsystem or can I just use the
> updated jffs2 stuff?
The current developer branch. Take care there were a lot of changes in nand.c 
and hardware driver files. See nand.c / autcpu12.c
Adaptions should made in hardware drivers like autcpu12 and not in nand.c
If there's a neccecarity to do this, please contact me or David Woodhouse.

> I also came across some problems with the existing NAND flash driver,
> especially with erases. It doesn't seem to mark an erase as done,
>   i.e. instr->state = MTD_ERASE_DONE;
It's fixed in CVS long ago

> Also, when doing an erase it obtains a spin lock that disables all
> bottom halves from running. It holds this lock for the duration of the
> erase, which is up to 4ms in the code - is this really a good idea? The
> Smartmedia specs say that this delay can be up to 400ms! Definitely not
> a good idea.
There's no better to ensure, that erase read and write can coexist at the 
moment. But you're invited to hack a better solution :)

I this a new card type ? All chips and card types I know, have maximum block 
erase times of 20ms.

-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
