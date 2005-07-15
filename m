Received: from web31707.mail.mud.yahoo.com ([68.142.201.187])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtHmo-0007TP-Vk
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 00:27:03 -0400
Message-ID: <20050715042650.24467.qmail@web31707.mail.mud.yahoo.com>
Date: Thu, 14 Jul 2005 21:26:50 -0700 (PDT)
From: Sunil Khandelwal <sunil_khandelwal@yahoo.com>
To: tglx@linutronix.de
In-Reply-To: <1121344921.24449.60.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Nand Flash driver for dedicated conroller
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



--- Thomas Gleixner <tglx@linutronix.de> wrote:

> On Thu, 2005-07-14 at 05:28 -0700, Sunil Khandelwal
> wrote:
> > I have an ARM based board, which has a flash
> > controller on chip.
> > 
> > There is no way I can control the signals like
> ALE, CE
> > etc to flash directly. 
> 
> Read
>
http://www.linux-mtd.infradead.org/tech/mtdnand/x76.html
> 
> > How can I use nand.c of mtd in my driver specially
> as
> > it expect me to control IO lines.
> 
> There is no nand.c
> 
> tglx


Thanks for the reply, I am referring to file nand.c
which is at location /drivers/mtd/nand/nand.c

We have flash controller, which controls the signal
going to flash Memory. There is no way I can control
individual signals like ALE etc. 

The architecture currently for nand expects me to
control signal lines, which is not possible.

Regards,
Sunil



		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 
