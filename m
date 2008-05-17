Received: from mtaout01-winn.ispmail.ntl.com ([81.103.221.47])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JxShU-0001eI-Mc
	for linux-mtd@lists.infradead.org; Sat, 17 May 2008 20:08:17 +0000
Subject: Re: [PATCH] [MTD] CORE: Use list_for_each_entry[_safe] where
	appropriate.
From: Chris Malley <mail@chrismalley.co.uk>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080517194914.GA21674@logfs.org>
References: <1211046845.17244.19.camel@localhost>
	<20080517194914.GA21674@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2008 21:08:05 +0100
Message-Id: <1211054885.9960.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-05-17 at 21:49 +0200, Jörn Engel wrote:
> On Sat, 17 May 2008 18:54:05 +0100, Chris Malley wrote:
> > 
> > From: Chris Malley <mail@chrismalley.co.uk>
> > 
> > Should be no functional changes, just a bit of janitorial work
> > to remove temporary pointers and make some functions a bit more readable.
> 
> 
> > -	struct list_head *this;
> > +	struct mtd_blktrans_dev *this;
> >  	int last_devnum = -1;
> >  	struct gendisk *gd;
> >  
> > @@ -221,25 +221,24 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
> >  		BUG();
> >  	}
> >  
> > -	list_for_each(this, &tr->devs) {
> > -		struct mtd_blktrans_dev *d = list_entry(this, struct mtd_blktrans_dev, list);
> 
> I guess whoever originally wrote the code used "d" for ..._dev.  And in
> spite of being just one letter, I find it more descriptive than "this".
> Would you mind killing "this" instead of "d"?  And likewise in the other
> hunks, always nuke "this", as it has zero descriptiveness.

OK, I wasn't sure what people preferred; I'll change to use the original
identifiers.

> Otherwise a nice cleanup.  Did you check that the resulting object code
> remains identical?

Not yet, I'll do this before posting an updated version. Thanks for the
feedback.

Chris
