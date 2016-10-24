Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bynZZ-0006o0-Qg
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 22:18:26 +0000
Subject: Re: [PATCH v3 5/9] mtd: m25p80: add support of dual and quad spi
 protocols to all commands
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
 <20bbf1848567ce25c5ab58b1bf1a710c44fec2ac.1477325128.git.cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-kernel@vger.kernel.org
From: Marek Vasut <marex@denx.de>
Message-ID: <73101e7a-379f-f6a6-58b0-94966c821be4@denx.de>
Date: Tue, 25 Oct 2016 00:15:02 +0200
MIME-Version: 1.0
In-Reply-To: <20bbf1848567ce25c5ab58b1bf1a710c44fec2ac.1477325128.git.cyrille.pitchen@atmel.com>
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

On 10/24/2016 06:34 PM, Cyrille Pitchen wrote:
> Before this patch, m25p80_read() supported few SPI protocols:
> - regular SPI 1-1-1
> - SPI Dual Output 1-1-2
> - SPI Quad Output 1-1-4
> On the other hand, all other m25p80_*() hooks only supported SPI 1-1-1.
> 
> This patch adds support to all currently existing SPI protocols to
> cover as many protocols as possible.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  drivers/mtd/devices/m25p80.c | 193 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 149 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index f0a55c01406b..38778eac6c21 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -27,22 +27,64 @@
>  #include <linux/spi/flash.h>
>  #include <linux/mtd/spi-nor.h>
>  
> -#define	MAX_CMD_SIZE		6
> +#define	MAX_CMD_SIZE		16
>  struct m25p {
>  	struct spi_device	*spi;
>  	struct spi_nor		spi_nor;
>  	u8			command[MAX_CMD_SIZE];
>  };
>  
> +static inline int m25p80_proto2nbits(enum spi_nor_protocol proto,

This can be void , since it's always returning zero.

> +				     unsigned *code_nbits,
> +				     unsigned *addr_nbits,
> +				     unsigned *data_nbits)
> +{
> +	if (code_nbits)
> +		*code_nbits = SNOR_PROTO_CODE_FROM_PROTO(proto);
> +	if (addr_nbits)
> +		*addr_nbits = SNOR_PROTO_ADDR_FROM_PROTO(proto);
> +	if (data_nbits)
> +		*data_nbits = SNOR_PROTO_DATA_FROM_PROTO(proto);
> +
> +	return 0;
> +}
> +
[...]


-- 
Best regards,
Marek Vasut
