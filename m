Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECEVo-0001KH-3G
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2005 06:47:45 -0400
Date: Mon, 5 Sep 2005 12:27:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: oyvind.harboe@zylin.com
Message-ID: <20050905102706.GC23470@wohnheim.fh-wedel.de>
References: <20050901125707.GA1623@wohnheim.fh-wedel.de>
	<1125665087.32593.41.camel@localhost.localdomain>
	<20050904090043.GA9632@wohnheim.fh-wedel.de>
	<20050905120511.bq6majze2x2sc48g@www.zylin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050905120511.bq6majze2x2sc48g@www.zylin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 September 2005 12:05:11 +0200, oyvind.harboe@zylin.com wrote:
> 
> >>W.r.t. eCos, I expect the WORM capability to be enabled via a CDL
> >>option.
> >
> >I have to admit being clueless about eCos.  For Linux, the parser bits
> >are still missing.  How about this patch?  The parser stuff is quite
> >large, as this appears to be the first JFFS2 mount option ever.
> 
> Do you think this is useful for Linux?
> 
> I mostly foresaw it as being useful for deeply embedded systems, like eCos.

I don't know.  So far you've been the only person to ask for this.  If
that doesn't change, maybe it would be best if you maintained a
minimal patch and we would just forget about this.  But if the patch
is useful for others as well, we could merge it.

Anyone?

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
