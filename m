Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D2EnE-0003T4-1Y
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 15:32:04 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: John Kelly <johnfkelly@earthlink.net>
In-Reply-To: <18307332.1108758040913.JavaMail.root@bigbird.psp.pas.earthlink.net>
References: <18307332.1108758040913.JavaMail.root@bigbird.psp.pas.earthlink.net>
Content-Type: text/plain
Date: Fri, 18 Feb 2005 21:32:01 +0100
Message-Id: <1108758722.24721.305.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DoC-2000: NAND_CMD_READID hangs on stock 2.6.10 kernel
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-18 at 13:20 -0700, John Kelly wrote:
> I'm working on getting a Technologics TS-5400 board runnig 
> Linux-2.6 to see a 32MB DoC.
> 
> When inserting the diskonchip.ko driver from a vanilla 
> 2.6.10 kernel, I get into an infinite loop in nand_command 
> with command=0x90 (READID).  The loop is at the bottom of the function:
> 
>         /* Apply this short delay always to ensure that we do wait tWB in
>          * any case on any machine. */
>         ndelay (100);
>         /* wait until command is processed */
>         while (!this->dev_ready(mtd));
> 
> If I use a counter to break out of the loop after 40 tries,
>  everything works--only READID seems to need this.

It's not READID, there is something wrong with the number of chips to
scan for. I have encountered the problem here too. I will post again
when I have fixed it.

tglx
