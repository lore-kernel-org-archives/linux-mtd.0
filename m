Received: from mail.broadpark.no ([217.13.4.2])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkdEB-000861-Hl
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 02:26:52 -0400
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1089760454.8822.23.camel@imladris.demon.co.uk>
References: <1089728296.6288.19.camel@famine>
	<1089760454.8822.23.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <1089786408.7607.4.camel@famine>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 08:26:48 +0200
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

On Wed, 2004-07-14 at 01:14, David Woodhouse wrote:
> On Tue, 2004-07-13 at 16:18 +0200, Øyvind Harboe wrote:
> > - Is the code correct? 
> 
> It looks OK at first glance but I can't actually tell. List mangling
> code is hard enough to read when it's in the style I understand :)
> 
> I've rewritten it and just posted that version. 

Excellent! I'll make sure to run my tests with your new version.

> > - What performance impact does it have? 
> 
> It'll go walking the lists every time a node is obsoleted. My guess is
> it'll make the performance suck _hard_. But it will get you your memory
> back. I suspect it should be a configuration option -- or maybe we could
> stick the list-walking code into a separate function and call it
> periodically to do the cleanup, rather than doing it every time.

Note that in my case I have the following usage:

- Little RAM(so freeing up is essential)
- Big flash disk(mainly for wear levelling purposes).
- Few and small files
- Lots of deleted nodes
- The application overwrites existing files with regular intervals

In this scenario, the performance should be fine.

In a scneario with:

- lots of files
- lots of ram
- occasional freing up

Performance should suck.

> Could do with seeing some profiling info.

Would all the performance problems go away if the lists were doubly
linked?

-- 
Øyvind Harboe
http://www.zylin.com
