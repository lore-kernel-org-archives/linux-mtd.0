Received: from dsl-crow-209-5-162-130-cgy.nucleus.com ([209.5.162.130]
	helo=ray.lehtiniemi.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D5X9F-0001H6-Ke
	for linux-mtd@lists.infradead.org; Sun, 27 Feb 2005 17:44:26 -0500
Date: Sun, 27 Feb 2005 15:44:20 -0700
From: Ray Lehtiniemi <rayl@mail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050227224420.GA19056@mail.com>
References: <1109444967.4688.19.camel@sauron.oktetlabs.ru>
	<422141F8.7050707@voxware.com> <20050227181012.GA15280@mail.com>
	<1109529115.13512.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1109529115.13512.50.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [BUGFIX] JFFS2 NOR problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 27, 2005 at 09:31:55PM +0300, Artem B. Bityuckiy wrote:
> 
> I can't be completely certain but it is likely that your problem is the
> same problem that I've observed about a month ago. Take a glimpse at:
> http://lists.infradead.org/pipermail/linux-mtd/2005-January/011357.html

seems like it, yes.


> Here is a somewhat tweaked David's patch. I tried it and it looks like
> it works pretty good. Please, try it together with my last mount fix.
> 
> P.S. We'll commit both patches to the CVS after you (and others) have
> reported they are OK.

i have applied this patch against 2.6.11-rc3 + 20050225 mtd snapshot +
your previous patch, and it seems to cure both the oops with a virgin
fs and the slab corruption with a non-virgin fs.


thanks!

-- 
----------------------------------------------------------------------
     Ray L   <rayl@mail.com>
