Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IinPb-00063O-5c
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 09:40:57 +0100
Date: Fri, 19 Oct 2007 10:24:38 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
Message-ID: <20071019082438.GA26913@lazybastard.org>
References: <f383264b0710181813i61b5b9acs76afdf27f199adcc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f383264b0710181813i61b5b9acs76afdf27f199adcc@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 18 October 2007 18:13:07 -0700, Matt Reimer wrote:
> 
> If there were multiple bit errors in the data s3c2410_nand_correct_data()
> was returning 0 (no error) instead of -1, so the upper layers (like JFFS2)
> would not know the data is corrupt.
> 
> Signed-off-by: Matt Reimer <mreimer@vpop.net>
> ---
>  drivers/mtd/nand/s3c2410.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 077fdcc..2e6b435 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -397,7 +397,7 @@ static int s3c2410_nand_correct_data(struct
> mtd_info *mtd, u_char *dat,
>         if ((diff0 & ~(1<<fls(diff0))) == 0)
>                 return 1;
> 
> -       return 0;
> +       return -1;
>  }

Why don't you return -EBADMSG?

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
