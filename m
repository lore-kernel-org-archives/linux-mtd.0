Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPZnT-0003Qr-Qy
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 18:31:12 +0000
Received: by mail-pa0-x242.google.com with SMTP id q2so1758981pap.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 11:30:50 -0700 (PDT)
Date: Tue, 19 Jul 2016 11:30:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: nand: Get rid of needless 'goto'
Message-ID: <20160719183047.GC85399@google.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
 <1468942904-26464-2-git-send-email-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1468942904-26464-2-git-send-email-andrew.smirnov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 08:41:44AM -0700, Andrey Smirnov wrote:
> Using "goto" in that "switch" statement only makes it harder to follow
> control flow and doesn't bring any advantages. Rewrite the code to avoid
> using "goto".
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 57043a6..8fa5536 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2139,18 +2139,15 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
>  	case MTD_OPS_PLACE_OOB:
>  	case MTD_OPS_AUTO_OOB:
>  	case MTD_OPS_RAW:
> +		if (!ops->datbuf)
> +			ret = nand_do_read_oob(mtd, from, ops);
> +		else
> +			ret = nand_do_read_ops(mtd, from, ops);
>  		break;
> -
>  	default:
> -		goto out;
> +		break;
>  	}
>  
> -	if (!ops->datbuf)
> -		ret = nand_do_read_oob(mtd, from, ops);
> -	else
> -		ret = nand_do_read_ops(mtd, from, ops);
> -
> -out:
>  	nand_release_device(mtd);
>  	return ret;
>  }

The default case is really just a catch-all error case. We don't
actually even need the nand_get_device() call for that... can we just
do this instead?

static int nand_read_oob(struct mtd_info *mtd, loff_t from,
			 struct mtd_oob_ops *ops)
{
	int ret;
	 
	ops->retlen = 0; 

	/* Do not allow reads past end of device */
	if (ops->datbuf && (from + ops->len) > mtd->size) {
		pr_debug("%s: attempt to read beyond end of device\n",
				__func__);
		return -EINVAL;
	}

	switch (ops->mode) {
	case MTD_OPS_PLACE_OOB:
	case MTD_OPS_AUTO_OOB:
	case MTD_OPS_RAW:
		break;

	default:
		return -ENOTSUPP;
	}

	nand_get_device(mtd, FL_READING);

	if (!ops->datbuf)
		ret = nand_do_read_oob(mtd, from, ops);
	else
		ret = nand_do_read_ops(mtd, from, ops);

	nand_release_device(mtd);
	return ret;
}

i.e., this diff:

Signed-off-by: Brian Norris <computersforpeace@gmail.com>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77533f7f2429..881dbd495466 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2162,7 +2162,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops)
 {
-	int ret = -ENOTSUPP;
+	int ret;
 
 	ops->retlen = 0;
 
@@ -2173,8 +2173,6 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 		return -EINVAL;
 	}
 
-	nand_get_device(mtd, FL_READING);
-
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
 	case MTD_OPS_AUTO_OOB:
@@ -2182,15 +2180,16 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 		break;
 
 	default:
-		goto out;
+		return -ENOTSUPP;
 	}
 
+	nand_get_device(mtd, FL_READING);
+
 	if (!ops->datbuf)
 		ret = nand_do_read_oob(mtd, from, ops);
 	else
 		ret = nand_do_read_ops(mtd, from, ops);
 
-out:
 	nand_release_device(mtd);
 	return ret;
 }
