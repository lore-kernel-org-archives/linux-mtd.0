Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9RYP-00047e-CH
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 02:10:53 +0000
Message-ID: <504806A0.6030804@freescale.com>
Date: Thu, 6 Sep 2012 10:12:48 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi-nand: Improve logging style
References: <1346851653-28117-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1346851653-28117-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: marex@denx.de, artem.bityutskiy@linux.intel.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA09=D4=C205=C8=D5 21:27, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Improve logging style by prefixing the pr_ messages with "gpmi_nand".
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index c46be6c..9493507 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -18,6 +18,9 @@
>   * with this program; if not, write to the Free Software Foundation, I=
nc.,
>   * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/clk.h>
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
> @@ -114,7 +117,7 @@ int common_nfc_set_geometry(struct gpmi_nand_data *=
this)
>  	/* We use the same ECC strength for all chunks. */
>  	geo->ecc_strength =3D get_ecc_strength(this);
>  	if (!geo->ecc_strength) {
> -		pr_err("We get a wrong ECC strength.\n");
> +		pr_err("wrong ECC strength.\n");
>  		return -EINVAL;
>  	}
> =20
> @@ -1685,9 +1688,9 @@ static int __init gpmi_nand_init(void)
> =20
>  	err =3D platform_driver_register(&gpmi_nand_driver);
>  	if (err =3D=3D 0)
> -		printk(KERN_INFO "GPMI NAND driver registered. (IMX)\n");
> +		pr_info("driver registered.\n");
>  	else
> -		pr_err("i.MX GPMI NAND driver registration failed\n");
> +		pr_err("driver registration failed.\n");
>  	return err;
>  }
> =20
thanks.

Acked-by: Huang Shijie <b32955@freescale.com>

Huang Shijie
