Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7OR8-000483-1L
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2011 08:50:03 +0000
Received: by fxm14 with SMTP id 14so1041119fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2011 01:50:00 -0700 (PDT)
Subject: Re: [PATCH] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1302033958-3056-1-git-send-email-marathon96@gmail.com>
References: <1302033958-3056-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Apr 2011 11:47:17 +0300
Message-ID: <1302079637.2742.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Grant, few more requests ;-)

On Tue, 2011-04-05 at 13:05 -0700, Grant Erickson wrote:
> When handling user space read or write requests via mtd_{read,write}
> or JFFS2 medium scan requests, exponentially back off on the size of
> the requested kernel transfer buffer until it succeeds or until the
> requested transfer buffer size falls below the page size.
> 
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
> 
>   v2: Incorporated coding style and comment feedback from Artem.
> 
> Signed-off-by: Grant Erickson <marathon96@gmail.com>
> ---
>  drivers/mtd/mtdchar.c fs/jffs2/scan.c
>  drivers/mtd/mtdchar.c   |   50 +++++++++++++++++++++-------------------------
>  drivers/mtd/mtdcore.c   |   41 ++++++++++++++++++++++++++++++++++++++
>  fs/jffs2/scan.c         |   11 +++++----
>  include/linux/mtd/mtd.h |    2 +
>  4 files changed, 72 insertions(+), 32 deletions(-)

This patch does not apply to l2-mtd-2.6.git, which is very up-to-date.
The conflict is trivial, but would be nice if you sent a patch against
l2-mtd-2.6.git:

git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

> +#define MAX_KMALLOC_SIZE 0x20000
> +
> +/**
> + * mtd_alloc_up_to - allocate a contiguous buffer up to the specified size
> + * @size: A pointer to the ideal or maximum size of the allocation. Points
> + *        to the actual allocation size on success.
> + *
> + * This routine attempts to allocate a contiguous kernel buffer up to
> + * the specified size, backing off the size of the request exponentially
> + * until the request succeeds or until the allocation size falls below
> + * the system page size.
> + *
> + * This is called, for example by mtd_{read,write} and jffs2_scan_medium,
> + * to handle smaller (i.e. degraded) buffer allocations under low- or
> + * fragmented-memory situations where such reduced allocations, from a
> + * requested ideal, are allowed.

Also, I think we need to provide a comment which describes why we picked
these kmalloc flags. I suggest you to add something like this:

This function tries to make sure it does not impact the performance
severely, so when allocating more than one page we ask the memory
allocator to avoid re-trying, swapping, write-back and I/O.

> + *
> + * Returns a pointer to the allocated buffer on success; otherwise, NULL.
> + */
> +void *mtd_alloc_up_to(size_t *size)

Can we please re-name it to mtd_kmalloc_up_to to reflect that we use
kmalloc and not vmalloc.

> +{
> +	gfp_t flags = (__GFP_NOWARN | __GFP_WAIT |
> +		       __GFP_NORETRY | __GFP_NO_KSWAPD);

Brackets are not really needed :-)

> +	size_t try;
> +	void *kbuf;
> +
> +	try = min_t(size_t, *size, MAX_KMALLOC_SIZE);
> +

Since we are trying to make this to be a "generic" function, let's use
KMALLOC_MAX_SIZE as the maximum. This constant is defined in
linux/slab.h, so you need to also add

#include <linux/slab.h>

> +	do {
> +		if (try == PAGE_SIZE)

Hmm, I think
		  if (try <= PAGE_SIZE)

because the input *size may be small in theory, in which case we should
basically fall-back to kmalloc(*size, GFP_KERNEL);

> +			flags = GFP_KERNEL;
> +
> +		kbuf = kmalloc(try, flags);
> +	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));
> +
> +	*size = try;
> +
> +	return kbuf;
Matter of taste, but I'd remove this extra new line. For me too sparse
code is less readable. I think both of these lines are about "returning
the results", so it makes sense to have them as "one block".
> +}

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
