Received: from na3sys009aog123.obsmtp.com ([74.125.149.149])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoEcQ-0004K7-81
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 13:02:48 +0000
Received: by mail-fx0-f44.google.com with SMTP id 6so6545373fxe.31
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 06:02:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
References: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
Date: Tue, 2 Aug 2011 09:02:39 -0400
Message-ID: <CAPcSpELvskFmRxEyBcZVGOqW8nKthk-1AbLXG4c4pUs_XQ2xmA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: davinci: Add cpufreq support
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sudhakar,

On Thu, Jul 21, 2011 at 5:39 AM, Rajashekhara, Sudhakar
<sudhakar.raj@ti.com> wrote:
> This patch adds cpufreq support for NAND driver. During cpufreq
> transition, 'davinci_aemif_setup_timing()' function will be called
> to reconfigure that AEMIF timings for the new frequency.

I can see that this will work fine for dacinci_nand -- and it is a
welcomed feature also -- thank you for the effort to push this
upstream.

Seeing this support added directly to davinci_nand driver made me
think -- now this driver has another reference to platform-specific
functions in arch/arm/mach-davinci/aemif.c. Recently the c6x project
pushed a fix to remove references to a platform specific include. Not
that you are re-introducing this include but in a more general sense:
perhaps the features/functions of the AEMIF _bus_ should be removed
from the davinci_nand driver?

As for an in-tree driver example: how would support for cpufreq
transitions be added to the UI-board's NOR device which is currently
using "physmap-flash" driver?

> Tested on TI DA850/OMAP-L138 EVM.
>
> Signed-off-by: Rajashekhara, Sudhakar <sudhakar.raj@ti.com>
> ---
> =A0drivers/mtd/nand/davinci_nand.c | =A0 54 +++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 54 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_n=
and.c
> index 1f34951..7e764af 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -33,6 +33,7 @@
> =A0#include <linux/mtd/nand.h>
> =A0#include <linux/mtd/partitions.h>
> =A0#include <linux/slab.h>
> +#include <linux/cpufreq.h>
>
> =A0#include <mach/nand.h>
> =A0#include <mach/aemif.h>
> @@ -74,6 +75,9 @@ struct davinci_nand_info {
> =A0 =A0 =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0core_chipsel;
>
> =A0 =A0 =A0 =A0struct davinci_aemif_timing =A0 =A0 *timing;
> +#ifdef CONFIG_CPU_FREQ
> + =A0 =A0 =A0 struct notifier_block =A0 freq_transition;
> +#endif
> =A0};
>
> =A0static DEFINE_SPINLOCK(davinci_nand_lock);
> @@ -519,6 +523,47 @@ static struct nand_ecclayout hwecc4_2048 __initconst=
 =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> +#ifdef CONFIG_CPU_FREQ
> +static int nand_davinci_cpufreq_transition(struct notifier_block *nb,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long val, void *data)
> +{
> + =A0 =A0 =A0 struct davinci_nand_info *info;
> +
> + =A0 =A0 =A0 info =3D container_of(nb, struct davinci_nand_info, freq_tr=
ansition);
> +
> + =A0 =A0 =A0 if (val =3D=3D CPUFREQ_POSTCHANGE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 davinci_aemif_setup_timing(info->timing, in=
fo->base,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->core_=
chipsel);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static inline int nand_davinci_cpufreq_register(struct davinci_nand_info=
 *info)
> +{
> + =A0 =A0 =A0 info->freq_transition.notifier_call =3D nand_davinci_cpufre=
q_transition;
> +
> + =A0 =A0 =A0 return cpufreq_register_notifier(&info->freq_transition,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CPUFREQ_TRANSITION_NOTIFIER=
);
> +}
> +
> +static inline void nand_davinci_cpufreq_deregister(struct davinci_nand_i=
nfo
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *info)
> +{
> + =A0 =A0 =A0 cpufreq_unregister_notifier(&info->freq_transition,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CPUFREQ_TRANSITION_NOTIFIER=
);
> +}
> +#else
> +static inline int nand_davinci_cpufreq_register(struct davinci_nand_info=
 *info)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static inline void nand_davinci_cpufreq_deregister(struct davinci_nand_i=
nfo
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *info)
> +{
> +}
> +#endif
> +
> =A0static int __init nand_davinci_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct davinci_nand_pdata =A0 =A0 =A0 *pdata =3D pdev->dev=
.platform_data;
> @@ -782,12 +827,19 @@ syndrome_done:
> =A0 =A0 =A0 =A0if (ret < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_scan;
>
> + =A0 =A0 =A0 ret =3D nand_davinci_cpufreq_register(info);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "failed to register cpu=
freq\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_cpu_freq_fail;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0val =3D davinci_nand_readl(info, NRCSR_OFFSET);
> =A0 =A0 =A0 =A0dev_info(&pdev->dev, "controller rev. %d.%d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 (val >> 8) & 0xff, val & 0xff);
>
> =A0 =A0 =A0 =A0return 0;
>
> +err_cpu_freq_fail:
> =A0err_scan:
> =A0err_timing:
> =A0 =A0 =A0 =A0clk_disable(info->clk);
> @@ -818,6 +870,8 @@ static int __exit nand_davinci_remove(struct platform=
_device *pdev)
> =A0 =A0 =A0 =A0struct davinci_nand_info *info =3D platform_get_drvdata(pd=
ev);
> =A0 =A0 =A0 =A0int status;
>
> + =A0 =A0 =A0 nand_davinci_cpufreq_deregister(info);
> +
> =A0 =A0 =A0 =A0status =3D mtd_device_unregister(&info->mtd);
>
> =A0 =A0 =A0 =A0spin_lock_irq(&davinci_nand_lock);
> --
> 1.7.1
>
> _______________________________________________
> Davinci-linux-open-source mailing list
> Davinci-linux-open-source@linux.davincidsp.com
> http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
>



--=20
Best Regards,
Ben Gardiner

---
Nanometrics Inc.
+1 (613) 592-6776 x239
http://www.nanometrics.ca
