Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fq8wd-0002aT-Uz
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 09:28:48 -0400
Message-ID: <448EBDE2.7090408@kaigai.gr.jp>
Date: Tue, 13 Jun 2006 22:30:10 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2/xattr problems.
References: <1148150486.3875.251.camel@pmac.infradead.org>	<44704CA9.8010604@ak.jp.nec.com>
	<448CCEC8.2080903@ak.jp.nec.com>	<1150099418.11159.44.camel@shinybook.infradead.org>	<448D3752.3090605@ak.jp.nec.com>
	<1150105995.8184.17.camel@pmac.infradead.org>
In-Reply-To: <1150105995.8184.17.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>>In my opinion, a xattr across multiple nodes isn't neccesary.
>>What do you think?
> 
> 
> I'd be happier if it worked -- some of us have plans to abuse XATTR
> support by building a simple database on it... :)
> 
> But as long as the failure mode is _graceful_, I suppose we can live
> without it for now, if ext3 is also limited to 4KiB.

I want to suspend this requirement if it's not imperative.
Probably, this design changing will involve so many fixes...

> I'm looking through your handling of deletion now... I'm not sure that
> we _need_ the physical deletion node for xdata, do we? Those can go away
> just because there are no xrefs which link to them, just like our inodes
> do?
> 
> Also, the physical deletion node for xrefs is only needed when the xattr
> is deleted _without_ the inode being deleted. When the inode goes away,
> again the xref becomes obsolete all by itself, right?

Indeed, you are right.
In mounting process, we can certainly detect xdatum no xref linked and
xref no inode linked. I'll fix its design, so please wait for a while.

> Finally, we need to be careful about garbage collection of deletion
> nodes. Remember that the deletion node might be garbage-collected
> _before_ the older node which it is deleting. So you must decide whether
> to write the deletion node out again, when you are garbage collecting
> it.

Don't worry.
When any other nodes are linked with xdatum or xref, the deletion nodes
are not removed in this garbage collect cycle.

Thanks,
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
