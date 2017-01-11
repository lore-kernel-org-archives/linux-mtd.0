Received: from avasout05.plus.net ([84.93.230.250])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRLfy-0001yT-RU
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 16:23:06 +0000
Date: Wed, 11 Jan 2017 16:22:35 +0000
From: Mike Crowe <mac@mcrowe.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
Message-ID: <20170111162235.GA32121@mcrowe.com>
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
 <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
 <20170105141834.GA3198@mcrowe.com>
 <20170105154824.5c9e97ee@bbrezillon>
 <20170105150402.GA3931@mcrowe.com>
 <8f046052-f092-86a0-3375-8d5ddc7572b6@sigma-star.at>
 <20170109145135.GA17740@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170109145135.GA17740@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 January 2017 at 14:51:35 +0000, Mike Crowe wrote:
> However, I can't say I understand how the main loop in nandwrite.c can work
> if blockalign > 1. It contains the following lines of code:
> 
> |  ebsize_aligned = mtd.eb_size * blockalign;
> |  ...
> |  ret = mtd_is_bad(&mtd, fd, offs / ebsize_aligned);

I believe that the above line should read:

 ret = mtd_is_bad(&mtd, fd, offs / mtd.eb_size);

so that...

> |  ...		   
> |  offs +=  ebsize_aligned / blockalign;
> 
> The implementation of mtd_is_bad in libmtd.c contains:
> 
> |  seek = (loff_t)eb * mtd->eb_size;

...the above line works correctly.

This seems to have been introduced back in 2010 in
15d811481cf1cf61ae23fabbd1e191ebdbcf3881 when a direct ioctl call was
replaced by the call to mtd_is_bad.

But, if it really has been broken since then, I think it's worth
questioning how many people can actually be using the blockalign feature.

Thanks.

Mike.
