Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJuHu-000114-0r
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 22:20:46 +0000
Received: by lboj14 with SMTP id j14so4981218lbo.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Apr 2012 15:20:43 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.gortmaker@gmail.com
In-Reply-To: <4F8C780D.9010702@xenotime.net>
References: <20120416161121.261ba4e7e38989173accfb16@canb.auug.org.au>
 <4F8C780D.9010702@xenotime.net>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Mon, 16 Apr 2012 18:20:12 -0400
Message-ID: <CAP=VYLr6TtABMNz1EBY2T6vYdhpR5X6S3yQTtvvqV0D7c9U5Lw@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: fix sbc2_flash build when PCI is not enabled
To: Randy Dunlap <rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tim Hockin <thockin@sun.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 16, 2012 at 3:50 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> sbc2_flash.c is a PCI driver, but its build fails when CONFIG_PCI

Minor nit -- above line and subject reference sbc2, when fail comes
from scb2 source module.

Paul.
--

> is not enabled, so make it depend on PCI.
>
> drivers/mtd/maps/scb2_flash.c:237:1: warning: data definition has no type=
 or storage class
> drivers/mtd/maps/scb2_flash.c:237:1: warning: type defaults to 'int' in d=
eclaration of 'module_pci_driver'
> drivers/mtd/maps/scb2_flash.c:237:1: warning: parameter names (without ty=
pes) in function declaration
>
> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
> Cc: =A0 =A0 David Woodhouse <dwmw2@infradead.org>
> Cc: =A0 =A0 linux-mtd@lists.infradead.org
> ---
> =A0drivers/mtd/maps/Kconfig | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20120416.orig/drivers/mtd/maps/Kconfig
> +++ linux-next-20120416/drivers/mtd/maps/Kconfig
> @@ -224,7 +224,7 @@ config MTD_CK804XROM
>
> =A0config MTD_SCB2_FLASH
> =A0 =A0 =A0 =A0tristate "BIOS flash chip on Intel SCB2 boards"
> - =A0 =A0 =A0 depends on X86 && MTD_JEDECPROBE
> + =A0 =A0 =A0 depends on X86 && MTD_JEDECPROBE && PCI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support for treating the BIOS flash chip on Intel SCB2=
 boards
> =A0 =A0 =A0 =A0 =A0as an MTD device - with this you can reprogram your BI=
OS.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
