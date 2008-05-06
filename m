Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtJhS-0007wG-NB
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 09:43:06 +0000
Date: Tue, 6 May 2008 19:42:49 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080506094249.GA23685@cloud.net.au>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<20080506001514.GA12796@cloud.net.au>
	<20080506061530.GA23412@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080506061530.GA23412@logfs.org>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 06, 2008 at 08:15:31AM +0200, Jörn Engel wrote:
> On Tue, 6 May 2008 10:15:15 +1000, Hamish Moffatt wrote:
> > 
> > Caching only makes sense when you can read extra data at no cost.
> 
> Not true.  Caching makes sense when the benefits outweigh the costs,
> just like everything else.  "No cost" is just a special case where even
> minimal benefits suffice.
> 
> Nand already does caching, it just limits itself to a single page.  If
> two consecutive reads hit the single page, it is only read once.  Which
> easily fits your definition and just as easily helps single-threaded
> users.  But two threads bouncing back and forth can already nullify the
> gains.  It would be useful to keep as much old data around as there is
> DRAM for.

It makes sense to keep data that you had to read anyway, but with the
subpage read patch that's less than a whole page.

> [ Also, even ubi attach may benefit from caching under special
> circumstances.  If you have just written an image and have enough ram,
> there is no reason to go back to flash.  But that hardly matters in real
> life. ]

I agree. So are we talking about caching of data which we've read
anyway, or speculative reads? Because reading more than the user
requested is speculation afaict. If LogFS (for example) reads a whole 
page even when it doesn't need it, that will degrade performance in some
cases.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
