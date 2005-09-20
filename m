Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHhTO-0005dy-KS
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 08:43:58 -0400
Date: Tue, 20 Sep 2005 14:43:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20050920124344.GB4634@wohnheim.fh-wedel.de>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
	<20050920102436.GC2143@wohnheim.fh-wedel.de>
	<1127213984.20014.34.camel@sauron.oktetlabs.ru>
	<20050920113616.GD2143@wohnheim.fh-wedel.de>
	<1127217365.20014.45.camel@sauron.oktetlabs.ru>
	<20050920122747.GA4634@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050920122747.GA4634@wohnheim.fh-wedel.de>
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 September 2005 14:27:47 +0200, Jörn Engel wrote:
> On Tue, 20 September 2005 15:56:04 +0400, Artem B. Bityutskiy wrote:
> > 
> > 1. Write code which understands both cleanmarkers and EB headers.
> > 2. Test that old images are actually work well on new JFFS2.
> > 3. Implement 1:1. Remove cleanmarkers support as they are not needed
> > anymore.
> 
> Not quite.  He must:
> 1. Assume 1:1 mapping.  If people are not, that's a completely
>    seperate problem.
> 2. Write robust code that does not depend on EBH.  If the header is
>    missing, it should just create a new one and initialize its members
>    as best it can - e.g. taking the average erase count.
> 3. Not emit clean markers anymore - they are not needed.

Btw, most of the complexity in Zhao's code comes from the attempt to
be future-proof and all that.  If he simply tried to implement better
wear levelling, it would be half the effort.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories
