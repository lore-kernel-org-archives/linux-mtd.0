Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJwmc-0005qq-3T
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 13:29:02 -0400
Date: Mon, 26 Sep 2005 19:28:56 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Peter Grayson <pgrayson@realmsys.com>
Message-ID: <20050926172855.GA23962@wohnheim.fh-wedel.de>
References: <1127433949.6937.30.camel@localhost.localdomain>
	<20050925150635.GD28978@wohnheim.fh-wedel.de>
	<4337B727.2050809@yandex.ru>
	<20050926093440.GE17756@wohnheim.fh-wedel.de>
	<4337C35C.6060007@yandex.ru>
	<20050926110150.GG17756@wohnheim.fh-wedel.de>
	<1127755073.6937.74.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127755073.6937.74.camel@localhost.localdomain>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2 whitespace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 September 2005 11:17:53 -0600, Peter Grayson wrote:
> On Mon, 2005-09-26 at 13:01 +0200, Jörn Engel wrote:
> > On Mon, 26 September 2005 13:46:04 +0400, Artem B. Bityutskiy wrote:
> > > Jörn Engel wrote:
> > > >Because we want things like ebh, summary, xattr, etc.?  If we accept
> > > >this patch, it makes life a bit worse for people who write the stuff
> > > >we want.  It may be the straw that makes them go away and never come
> > > >back.
> 
> I agree that other patches are more important than code formatting.
> However, we may also enable more people to contribute to jffs2 if the
> code is as readable/understandable as possible. I want to help make a
> small, but tangible step in that direction.

Thank you for that effort.

> > Imo, the costs outweigh the benefit.  [ Which doesn't mean that I
> > question the benefit.  It's just not big enough. ]
> 
> Since there appears to be at least some benefit, maybe we can do this in
> easy to digest pieces. I have made another patch just against the files
> concerning compression in jffs2. These files had a lot of problems and I
> do not believe they conflict with any of the main outstanding patches
> (ebh, xattr, centsum).

That patch I would gladly take.  Someone should quickly review it for
correctness (not me, sorry :-P).
The easiest way for review, I guess, would be to compile before and
after your patch.  If the binaries are identical (module timestamps,
so take objdump -D output or such), nothing dangerous slipped in.

And yes, for compression the benefits greatly outweigh the costs.
Quite an improvement.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
