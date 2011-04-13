Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9qsZ-0007AM-HY
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 03:36:32 +0000
Received: by ewy3 with SMTP id 3so63477ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 20:36:30 -0700 (PDT)
Subject: Re: [PATCH] nand: Fix S3C NAND clock stop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiri Pinkava <jiri.pinkava@vscht.cz>
In-Reply-To: <1302533304-6795-1-git-send-email-jiri.pinkava@vscht.cz>
References: <4DA27245.6@vscht.cz>
	<1302533304-6795-1-git-send-email-jiri.pinkava@vscht.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 06:36:24 +0300
Message-ID: <1302665784.14691.5.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	ben-linux@fluff.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-11 at 16:48 +0200, Jiri Pinkava wrote:
> Current implementation of s3c2410_nand_select_chip call
> clk_disable every time when chip = -1 (de-select). This happend
> multiple times even if chip was already de-selected. This causes
> disabling clock even if they are already disabled and due to
> nature of clock subsytem implementation this causes nand clock
> to be disabled and newer enabled again.
> 
> Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
> ---
>  drivers/mtd/nand/s3c2410.c |   59 ++++++++++++++++++++++++++++++++------------
>  1 files changed, 43 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> index 33d832d..cea775a 100644
> --- a/drivers/mtd/nand/s3c2410.c
> +++ b/drivers/mtd/nand/s3c2410.c
> @@ -55,7 +55,7 @@ static int hardware_ecc = 0;
>  #endif
>  
>  #ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
> -static int clock_stop = 1;
> +static const int clock_stop = 1;
>  #else
>  static const int clock_stop = 0;
>  #endif

Please, kill clock_stop variable completely in a separate patch.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
