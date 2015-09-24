Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfCxc-0007Eo-PL
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 20:17:45 +0000
Received: from mail-la0-f54.google.com ([209.85.215.54]:34654)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZfCxD-001MMI-T1
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 16:17:21 -0400
Received: by lacdq2 with SMTP id dq2so21440474lac.1
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2015 13:17:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1441137435-52862-4-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-4-git-send-email-computersforpeace@gmail.com>
Date: Fri, 25 Sep 2015 01:47:18 +0530
Message-ID: <CAD6G_RTpucYCnbNxnTs1xionz4pYukAmvys6x45EjYc=n7PNFw@mail.gmail.com>
Subject: Re: [PATCH 03/10] mtd: spi-nor: add SPI NOR manufacturer IDs
From: Jagan Teki <jteki@openedev.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2 September 2015 at 01:27, Brian Norris <computersforpeace@gmail.com> wrote:
> These are often similar for CFI (parallel NOR) and for SPI NOR, but they
> aren't always the same, for various reasons (different namespaces,
> company acquisitions and renames, etc.). And some don't have CFI_MFR_*
> entries at all.
>
> So let's make a proper place to list the SPI NOR IDs, with all the SPI
> NOR specific assumptions and comments.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  include/linux/mtd/spi-nor.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 321a055bc266..8558793cc0f7 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -11,6 +11,21 @@
>  #define __LINUX_MTD_SPI_NOR_H
>
>  #include <linux/bitops.h>
> +#include <linux/mtd/cfi.h>
> +
> +/*
> + * Manufacturer IDs
> + *
> + * The first byte returned from the flash after sending opcode SPINOR_OP_RDID.
> + * Sometimes these are the same as CFI IDs, but sometimes they aren't.
> + */
> +#define SNOR_MFR_ATMEL         CFI_MFR_ATMEL
> +#define SNOR_MFR_INTEL         CFI_MFR_INTEL
> +#define SNOR_MFR_MICRON                CFI_MFR_ST /* ST Micro <--> Micron */
> +#define SNOR_MFR_MACRONIX      CFI_MFR_MACRONIX
> +#define SNOR_MFR_SPANSION      CFI_MFR_AMD
> +#define SNOR_MFR_SST           CFI_MFR_SST
> +#define SNOR_MFR_WINBOND       0xef

Ideally company names same but looks like winbond is the only diff as
of now, why can't we define WIN and re-use the same from CFI?

>
>  /*
>   * Note on opcode nomenclature: some opcodes have a format like
> --
> 2.5.0.457.gab17608

thanks!
-- 
Jagan | openedev.
