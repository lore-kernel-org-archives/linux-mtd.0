Received: from mail-oa0-x231.google.com ([2607:f8b0:4003:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRRR8-0003Ou-3d
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 18:46:16 +0000
Received: by mail-oa0-f49.google.com with SMTP id i4so1209265oah.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 11:45:52 -0700 (PDT)
Date: Wed, 2 Oct 2013 11:45:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH] Staging: MTD: Micron SPINAND Driver support
Message-ID: <20131002184547.GR23337@ld-irv-0074.broadcom.com>
References: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
 <1380620038-25643-1-git-send-email-kamlakant.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380620038-25643-1-git-send-email-kamlakant.patel@broadcom.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-mtd@lists.infradead.org, manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 01, 2013 at 03:03:58PM +0530, Kamlakant Patel wrote:
> This patch adds support for Micron SPINAND via MTD.
> 
> Signed-off-by: Mona Anonuevo <manonuevo@micron.com>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> ---
> This patch has to be merged via staging tree.
>   
> This is a driver from Micron for MT29F1G01ZACH4 SPI based NAND chips. This driver had
> been posted multiple times to the mtd list.
> 1. http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html
> 2. http://lists.infradead.org/pipermail/linux-mtd/2010-April/029523.html
> 3. patchwork.ozlabs.org/patch/258697/
> This has not been merged into the main kernel yet.
> 
> I have cleaned and updated it for current kernel. Since there are many users for
> this driver, it may be useful to add it to the staging tree, where further fixes and
> cleanups can be done. Once it reaches to the standard will be moved to the mtd.
> 
> This driver has been tested with Micron SPINAND MT29F1G01ZACH4 chip on kernel 3.12 on
> the Netlogic XLP platforms.
>  
> Mona Anonuevo, I have retained your sign-offs from the original patch.
> 
> v1:
> * Added MTD_SPINAND_MT29F and MTD_NAND dependencies to avoid build errors.
> * Some more code cleanup.
> 
>  drivers/staging/Kconfig                       |   2 +
>  drivers/staging/Makefile                      |   1 +
>  drivers/staging/mt29f_spinand/Kconfig         |  16 +
>  drivers/staging/mt29f_spinand/Makefile        |   1 +
>  drivers/staging/mt29f_spinand/TODO            |  13 +
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 962 ++++++++++++++++++++++++++
>  drivers/staging/mt29f_spinand/mt29f_spinand.h | 107 +++
>  7 files changed, 1102 insertions(+)
>  create mode 100644 drivers/staging/mt29f_spinand/Kconfig
>  create mode 100644 drivers/staging/mt29f_spinand/Makefile
>  create mode 100644 drivers/staging/mt29f_spinand/TODO
>  create mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.c
>  create mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.h

...

> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> new file mode 100644
> index 0000000..8e95a57
> --- /dev/null
> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
> @@ -0,0 +1,962 @@

...

> +#define MAX_WAIT_JIFFIES  (40 * HZ)
> +static int wait_till_ready(struct spi_device *spi_nand)
> +{
> +	unsigned long deadline;
> +	int retval;
> +	u8 stat = 0;
> +
> +	deadline = jiffies + MAX_WAIT_JIFFIES;
> +	do {
> +		retval = spinand_read_status(spi_nand, &stat);
> +		if (retval < 0)
> +			return -1;

You might want to look at using proper error codes here.

> +		else if (!(stat & 0x1))
> +			break;
> +
> +		cond_resched();
> +	} while (!time_after_eq(jiffies, deadline));
> +
> +	if ((stat & 0x1) == 0)
> +		return 0;
> +
> +	return -1;

Same.

> +}

...

> +static int spinand_wait(struct mtd_info *mtd, struct nand_chip *chip)
> +{
> +	struct spinand_info *info = (struct spinand_info *)chip->priv;
> +
> +	unsigned long timeo = jiffies;
> +	int retval, state = chip->state;
> +	u8 status;
> +
> +	if (state == FL_ERASING)
> +		timeo += (HZ * 400) / 1000;
> +	else
> +		timeo += (HZ * 20) / 1000;

msecs_to_jiffies()?

> +
> +	while (time_before(jiffies, timeo)) {
> +		retval = spinand_read_status(info->spi, &status);
> +		if ((status & STATUS_OIP_MASK) == STATUS_READY)
> +			return 0;
> +
> +		cond_resched();
> +	}
> +	return 0;
> +}
> +

You can address these comments in follow up patches after it's included
in staging, though. There's probably more review needed anyway
eventually (I see that no one really has reviewed this on the MTD
mailing list yet).

Brian
