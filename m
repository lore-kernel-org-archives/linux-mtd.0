Received: from mail-ob0-f170.google.com ([209.85.214.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vog0p-0005Uo-E0
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 20:59:08 +0000
Received: by mail-ob0-f170.google.com with SMTP id wp18so18606779obc.29
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 12:58:42 -0800 (PST)
Received: from ld-irv-0074.broadcom.com (5520-maca-inet1-outside.broadcom.com.
 [216.31.211.11])
 by mx.google.com with ESMTPSA id tr10sm79589047obb.6.2013.12.05.12.58.40
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=RC4-SHA bits=128/128);
 Thu, 05 Dec 2013 12:58:41 -0800 (PST)
Date: Thu, 5 Dec 2013 12:58:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131205205838.GL27149@ld-irv-0074.broadcom.com>
References: <1386274800-22013-1-git-send-email-computersforpeace@gmail.com>
 <1386274800-22013-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386274800-22013-3-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Caught a simple bug when testing with a non-READ_RETRY NAND. See below.

On Thu, Dec 05, 2013 at 12:19:59PM -0800, Brian Norris wrote:
...
> One thing I'm not sure about: do all relevant (i.e., ONFI-capable) NAND drivers
> support SET_FEATURES properly? If not, then it's possible that this could break
> nand_do_read_ops for such drivers. Not sure what the best method of handling
> that would be.
...
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
...
> @@ -1512,8 +1535,27 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  					nand_wait_ready(mtd);
>  			}
>  
> -			if (mtd->ecc_stats.failed - ecc_failures)
> -				ecc_fail = true;
> +			if (mtd->ecc_stats.failed - ecc_failures) {
> +				retry_mode++;

This increment shouldn't be done for all ECC failures, but only for
failures where there are remaining read-retry modes (i.e., flash that
support read retry).

> +				if (retry_mode < chip->read_retries) {
> +					pr_debug("ECC error; performing READ RETRY %d\n",
> +							retry_mode);
> +
> +					ret = nand_set_read_retry(mtd,
> +							retry_mode);
> +					if (ret < 0)
> +						break;
> +
> +					/* Reset failures */
> +					mtd->ecc_stats.failed = ecc_failures;
> +					continue;
> +				} else {
> +					/* No more retry modes; real failure */
> +					ecc_fail = true;
> +				}
> +			}
> +
> +			buf += bytes;
>  		} else {
>  			memcpy(buf, chip->buffers->databuf + col, bytes);
>  			buf += bytes;

I'll send a v2 with the following extra diff:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 82efd819f31b..aeafcdce6cc0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1536,8 +1536,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			}
 
 			if (mtd->ecc_stats.failed - ecc_failures) {
-				retry_mode++;
-				if (retry_mode < chip->read_retries) {
+				if (retry_mode + 1 < chip->read_retries) {
+					retry_mode++;
 					pr_debug("ECC error; performing READ RETRY %d\n",
 							retry_mode);
 
---

Brian
