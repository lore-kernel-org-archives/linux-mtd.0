Received: from [212.68.212.198] (helo=barnabe.hellea.be ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MpUY-0004Bc-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 13:04:34 +0000
Date: Fri, 13 Dec 2002 14:35:00 +0100
From: Geoffroy Stevenne <geof@hellea.com>
To: linux-mtd@lists.infradead.org
Subject: Re: bbram access problems
Message-Id: <20021213143500.630bedeb.geof@hellea.com>
In-Reply-To: <200212121540.43586.tglx@linutronix.de>
References: <20021212140546.3607a3e0.geof@hellea.com>
	<200212121540.43586.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Le Thu, 12 Dec 2002 15:40:43 +0100
Thomas Gleixner <tglx@linutronix.de> a écrit:

> from slram.c
> NOTE:
>   With slram it's only possible to map a contigous memory region. 
> 
> So you can't access it with slram, as the BBSRAM is a device with
> paged access. All you have to do, is copy slram.c to bbram.c and add
> an additional parameter, which tells the driver the number of
> pages.available. Then modify the erase / read / write functions to do
> the page selection depending on the address you have to access. 
> If you think this is out of your league, then hope, that somebody does
> this for you sometimes, or ask one of the experts to help you for a
> little fee immidiately :)

Thanks to all! We will code... but I still can't figure how to prevent
other processes to access this memory area.  IANAE on memory locking and
stuff like that, nor in kernel programming in general.

I'll learn :-)

--
Geoffroy
