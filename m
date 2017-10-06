Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0RWH-0001YN-Qb
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 12:14:23 +0000
Date: Fri, 6 Oct 2017 14:13:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, computersforpeace@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Message-ID: <20171006121359.GA14435@amd>
References: <20170923201314.GA14742@amd> <9307201.RrdVcHfbLZ@blindfold>
 <20171006115514.GF9497@amd> <5423699.qLmXvRyVVn@blindfold>
 <1507291276.29211.350.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507291276.29211.350.camel@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri 2017-10-06 13:01:16, David Woodhouse wrote:
> On Fri, 2017-10-06 at 14:00 +0200, Richard Weinberger wrote:
> > Am Freitag, 6. Oktober 2017, 13:55:14 CEST schrieb Pavel Machek:
> > > 
> > > > 
> > > > Let's carry it via MTD.
> > > > BTW: Shouldn't it be s/kernel/comment/ in the subject line?
> > > Yes, it should. Can it be fixed while applying?
> > Sure. :)
> 
> You can change 'C++' to 'C99' too, while you're at it :)

No. They are C++ comments... as in... dangerous infection that came
from C++. Yes, C99 is infected, too, but still C++ is original source
of infection :-).

                                                                        Pavel
									

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
