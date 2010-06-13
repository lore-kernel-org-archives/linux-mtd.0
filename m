Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONk0O-00025j-Py
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 10:01:29 +0000
Subject: Re: [PATCH] mtd: denali: add Kconfig dependency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karl Beldan <karl.beldan@gmail.com>
In-Reply-To: <1276338313-12224-1-git-send-email-karl.beldan@gmail.com>
References: <1276338313-12224-1-git-send-email-karl.beldan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 12:57:26 +0300
Message-ID: <1276423046.19028.212.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-06-12 at 12:25 +0200, Karl Beldan wrote:
> Signed-off-by: Karl Beldan <karl.beldan@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index ffc3720..8fe82c8 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -61,6 +61,7 @@ config MTD_NAND_DENALI
>  config MTD_NAND_DENALI_SCRATCH_REG_ADDR
>          hex "Denali NAND size scratch register address"
>          default "0xFF108018"
> +        depends on MTD_NAND_DENALI
>          help
>            Some platforms place the NAND chip size in a scratch register
>            because (some versions of) the driver aren't able to automatically

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
