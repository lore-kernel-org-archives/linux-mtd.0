Received: from ik-out-1112.google.com ([66.249.90.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jogzi-0007kW-TZ
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 15:34:51 +0000
Received: by ik-out-1112.google.com with SMTP id c29so624033ika.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 08:34:49 -0700 (PDT)
Message-ID: <80b317760804230237n188bd989oc28a5ed60e615d88@mail.gmail.com>
Date: Wed, 23 Apr 2008 11:37:51 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
In-Reply-To: <1208889653.9212.641.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47BABA0C.8070500@gmail.com>
	<1208889653.9212.641.camel@pmac.infradead.org>
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> patching file arch/arm/mach-at91/at91sam9260_devices.c
>  Hunk #1 FAILED at 288.
>  1 out of 1 hunk FAILED -- saving rejects to file arch/arm/mach-at91/at91sam9260_devices.c.rej
>  patching file arch/arm/mach-at91/at91sam9263_devices.c
>  Hunk #1 FAILED at 358.
>  1 out of 1 hunk FAILED -- saving rejects to file arch/arm/mach-at91/at91sam9263_devices.c.rej
>  patching file drivers/mtd/nand/Kconfig
>  Hunk #1 succeeded at 278 with fuzz 2.
>  patching file drivers/mtd/nand/at91_nand.c
>  Hunk #3 succeeded at 139 with fuzz 2.
>  Hunk #11 FAILED at 584.
>  1 out of 11 hunks FAILED -- saving rejects to file drivers/mtd/nand/at91_nand.c.rej
>  patching file include/asm-arm/arch-at91/at91_ecc.h
>  Hunk #1 FAILED at 13.
>  1 out of 1 hunk FAILED -- saving rejects to file include/asm-arm/arch-at91/at91_ecc.h.rej
>  patching file include/asm-arm/arch-at91/at91sam9260.h
>  patching file include/asm-arm/arch-at91/at91sam9263.h
>  --
>  dwmw2

I don't know what kernel you use, but I'm getting no error with this
patch on kernel 2.6.25-rc2 (and on 2.6.25 it's also ok) that I've
downloaded from kernel.org:

~/dev/kernels/linux-2.6.25-rc2$ patch -p1 < ../mail.google.com
patching file arch/arm/mach-at91/at91sam9260_devices.c
patching file arch/arm/mach-at91/at91sam9263_devices.c
patching file drivers/mtd/nand/Kconfig
patching file drivers/mtd/nand/at91_nand.c
patching file include/asm-arm/arch-at91/at91_ecc.h
patching file include/asm-arm/arch-at91/at91sam9260.h
patching file include/asm-arm/arch-at91/at91sam9263.h
