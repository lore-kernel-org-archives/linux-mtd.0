Received: from rv-out-0910.google.com ([209.85.198.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISGBX-0003i5-Ft
	for linux-mtd@lists.infradead.org; Mon, 03 Sep 2007 13:58:08 -0400
Received: by rv-out-0910.google.com with SMTP id c24so983131rvf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Sep 2007 10:58:00 -0700 (PDT)
Message-ID: <8bd0f97a0709031057u1f4608f6y36bd20a8f6910a32@mail.gmail.com>
Date: Mon, 3 Sep 2007 13:57:59 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: bryan.wu@analog.com
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
In-Reply-To: <1188804323.29566.6.camel@roc-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1188804323.29566.6.camel@roc-laptop>
Cc: linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/3/07, Bryan Wu <bryan.wu@analog.com> wrote:
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -131,6 +131,24 @@ config MTD_NAND_AU1550
> +config MTD_NAND_BF54X
> +       tristate "NAND Flash support for Blackfin BF54X SoC DSP"

i'd just describe it as "Blackfin on-chip NAND" rather than sticking
in exact part numbers as i imagine we can extend it down the line

> +         This enables the NAND flash controller on the BF54X SoC DPSs

"BF54X SoC DPSs" -> "BF54x SoC DSPs"

> +         No board specific support is done by this driver, each board
> +         must advertise a platform_device for the driver to attach.

should mention the module name when built as a module

> +config MTD_NAND_BF54X_HWECC
> +       bool "BF54X NAND Hardware ECC"
> +       depends on MTD_NAND_BF54X
> +       help
> +         Enable the use of the BF54X's internal ECC generator when
> +         using NAND. Early versions of the chip have had problems with
> +         incorrect ECC generation, and if using these, the default of
> +         software ECC is preferable.

rather than advertising this, i'd just keep it in the driver ...
presumably there are anomaly #'s for when the ECC is wrong, so we can
make the code depend on those
-mike
