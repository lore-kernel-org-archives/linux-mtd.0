Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIlkm-0001fJ-N5
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 22:15:29 +0000
Received: by mail-lb0-f170.google.com with SMTP id w7so41229183lbi.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 Feb 2015 14:15:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
References: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
Date: Tue, 3 Feb 2015 16:15:04 -0600
Message-ID: <CADhT+weaYA1cSQCNP98Ta0ChgxymbBbwtRikdUdcbL2pQB-TXQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
From: Dinh Nguyen <dinh.linux@gmail.com>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Content-Type: text/plain; charset=UTF-8
Cc: josh@joshtriplett.org, Linux List <linux-kernel@vger.kernel.org>,
 yamada.m@jp.panasonic.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Wed, Jan 14, 2015 at 9:38 AM,  <dinguyen@opensource.altera.com> wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
>
> The Denali Controller IP does not support sub-page writes.
>
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---
>  drivers/mtd/nand/denali.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index b3b7ca1..b16b040 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1565,6 +1565,9 @@ int denali_init(struct denali_nand_info *denali)
>         denali->nand.options |= NAND_SKIP_BBTSCAN;
>         denali->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
>
> +       /* no subpage writes on denali */
> +       denali->nand.options |= NAND_NO_SUBPAGE_WRITE;
> +
>         /*
>          * Denali Controller only support 15bit and 8bit ECC in MRST,
>          * so just let controller do 15bit ECC for MLC and 8bit ECC for
> --
> 2.2.1
>

Was wondering if you got a chance to look at this patch?

Thanks,
Dinh
