Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avLlR-00067G-KI
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 09:28:10 +0000
Date: Wed, 27 Apr 2016 11:27:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/8] mtd-utils: Add multi-block erase function
Message-ID: <20160427112727.0d767fac@bbrezillon>
In-Reply-To: <e3758952-76e9-8b62-f575-42248f2d66f4@sigma-star.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-3-git-send-email-richard@nod.at>
 <20160426100406.452b2378@bbrezillon>
 <e3758952-76e9-8b62-f575-42248f2d66f4@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Wed, 27 Apr 2016 11:21:31 +0200
David Oberhollenzer <david.oberhollenzer@sigma-star.at> wrote:

> On 04/26/2016 10:04 AM, Boris Brezillon wrote:
> >> -int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
> >> +int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
> >> +			int fd, int eb, int blocks)
> >>  {
> >>  	int ret;
> >>  	struct libmtd *lib = (struct libmtd *)desc;
> >> @@ -856,8 +857,12 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	ei64.start = (__u64)eb * mtd->eb_size;
> >> -	ei64.length = mtd->eb_size;
> >> +	ret = mtd_valid_erase_block(mtd, eb + blocks - 1);
> >> +	if (ret)
> >> +		return ret;  
> > 
> > Maybe you should also check if @eb is a valid block (what if @eb < 0,
> > but @eb + @blocks >= 0).
> >   
> This patch only renames the mtd_erase function to mtd_erase_multi and lets it
> accept a block count. The existing code already checks @eb for validity.

My bad, just didn't look at the original file before commenting.
Thanks for the clarification.

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
