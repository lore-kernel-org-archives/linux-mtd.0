Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEw5M-000783-7w
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 19:34:28 +0000
Date: Wed, 29 Oct 2003 20:32:09 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jun Sun <jsun@mvista.com>
Message-ID: <20031029193209.GA23482@wohnheim.fh-wedel.de>
References: <20031022182558.U19834@mvista.com>
	<20031027101741.C1678@mvista.com>
	<1067338214.15551.405.camel@hades.cambridge.redhat.com>
	<20031028182828.D30683@mvista.com>
	<1067426006.15551.1546.camel@hades.cambridge.redhat.com>
	<20031029104546.K30683@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031029104546.K30683@mvista.com>
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

On Wed, 29 October 2003 10:45:46 -0800, Jun Sun wrote:
> 
> phsmap currently only supports mapping for one physical flash unit.

I've created a physmap variant for multiply physical mappings once.
Google for mphysmap.c and you can still find it.  No reaction
whatsoever to this day, so you can guess how many people need it. ;)

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
