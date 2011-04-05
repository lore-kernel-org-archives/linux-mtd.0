Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7ByJ-0008Rx-5V
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 19:31:28 +0000
Received: by eyh6 with SMTP id 6so248472eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 12:31:25 -0700 (PDT)
Subject: Re: [PATCH] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1302028464-9519-1-git-send-email-marathon96@gmail.com>
References: <1302028464-9519-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 22:31:22 +0300
Message-ID: <1302031882.2608.48.camel@koala>
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

Just partial review before I go to bed, to keep you busy :-)))

On Tue, 2011-04-05 at 11:34 -0700, Grant Erickson wrote:
> 			kfree(kbuf);
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index da69bc8..d102b96 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -638,6 +638,36 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
>  	return ret;
>  }
>  
> +/* mtd_alloc_up_to - called, for example by mtd_{read,write} and
> + *			jffs2_scan_medium, to handle smaller (i.e. degraded) buffer
> + *			allocations under low- or fragmented-memory situations where
> + *			such reduced allocations, from a requested ideal, are allowed.
> + */

Please, make the comment to be of proper style. See the CodingStyle
file. Or even better - make it proper kerneldoc comment, if you can. I'm
sure you'll find the rules in the "Documentation" directory, but this is
optional. Also, please, put the comment just above the function. 
> +#define MAX_KMALLOC_SIZE 0x20000
> +
> +void *mtd_alloc_up_to(size_t *size)
> +{
> +	gfp_t flags;
> +	size_t try;
> +	void *kbuf;
> +
> +	try = min_t(size_t, *size, MAX_KMALLOC_SIZE);
> +
> +	do {
> +		flags = ((size == PAGE_SIZE) ?

s/size/try/

> +			 GFP_KERNEL :
> +			 (__GFP_NOWARN | __GFP_WAIT |
> +			   __GFP_NORETRY | __GFP_NO_KSWAPD));

Sorry, but this construct is not beautiful and difficult to read. I'd
call it abuse of ?: operators :-) I think it is much more readable to
simply:

1. initialize gfp_t flags to (__GFP_NOWARN .... ) when you initialize it
or just before the loop.
2. Do
	if (try == PAGE_SIZE)
		flags = GFP_KERNEL;

Simple and readable.

And do not forget to check the code with checkpatch.pl before sending
out :-)

Good night!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
