Received: from hauke-m.de ([5.39.93.123] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDfTE-00042b-L6
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 22:41:21 +0000
Subject: Re: [PATCH] mtd: nand: xway: fix build undefined MODULE_DEVICE_TABLE()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20161130225110.10759-1-hauke@hauke-m.de>
 <20161201133627.38953fb0@bbrezillon>
Cc: richard@nod.at, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 john@phrozen.org, cyrille.pitchen@atmel.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <eb0b0e63-6c77-8192-adf9-14fdf83aabba@hauke-m.de>
Date: Sun, 4 Dec 2016 23:40:56 +0100
MIME-Version: 1.0
In-Reply-To: <20161201133627.38953fb0@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/01/2016 01:36 PM, Boris Brezillon wrote:
> Hi Hauke,
> 
> On Wed, 30 Nov 2016 23:51:10 +0100
> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> 
>> The header file with the definition of MODULE_DEVICE_TABLE() was
>> missing, add include for linux/module.h to fix the problem in 4.9.
> 
> I tried to enable this driver as a module, and the build failed because
> of a missing symbol (see the following patch).
> Now, if it's not supposed to be compiled as a module, then you should
> modify the Kconfig accordingly.
> 
> Regards,
> 
> Boris
> 
> --->8---
> diff --git a/arch/mips/lantiq/xway/sysctrl.c
> b/arch/mips/lantiq/xway/sysctrl.c index 236193b5210b..29e753556597
> 100644 --- a/arch/mips/lantiq/xway/sysctrl.c
> +++ b/arch/mips/lantiq/xway/sysctrl.c
> @@ -156,6 +156,7 @@ static void __iomem *pmu_membase;
>  static void __iomem *ltq_xbar_membase;
>  void __iomem *ltq_cgu_membase;
>  void __iomem *ltq_ebu_membase;
> +EXPORT_SYMBOL(ltq_ebu_membase);
>  
>  static u32 ifccr = CGU_IFCCR;
>  static u32 pcicr = CGU_PCICR;
> 

Also module_platform_driver() needs linux/module.h, because it contains
module_init() and some more stuff.

I would like to add the include for linux/module.h and deactivate module
support. It looks like it was possible to select module building since
it was added, but it should never have worked.

Hauke
