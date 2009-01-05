Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJqWu-0001Dd-2A
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 14:34:08 +0000
Subject: Re: [PATCH 3/3] UBI: is_mapped operation via ioctl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <71cd59b00901050607l4356c850y2be8ea93d8437fbd@mail.gmail.com>
References: <71cd59b00901050607l4356c850y2be8ea93d8437fbd@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Jan 2009 16:33:29 +0200
Message-Id: <1231166009.6608.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-01-05 at 15:07 +0100, Corentin Chary wrote:
> diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
> index bcff3a0..a65c4ab 100644
> --- a/include/mtd/ubi-user.h
> +++ b/include/mtd/ubi-user.h
> @@ -137,6 +137,8 @@
>  #define UBI_IOMAP   _IOW(UBI_VOL_IOC_MAGIC, 3, struct ubi_map_req)
>  /* Unmap an eraseblock */
>  #define UBI_IOUNMAP _IOW(UBI_VOL_IOC_MAGIC, 4, int32_t)
> +/* check whether an eraseblock is mapped */
Bettert to start from capital "C".

> +#define UBI_IOISMAP _IOW(UBI_VOL_IOC_MAGIC, 5, int32_t)
I think this should be _IOR instead.

_IOR: data is transferred from kernel to user-space
_IOW: data is transferred from user-space to kernel
_IORW: both directions

Otherwise, the patches look OK for me.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
