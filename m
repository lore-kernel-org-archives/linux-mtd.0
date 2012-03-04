MIME-Version: 1.0
In-Reply-To: <1330807232-5616-1-git-send-email-shijie8@gmail.com>
References: <1330807232-5616-1-git-send-email-shijie8@gmail.com>
Date: Sat, 3 Mar 2012 20:11:18 -0500
Message-ID: <CAMiH66E9Hr5oeNCk1cAQJKO-qtc8a=mHxNgDGgGwXC95XWhGMQ@mail.gmail.com>
Subject: Re: [PATCH] mtd/gpmi : move the __mxs_setl()/__mxs_clrl() to
 gpmi-lib.c
From: Huang Shijie <shijie8@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

please ignore this patch.

mxs-dma and some other module also have the same problem.
A more powerful patch is needed.

BR
Huang Shijie


On Sat, Mar 3, 2012 at 3:40 PM, Huang Shijie <shijie8@gmail.com> wrote:
> We will meet the compiler error in mx6q, since there is no mxs.h header a=
nymore.
> So move these two helper functions to gpmi-lib.c.
>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> ---
> =C2=A0drivers/mtd/nand/gpmi-nand/gpmi-lib.c | =C2=A0 14 +++++++++++++-
> =C2=A01 files changed, 13 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 5e3c505..9a208cb 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -21,7 +21,6 @@
> =C2=A0#include <linux/mtd/gpmi-nand.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/clk.h>
> -#include <mach/mxs.h>
>
> =C2=A0#include "gpmi-nand.h"
> =C2=A0#include "gpmi-regs.h"
> @@ -37,6 +36,19 @@ struct timing_threshod timing_default_threshold =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_dll_delay_in_ns =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 16,
> =C2=A0};
>
> +#define MXS_SET_ADDR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4
> +#define MXS_CLR_ADDR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x8
> +
> +static inline void __mxs_setl(u32 mask, void __iomem *reg)
> +{
> + =C2=A0 =C2=A0 =C2=A0 writel(mask, reg + MXS_SET_ADDR);
> +}
> +
> +static inline void __mxs_clrl(u32 mask, void __iomem *reg)
> +{
> + =C2=A0 =C2=A0 =C2=A0 writel(mask, reg + MXS_CLR_ADDR);
> +}
> +
> =C2=A0/*
> =C2=A0* Clear the bit and poll it cleared. =C2=A0This is usually called w=
ith
> =C2=A0* a reset address and mask being either SFTRST(bit 31) or CLKGATE
> --
> 1.7.4
>
