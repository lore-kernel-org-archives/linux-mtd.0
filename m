Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUJKv-0004hS-LX
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 15:06:54 +0000
From: "Mohammed, Afzal" <afzal@ti.com>
To: "tony@atomide.com" <tony@atomide.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "artem.bityutskiy@linux.intel.com"
 <artem.bityutskiy@linux.intel.com>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 1/3] ARM: OMAP2+: gpmc: Modify interrupt handling
Date: Tue, 15 May 2012 15:06:43 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98C879@DBDE01.ent.ti.com>
References: <cover.1337090835.git.afzal@ti.com>
 <d193f1d968843c2580006bf3cde51f951de13892.1337090835.git.afzal@ti.com>
In-Reply-To: <d193f1d968843c2580006bf3cde51f951de13892.1337090835.git.afzal@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tony,

On Tue, May 15, 2012 at 20:08:34, Mohammed, Afzal wrote:
> Modify interrupt handling such that interrupts can be handled by GPMC
> client drivers using standard interrupt APIs rather than requiring
> the drivers to have knowledge about GPMC interrupt handling. Currently
> only NAND related interrupts has been considered (which is the case
> even without this change) as the only user of GPMC interrupt is NAND.

:

> -	ret =3D request_irq(gpmc_irq, gpmc_handle_irq, IRQF_SHARED, "gpmc", NUL=
L);

If this series could not be considered for 3.5, to prevent failure of
request_irq, either,

355f8ee  ARM: OMAP2+: GPMC: resolve type-conversion warning from sparse,

should be avoided, or diff [1] would be required, as shared irq needs dev-i=
d.

Regards
Afzal

[1]
diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index 46b09da..9e1b726 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -768,7 +768,7 @@ static int __init gpmc_init(void)
                irq++;
        }

-       ret =3D request_irq(gpmc_irq, gpmc_handle_irq, IRQF_SHARED, "gpmc",=
 NULL);
+       ret =3D request_irq(gpmc_irq, gpmc_handle_irq, 0, "gpmc", NULL);
        if (ret)
                pr_err("gpmc: irq-%d could not claim: err %d\n",
                                                gpmc_irq, ret);
