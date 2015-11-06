Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zug77-0001Fn-A4
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 12:27:31 +0000
Message-ID: <1446812825.20949.137.camel@gmail.com>
Subject: Re: [PATCH 3/5] UBI: Expose the bitrot interface
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co
Date: Fri, 06 Nov 2015 14:27:05 +0200
In-Reply-To: <1446764217-15021-4-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
 <1446764217-15021-4-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All the comments in this e-mail are about improving commentaries and
naming conventions to make the code more consistent, may be a bit more
"formal", and more self-documenting.

On Thu, 2015-11-05 at 23:56 +0100, Richard Weinberger wrote:

> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index d16fccf..f500451 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -963,6 +963,36 @@ static long ubi_cdev_ioctl(struct file *file,
> unsigned int cmd,
>  		break;
>  	}
>  
> +	/* Read a PEB */

Naive reader's thoughts: Hmm, I thought tor read a PEB I can just read
from the character device. Hmm, there is an IOCTL for reading? And it
returns me the data?

Suggestion: please, improve the comment. Tell what it actually does and
why is it needed. Something like "Check whether the PEB has bit-flips
and hence, needs scrubbing" would do.

> +	case UBI_IOCRPEB:
> +	{
> +		int pnum;
> +
> +		err = get_user(pnum, (__user int32_t *)argp);
> +		if (err) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		err = ubi_bitrot_check(ubi, pnum, 0);

So I see 2 terms used: bitflips and bitrots. Would we please stick to
one of them, and I'd suggest the former, and leave the latter.

E.g.: ubi_check_bitflips() ?

> +	/* Scrub a PEB */

Naive reader's question: does it scrub unconditionally or only if there
are bit-flips. Is it really just scrub, or check-and-scrub?

Suggestion: improve the comment a bit.

> +	case UBI_IOCSPEB:
> +	{
> +		int pnum;
> +
> +		err = get_user(pnum, (__user int32_t *)argp);
> +		if (err) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		err = ubi_bitrot_check(ubi, pnum, 1);

Name is confusing, because it says "check", while the ioctl said
"scrub". But I guess we can leave with this, and I do not have better
ideas.

> +/**
> + * ubi_bitrot_check - Check an eraseblock for bitflips

But in the comment you do need to say something like 'check and scrub
an eraseblock' or something, so that it is clear this is not only about
'checking'.

> + * @pnum: the physical eraseblock to schedule
> + * @force_scrub: force scrubbing if non-zero
> + *

And here I'd put some additional comment about the function - what it
does, is scrubbing unconditional or not, etc.
