Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMWkU-00054X-HZ
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 05:25:55 +0000
Received: by mail-pb0-f49.google.com with SMTP id xb4so7934348pbc.22
 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2013 22:25:32 -0700 (PDT)
Date: Wed, 18 Sep 2013 22:25:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Fix 4 byte addressing mode for Micron
 devices.
Message-ID: <20130919052526.GB31275@brian-ubuntu>
References: <20130917014706.GL4550@ld-irv-0074.broadcom.com>
 <1379440103-5167-1-git-send-email-eliedebrauwer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1379440103-5167-1-git-send-email-eliedebrauwer@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 17, 2013 at 07:48:22PM +0200, Elie De Brauwer wrote:
> According to the datasheet for Micron n25q256a (N25Q256A13ESF40F) 4-byte
> addressing mode should be entered as follows:
> 
> <quote>
> To enter or exit the 4-byte address mode, the WRITE ENABLE command
> must be executed to set the write enable latch bit to 1. (Note: The
> WRITE ENABLE command must NOT be executed on the N25Q256A83ESF40x and
> N25Q256A83E1240x devices.) S# must be driven LOW. The effect of the
> command is immediate; after the command has been executed, the write
> enable latch bit is cleared to 0.
> </quote>
> 
> Micron's portable way to perform this for all types of Micron flash
> is to first issue a write enable, then switch the addressing mode
> followed by a write disable to avoid leaving the flash in a write-
> able state.

I just noticed, you're missing a

  "Signed-off-by: Your Name <your@email.com>"

If you reply with a line like that, I can past it into the commit.

> ---
>  drivers/mtd/devices/m25p80.c |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 26b14f9..272d483 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -169,8 +169,16 @@ static inline int write_disable(struct m25p *flash)
>  static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
>  {
>  	switch (JEDEC_MFR(jedec_id)) {
> -	case CFI_MFR_MACRONIX:
>  	case CFI_MFR_ST: /* Micron, actually */
> +	{
> +		int status;
> +		write_enable(flash);
> +		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
> +		status = spi_write(flash->spi, flash->command, 1);
> +		write_disable(flash);
> +		return status;
> +	}
> +	case CFI_MFR_MACRONIX:
>  	case 0xEF /* winbond */:
>  		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
>  		return spi_write(flash->spi, flash->command, 1);

I personally don't like the code duplication from the Macronix and
Winbond cases, and the extra context braces may not be needed. How about
the following? If it's OK, I'll just squash your description and my
patch.

Brian

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 26b14f9..6bc9618 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -168,12 +168,25 @@ static inline int write_disable(struct m25p *flash)
  */
 static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
 {
+	int status;
+	bool need_wren = false;
+
 	switch (JEDEC_MFR(jedec_id)) {
-	case CFI_MFR_MACRONIX:
 	case CFI_MFR_ST: /* Micron, actually */
+		/* Some Micron need WREN command; all will accept it */
+		need_wren = true;
+	case CFI_MFR_MACRONIX:
 	case 0xEF /* winbond */:
+		if (need_wren)
+			write_enable(flash);
+
 		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
-		return spi_write(flash->spi, flash->command, 1);
+		status = spi_write(flash->spi, flash->command, 1);
+
+		if (need_wren)
+			write_disable(flash);
+
+		return status;
 	default:
 		/* Spansion style */
 		flash->command[0] = OPCODE_BRWR;
