Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fi4OS-00084X-V0
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 20:58:54 +0000
Date: Tue, 24 Jul 2018 22:58:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: John Crispin <john@phrozen.org>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] mtd: nand: add Winbond manufacturer and chip
Message-ID: <20180724225840.685d49d5@bbrezillon>
In-Reply-To: <20180724140914.15986-1-john@phrozen.org>
References: <20180724140914.15986-1-john@phrozen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

On Tue, 24 Jul 2018 16:09:14 +0200
John Crispin <john@phrozen.org> wrote:

> From: Christian Lamparter <chunkeey@gmail.com>
> 
> This patch adds the W25N01GV NAND to the table of
> known devices. Without this patch the device gets detected:
> 
> nand: device found, Manufacturer ID: 0xef, Chip ID: 0xaa
> nand: Unknown NAND 256MiB 1,8V 8-bit
> nand: 256 MiB, SLC, erase size: 64 KiB, page size: 1024, OOB size : 16

Nice try! You're trying to add support for a SPI NAND in a subsystem
that is supposed to only deal with parallel/raw NANDs :-). I guess
you're using the MT29F driver that lies in staging (or a modified
version of this driver).

> 
> Whereas the u-boot identifies it as:
> spi_nand: spi_nand_flash_probe SF NAND ID 00:ef:aa:21
> SF: Detected W25N01GV with page size 2 KiB, total 128 MiB

I'm also surprised you made it work in u-boot using the spi-flash
layer, which, AFAIR, is only supporting SPI NORs.

> 
> Due to the page size discrepancy, it's impossible to attach
> ubi volumes on the device.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/mtd/nand/raw/nand_ids.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
> index 5423c3bb388e..1610e1cb6bfc 100644
> --- a/drivers/mtd/nand/raw/nand_ids.c
> +++ b/drivers/mtd/nand/raw/nand_ids.c
> @@ -54,6 +54,10 @@ struct nand_flash_dev nand_flash_ids[] = {
>  		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
>  		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
>  		  NAND_ECC_INFO(40, SZ_1K), 4 },
> +	{"W25N01GV 1G 3.3V 8-bit",
> +		{ .id = {0xef, 0xaa} },
> +		  SZ_2K, SZ_128, SZ_128K, NAND_NO_SUBPAGE_WRITE,
> +		  2, 64, NAND_ECC_INFO(1, SZ_512) },
>  

So, obviously that's a nack on this change, but you're lucky, we just
added the SPI NAND framework, so you should be able to add an entry
here [1].

>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),

Regards,

Boris

[1]http://git.infradead.org/linux-mtd.git/blob/refs/heads/nand/next:/drivers/mtd/nand/spi/winbond.c#l77
