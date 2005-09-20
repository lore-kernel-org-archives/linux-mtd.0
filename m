Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHhDu-0005Iu-BY
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 08:27:58 -0400
Date: Tue, 20 Sep 2005 14:27:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20050920122747.GA4634@wohnheim.fh-wedel.de>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
	<20050920102436.GC2143@wohnheim.fh-wedel.de>
	<1127213984.20014.34.camel@sauron.oktetlabs.ru>
	<20050920113616.GD2143@wohnheim.fh-wedel.de>
	<1127217365.20014.45.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127217365.20014.45.camel@sauron.oktetlabs.ru>
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

On Tue, 20 September 2005 15:56:04 +0400, Artem B. Bityutskiy wrote:
> On Tue, 2005-09-20 at 13:36 +0200, Jörn Engel wrote:
> > > 
> > > If old binary mounts new image, it starts writing its cleanmarkers, use
> > > 1:N mapping etc. A "mixed" image appears. Afterwords, if this mixed
> > > image is being mounted on new JFFS2 binary, what poor Zhao is supposed
> > > to do? There will be too much ugliness in the code to handle that.
> > 
> > Please don't mix those two problems.  1:1 mapping has been dealt with.
> > If you don't like how it has been dealt with, complain in the context
> > of 1:1 mapping.
> 
> Please, remember the original goal. It is new wear-levelling. This patch
> may be considered as something independent, but it is not optimal. If we
> follow this way, Zhao must:
> 
> 1. Write code which understands both cleanmarkers and EB headers.
> 2. Test that old images are actually work well on new JFFS2.
> 3. Implement 1:1. Remove cleanmarkers support as they are not needed
> anymore.

Not quite.  He must:
1. Assume 1:1 mapping.  If people are not, that's a completely
   seperate problem.
2. Write robust code that does not depend on EBH.  If the header is
   missing, it should just create a new one and initialize its members
   as best it can - e.g. taking the average erase count.
3. Not emit clean markers anymore - they are not needed.

Going back to your list:

> 1. Write code which understands both cleanmarkers and EB headers.

Big deal.  Cleanmarker doesn't really matter, absence of EBH does.

> 2. Test that old images are actually work well on new JFFS2.

Sure!

> 3. Implement 1:1. Remove cleanmarkers support as they are not needed
> anymore.

Nope, why do you keep bringing it up?  1:1 is finished.  History.
Dealt with.  Old coffee.  Not a problem anymore.  Capisci?

Jörn

-- 
You ain't got no problem, Jules. I'm on the motherfucker. Go back in
there, chill them niggers out and wait for the Wolf, who should be
coming directly.
-- Marsellus Wallace
