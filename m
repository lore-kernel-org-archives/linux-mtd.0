Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CuCfg-0001Eu-ON
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 11:39:06 -0500
Date: Thu, 27 Jan 2005 17:38:45 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Cam <camilo@mesias.co.uk>
Message-ID: <20050127163845.GA7755@wohnheim.fh-wedel.de>
References: <20050126205121.11236.qmail@web52705.mail.yahoo.com>
	<1106775037.6955.50.camel@weaponx.rchland.ibm.com>
	<1106819251.783.141.camel@baythorne.infradead.org>
	<20050127131702.GA22121@wohnheim.fh-wedel.de>
	<41F9127E.6030508@mesias.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41F9127E.6030508@mesias.co.uk>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 document / wiki [OT]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 January 2005 16:10:38 +0000, Cam wrote:
> 
> >Plus, Wikis tend to be instant security problems.  The situation
> >appears to be so bad that anyone with average exploit knowledge can
> >read the sources and control some new machines within a rainy
> >afternoon. 
> 
> Can you back that statement up with an example please? I wasn't aware 
> that wikis were so dangerous! :)

Neither was I before attending last years ccc.
http://www.ccc.de/congress/2004/

Various bits of information on this were spread all over the place:
o Code examples of mysql - tons of buffer overflows.
o Code examples of php - same.
o Various hacks of machines based on either php or mysql
  vulnerabilities.
o Some specific problems with some wiki implementations.

Considering that most wikis use php, mysql or both, you can pretty
much get the idea.  I cannot point to specific vulnerabilities or
exploits, but the only thing stopping me from owning your wiki is my
lack of interest.  Cooking up something new is horribly simple.  So
you might want to move it somewhere, either to a dedicated machine or
to a vserver/chroot/jail.

And if you have too much time on your hands, security audits on php
and mysql wouldn't hurt.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
