Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM2lv-0002Qs-PC
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 00:39:00 +0000
Received: by mail-pa0-x241.google.com with SMTP id dx3so10431067pab.2
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 17:38:39 -0700 (PDT)
Date: Sat, 9 Jul 2016 17:38:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-cris-kernel@axis.com
Subject: Re: [PATCH] mtd: Remove unused symbol CONFIG_MTDRAM_ABS_POS
Message-ID: <20160710003835.GA29572@localhost>
References: <20160603000627.GN7555@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160603000627.GN7555@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 03, 2016 at 01:06:27AM +0100, Ben Hutchings wrote:
> This has been unused, except as the condition for a fatal error, since
> commit c13cbf3b5086 ("[MTD] mtdram: Quick cleanup of the driver:") in
> 2.6.13 (!).
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  arch/cris/arch-v10/drivers/axisflashmap.c |  2 +-
>  drivers/mtd/devices/Kconfig               | 12 ------------
>  2 files changed, 1 insertion(+), 13 deletions(-)

You missed a usage in arch/cris/arch-v32/drivers/axisflashmap.c. Applied
with the following diff:

diff --git a/arch/cris/arch-v32/drivers/axisflashmap.c b/arch/cris/arch-v32/drivers/axisflashmap.c
index bd10d3ba0949..87656c41fec7 100644
--- a/arch/cris/arch-v32/drivers/axisflashmap.c
+++ b/arch/cris/arch-v32/drivers/axisflashmap.c
@@ -320,7 +320,7 @@ static int __init init_axis_flash(void)
 	 * but its size must be configured as 0 so as not to conflict
 	 * with our usage.
 	 */
-#if !defined(CONFIG_MTD_MTDRAM) || (CONFIG_MTDRAM_TOTAL_SIZE != 0) || (CONFIG_MTDRAM_ABS_POS != 0)
+#if !defined(CONFIG_MTD_MTDRAM) || (CONFIG_MTDRAM_TOTAL_SIZE != 0)
 	if (!romfs_in_flash && !nand_boot) {
 		printk(KERN_EMERG "axisflashmap: Cannot create an MTD RAM "
 		       "device; configure CONFIG_MTD_MTDRAM with size = 0!\n");
