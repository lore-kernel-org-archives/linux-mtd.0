Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6yBk-0000Yb-Sg
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 04:48:25 +0000
Received: by eyh6 with SMTP id 6so1285eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 21:48:23 -0700 (PDT)
Subject: Re: [PATCH v2] MTD: Retry Read/Write Transfer Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1301941174-10050-1-git-send-email-marathon96@gmail.com>
References: <1301705049-15593-1-git-send-email-marathon96@gmail.com>
	<1301941174-10050-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 07:48:21 +0300
Message-ID: <1301978901.2608.38.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 11:19 -0700, Grant Erickson wrote:
> When handling user space read or write requests via mtd_{read,write},
> exponentially back off on the size of the requested kernel transfer
> buffer until it succeeds or until the requested transfer buffer size
> falls below the page size.
> 
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
> 
>   v2: Added __GFP_NOWARN flag and made common retry loop a function
>       as recommended by Artem.
> 
> Signed-off-by: Grant Erickson <marathon96@gmail.com>
> ---
>  drivers/mtd/mtdchar.c |   66 +++++++++++++++++++++++++++++++++---------------
>  1 files changed, 45 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 145b3d0d..df9be51 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -166,11 +166,44 @@ static int mtd_close(struct inode *inode, struct file *file)
>  	return 0;
>  } /* mtd_close */
>  
> -/* FIXME: This _really_ needs to die. In 2.5, we should lock the
> -   userspace buffer down and use it directly with readv/writev.
> -*/
> +/* Back in April 2005, Linus wrote:
> + * 
> + *   FIXME: This _really_ needs to die. In 2.5, we should lock the
> + *   userspace buffer down and use it directly with readv/writev.
> + *
> + * The implementation below, using mtd_try_alloc, mitigates allocation
> + * failures when the sytem is under low-memory situations or if memory
> + * is highly fragmented at the cost of reducing the performance of the
> + * requested transfer due to a smaller buffer size.
> + *
> + * A more complex but more memory-efficient implementation based on
> + * get_user_pages and iovecs to cover extents of those pages is a
> + * longer-term goal, as intimated by Linus above. However, for the
> + * write case, this requires yet more complex head and tail transfer
> + * handling when those head and tail offsets and sizes are such that
> + * alignment requirements are not met in the NAND subdriver.
> + */
>  #define MAX_KMALLOC_SIZE 0x20000
>  
> +static void *mtd_try_alloc(size_t *size)

Also, if you do the changes I request and make this function allow scary
kmalloc warnings on the last resort PAGE_SIZE allocation, the "try" in
the function name becomes not very appropriate, because in the kernel
APIs it is usually used for something like "try, if did not succeed, no
worry, just return". E.g., mutex_try_lock() or something.

I think it is better to name it mtd_alloc or something like this, but
without "try".

And probably you want to reuse this function in JFFS2, so we should give
it some name which is good for exported API function. May be
mtd_alloc_upto() ? Or mtd_alloc_as_much() ? Or better ideas?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
