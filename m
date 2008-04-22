Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <47BABA0C.8070500@gmail.com>
References: <47BABA0C.8070500@gmail.com>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 19:40:53 +0100
Message-Id: <1208889653.9212.641.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2008-02-19 at 12:14 +0100, Richard Genoud wrote:
> This is a patch to use the hardware ECC controller of
> the AT91SAM9260 and AT91SAM9263 for the AT91 nand.
> On AT91 NAND, there's now a choice between ECC soft,
> ECC hard or no ECC (for debug).
> 
> It has been tested on AT91SAM9263 with 8 bits large
> and small page NAND.
> 
> 
> kernel version : 2.6.25-rc2
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>


patching file arch/arm/mach-at91/at91sam9260_devices.c
Hunk #1 FAILED at 288.
1 out of 1 hunk FAILED -- saving rejects to file arch/arm/mach-at91/at91sam9260_devices.c.rej
patching file arch/arm/mach-at91/at91sam9263_devices.c
Hunk #1 FAILED at 358.
1 out of 1 hunk FAILED -- saving rejects to file arch/arm/mach-at91/at91sam9263_devices.c.rej
patching file drivers/mtd/nand/Kconfig
Hunk #1 succeeded at 278 with fuzz 2.
patching file drivers/mtd/nand/at91_nand.c
Hunk #3 succeeded at 139 with fuzz 2.
Hunk #11 FAILED at 584.
1 out of 11 hunks FAILED -- saving rejects to file drivers/mtd/nand/at91_nand.c.rej
patching file include/asm-arm/arch-at91/at91_ecc.h
Hunk #1 FAILED at 13.
1 out of 1 hunk FAILED -- saving rejects to file include/asm-arm/arch-at91/at91_ecc.h.rej
patching file include/asm-arm/arch-at91/at91sam9260.h
patching file include/asm-arm/arch-at91/at91sam9263.h

-- 
dwmw2
