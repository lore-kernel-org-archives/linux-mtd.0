Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPHaz-0004uy-S6
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 14:28:52 +0000
Date: Tue, 20 Jan 2009 23:28:54 +0900 (JST)
Message-Id: <20090120.232854.93206447.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [patch 1/6] physmap: make map_info customizable
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <20081211.103908.192842546.nemoto@toshiba-tops.co.jp>
References: <200812012223.mB1MNbjl014522@imap1.linux-foundation.org>
	<1228925679.21454.69.camel@macbook.infradead.org>
	<20081211.103908.192842546.nemoto@toshiba-tops.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 11 Dec 2008 10:39:08 +0900 (JST), Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> > > Add a hook to physmap_flash_data for map_info initialization.  This makes
> > > platform code can customize map operations.
> > > 
> > > Background: I wrote this patch to support RBTX4939 board, which requires
> > > custom map->{read,write,copy_from} function.  I think extending the
> > > physmap driver is better than adding a new map driver.
> > 
> > Hm. I'm unconvinced -- surely you're calling into a function which does
> > everything that a 'new map driver' would have to do anyway?
> 
> Yes.  Once I wrote a new map driver and realized most of it is
> duplication of physmap driver.

While this patch had NACKed a while ago, I have just posted a new map
driver for the board.  I hope this driver is acceptable.

---
Atsushi Nemoto
