Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEzYS-0008Ct-Bb
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 23:16:44 +0000
Date: Wed, 29 Oct 2003 15:15:16 -0800
From: Jun Sun <jsun@mvista.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Message-ID: <20031029151516.F6588@mvista.com>
References: <20031022182558.U19834@mvista.com>
	<20031027101741.C1678@mvista.com>
	<1067338214.15551.405.camel@hades.cambridge.redhat.com>
	<20031028182828.D30683@mvista.com>
	<1067426006.15551.1546.camel@hades.cambridge.redhat.com>
	<20031029104546.K30683@mvista.com>
	<20031029193209.GA23482@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031029193209.GA23482@wohnheim.fh-wedel.de>;
	from joern@wohnheim.fh-wedel.de on Wed, Oct 29, 2003 at 08:32:09PM +0100
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2003 at 08:32:09PM +0100, Jörn Engel wrote:
> On Wed, 29 October 2003 10:45:46 -0800, Jun Sun wrote:
> > 
> > phsmap currently only supports mapping for one physical flash unit.
> 
> I've created a physmap variant for multiply physical mappings once.
> Google for mphysmap.c and you can still find it.  No reaction
> whatsoever to this day, so you can guess how many people need it. ;)
> 

Cool!  I think once we extend phsymap driver and get more boards
converted to using it good stuff like this will be in much more demand.

Jun
