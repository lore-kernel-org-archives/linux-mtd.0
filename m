Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy3hy-0008SJ-Oe
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 11:39:15 +0000
Date: Mon, 19 May 2008 13:38:58 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Chris Malley <mail@chrismalley.co.uk>
Subject: Re: [PATCH] [MTD] CORE: Use list_for_each_entry[_safe] where
	appropriate (2nd attempt)
Message-ID: <20080519113858.GB32679@logfs.org>
References: <1211046845.17244.19.camel@localhost>
	<20080517194914.GA21674@logfs.org>
	<1211139433.19435.19.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1211139433.19435.19.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 18 May 2008 20:37:13 +0100, Chris Malley wrote:
>
> +	list_for_each_entry(tr, &blktrans_majors, list) {
>  		tr->add_mtd(tr, mtd);
>  	}

In a couple of places like this the loop body became a single line.  So
you could remove the braces as well, while at it.

> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 07c7011..b7847f2 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -302,20 +302,14 @@ static int part_block_markbad (struct mtd_info *mtd, loff_t ofs)
>  
>  int del_mtd_partitions(struct mtd_info *master)
>  {
> -	struct list_head *node;
> -	struct mtd_part *slave;
> +	struct mtd_part *slave, *safe;

"next" seems a bit better than "safe".

Rest looks fine to me.  So I leave it up to you whether to add those
trivial cosmetics or just leave the patch as-is.  Either way, it is an
improvement.  Also, having dwmw2 on Cc: improves the chances of this
patch not being ignored. ;)

Reviewed-By: Joern Engel <joern@logfs.org>

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
