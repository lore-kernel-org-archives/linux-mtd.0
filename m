Received: from hs-out-0708.google.com ([64.233.178.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRAof-0003By-9u
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 18:34:13 +0000
Received: by hs-out-0708.google.com with SMTP id 55so2649504hsc.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Feb 2008 10:34:12 -0800 (PST)
Message-ID: <97a0a9ac0802181034w6f31ac3dj36b18ea409b8f988@mail.gmail.com>
Date: Mon, 18 Feb 2008 11:34:11 -0700
From: "Gordon Farquharson" <gordonfarquharson@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] [NOR] Add support for the ST M29W400DB flash chip.
In-Reply-To: <97a0a9ac0801082035r2dacab1cu40a6bfc4e7fedb1a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <97a0a9ac0801082035r2dacab1cu40a6bfc4e7fedb1a@mail.gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Thayne Harbaugh <tharbaugh@lnxi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I submitted this patch to the list at the beginning of January in the
hope that it would be included in 2.6.25. I know that the merge window
for 2.6.25 is closed, but is it still possible to get this into
2.6.25? It is not a significant change. This chip is used in the GLAN
Tank NAS.

Thanks.

Gordon

On Jan 8, 2008 9:35 PM, Gordon Farquharson <gordonfarquharson@gmail.com> wrote:
> Add support for the ST M29W400DB flash chip.
>
> Signed-off-by: Gordon Farquharson <gordonfarquharson@gmail.com>
>
> ---
>
> diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
> index 6405938..0b4f481 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -135,6 +135,7 @@
>  #define M29W160DT      0x22C4
>  #define M29W160DB      0x2249
>  #define M29W040B       0x00E3
> +#define M29W400DB      0x00EF
>  #define M50FW040       0x002C
>  #define M50FW080       0x002D
>  #define M50FW016       0x002E
> @@ -1498,7 +1499,22 @@ static const struct amd_flash_info jedec_table[] = {
>                 .regions        = {
>                         ERASEINFO(0x10000,8),
>                 }
> -        }, {
> +       }, {
> +               .mfr_id         = MANUFACTURER_ST,
> +               .dev_id         = M29W400DB,
> +               .name           = "ST M29W400DB",
> +               .devtypes       = CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
> +               .uaddr          = MTD_UADDR_0x0555_0x02AA,
> +               .dev_size       = SIZE_512KiB,
> +               .cmd_set        = P_ID_AMD_STD,
> +               .nr_regions     = 4,
> +               .regions        = {
> +                       ERASEINFO(0x04000,1),
> +                       ERASEINFO(0x02000,2),
> +                       ERASEINFO(0x08000,1),
> +                       ERASEINFO(0x10000,7)
> +               }
> +       }, {
>                 .mfr_id         = MANUFACTURER_ST,
>                 .dev_id         = M50FW040,
>                 .name           = "ST M50FW040",
>

-- 
Gordon Farquharson
GnuPG Key ID: 32D6D676
