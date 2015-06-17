Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z52lL-0001JJ-MF
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 02:07:36 +0000
Received: by pacgb13 with SMTP id gb13so23943819pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 16 Jun 2015 19:07:12 -0700 (PDT)
Date: Tue, 16 Jun 2015 19:07:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/6] mtd: nandsim: Fix kasprintf() usage
Message-ID: <20150617020707.GD4917@ld-irv-0074>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433193054-26865-3-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, maximlevitsky@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 01, 2015 at 11:10:50PM +0200, Richard Weinberger wrote:
> kasprintf() used in get_partition_name() does a dynamic
> memory allocation and can fail. We have to handle that case.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/nand/nandsim.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index f232427..52c0c1a 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -743,6 +743,11 @@ static int init_nandsim(struct mtd_info *mtd)
>  			goto error;
>  		}
>  		ns->partitions[i].name   = get_partition_name(i);
> +		if (!ns->partitions[i].name) {
> +			NS_ERR("unable to allocate memory.\n");

Probably don't really need the allocation failure messages. But this
matches the current style, so we can just rip the messages out at
another time.

> +			ret = -ENOMEM;
> +			goto error;
> +		}
>  		ns->partitions[i].offset = next_offset;
>  		ns->partitions[i].size   = part_sz;
>  		next_offset += ns->partitions[i].size;
> @@ -756,6 +761,11 @@ static int init_nandsim(struct mtd_info *mtd)
>  			goto error;
>  		}
>  		ns->partitions[i].name   = get_partition_name(i);
> +		if (!ns->partitions[i].name) {
> +			NS_ERR("unable to allocate memory.\n");

Same here.

> +			ret = -ENOMEM;
> +			goto error;
> +		}
>  		ns->partitions[i].offset = next_offset;
>  		ns->partitions[i].size   = remains;
>  		ns->nbparts += 1;

Brian
