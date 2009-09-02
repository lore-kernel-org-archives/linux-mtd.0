Message-ID: <4A9E0C47.205@gmail.com>
Date: Wed, 02 Sep 2009 09:10:15 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
In-Reply-To: <C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/02/2009 08:59 AM, Amul Kumar Saha wrote:
> +if MTD_ONENAND_OTP
> +
> +config ONENAND_OTP_AREA
> +	bool "OTP area ONLY"
> +	depends on MTD_ONENAND_OTP
> +	select ON_OTP_AREA
> +
> +config ONENAND_OTP_BLOCK0
> +	bool "Block[0] ONLY"
> +	depends on MTD_ONENAND_OTP&&  !ONENAND_OTP_AREA
> +	select ON_OTP_BLOCK0
> +
> +config ONENAND_OTP_AREA_BLOCK0
> +	bool "BOTH OTP area AND Block[0]"
> +	depends on MTD_ONENAND_OTP&&  !ONENAND_OTP_AREA&&  !ONENAND_OTP_BLOCK0
> +	select ON_OTP_AREA_BLOCK0
> +
> +endif #MTD_ONENAND_OTP

If there were 10 OTP blocks, would you add 10 options?
I mean, are these switches really needed? Can we remove them?

> +
>   config MTD_ONENAND_2X_PROGRAM
>   	bool "OneNAND 2X program support"
>   	help
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index 6e82909..1b11a3e 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -13,6 +13,10 @@
>    *	Flex-OneNAND support
>    *	Copyright (C) Samsung Electronics, 2008
>    *
> + *	Amul Kumar Saha<amul.saha@samsung.com>
> + *	OTP support
> + *	Copyright (C) SAMSUNG Electronics, 2009

If this all is (C) Samsung already, do you really need to add one more
(C) line?

> + *
>    * This program is free software; you can redistribute it and/or modify
>    * it under the terms of the GNU General Public License version 2 as
>    * published by the Free Software Foundation.
> @@ -308,6 +312,81 @@ int flexonenand_region(struct mtd_info *mtd, loff_t addr)
>   EXPORT_SYMBOL(flexonenand_region);
>
>   /**
> + * onenand_otp_command - Send OTP specific command to OneNAND device
> + * @param mtd	 MTD device structure
> + * @param cmd	 the command to be sent
> + * @param addr	 offset to read from or write to
> + * @param len	 number of bytes to read or write
> + */
> +static int onenand_otp_command(struct mtd_info *mtd, int cmd, loff_t addr,
> +				size_t len)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	int value, block, page;
> +
> +	/* Address translation */
> +	switch (cmd) {
> +	case ONENAND_CMD_OTP_ACCESS:
> +		block = (int) (addr>>  this->erase_shift);

Why do you need the (int) cast there? How about cleaning up
>> (missing space) ?

> +		page = -1;
> +		break;
> +
> +	default:
> +		block = (int) (addr>>  this->erase_shift);
> +		page = (int) (addr>>  this->page_shift);

Ditto. And there are many places where you did not have put spaces properly.

> +/**
>    * onenand_command - [DEFAULT] Send command to OneNAND device
>    * @param mtd		MTD device structure
>    * @param cmd		the command to be sent
> @@ -1879,7 +1958,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
>   			onenand_update_bufferram(mtd, prev, !ret&&  !prev_subpage);
>   			if (ret) {
>   				written -= prevlen;
> -				printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
> +				printk(KERN_ERR "onenand_write_ops_nolock: \
> +						write failed %d\n", ret);
>   				break;

Please, fix printk's. Do not use "\".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
