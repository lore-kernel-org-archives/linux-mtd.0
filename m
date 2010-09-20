Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxgHg-0007mn-LS
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 13:19:53 +0000
Received: by bwz19 with SMTP id 19so6140311bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 06:19:51 -0700 (PDT)
Subject: Re: [PATCH 2/2][MTD]MLC device check in OneNAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
In-Reply-To: <000101cb53e3$b15d6280$14182780$%hs@samsung.com>
References: <000101cb53e3$b15d6280$14182780$%hs@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 16:18:00 +0300
Message-ID: <1284988680.5258.48.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: v.dalal@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-14 at 13:36 +0530, Rohit Hassan Sathyanarayan wrote:
> Signed-off-by: Rohit HS <rohit.hs@samsung.com>
> ---
>  include/mtd/mtd-abi.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index 4debb45..6c6465d 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -57,12 +57,14 @@ struct mtd_oob_buf64 {
>  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
>  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
>  #define MTD_POWERUP_LOCK	0x2000	/* Always locked after reset */
> +#define MTD_WRITABLE_ONCE	0x4000

MTD_WRITABLE_ONCE is bad name.

>  
>  // Some common devices / combinations of capabilities
>  #define MTD_CAP_ROM		0
>  #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
>  #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
> +#define MTD_CAP_MLCNANDFLASH	(MTD_WRITEABLE | MTD_WRITABLE_ONCE)

MLC is not really a capability.

I think MLC flash is so much different to the old good SLC flashes, that
I'd just treat it as another flash type. I'd introduce MTD_MLCNANDFLASH
for it, similar to MTD_NANDFLASH.

What do you think?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
