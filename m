Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaVek-0007Jn-QI
	for linux-mtd@lists.infradead.org; Thu, 28 Jan 2010 14:47:43 +0000
Subject: Re: [PATCH v2 2/2] Creating helper func for block alignment
	verfication
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5791001130529l6f2ef9d5k79b6329a98baed54@mail.gmail.com>
References: <ce9ab5791001130453md91ad46ld84f9d51ccd96e87@mail.gmail.com>
	<ce9ab5791001130506g28bb330dm79225c688839323d@mail.gmail.com>
	<ce9ab5791001130520u6cbf0d9cx1f3fd16df31354d@mail.gmail.com>
	<ce9ab5791001130529l6f2ef9d5k79b6329a98baed54@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Jan 2010 16:46:43 +0200
Message-ID: <1264690003.1973.138.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2010-01-13 at 18:59 +0530, Vimal Singh wrote:
> From 310f7faa8f319bd9384512f7d5a7f13dcfbeebc8 Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Wed, 13 Jan 2010 18:11:47 +0530
> Subject: [PATCH] Creating helper func for block alignment verfication
> 
> These checks are fairly common in 'nand_erase_nand', 'nand_lock'
> and 'nand_unlock' functions.
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c |   97 +++++++++++++++---------------------------
>  1 files changed, 34 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 4e27426..c80cec5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -108,6 +108,37 @@ static int nand_do_write_oob(struct
>   */
>  DEFINE_LED_TRIGGER(nand_led_trigger);
> 
> +static int block_alignment_verification(struct mtd_info *mtd,
> +					loff_t ofs, uint64_t len)
> +{

This function checks not only alignment, so the name is bad. I suggest
check_offs_len() - it at least does not lie about what it does :-)

> +	struct nand_chip *chip = mtd->priv;
> +
> +	DEBUG(MTD_DEBUG_LEVEL3, "%s: start = 0x%012llx, len = %llu\n",
> +			__func__, (unsigned long long)ofs, len);

No, you should keep the DEBUG part in the caller. Because of __func__.

Also please, introduce the helper in the _first_ patch, and then use it
in your functions in the second patch. This is more logical.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
