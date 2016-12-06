Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEL7D-00021F-Kq
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 19:09:28 +0000
Received: by mail-wj0-x244.google.com with SMTP id kp2so45650634wjc.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 11:09:02 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: spi-nor: improve macronix_quad_enable()
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <5b7ad2367d9b6a4e3a766ce6cadf16c313a03a26.1481039788.git.cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5962912d-b5de-f0d0-077b-af3b9ff2a77c@gmail.com>
Date: Tue, 6 Dec 2016 20:01:03 +0100
MIME-Version: 1.0
In-Reply-To: <5b7ad2367d9b6a4e3a766ce6cadf16c313a03a26.1481039788.git.cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/06/2016 05:01 PM, Cyrille Pitchen wrote:
> The patch checks whether the Quad Enable bit is already set in the Status
> Register. If so, the function exits immediately with a successful return
> code.

Performance optimization I presume ?

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Reviewed-by: Jagan Teki <jagan@openedev.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index da7cd69d4857..1fd32b991eb7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1216,6 +1216,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	val = read_sr(nor);
>  	if (val < 0)
>  		return val;
> +	if (val & SR_QUAD_EN_MX)
> +		return 0;
> +
>  	write_enable(nor);
>  
>  	write_sr(nor, val | SR_QUAD_EN_MX);
> 


-- 
Best regards,
Marek Vasut
