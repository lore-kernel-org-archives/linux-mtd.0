Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0ed-0006ep-A3
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:56:08 +0000
Received: by bwz5 with SMTP id 5so2037702bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:56:05 -0800 (PST)
Subject: Re: [PATCH] mtd: Fix section mismatch on sst25l
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <fabioestevam@yahoo.com>
In-Reply-To: <843351.91050.qm@web51004.mail.re2.yahoo.com>
References: <843351.91050.qm@web51004.mail.re2.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:55:33 +0200
Message-ID: <1290786933.2552.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-12 at 08:03 -0800, Fabio Estevam wrote:
> Building the kernel with 'make CONFIG_DEBUG_SECTION_MISMATCH=y´
> 
> resulted in:
> 
> WARNING: vmlinux.o(.data+0x15938): Section mismatch in reference from
> the variable sst25l_driver to the function .init.text:sst25l_probe()
> The variable sst25l_driver references
> the function __init sst25l_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,
> 
> Fix the section mismatch.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/devices/sst25l.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
> index 684247a..925b1a9 100644
> --- a/drivers/mtd/devices/sst25l.c
> +++ b/drivers/mtd/devices/sst25l.c
> @@ -375,7 +375,7 @@ static struct flash_info *__init sst25l_match_device(struct spi_device *spi)
>  	return flash_info;
>  }
>  
> -static int __init sst25l_probe(struct spi_device *spi)
> +static int __devinit sst25l_probe(struct spi_device *spi)
>  {
>  	struct flash_info *flash_info;
>  	struct sst25l_flash *flash;

Should then sst25l_match_device be __devinit as well?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
