Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkWTY-0006fZ-M0
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 19:14:17 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1089728296.6288.19.camel@famine>
References: <1089728296.6288.19.camel@famine>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1089760454.8822.23.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 14 Jul 2004 00:14:14 +0100
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

On Tue, 2004-07-13 at 16:18 +0200, Øyvind Harboe wrote:
> - Is the code correct? 

It looks OK at first glance but I can't actually tell. List mangling
code is hard enough to read when it's in the style I understand :)

I've rewritten it and just posted that version. 

> - What performance impact does it have? 

It'll go walking the lists every time a node is obsoleted. My guess is
it'll make the performance suck _hard_. But it will get you your memory
back. I suspect it should be a configuration option -- or maybe we could
stick the list-walking code into a separate function and call it
periodically to do the cleanup, rather than doing it every time.

Could do with seeing some profiling info.

-- 
dwmw2
