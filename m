Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b4qQt-0003Jw-Uv
 for linux-mtd@lists.infradead.org; Mon, 23 May 2016 14:02:12 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: disable software protection for
 Macronix flash at startup
To: Matthias Schiffer <mschiffer@universe-factory.net>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: Felix Fietkau <nbd@nbd.name>
Message-ID: <57430D4C.3010000@atmel.com>
Date: Mon, 23 May 2016 16:01:48 +0200
MIME-Version: 1.0
In-Reply-To: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthias,

Le 18/05/2016 15:32, Matthias Schiffer a écrit :
> This patch has been tested in OpenWrt for a few months and seems to work
> correctly.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 157841d..d681003 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1304,6 +1304,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
>  
>  	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
>  	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
> +	    JEDEC_MFR(info) == SNOR_MFR_MACRONIX ||
>  	    JEDEC_MFR(info) == SNOR_MFR_SST ||
>  	    info->flags & SPI_NOR_HAS_LOCK) {
>  		write_enable(nor);
> 
The line following this patch chunk is "write_sr(nor, 0);" however, if I refer
to the Macronix mx25l25673g datasheet about the Status Register, bits[5:2]
(BP0, BP1, BP2 and BP3) are non-volatile and define the protected area.
Also bit6 (Quad Enable) is also non-volatile and is used to reassign #WP and
#Hold pins to IO2 and IO3 functions needed by Quad SPI protocols on many other
Macronix memories (indeed on the 73g part, the Quad Enable bit is always 1).

So you should not write 0 directly into the Status Register if you only want to
clear bit7 (Status Register Write Disable): use a read, modify, write sequence
instead.


Best regards,

Cyrille
