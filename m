Received: from rn-out-0910.google.com ([64.233.170.191]
	helo=rn-out-0102.google.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Il7Cw-0006ph-C1
	for linux-mtd@lists.infradead.org; Thu, 25 Oct 2007 19:13:28 +0100
Received: by rn-out-0102.google.com with SMTP id e25so242036rng
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Oct 2007 11:12:24 -0700 (PDT)
Message-ID: <f383264b0710251112j6d369126ja779348f67c687b6@mail.gmail.com>
Date: Thu, 25 Oct 2007 11:12:24 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
In-Reply-To: <1192898905-12921-1-git-send-email-mattjreimer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1192898905-12921-1-git-send-email-mattjreimer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anyone willing to ACK this patch?

Matt

On 10/20/07, Matt Reimer <mattjreimer@gmail.com> wrote:
> From: Matt Reimer <mreimer@vpop.net>
>
> If there were multiple bit errors in the data s3c2410_nand_correct_data()
> was returning 0 (no error) instead of -EBADMSG, so the upper layers
> (like JFFS2) would not know the data is corrupt.
>
> Signed-off-by: Matt Reimer <mreimer@vpop.net>
> ---
>  drivers/mtd/nand/s3c2410.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 077fdcc..1aa3a18 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -397,7 +397,7 @@ static int s3c2410_nand_correct_data(struct mtd_info *mtd, u_char *dat,
>         if ((diff0 & ~(1<<fls(diff0))) == 0)
>                 return 1;
>
> -       return 0;
> +       return -EBADMSG;
>  }
>
>  /* ECC functions
> --
> 1.5.3.2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
