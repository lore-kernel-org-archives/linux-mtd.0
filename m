Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuCrs-0001Ti-S4
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 11:51:42 -0500
Date: Thu, 27 Jan 2005 17:51:38 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: jasmine@linuxgrrls.org
Message-ID: <20050127165138.GB7755@wohnheim.fh-wedel.de>
References: <20050126205121.11236.qmail@web52705.mail.yahoo.com>
	<1106775037.6955.50.camel@weaponx.rchland.ibm.com>
	<1106819251.783.141.camel@baythorne.infradead.org>
	<20050127131702.GA22121@wohnheim.fh-wedel.de>
	<41F9127E.6030508@mesias.co.uk>
	<20050127163845.GA7755@wohnheim.fh-wedel.de>
	<Pine.LNX.4.61.0501271637001.3401@hex.linuxgrrls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0501271637001.3401@hex.linuxgrrls.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: JFFS3 document / wiki [OT]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 January 2005 16:37:47 +0000, jasmine@linuxgrrls.org wrote:
> On Thu, 27 Jan 2005, [iso-8859-1] Jörn Engel wrote:
> 
> >And if you have too much time on your hands, security audits on php
> >and mysql wouldn't hurt.
> 
> Or just do what anyone with taste does and use Java servlets or JSP on top 
> of a PostgreSQL database.  I'm pretty sure there are Java-based wikis out 
> there.

Not sure how much better postgres is.  Java surely helps.  If all
input is checked for "normalness" before being passed to the dbms,
that would help as well.

Sadly the "normalness" includes things like domain names being shorter
than 100 bytes and other non-obvious stuff.

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
