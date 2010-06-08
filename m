Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OM2MT-0004xk-6r
	for linux-mtd@lists.infradead.org; Tue, 08 Jun 2010 17:13:14 +0000
Received: by pvg11 with SMTP id 11so1740179pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Jun 2010 10:13:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1275637205-489-1-git-send-email-s-ghorai@ti.com>
References: <s-ghorai@ti.com> <1275637205-489-1-git-send-email-s-ghorai@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 8 Jun 2010 22:42:51 +0530
Message-ID: <AANLkTinf8OcvHbLggdEJNGLvlAtSeExKri-IqNlwLpYD@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] omap3 nand: cleanup exiting platform related code
To: Sukumar Ghorai <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: tony@atomide.com, linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reviewed-by: Vimal Singh <vimal.newwork@gmail.com>

On Fri, Jun 4, 2010 at 1:10 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> =A0 The following set of patches applies on top of for-next branch.
> =A0 =A0 =A0 =A0http://git.kernel.org/?p=3Dlinux/kernel/git/tmlind/linux-o=
map-2.6.git
> =A0 Patches verified on: omap3430-SDP, omap3630-sdp, zoom3 and beagle boa=
rd
>
> =A0 And these are the patches required to address the following input -
> =A0 =A0 1. The NAND driver needs to stop tinkering with the GPMC register=
s
> =A0 =A0 =A0 =A0The omap General Purpose Memory Controller (GPMC) register=
s are omap
> =A0 =A0 =A0 =A0specific, and not driver specific. Tinkering with these re=
gisters can
> =A0 =A0 =A0 =A0cause issues with the other devices on the GPMC.
>
> =A0 =A0 2. Passing hardcoded GPMC_CS0_BASE needs to go from the board fil=
es
> =A0 =A0 =A0 =A0Passing hardcoded GPMC virtual addressess is sure way to m=
ess up things.
> =A0 =A0 =A0 =A0This should all become unnecessary once the NAND drivers s=
tops messing
> =A0 =A0 =A0 =A0with the GPMC registers directly.
> =A0 =A0 Discussion: http://www.mail-archive.com/linux-omap@vger.kernel.or=
g/msg27630.html
>
> =A0 Changes in this series -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Unused function removed.
>
> =A0Functions related to ecc and prefetch engine are optimized.
> =A0v4: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg29458.ht=
ml
>
> =A0Few functionality was missing =A0like - There should be some locking a=
s only
> =A0 one chipselect can use the ECC or prefetch engine at a time. If you h=
ave
> =A0 NAND in two chipselects, bad things would happen.
> =A0v3: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg28715.ht=
ml
>
> =A0Additionally, it was needed to implement more functions for the platfo=
rm
> =A0init code to use.
> =A0v2: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg28467.ht=
ml
>
> =A0v1: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg28164.ht=
ml
>
>
> Sukumar Ghorai (3):
> =A0 =A0 =A0 =A0omap3 gpmc: functionality enhancement
> =A0 =A0 =A0 =A0omap3 nand: cleanup virtual address usages
> =A0 =A0 =A0 =A0omap3 nand: fix issue in board file to detect nand
> =A0arch/arm/mach-omap2/board-cm-t35.c =A0 =A0 =A0 =A0 | =A0 20 +---
> =A0arch/arm/mach-omap2/board-devkit8000.c =A0 =A0 | =A0 25 +---
> =A0arch/arm/mach-omap2/board-omap3beagle.c =A0 =A0| =A0 24 +---
> =A0arch/arm/mach-omap2/board-omap3touchbook.c | =A0 25 +---
> =A0arch/arm/mach-omap2/board-overo.c =A0 =A0 =A0 =A0 =A0| =A0 24 +---
> =A0arch/arm/mach-omap2/board-sdp-flash.c =A0 =A0 =A0| =A0 =A05 -
> =A0arch/arm/mach-omap2/gpmc-nand.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 39 ++----
> =A0arch/arm/mach-omap2/gpmc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0228 ++=
+++++++++++++++++++++++---
> =A0arch/arm/plat-omap/include/plat/gpmc.h =A0 =A0 | =A0 36 ++++-
> =A0arch/arm/plat-omap/include/plat/nand.h =A0 =A0 | =A0 =A06 +-
> =A0drivers/mtd/nand/omap2.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0229 =
++++++++--------------------
> =A011 files changed, 320 insertions(+), 341 deletions(-)
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Regards,
Vimal Singh
