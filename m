Date: Fri, 6 Jun 2008 15:36:27 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <alpine.LFD.1.10.0806061609160.3235@apollo.tec.linutronix.de>
Message-ID: <alpine.LFD.1.10.0806061522050.26291@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080603174244.GC1224@logfs.org>
	<alpine.LFD.1.10.0806051724560.16300@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806052110560.3235@apollo.tec.linutronix.de>
	<alpine.LFD.1.10.0806061043300.18675@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806061412380.3235@apollo.tec.linutronix.de>
	<alpine.LFD.1.10.0806061418130.26291@pentafluge.infradead.org>
	<alpine.LFD.1.10.0806061609160.3235@apollo.tec.linutronix.de>
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

On Fri, 6 Jun 2008, Thomas Gleixner wrote:

> On Fri, 6 Jun 2008, Alexey Korolev wrote:
> > > > 2. existence of such redefinition is redundend. There is definetely
> > > > no need to redefine it.
> > > 
> > > -ENOPARSE
> > >
> > Ok. Can you show me a reason why write page
> > should be in nand_chip structure? Please consider the fact that nobody redefines
> > write_page (cafe_nand_write_page and nand_write_page are identical). 
> 
> That's not the point. If these functions are the same then of course
> there is no need to have it duplicated, but just silently deleting
> stuff in a (according to the changelog) unnrelated patch w/o fixing up
> what breaks is not how it works.
Good this was a thing I wanted to know. Now I don't need to worry if I
can remove write_page from nand_chip and cafe.c
> 
> You want others to review your changes, then please provide them in a
> form which do not cause the reviewer to figure out that the function
> in cafe.c is identical.
> 
I didn't know it as well before today. Thanks for catching a potential
problem with nand_cafe. 
> It would have been entirely clear when the patch series would have
> contained:
> 
> [1/n] remove duplicated write_page function from cafe.c
> [2/n] remove now unused write_page function pointer from struct nand_chip
>
> I have only restricted time to do such reviews and I definitely have
> no interest to investigate why the heck a change which is completely
> unrelated might be correct or useful.


Thanks,
Alexey
