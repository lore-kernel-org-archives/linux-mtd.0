Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWs3S-0000v7-Ei
	for linux-mtd@lists.infradead.org; Fri, 21 Apr 2006 05:36:05 -0400
Date: Fri, 21 Apr 2006 11:32:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060421093235.GA32710@wohnheim.fh-wedel.de>
References: <20060417144823.GC7429@stusta.de>
	<1145285754.13200.15.camel@pmac.infradead.org>
	<20060420120624.GO25047@stusta.de>
	<1145566451.11909.111.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1145566451.11909.111.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	rmk@arm.linux.org.uk, Adrian Bunk <bunk@stusta.de>
Subject: Re: [RFC: 2.6 patch] let arm use drivers/Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 April 2006 21:54:11 +0100, David Woodhouse wrote:
> On Thu, 2006-04-20 at 14:06 +0200, Adrian Bunk wrote:
> > > This dependency is incorrect. It's only one or two chip-specific drivers
> > > which require that the architecture correctly handle alignment traps,
> > > and even then it's only actually apparent when used with JFFS2 which
> > > actually _gives_ it an unaligned buffer occasionally. Everything else
> > > works fine.
> >
> > Can anyone tell me which chip-specific drivers are affected by this 
> > issue so that I can send a patch?
> 
> Disabling those chip drivers isn't necessarily the answer, since they
> can still be used in most cases; just not for JFFS2. Perhaps we should
> just disable JFFS2 if BROKEN_UNALIGNED is set -- or disable JFFS2 on NOR
> flash if it's set. 

mtd->flags would be a good place for that.  Unlike many other things
previously in there, it is a device property that matters.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
