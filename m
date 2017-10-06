Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0RoI-0002zL-Oe
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 12:33:02 +0000
Date: Fri, 6 Oct 2017 13:32:03 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Pavel Machek <pavel@ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, computersforpeace@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Message-ID: <20171006123203.GM21978@ZenIV.linux.org.uk>
References: <20170923201314.GA14742@amd> <9307201.RrdVcHfbLZ@blindfold>
 <20171006115514.GF9497@amd> <5423699.qLmXvRyVVn@blindfold>
 <1507291276.29211.350.camel@infradead.org>
 <20171006121359.GA14435@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171006121359.GA14435@amd>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 06, 2017 at 02:13:59PM +0200, Pavel Machek wrote:
> On Fri 2017-10-06 13:01:16, David Woodhouse wrote:
> > On Fri, 2017-10-06 at 14:00 +0200, Richard Weinberger wrote:
> > > Am Freitag, 6. Oktober 2017, 13:55:14 CEST schrieb Pavel Machek:
> > > > 
> > > > > 
> > > > > Let's carry it via MTD.
> > > > > BTW: Shouldn't it be s/kernel/comment/ in the subject line?
> > > > Yes, it should. Can it be fixed while applying?
> > > Sure. :)
> > 
> > You can change 'C++' to 'C99' too, while you're at it :)
> 
> No. They are C++ comments... as in... dangerous infection that came
> from C++. Yes, C99 is infected, too, but still C++ is original source
> of infection :-).

No, it is not.  See https://www.bell-labs.com/usr/dmr/www/bcpl.html and
scans refered therein; let's keep snobbery historically accurate...

IOW, it's not C++ invention - it's BCPL one.
