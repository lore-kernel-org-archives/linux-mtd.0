Received: from mail-oa0-x22f.google.com ([2607:f8b0:4003:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY9oF-0003NF-9m
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 07:21:51 +0000
Received: by mail-oa0-f47.google.com with SMTP id i18so1472176oag.20
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 00:21:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52649FDA.1030804@freescale.com>
References: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
 <52649FDA.1030804@freescale.com>
Date: Mon, 21 Oct 2013 00:21:24 -0700
Message-ID: <CAN8TOE9+ez=t-1n+jd5d3tu+EB9YJKFeM2RKAHBf059L5TYM7A@mail.gmail.com>
Subject: Re: gpmi-mtd ecc regression
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Tim Harvey <tharvey@gateworks.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 20, 2013 at 8:30 PM, Huang Shijie <b32955@freescale.com> wrote:
> 于 2013年10月19日 01:03, Tim Harvey 写道:
>>
>> The patch you made to obtain ECC info from the chip
>>
>> (http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/mtd/nand/gpmi-nand?id=2febcdf84b75aae627c61f0a5bf531a69299966c)
>> has caused a regression for an i.MX6 board I'm working with that uses
>> NAND and ubifs.

...

> I am in an embarrass state now:
> [1] we can support the jffs2, when we use the set_geometry_by_ecc_info() to
> set the NAND layout.
>
> [2] if we still use the legacy_set_geometry() to set the NAND layout, we can
> not support the jffs2 for GPMI.
>
>
> When i submitted the gpmi to the kernel, the mtd code can not provide me the
> ECC info. I had to use all the OOB
> with legacy_set_geometry(). After i submitted several patches for mtd, it
> can provide us the ECC info now, so i switch
> to use the set_geometry_by_ecc_info().
>
> it's easy to fix your problem with a patch like this:
> -----------------------------------------------------------------------------------------------------------------
>
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/gpmi-nand
> index 5a1bbc7..8eeead6 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -352,7 +352,8 @@ static int legacy_set_geometry(struct gpmi_nand_data
> *this)
>
>  int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  {
> -       return set_geometry_by_ecc_info(this) ? 0 :
> legacy_set_geometry(this);
> +       return (legacy_set_geometry(this) == 0) ? 0 :
> +               set_geometry_by_ecc_info(this);
>  }
>
>  struct dma_chan *get_dma_chan(struct gpmi_nand_data *this)
>
>
> -----------------------------------------------------------------------------------------------------------------

So you really have two wholly incompatible layout methods, one which
targeted using the maximum ECC strength that fits and one which
targets the minimum required ECC strength? It seems that you can only
use a new ECC/geometry if the user prompts you to do so (via device
tree, for instance). Doing otherwise is bound to create regressions
like this.

> But after apply this patch, the gpmi may can not support the JFFS2 any more.

Well, we do prioritize "no regressions", rather than new features. So
we may have to do this until a proper solution can be formed.

Brian
