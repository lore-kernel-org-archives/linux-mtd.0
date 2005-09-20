Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHgQ7-000478-F2
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 07:37:53 -0400
Date: Tue, 20 Sep 2005 13:36:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20050920113616.GD2143@wohnheim.fh-wedel.de>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
	<20050920102436.GC2143@wohnheim.fh-wedel.de>
	<1127213984.20014.34.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127213984.20014.34.camel@sauron.oktetlabs.ru>
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

On Tue, 20 September 2005 14:59:43 +0400, Artem B. Bityutskiy wrote:
> On Tue, 2005-09-20 at 12:24 +0200, Jörn Engel wrote:
> > > 4 old JFFS2 binaries reject mounting new JFFS2 images
> > 
> > Why this?
> 
> Because he changed cleanmarker to the EB header (eraseblock header). Old
> binaries got confused by this since there are working no compatibility
> flags in cleanmarkers. 

WTF?  Old code can simply delete the EB.  You lost all the goodies
from EB, sure, but they are only optimization.  So who cares?

> Moreover, we are going to implement the 1:1 mapping at the same time.
> 
> If old binary mounts new image, it starts writing its cleanmarkers, use
> 1:N mapping etc. A "mixed" image appears. Afterwords, if this mixed
> image is being mounted on new JFFS2 binary, what poor Zhao is supposed
> to do? There will be too much ugliness in the code to handle that.

Please don't mix those two problems.  1:1 mapping has been dealt with.
If you don't like how it has been dealt with, complain in the context
of 1:1 mapping.

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
