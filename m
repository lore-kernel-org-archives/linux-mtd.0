Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CuAOz-00006l-AA
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 09:13:42 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Moises Beck - EDS Digicon <mbeck@perto.com.br>
In-Reply-To: <200501271218.j0RCI9L07866@rsmail.perto.com.br>
References: <200501271218.j0RCI9L07866@rsmail.perto.com.br>
Content-Type: text/plain
Date: Thu, 27 Jan 2005 15:13:36 +0100
Message-Id: <1106835217.14517.6.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand_scan identification problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-27 at 10:18 -0200, Moises Beck - EDS Digicon wrote:
> Hello,
>      I am using a smartmedia card on linux MTD. Everything runs very
> well. But just after power on, the first attempt to load the driver
> spia.o fails. The driver calls nand_scan(), that cannot identify the
> present card. On the second attempt to load the driver, the flash is
> correctly identified. I saw that in nand_scan(), the command
> NAND_CMD_READID return nand_maf_id=0 and nand_dev_id=0 on the first call
> to it. On the second call the IDs are returned correctly. I tried to
> solve this by putting the following code just before the command
> NAND_CMD_READID, on nand_base.c:
> 
>         /* Select the device */
>         this->select_chip(mtd, 0);
>                                                                        
>         
>         /* by momo - reset smartmedia e put it on mode READ */
>         this->cmdfunc (mtd, NAND_CMD_RESET, -1, -1);
>         this->cmdfunc (mtd, NAND_CMD_READ0, -1, -1);

> Anyone has some clue ?

Can you verify that your port pins are initialized correctly before
calling nand_scan(). 

nCE = high
ALE = low
CLE = low

The calls you inserted do not touch ALE, but the read_ID command does.

tglx
