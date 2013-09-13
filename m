Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKYXl-0004jK-0T
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2013 18:56:37 +0000
Received: by mail-ob0-f172.google.com with SMTP id gq1so1460368obb.31
 for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2013 11:56:14 -0700 (PDT)
Date: Fri, 13 Sep 2013 11:56:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: detect Squashfs partition
Message-ID: <20130913185610.GG4550@ld-irv-0074.broadcom.com>
References: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 13, 2013 at 06:38:17PM +0200, Rafał Miłecki wrote:
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/bcm47xxpart.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 9279a91..96f821a 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -32,6 +32,7 @@
>  #define ML_MAGIC1			0x39685a42
>  #define ML_MAGIC2			0x26594131
>  #define TRX_MAGIC			0x30524448
> +#define SQSH_MAGIC			0x71736873	/* shsq */

s/shsq/sqsh/

Or really, the "sqsh" comment doesn't add much to the SQSH_MAGIC macro.
Maybe this instead?

s/shsq/SquashFS/

>  
>  struct trx_header {
>  	uint32_t magic;
> @@ -167,6 +168,13 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>  			offset = rounddown(offset + trx->length, blocksize);
>  			continue;
>  		}
> +
> +		/* Squashfs */
> +		if (buf[0x000 / 4] == SQSH_MAGIC) {
> +			bcm47xxpart_add_part(&parts[curr_part++], "rootfs",
> +					     offset, 0);
> +			continue;
> +		}
>  	}
>  
>  	/* Look for NVRAM at the end of the last block. */

Brian
