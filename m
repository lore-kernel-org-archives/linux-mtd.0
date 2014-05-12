Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjv0G-0006lt-Js
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 18:31:09 +0000
Received: by mail-pa0-f44.google.com with SMTP id ld10so9257354pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 11:30:47 -0700 (PDT)
Date: Mon, 12 May 2014 11:30:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Subject: Re: [PATCH v3] mtd: lpddr: add driver for LPDDR2-NVM PCM memories
Message-ID: <20140512183044.GK28907@ld-irv-0074>
References: <1399670397-2247-1-git-send-email-vincenzo.aliberti@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1399670397-2247-1-git-send-email-vincenzo.aliberti@gmail.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vincenzo,

On Fri, May 09, 2014 at 11:19:57PM +0200, Vincenzo Aliberti wrote:
> MTD: LPDDR: Add Driver for LPDDR2-NVM PCM memories
> 
> Signed-off-by: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> 
> ---
> Changes in v3:
> 	- BusWidth no longer passed as argument: PCM devices available as x32
> 	- Partitions no longer defined in the driver
> 	- Added a remove callback

OK, so you handled a lot of my requests. But you're still missing some
error handling and a few other things. Rather than go through this whole
patch again, I just made my own changes. Can you please review and test
my diff, appended below?

>  drivers/mtd/lpddr/Kconfig      |   12 +-
>  drivers/mtd/lpddr/Makefile     |    1 +
>  drivers/mtd/lpddr/lpddr2_nvm.c |  515 ++++++++++++++++++++++++++++++++++++++++
>  include/uapi/mtd/mtd-abi.h     |    1 +
>  4 files changed, 527 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mtd/lpddr/lpddr2_nvm.c
[snip]

diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
index 4ab9adb515eb..4e76f889c9c6 100644
--- a/drivers/mtd/lpddr/lpddr2_nvm.c
+++ b/drivers/mtd/lpddr/lpddr2_nvm.c
@@ -17,10 +17,6 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": %s: " fmt, __func__
@@ -35,7 +31,6 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/ioport.h>
-#include <linux/sched.h>
 
 /* Parameters */
 #define ERASE_BLOCKSIZE			(0x00020000/2)	/* in Word */
@@ -419,17 +414,15 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 {
 	struct map_info *map;
 	struct mtd_info *mtd;
-	struct resource *add_range = platform_get_resource(pdev,
-						IORESOURCE_MEM, 0);
-	struct resource *control_regs = platform_get_resource(pdev,
-						IORESOURCE_MEM, 1);
+	struct resource *add_range;
+	struct resource *control_regs;
 	struct pcm_int_data *pcm_data;
 
 	/* Allocate memory control_regs data structures */
 	pcm_data = devm_kzalloc(&pdev->dev, sizeof(*pcm_data), GFP_KERNEL);
 	if (!pcm_data)
 		return -ENOMEM;
-	pcm_data->ctl_regs = devm_ioremap_resource(&pdev->dev, control_regs);
+
 	pcm_data->bus_width = BUS_WIDTH;
 
 	/* Allocate memory for map_info & mtd_info data structures */
@@ -441,34 +434,35 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 	if (!mtd)
 		return -ENOMEM;
 
-	/* Reserve lpddr2_nvm address range */
-	if (devm_request_mem_region(&pdev->dev, add_range->start,
-		resource_size(add_range), "lpddr2_nvm") == NULL) {
-		pr_err("Unable to reserve address range\n");
-		return -EBUSY;
-	}
+	/* lpddr2_nvm address range */
+	add_range = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	/* Populate map_info data structure */
 	*map = (struct map_info) {
-		.virt		= devm_ioremap_nocache(&pdev->dev,
-				add_range->start, (add_range->end -
-				add_range->start + 1)),
+		.virt		= devm_ioremap_resource(&pdev->dev, add_range),
 		.name		= pdev->dev.init_name,
 		.phys		= add_range->start,
-		.size		= add_range->end - add_range->start + 1,
-		.bankwidth	= pcm_data->bus_width/2,
+		.size		= resource_size(add_range),
+		.bankwidth	= pcm_data->bus_width / 2,
 		.pfow_base	= OW_BASE_ADDRESS,
 		.fldrv_priv	= pcm_data,
 	};
+	if (IS_ERR(map->virt))
+		return PTR_ERR(map->virt);
 
 	simple_map_init(map);	/* fill with default methods */
 
+	control_regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	pcm_data->ctl_regs = devm_ioremap_resource(&pdev->dev, control_regs);
+	if (IS_ERR(pcm_data->ctl_regs))
+		return PTR_ERR(pcm_data->ctl_regs);
+
 	/* Populate mtd_info data structure */
 	*mtd = (struct mtd_info) {
 		.name		= pdev->dev.init_name,
 		.type		= MTD_RAM,
 		.priv		= map,
-		.size		= add_range->end - add_range->start + 1,
+		.size		= resource_size(add_range),
 		.erasesize	= ERASE_BLOCKSIZE * pcm_data->bus_width,
 		.writesize	= 1,
 		.writebufsize	= WRITE_BUFFSIZE * pcm_data->bus_width,
@@ -494,10 +488,7 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
  */
 static int lpddr2_nvm_remove(struct platform_device *pdev)
 {
-	/* Unregister the MTD device */
-	mtd_device_unregister(dev_get_drvdata(&pdev->dev));
-
-	return 0;
+	return mtd_device_unregister(dev_get_drvdata(&pdev->dev));
 }
 
 /* Initialize platform_driver data structure for lpddr2_nvm */
