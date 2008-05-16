Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jwstq-0003PG-K7
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 05:54:39 +0000
Date: Fri, 16 May 2008 15:54:24 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Porting to Intel P33 flash
Message-ID: <20080516055424.GA10763@cloud.net.au>
References: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net>
	<Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0805141752210.5183@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, jkimble@one.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 14, 2008 at 06:06:35PM +0100, Alexey Korolev wrote:
> There are two versions of P33 one has version of CFI 1.4 another version
> 1.5 
> 
> P33 with CFI 1.4 works Ok starting 2.6.17 
> P33 with CFI 1.5 works Ok starting 2.6.24 
> 
> Since the difference between P33 with CFI 1.4 and P33 with CFI 1.5 are
> minor applying the following very simple patch:
> http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=b1c9c9be6da010510459aca93f5754efb19695ff 
> should solve the problem for linux >= 2.6.17.

I've been running 2.6.15 with P33 CFI 1.5 without issue. Almost
completely read-only operation though in my application.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
