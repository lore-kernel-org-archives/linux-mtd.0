Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a68qA-0007t8-Ej
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 03:21:25 +0000
Received: by pacwq6 with SMTP id wq6so4464779pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 19:21:01 -0800 (PST)
Date: Mon, 7 Dec 2015 19:20:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Steven Miao <realmz6@gmail.com>
Cc: adi-buildroot-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 02/25] blackfin: nand: make use of mtd_to_nand() where
 appropriate
Message-ID: <20151208032059.GQ120110@google.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1448967802-25796-3-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448967802-25796-3-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Reducing CC, since adi-buildroot-devel@lists.sourceforge.net doesn't
like that many...)

Hi Steven,

On Tue, Dec 01, 2015 at 12:02:59PM +0100, Boris Brezillon wrote:
> mtd_to_nand() was recently introduced to avoid direct accesses to the
> mtd->priv field. Update all blackfin specific implementations to use
> this helper.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  arch/blackfin/mach-bf537/boards/stamp.c   | 2 +-
>  arch/blackfin/mach-bf561/boards/acvilon.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/blackfin/mach-bf537/boards/stamp.c b/arch/blackfin/mach-bf537/boards/stamp.c
> index 88a19fc..c181543 100644
> --- a/arch/blackfin/mach-bf537/boards/stamp.c
> +++ b/arch/blackfin/mach-bf537/boards/stamp.c
> @@ -404,7 +404,7 @@ static struct mtd_partition bfin_plat_nand_partitions[] = {
>  #define BFIN_NAND_PLAT_ALE 1
>  static void bfin_plat_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd->priv;
> +	struct nand_chip *this = mtd_to_nand(mtd);
>  
>  	if (cmd == NAND_CMD_NONE)
>  		return;
> diff --git a/arch/blackfin/mach-bf561/boards/acvilon.c b/arch/blackfin/mach-bf561/boards/acvilon.c
> index 6ab9515..37f8f25 100644
> --- a/arch/blackfin/mach-bf561/boards/acvilon.c
> +++ b/arch/blackfin/mach-bf561/boards/acvilon.c
> @@ -267,7 +267,7 @@ static struct mtd_partition bfin_plat_nand_partitions[] = {
>  static void bfin_plat_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
>  				    unsigned int ctrl)
>  {
> -	struct nand_chip *this = mtd->priv;
> +	struct nand_chip *this = mtd_to_nand(mtd);
>  
>  	if (cmd == NAND_CMD_NONE)
>  		return;

FWIW:

Acked-by: Brian Norris <computersforpeace@gmail.com>

What would you like done with this? I can just take it via MTD, since
it's pretty small. Or I can queue up this and 1 dependent change as a
pull request for you.

Regards,
Brian
