Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ49Q-0000ab-4G
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 10:50:40 +0100
Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ49L-0006dj-Lp
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 05:50:37 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1116581705.5777.43.camel@icampbell-debian>
References: <1116580638.18096.133.camel@server11>
	<1116581705.5777.43.camel@icampbell-debian>
Content-Type: text/plain
Date: Fri, 20 May 2005 17:50:28 +0800
Message-Id: <1116582628.18096.148.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: map and chip drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I see

Now I understand. 

It also means that one might have to make changes to the map driver to
make adjustments according to the boards/address space used?

Can I call it a hardware abstraction layer code?

On Fri, 2005-05-20 at 10:35 +0100, Ian Campbell wrote:
> On Fri, 2005-05-20 at 17:17 +0800, Munira Ahmed wrote:
> > > Breaking things down a little more, in the mtd stack there are 3 kinds of drivers.
> > > map drivers that describe how to talk to a given flash chip.
> > > probe drivers that identify what kind of chip you have.
> > > chip drivers that know how to speak a command set and let you flash your chip.
> > 
> > 
> > I really don't understand the difference between the map and the chip
> > driver? 
> > 
> > talk to a given flash !
> > speak a command set!
> > 
> > ain't they the same?
> 
> The map driver takes care of physically accessing the flash, while the
> chip driver knows what to do with each type of flash. So the map driver
> provides the method for the chip driver to actually access the flash.
> 
> For example we have boards at work which have flash chips mapped at
> various physical addresses (differing between boards), some devices have
> paged flash, with an i/o register to select the page and a physical
> address where the current page is mapped. I'm sure there are other ways
> of arranging things.
> 
> The board-specific map drivers takes care of all these differences,
> while the chip driver is shared between multiple boards because the
> underlying chips are the same in each case.
> 
> Ian.
-- 
Munira Ahmed
