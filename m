Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3aX1-0007vm-TY
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 00:10:00 +0000
From: Marek Vasut <marex@denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: m25p80: Use OPCODE_QUAD_READ_4B for 4-byte addressing
Date: Thu, 16 Jan 2014 01:09:34 +0100
References: <1389800935-6468-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1389800935-6468-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201401160109.34499.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, January 15, 2014 at 04:48:55 PM, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> 
> commit 3487a63955c34ea508bcf4ca5131ddd953876e2d ("drivers: mtd: m25p80: add
> quad read support") in -next added both the 3-byte OPCODE_QUAD_READ and the
> 4-byte OPCODE_QUAD_READ_4B, but incorrectly uses OPCODE_QUAD_READ for both
> 3-byte and 4-byte addressing.
> 
> Use OPCODE_QUAD_READ_4B in the 4-byte case to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

Looks all right.

Acked-by: Marek Vasut <marex@denx.de>

> ---
>  drivers/mtd/devices/m25p80.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index bf358326c335..0e9e78acc677 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -1258,7 +1258,7 @@ pr_info("jid = 0x%p\n", jid);
>  			/* Dedicated 4-byte command set */
>  			switch (flash->flash_read) {
>  			case M25P80_QUAD:
> -				flash->read_opcode = OPCODE_QUAD_READ;
> +				flash->read_opcode = OPCODE_QUAD_READ_4B;
>  				break;
>  			case M25P80_FAST:
>  				flash->read_opcode = OPCODE_FAST_READ_4B;

Best regards,
Marek Vasut
