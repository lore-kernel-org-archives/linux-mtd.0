Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1zM6-0003Tx-HK
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 15:20:39 +0000
Received: by mail-pa0-f42.google.com with SMTP id et14so1382707pad.29
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 07:20:16 -0800 (PST)
Date: Fri, 19 Dec 2014 07:20:13 -0800
From: Jeremiah Mahler <jmmahler@gmail.com>
To: Mohammad Jamal <md.jamalmohiuddin@gmail.com>
Subject: Re: [PATCH] mtd: ssfdc: Fix space before ( coding style
Message-ID: <20141219152013.GA2046@hudson.localdomain>
References: <1418999413-29428-1-git-send-email-md.jamalmohiuddin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1418999413-29428-1-git-send-email-md.jamalmohiuddin@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mohammad,

On Fri, Dec 19, 2014 at 08:00:13PM +0530, Mohammad Jamal wrote:
> Patch solves the space before ( coding style issue of ssfdc.c
> 
> Signed-off-by: Mohammad Jamal <md.jamalmohiuddin@gmail.com>
> ---
>  drivers/mtd/ssfdc.c |   18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
> index daf82ba..d4a922c 100644
> --- a/drivers/mtd/ssfdc.c
> +++ b/drivers/mtd/ssfdc.c
> @@ -42,8 +42,8 @@ struct ssfdcr_record {
>  #define MAX_LOGIC_BLK_PER_ZONE	1000
>  #define MAX_PHYS_BLK_PER_ZONE	1024
>  
> -#define KiB(x)	( (x) * 1024L )
> -#define MiB(x)	( KiB(x) * 1024L )
> +#define KiB(x)	((x) * 1024L)
> +#define MiB(x)	(KiB(x) * 1024L)
This looks better than before.

>  
>  /** CHS Table
>  		1MiB	2MiB	4MiB	8MiB	16MiB	32MiB	64MiB	128MiB
> @@ -63,13 +63,13 @@ typedef struct {
>  
>  /* Must be ordered by size */
>  static const chs_entry_t chs_table[] = {
> -	{ MiB(  1), 125,  4,  4 },
> -	{ MiB(  2), 125,  4,  8 },
> -	{ MiB(  4), 250,  4,  8 },
> -	{ MiB(  8), 250,  4, 16 },
> -	{ MiB( 16), 500,  4, 16 },
> -	{ MiB( 32), 500,  8, 16 },
> -	{ MiB( 64), 500,  8, 32 },
> +	{ MiB(1), 125,  4,  4 },
> +	{ MiB(2), 125,  4,  8 },
> +	{ MiB(4), 250,  4,  8 },
> +	{ MiB(8), 250,  4, 16 },
> +	{ MiB(16), 500,  4, 16 },
> +	{ MiB(32), 500,  8, 16 },
> +	{ MiB(64), 500,  8, 32 },
>  	{ MiB(128), 500, 16, 32 },
>  	{ 0 },
>  };
I like the original version better here.  The columns were lined up
nicely and it was easier to read.

-- 
- Jeremiah Mahler
