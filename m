Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a68yo-000557-Hq
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 03:30:19 +0000
Received: by pfu207 with SMTP id 207so4608332pfu.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 19:29:57 -0800 (PST)
Date: Mon, 7 Dec 2015 19:29:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Subject: Re: [PATCH v2 04/25] mips: nand: make use of mtd_to_nand() where
 appropriate
Message-ID: <20151208032955.GS120110@google.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1448967802-25796-5-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448967802-25796-5-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Trim CC list)

Hi Ralf,

On Tue, Dec 01, 2015 at 12:03:01PM +0100, Boris Brezillon wrote:
> mtd_to_nand() was recently introduced to avoid direct accesses to the
> mtd->priv field. Update all MIPS specific implementations to use this
> helper.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  arch/mips/alchemy/devboards/db1200.c | 2 +-
>  arch/mips/alchemy/devboards/db1300.c | 2 +-
>  arch/mips/alchemy/devboards/db1550.c | 2 +-
>  arch/mips/pnx833x/common/platform.c  | 2 +-
>  arch/mips/rb532/devices.c            | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
> index 8c13675..992442a 100644
> --- a/arch/mips/alchemy/devboards/db1200.c
> +++ b/arch/mips/alchemy/devboards/db1200.c
> @@ -200,7 +200,7 @@ static struct i2c_board_info db1200_i2c_devs[] __initdata = {
>  static void au1200_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
>  				 unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd->priv;
> +	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
>  
>  	ioaddr &= 0xffffff00;
> diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
> index b580770..d3c087f 100644
> --- a/arch/mips/alchemy/devboards/db1300.c
> +++ b/arch/mips/alchemy/devboards/db1300.c
> @@ -150,7 +150,7 @@ static void __init db1300_gpio_config(void)
>  static void au1300_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
>  				 unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd->priv;
> +	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
>  
>  	ioaddr &= 0xffffff00;
> diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
> index 5740bcf..b518f02 100644
> --- a/arch/mips/alchemy/devboards/db1550.c
> +++ b/arch/mips/alchemy/devboards/db1550.c
> @@ -128,7 +128,7 @@ static struct i2c_board_info db1550_i2c_devs[] __initdata = {
>  static void au1550_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
>  				 unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd->priv;
> +	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long ioaddr = (unsigned long)this->IO_ADDR_W;
>  
>  	ioaddr &= 0xffffff00;
> diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
> index b4b774b..3cd3577 100644
> --- a/arch/mips/pnx833x/common/platform.c
> +++ b/arch/mips/pnx833x/common/platform.c
> @@ -180,7 +180,7 @@ static struct platform_device pnx833x_sata_device = {
>  static void
>  pnx833x_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd->priv;
> +	struct nand_chip *this = mtd_to_nand(mtd);
>  	unsigned long nandaddr = (unsigned long)this->IO_ADDR_W;
>  
>  	if (cmd == NAND_CMD_NONE)
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 9bd7a2d..0966adc 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -148,7 +148,7 @@ static int rb532_dev_ready(struct mtd_info *mtd)
>  
>  static void rb532_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  {
> -	struct nand_chip *chip = mtd->priv;
> +	struct nand_chip *chip = mtd_to_nand(mtd);
>  	unsigned char orbits, nandbits;
>  
>  	if (ctrl & NAND_CTRL_CHANGE) {

Acked-by: Brian Norris <computersforpeace@gmail.com>

Do you want me to queue a pull request with this patch + 1 dependent
change for you? I'm perfectly fine just taking this directly too.

Regards,
Brian
