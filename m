Date: Thu, 5 Jun 2008 21:13:12 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
Message-ID: <alpine.LFD.1.10.0806052110560.3235@apollo.tec.linutronix.de>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080603174244.GC1224@logfs.org>
	<alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
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

On Thu, 5 Jun 2008, Alexey Korolev wrote:
> > > -	if (!chip->write_page)
> > > -		chip->write_page = nand_write_page;
> > > -
> > 
> > Why is this removed?
> >
> Oh. May be it would be better to make stand alone patch in order to
> clean up NAND subsystem. Using chip->write_page is redundend here. It
> is set once it is set for write procedure only. There is no chip read
> page call like that. IMHO it is better to use static call here. Please
> let me know if you are agree with this. 

No, it's definitely not better to use a static call here. Cared to look
at the existing drivers, whether one provides it's own function ?

drivers/mtd/nand/cafe_nand.c:	cafe->nand.write_page = cafe_nand_write_page;

Thanks,
	tglx
