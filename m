Received: from mail-qe0-x22d.google.com ([2607:f8b0:400d:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoNuV-0006iq-NH
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 01:39:24 +0000
Received: by mail-qe0-f45.google.com with SMTP id 6so16912345qea.32
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 17:39:02 -0800 (PST)
Date: Wed, 4 Dec 2013 17:38:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [RESEND PATCH 1/2] mtd: Add a retlen parameter to _get_{fact,
 user}_prot_info
Message-ID: <20131205013857.GG27149@ld-irv-0074.broadcom.com>
References: <1380798876-3321-1-git-send-email-christian.riesch@omicron.at>
 <9c3c8484-54a4-40e3-8a32-2b01c33280ac@mary.at.omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c3c8484-54a4-40e3-8a32-2b01c33280ac@mary.at.omicron.at>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Christian,

Are you sure you compile-tested this? I get build failures. See below.

On Thu, Oct 03, 2013 at 01:14:35PM +0200, Christian Riesch wrote:
> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |   31 +++++++++++++------------------
>  drivers/mtd/devices/mtd_dataflash.c |    7 ++++---
>  drivers/mtd/mtdchar.c               |   11 ++++++-----
>  drivers/mtd/mtdcore.c               |   12 ++++++------
>  drivers/mtd/mtdpart.c               |   14 ++++++++------
>  drivers/mtd/onenand/onenand_base.c  |   30 ++++++++++++------------------
>  include/linux/mtd/mtd.h             |   16 ++++++++--------
>  7 files changed, 57 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 7751443..2378e2f 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2399,24 +2399,19 @@ static int cfi_intelext_lock_user_prot_reg(struct mtd_info *mtd,
>  				     NULL, do_otp_lock, 1);
>  }
>  
> -static int cfi_intelext_get_fact_prot_info(struct mtd_info *mtd,
> -					   struct otp_info *buf, size_t len)
> -{
> -	size_t retlen;
> -	int ret;
> +static int cfi_intelext_get_fact_prot_info(struct mtd_info *, size_t,
> +					   size_t *, struct otp_info *);

You have a stray semicolon here, which causes the following compile
errors/warnings:

drivers/mtd/chips/cfi_cmdset_0001.c:2414:1: error: expected identifier or '(' before '{' token
drivers/mtd/chips/cfi_cmdset_0001.c:2411:12: warning: 'cfi_intelext_get_fact_prot_info' declared 'static' but never defined [-Wunused-function]

You seem to have replaced a function definition with just a declaration.

>  

You also have an extraneous blank line.

> -	ret = cfi_intelext_otp_walk(mtd, 0, len, &retlen, (u_char *)buf, NULL, 0);
> -	return ret ? : retlen;
> +{
> +	return cfi_intelext_otp_walk(mtd, 0, len, &retlen, (u_char *)buf,
> +				     NULL, 0);
>  }
>  
...

Brian
