Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHgjl-0004qe-Ec
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 07:56:51 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050920113616.GD2143@wohnheim.fh-wedel.de>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
	<20050920102436.GC2143@wohnheim.fh-wedel.de>
	<1127213984.20014.34.camel@sauron.oktetlabs.ru>
	<20050920113616.GD2143@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 20 Sep 2005 15:56:04 +0400
Message-Id: <1127217365.20014.45.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 13:36 +0200, Jörn Engel wrote:
> > 
> > If old binary mounts new image, it starts writing its cleanmarkers, use
> > 1:N mapping etc. A "mixed" image appears. Afterwords, if this mixed
> > image is being mounted on new JFFS2 binary, what poor Zhao is supposed
> > to do? There will be too much ugliness in the code to handle that.
> 
> Please don't mix those two problems.  1:1 mapping has been dealt with.
> If you don't like how it has been dealt with, complain in the context
> of 1:1 mapping.
> 

Please, remember the original goal. It is new wear-levelling. This patch
may be considered as something independent, but it is not optimal. If we
follow this way, Zhao must:

1. Write code which understands both cleanmarkers and EB headers.
2. Test that old images are actually work well on new JFFS2.
3. Implement 1:1. Remove cleanmarkers support as they are not needed
anymore.

So, there is unneeded work. Does it make sense to regard these problems
coincidentally?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
