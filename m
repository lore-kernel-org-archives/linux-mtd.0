Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyQLN-0004ZA-3u
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2018 23:07:03 +0000
Received: by mail-wr0-x242.google.com with SMTP id s18so3379137wrg.9
 for <linux-mtd@lists.infradead.org>; Tue, 20 Mar 2018 16:06:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180301133941.19660-3-joakim.tjernlund@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <20180301133941.19660-3-joakim.tjernlund@infinera.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 21 Mar 2018 00:06:48 +0100
Message-ID: <CAFLxGvx9ZC6P9iYtODnvGi=qnE1Z9zNtdbo6fRAFBSpdsLzV8g@mail.gmail.com>
Subject: Re: [PATCH 2/3] cfi_cmdset_0001: Workaround Micron Erase suspend bug.
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 stable <stable@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim,

On Thu, Mar 1, 2018 at 2:39 PM, Joakim Tjernlund
<joakim.tjernlund@infinera.com> wrote:
> From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
>
> Some Micron chips does not work well wrt Erase suspend for
> boot blocks. This avoids the issue by not allowing Erase suspend
> for the boot blocks for the 28F00AP30(1GBit) chip.

Is this bug documented somewhere?

> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index b59872304ae7..64ae65dab877 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -45,6 +45,7 @@
>  #define I82802AB       0x00ad
>  #define I82802AC       0x00ac
>  #define PF38F4476      0x881c
> +#define M28F00AP30     0x8963
>  /* STMicroelectronics chips */
>  #define M50LPW080       0x002F
>  #define M50FLW080A     0x0080
> @@ -375,6 +376,17 @@ static void cfi_fixup_major_minor(struct cfi_private *cfi,
>                 extp->MinorVersion = '1';
>  }
>
> +static int cfi_is_micron_28F00AP30(struct cfi_private *cfi, struct flchip *chip)
> +{
> +       /*
> +        * Micron(was Numonyx) 1Gbit bottom boot are buggy w.r.t
> +        * Erase Supend for their small Erase Blocks(0x8000)
> +        */
> +       if (cfi->mfr == CFI_MFR_INTEL && cfi->id == M28F00AP30)
> +               return 1;
> +       return 0;
> +}
> +
>  static inline struct cfi_pri_intelext *
>  read_pri_intelext(struct map_info *map, __u16 adr)
>  {
> @@ -854,6 +866,11 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long
>                     chip->in_progress_block_addr)
>                         goto sleep;
>
> +               /* do not suspend small EBs, buggy Micron Chips */
> +               if (cfi_is_micron_28F00AP30(cfi, chip) &&
> +                   (chip->in_progress_block_mask == ~(0x8000-1)))
> +                       goto sleep;
> +
>                 /* Erase suspend */
>                 map_write(map, CMD(0xB0), chip->in_progress_block_addr);
>
> --
> 2.13.6
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
