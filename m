Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGukP-0004z9-RD
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 18:55:10 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so11657296pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 11:54:48 -0700 (PDT)
Date: Mon, 11 Aug 2014 11:54:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [RESEND PATCH v4 1/4] mtd: cfi_cmdset_0002: Add support for
 reading OTP
Message-ID: <20140811185445.GZ3711@ld-irv-0074>
References: <1399270469-31022-1-git-send-email-christian.riesch@omicron.at>
 <04bad0a1-cd2d-4f9d-8f5d-3fb4767a8ca1@mary.at.omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04bad0a1-cd2d-4f9d-8f5d-3fb4767a8ca1@mary.at.omicron.at>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Christian,

This patch is already upstream, but Coverity noticed a problem. Below:

On Mon, May 05, 2014 at 08:14:26AM +0200, Christian Riesch wrote:
> @@ -1224,6 +1238,148 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
>  	return ret;
>  }
>  
> +static int cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
> +			       size_t *retlen, u_char *buf,
> +			       otp_op_t action, int user_regs)
> +{
...
> +				mutex_lock(&chip->mutex);
> +				ret = get_chip(map, chip, base, FL_LOCKING);

'ret' is never checked after this.

> +

Should something like the following (untested) patch be applied?

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 5a4bfe33112a..46c4643b7a07 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1434,6 +1434,10 @@ static int cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 
 				mutex_lock(&chip->mutex);
 				ret = get_chip(map, chip, base, FL_LOCKING);
+				if (ret) {
+					mutex_unlock(&chip->mutex);
+					return ret;
+				}
 
 				/* Enter lock register command */
 				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1,

Brian
