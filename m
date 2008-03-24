Received: from mk-filter-1-a-1.mail.uk.tiscali.com ([212.74.100.52])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JdqJh-0002hj-L9
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 17:18:38 +0000
Subject: Re: [PATCH] 3/3 maple: update bus driver to support Dreamcast VMU
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080324170707.GH2899@logfs.org>
References: <1206207805.6324.13.camel@localhost.localdomain>
	<1206209786.6324.41.camel@localhost.localdomain>
	<20080324033344.GB15872@linux-sh.org> <20080324144647.GC2899@logfs.org>
	<1206371178.6283.37.camel@localhost.localdomain>
	<20080324152952.GF2899@logfs.org>
	<1206373900.6283.39.camel@localhost.localdomain>
	<20080324160429.GG2899@logfs.org>  <20080324170707.GH2899@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2008 17:18:13 +0000
Message-Id: <1206379093.7543.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@osdl.org>, linux-sh <linux-sh@vger.kernel.org>,
	Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>,
	Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-03-24 at 18:07 +0100, Jörn Engel wrote:
> On Mon, 24 March 2008 17:04:29 +0100, Jörn Engel wrote:
> > 
> > Then we should be fine.  I'll try to beat the code into submission.
> 
> And here go two more interesting patches.  The first is removing all
> locking from the mtd driver.  Since the existing locking code is nearly
> impossibly to verify, I'd rather have something simple and wrong than
> something complicated and wrong.
> 
> The second rearranges the list locking a bit.  Previously it was
> possible to touch maple_waitq or maple_sentq without holding the lock.
> With my limited understanding of the driver, the second patch may
> already be enough to prevent the type of corruption you've been seeing.
> 
> Jörn
> 


These will fail.

Removing the locks just about guarantees memory corruption and
maple_waitq is not the issue - it is the objects held in maple_waitq
that are the issue.

I have an idea though, so let me hack at it
