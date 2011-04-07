Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7kNZ-0005FJ-Qa
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 08:15:50 +0000
Received: by bwz1 with SMTP id 1so2185342bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 01:15:47 -0700 (PDT)
Subject: Re: [PATCH v3] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1302105402-12990-1-git-send-email-marathon96@gmail.com>
References: <1302105402-12990-1-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Apr 2011 11:13:03 +0300
Message-ID: <1302163983.2407.12.camel@localhost>
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

On Wed, 2011-04-06 at 08:56 -0700, Grant Erickson wrote:
> When handling user space read or write requests via mtd_{read,write}
> or JFFS2 medium scan requests, exponentially back off on the size of
> the requested kernel transfer buffer until it succeeds or until the
> requested transfer buffer size falls below the page size.
> 
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
> 
>   v2: Incorporated coding style and comment feedback from Artem.
>   v3: Incorporated more feedback from Artem. Retargeted patch against
>       l2-mtd-2.6.
> 
> Signed-off-by: Grant Erickson <marathon96@gmail.com>

Looks good, but I have 2 requests still.

> ---
>  drivers/mtd/mtdchar.c   |   50 +++++++++++++++++++++-------------------------
>  drivers/mtd/mtdcore.c   |   41 ++++++++++++++++++++++++++++++++++++++
>  fs/jffs2/scan.c         |   11 +++++----
>  include/linux/mtd/mtd.h |    2 +
>  4 files changed, 72 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 145b3d0d..8651a79 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -166,10 +166,23 @@ static int mtd_close(struct inode *inode, struct file *file)
>  	return 0;
>  } /* mtd_close */
>  
> -/* FIXME: This _really_ needs to die. In 2.5, we should lock the
> -   userspace buffer down and use it directly with readv/writev.
> -*/
> -#define MAX_KMALLOC_SIZE 0x20000
> +/* Back in April 2005, Linus wrote:
> + *
> + *   FIXME: This _really_ needs to die. In 2.5, we should lock the
> + *   userspace buffer down and use it directly with readv/writev.
> + *
> + * The implementation below, using mtd_alloc_up_to, mitigates

1. s/mtd_alloc_up_to/mtd_kmalloc_up_to/ here as well.

BTW, It still does not apply on top of l2-mtd-2.6.git, the conflict is
in include/linux/mtd/mtd.h - but well, I can fix that conflict.

2. Please, fix compilation warning:

fs/jffs2/scan.c: In function ‘jffs2_scan_medium’:
fs/jffs2/scan.c:123: warning: passing argument 1 of ‘mtd_kmalloc_up_to’ from incompatible pointer type
include/linux/mtd/mtd.h:351: note: expected ‘size_t *’ but argument is of type ‘uint32_t *’

This is a bug in 64-bit machines because sizeof(size_t) is 8 there.

Could you please fix that, test, and then send the final version.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
