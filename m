Received: from mail.broadpark.no ([217.13.4.2])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bkdbj-0008Se-Rj
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 02:51:12 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1089787265.8822.31.camel@imladris.demon.co.uk>
References: <1089728296.6288.19.camel@famine>
	<1089760454.8822.23.camel@imladris.demon.co.uk>
	<1089786408.7607.4.camel@famine>
	<1089787265.8822.31.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1089787869.7607.9.camel@famine>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 08:51:09 +0200
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Prune obsolete raw_node_ref's from RAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-14 at 08:41, David Woodhouse wrote:
> On Wed, 2004-07-14 at 08:26 +0200, Øyvind Harboe wrote:
> > Would all the performance problems go away if the lists were doubly
> > linked?
> 
> Well yes, but since the object of the exercise was to save memory,
> doubling the size of the objects in question doesn't really strike me as
> being the right way to approach the problem :)

The memory problem I ran into wasn't the size of the un-obsolete nodes,
but that they grew with the number of obsolete nodes.

I hate #if's in code as much as the next guy, but JFFS2 spans deeply
embedded systems to full-fledged PCs and it is only to be expected that
the different profiles have different needs.

-- 
Øyvind Harboe
http://www.zylin.com
