Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfIPn-00011D-AX
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 10:17:21 -0400
Date: Mon, 6 Jun 2005 16:16:50 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050606141650.GG31739@wohnheim.fh-wedel.de>
References: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
	<20050606131534.GC31739@wohnheim.fh-wedel.de>
	<42A45382.5080301@yandex.ru>
	<20050606140010.GE31739@wohnheim.fh-wedel.de>
	<1118067037.5629.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1118067037.5629.15.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS3 superblock search
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 June 2005 18:10:37 +0400, Artem B. Bityuckiy wrote:
> 
> > There are valid reasons to use 512 byte blocks instead.  Most likely I
> > will do just that for logfs, just as a hint.  Therefore, even with 8
> > byte keys, you'd be down to 32^4 or about a million.  Prepare for more
> > levels.
> 
> May be. Should think more.
> If you're going to make use of the Tree-based approach, then why don't
> you rename logfs to JFFS3 and we'll join :-) ?

I won't make use of a single tree.  And naming is jffs3 would just be
gross.  Image the name correctly describing the design?  Eew!  ;)

Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
