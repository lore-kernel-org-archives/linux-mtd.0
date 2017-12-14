Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePQeV-0007ZV-VM
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 10:22:09 +0000
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add support for is25lq040b
To: <cyrille.pitchen@wedev4u.fr>
References: <20171213113530.6857-1-sean.nyekjaer@prevas.dk>
CC: <linux-mtd@lists.infradead.org>, <marek.vasut@gmail.com>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <e85d724e-a8c8-8afb-0552-e2d5fef0208f@prevas.dk>
Date: Thu, 14 Dec 2017 11:21:37 +0100
MIME-Version: 1.0
In-Reply-To: <20171213113530.6857-1-sean.nyekjaer@prevas.dk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille

On 2017-12-13 12:35, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
> v2:
>   - removed SECT_4K as the chip are supporting 32K and bulk erase
>
>   drivers/mtd/spi-nor/spi-nor.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 9178139a39d0..cc4328dff89a 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1048,6 +1048,7 @@ static const struct flash_info spi_nor_ids[] = {
>   	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>   	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024, 256,
>   			SECT_4K | SPI_NOR_DUAL_READ) },
> +	{ "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,  64, 0) },
Doh, my bad, there is only 8 blocks on the device (4Mbit not 4MB)

The device have the possibility to erase 4, 32, 64 Kbyte, or Chip Erase.
Is the SECT_4K preferred in the kernel or should i leave it off?
>   
>   	/* Macronix */
>   	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
/Sean
