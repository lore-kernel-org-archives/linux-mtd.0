Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNTvr-0003pJ-Ti
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 06:24:33 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <418213C3.3050706@magellan-technology.com>
References: <20041028230640.GB13105@home.fluff.org>
	<4181840D.2020605@magellan-technology.com>
	<1099035223.22387.529.camel@thomas>
	<418213C3.3050706@magellan-technology.com>
Content-Type: text/plain
Date: Fri, 29 Oct 2004 12:16:18 +0200
Message-Id: <1099044978.22387.557.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: Read/nBusy via interrupt
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-29 at 19:56 +1000, Aras Vaichas wrote:
> > No. Usually R/B is connected anyway.
> 
> usually? If the software doesn't need it, then why would you connect it?

There's a different between needs it and takes advantage of it. If I can
take advantage, then I will connect it. Using the R/B signal instead of
polling is an advantage.

> >>* more code to write and debug!
> > 
> > About 20 lines. I'm scared.
> 
> No need to be scared. Software engineers don't come for free. development time 
> == money.

Developing efficient polling might need software engineers too. 

> I never said it would affect it significantly (or did I?). I was simply stating 
> the fact that the time does increase. Every pin on a chip costs extra and when 
> you are planning on making 10,000+ per year of a product, that price difference 
> makes a affects your company's bottom line. If you don't believe me, then take 
> a look at the Digikey page for the AT45DB081 and take a long hard look at unit 
> price versus pin count.

I'm aware of high volume designs, where the pin count, pcb size ... has 
to be taken into account.

> Doesn't it count as an MTD device? Where did this kernel option come from -> 
> "CONFIG_MTD_AT91_DATAFLASH" ??

Did I say that ?

> 
> > We are talking about NAND >= 32MB, which is often used for filesystems.
> 
> Ben didn't mention "NAND >= 32MB, which is often used for filesystems", or 
> perhaps I read the initial email incorrectly ... hmmm, my bad. 

Ben was explicitly talking about NAND FLASH, where today the non
obsolete devices start at 32MB

> Thomas, your reply to my email was so ridiculously over the top and harsh. 

Sorry, It was not my intention to offend you. 

> I was simply offering an opinion and some information on a useful MTD device from 
> the position of someone with hardware experience. Perhaps next time you should 
> re-think the tone of your replies and consider the signal-to-noise ratio of 
> what you write. I'm sure this forum will be a better place for it.

Just FYI, I have >20 years hardware/software experience.

Talking about signal/noise ratio. Is an extensive explanation of
DataFlash in answer to a question on NAND FLASH signal or noise ?

tglx
