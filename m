Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkviu-0005ko-OT
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 12:57:10 +0000
Date: Mon, 25 Nov 2013 09:56:48 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: auto-detection of NAND bus-width from ONFI
 param or nand_id[]
Message-ID: <20131125125647.GF2408@localhost>
References: <1385382728-7913-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1385382728-7913-1-git-send-email-pekon@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 balbi@ti.com, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

Thanks for taking care of this! :-)

On Mon, Nov 25, 2013 at 06:02:08PM +0530, Pekon Gupta wrote:
> This patch is alternative implementation for following commit which introduced
> NAND_BUSWIDTH_AUTO for detection of bus-width during device probe
>    commit 64b37b2a63eb2f80b65c7185f0013f8ffc637ae3
>    Author:     Matthieu CASTET <matthieu.castet@parrot.com>
>    AuthorDate: 2012-11-06
> 
> As NAND device is identified only during nand_scan_ident(), so this patch 
> assumes that NAND driver may un-initialized or partially congigured while
> calling nand_scan_ident(). Hence, this patch does following:
> 
> (1) Temporarily configures 'bus-width=x8' mode before reading ONFI parameters,
>  (as required by ONFI spec Refer[*]), and then reverts to original bus-width.
>  This allows nand_flash_detect_onfi() to read ONFI paramers page even if
>  bus-width was un-initialized or incorrectly configured.
> 
> (2) reconfigures driver with correct bus-width determined by:
>  - either by reading ONFI param OR
>  - as found in nand_flash_id[] table
>  So, any driver-specific callback overrides should be done post nand_scan_ident.
> 
> This patch removes any dependency on either 'DT binding' or 'platform data' to
> for determining NAND device bus-width.
> 
> [*] Reference: ONFI spec version 3.1 (section 3.5.3. Target Initialization)
>     "The Read ID and Read Parameter Page commands only use the lower 8-bits
>      of the data bus. The host shall not issue commands that use a word
>      data width on x16 devices until the host determines the device supports
>      a 16-bit data bus width in the parameter page."
> 
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/nand/nand_base.c | 43 ++++++++++++++++++-------------------------
>  include/linux/mtd/nand.h     |  7 -------
>  2 files changed, 18 insertions(+), 32 deletions(-)
> 
[..]
> +
> +	/* re-configure driver is bus-width was incorrectly configured */
> +	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
> +		pr_warn("reconfiguring NAND bus width to %d instead %d bit\n",
> +			   busw ? 16 : 8,
> +			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
> +		chip->options = (chip->options & ~NAND_BUSWIDTH_16) | busw;

Looking at this makes me wonder why are we *re* configuring, instead of
just configuring. I mean, why do we keep the NAND_BUSWIDTH_16 setting?

What use case might need the user to set it, before hand?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
