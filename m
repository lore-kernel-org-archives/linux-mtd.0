MIME-Version: 1.0
In-Reply-To: <1286315819-5906-1-git-send-email-manjugk@ti.com>
References: <1286315819-5906-1-git-send-email-manjugk@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 7 Oct 2010 23:05:10 +0530
Message-ID: <AANLkTin-rjxxDpiN9V5CinWr4cCqH1QB=cEH+huEcxYv@mail.gmail.com>
Subject: Re: [PATCH v3] OMAP: NAND: Fix static declaration warning
To: "G, Manjunath Kondaiah" <manjugk@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 6, 2010 at 3:26 AM, G, Manjunath Kondaiah <manjugk@ti.com> wrot=
e:
> This patch fixes sparse warning for static declaration of variable "use_d=
ma"
>
> drivers/mtd/nand/omap2.c:114:11: warning: symbol 'use_dma' was not declar=
ed. Should it be static?
>
> Signed-off-by: G, Manjunath Kondaiah <manjugk@ti.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mtd@lists.infradead.org
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Nishanth Menon <nm@ti.com>
> ---
> Changes since v1:
> =A0- no logical changes, patch seperated from series based Tony's suggest=
ion.
>
> =A0drivers/mtd/nand/omap2.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 133d515..439e80d 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -111,11 +111,11 @@ static int use_dma =3D 1;
> =A0module_param(use_dma, bool, 0);
> =A0MODULE_PARM_DESC(use_dma, "enable/disable use of DMA");
> =A0#else
> -const int use_dma;
> +static const int use_dma;
> =A0#endif
> =A0#else
> =A0const int use_prefetch;
> -const int use_dma;
> +static const int use_dma;

I did not understand, why did it not pointed same error for 'const int
use_prefetch'?

--=20
Regards,
Vimal Singh
