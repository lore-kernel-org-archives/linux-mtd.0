Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2PLb-0000XJ-0f
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 11:01:57 +0000
Message-ID: <475FBE80.1060202@nokia.com>
Date: Wed, 12 Dec 2007 12:57:04 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] [MTD][OneNAND] Check the initial bad block
	using	ONENAND_CTRL_ERROR
References: <20071212083309.GA32235@party>
In-Reply-To: <20071212083309.GA32235@party>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> Some chips don't set the ONENAND_CTRL_LOAD bit.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index bfc8399..e9aac83 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1121,8 +1121,8 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
>  
>  	if (ctrl & ONENAND_CTRL_ERROR) {
>  		printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
> -		/* Initial bad block case */
> -		if (ctrl & ONENAND_CTRL_LOAD)
> +		/* Initial bad block case: 0x2400 or 0x0400 */
> +		if (ctrl & ONENAND_CTRL_ERROR)
>  			return ONENAND_BBT_READ_ERROR;
>  		return ONENAND_BBT_READ_FATAL_ERROR;
>  	}

You have:

  	if (ctrl & ONENAND_CTRL_ERROR) {
  		printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
 		/* Initial bad block case: 0x2400 or 0x0400 */
		if (ctrl & ONENAND_CTRL_ERROR)
  			return ONENAND_BBT_READ_ERROR;
  		return ONENAND_BBT_READ_FATAL_ERROR;
  	}

which is the same as:

  	if (ctrl & ONENAND_CTRL_ERROR) {
  		printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
 		return ONENAND_BBT_READ_ERROR;
  	}

Is that what you intended?
