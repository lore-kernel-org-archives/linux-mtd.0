Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaXWh-00015F-GW
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 23:14:40 +0000
Received: by padhy16 with SMTP id hy16so86922921pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2015 16:14:19 -0700 (PDT)
Date: Fri, 11 Sep 2015 16:14:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jteki@openedev.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>,
 Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Zap unneeded write_enable from write_reg
Message-ID: <20150911231416.GK11487@google.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
 <1439978205-6092-2-git-send-email-jteki@openedev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439978205-6092-2-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Joachim

On Wed, Aug 19, 2015 at 03:26:44PM +0530, Jagan Teki wrote:
> Since write enabling shall do with buf and len without
> need of exctra write_enable argument, hence removed the
> same from write_reg.

I rewrote this description a bit.

> Signed-off-by: Jagan Teki <jteki@openedev.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Han Xu <han.xu@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c      |  3 +--
>  drivers/mtd/spi-nor/fsl-quadspi.c |  3 +--
>  drivers/mtd/spi-nor/spi-nor.c     | 16 ++++++++--------
>  include/linux/mtd/spi-nor.h       |  3 +--
>  4 files changed, 11 insertions(+), 14 deletions(-)
> 

You missed the new drivers/mtd/spi-nor/nxp-spifi.c driver:

  drivers/mtd/spi-nor/nxp-spifi.c: In function 'nxp_spifi_setup_flash':
  drivers/mtd/spi-nor/nxp-spifi.c:340:23: warning: assignment from incompatible pointer type
    spifi->nor.write_reg = nxp_spifi_write_reg;
                         ^

[...]
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index e540952..c5a58c4 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -182,8 +182,7 @@ struct spi_nor {
>  	int (*write_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
>  			  u8 *buf, size_t len);
>  	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
> -	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
> -			int write_enable);
> +	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
>  
>  	int (*read)(struct spi_nor *nor, loff_t from,
>  			size_t len, size_t *retlen, u_char *read_buf);

Squashed in the following diff and applied to l2-mtd.git/next:

diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index ce7bf6b2916b..9e82098ae644 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -149,8 +149,7 @@ static int nxp_spifi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 	return nxp_spifi_wait_for_cmd(spifi);
 }
 
-static int nxp_spifi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
-			       int len, int write_enable)
+static int nxp_spifi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	struct nxp_spifi *spifi = nor->priv;
 	u32 cmd;
