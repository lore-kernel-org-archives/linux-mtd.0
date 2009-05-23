Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7n7X-0002Jp-JF
	for linux-mtd@lists.infradead.org; Sat, 23 May 2009 09:02:30 +0000
Subject: Re: [PATCH] mtd m25p80: add support for Macronix MX25L12805D
From: Artem Bityutskiy <dedekind@infradead.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
In-Reply-To: <20090520110711.GA5712@mail.wantstofly.org>
References: <20090520110711.GA5712@mail.wantstofly.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 May 2009 12:02:19 +0300
Message-Id: <1243069339.21646.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-20 at 13:07 +0200, Lennert Buytenhek wrote:
> Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 8185b1f..ce116e1 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -498,6 +498,9 @@ static struct flash_info __devinitdata m25p_data [] = {
>  	{ "at26df161a", 0x1f4601, 0, 64 * 1024, 32, SECT_4K, },
>  	{ "at26df321",  0x1f4701, 0, 64 * 1024, 64, SECT_4K, },
>  
> +	/* Macronix */
> +	{ "mx25l12805d", 0xc22018, 0, 64 * 1024, 256, },

I've taken your patch to l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
