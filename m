Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JxSPF-0007qL-UD
	for linux-mtd@lists.infradead.org; Sat, 17 May 2008 19:49:26 +0000
Date: Sat, 17 May 2008 21:49:15 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Chris Malley <mail@chrismalley.co.uk>
Subject: Re: [PATCH] [MTD] CORE: Use list_for_each_entry[_safe] where
	appropriate.
Message-ID: <20080517194914.GA21674@logfs.org>
References: <1211046845.17244.19.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1211046845.17244.19.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 17 May 2008 18:54:05 +0100, Chris Malley wrote:
> 
> From: Chris Malley <mail@chrismalley.co.uk>
> 
> Should be no functional changes, just a bit of janitorial work
> to remove temporary pointers and make some functions a bit more readable.


> -	struct list_head *this;
> +	struct mtd_blktrans_dev *this;
>  	int last_devnum = -1;
>  	struct gendisk *gd;
>  
> @@ -221,25 +221,24 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>  		BUG();
>  	}
>  
> -	list_for_each(this, &tr->devs) {
> -		struct mtd_blktrans_dev *d = list_entry(this, struct mtd_blktrans_dev, list);

I guess whoever originally wrote the code used "d" for ..._dev.  And in
spite of being just one letter, I find it more descriptive than "this".
Would you mind killing "this" instead of "d"?  And likewise in the other
hunks, always nuke "this", as it has zero descriptiveness.

Otherwise a nice cleanup.  Did you check that the resulting object code
remains identical?

Jörn

-- 
In America you can have either a flimsy box banged together out of two
by fours and drywall, or a McMansion -- a flimsy box banged together
out of two by fours and drywall, but larger, more dramatic-looking,
and full of expensive fittings.
-- Paul Graham
