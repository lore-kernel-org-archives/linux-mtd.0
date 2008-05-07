Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JtZlM-0000M6-9R
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 02:52:12 +0000
Received: by wf-out-1314.google.com with SMTP id 28so86798wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 May 2008 19:52:10 -0700 (PDT)
Message-ID: <9c9fda240805061952s1da089b5x1be364588146994e@mail.gmail.com>
Date: Wed, 7 May 2008 11:52:10 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] cmdlinepart: Missing partition info is not an error
In-Reply-To: <87lk5nr0j9.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87lk5nr0j9.fsf@macbook.be.48ers.dk>
Cc: sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

After commit this patch, we can't register the mtd partitions in case
of OneNAND.
In previous time it expects the negative value (-EINVAL) if not found.
Now it returns 0 if not found.

#ifdef CONFIG_MTD_PARTITIONS
        err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
        if (err > 0)
                /* If cmdline found */
                add_mtd_partitions(&info->mtd, info->parts, err);
        else if (err < 0 && pdata->parts)
                /* not found but we have parts info */
                add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);
        else
#endif
                err = add_mtd_device(&info->mtd);

Well I will send the related patches.

Thank you,
Kyungmin Park


On Fri, Feb 15, 2008 at 1:00 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> Return 0 partitions instead of -EINVAL on no mtdpart= argument in kernel
>  cmdline or missing partition info for device.
>
>  Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>  Acked-by: Stefan Roese <sr@denx.de>
>  ---
>   drivers/mtd/cmdlinepart.c |    5 +----
>   1 files changed, 1 insertions(+), 4 deletions(-)
>
>  diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>  index b44292a..08b82c9 100644
>  --- a/drivers/mtd/cmdlinepart.c
>  +++ b/drivers/mtd/cmdlinepart.c
>  @@ -308,9 +308,6 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>         struct cmdline_mtd_partition *part;
>         char *mtd_id = master->name;
>
>  -       if(!cmdline)
>  -               return -EINVAL;
>  -
>         /* parse command line */
>         if (!cmdline_parsed)
>                 mtdpart_setup_real(cmdline);
>  @@ -341,7 +338,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
>                         return part->num_parts;
>                 }
>         }
>  -       return -EINVAL;
>  +       return 0;
>   }
>
>
>  --
