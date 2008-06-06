Date: Fri, 6 Jun 2008 14:47:04 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <alpine.LFD.1.10.0806061412380.3235@apollo.tec.linutronix.de>
Message-ID: <alpine.LFD.1.10.0806061418130.26291@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080603174244.GC1224@logfs.org>
	<alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806052110560.3235@apollo.tec.linutronix.de>
	<alpine.LFD.1.10.0806061043300.18675@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806061412380.3235@apollo.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > > > > > -	if (!chip->write_page)
> > > > > > -		chip->write_page = nand_write_page;
> > > > > > -
> > > > > 
> > > > > Why is this removed?
> > > > >
> > > > Oh. May be it would be better to make stand alone patch in order to
> > > > clean up NAND subsystem. Using chip->write_page is redundend here. It
> > > > is set once it is set for write procedure only. There is no chip read
> > > > page call like that. IMHO it is better to use static call here. Please
> > > > let me know if you are agree with this. 
> > > 
> > > No, it's definitely not better to use a static call here. Cared to look
> > > at the existing drivers, whether one provides it's own function ?
> > > 
> > > drivers/mtd/nand/cafe_nand.c:	cafe->nand.write_page = cafe_nand_write_page;
> > >
> > It make sence to remove because of:
> > 1. nand_chip structure looks ugly with that function. It contains
>   write_page but it does not contain read_page.
> 
> Oh yeah, "looks ugly" is definitely a perfect technical reason.
> 
> > 2. existence of such redefinition is redundend. There is definetely
> > no need to redefine it.
> 
> -ENOPARSE
>
Ok. Can you show me a reason why write page
should be in nand_chip structure? Please consider the fact that nobody redefines
write_page (cafe_nand_write_page and nand_write_page are identical). 
