Date: Tue, 23 Sep 2014 14:07:24 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <1931039891.303225.1411499244022.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1106241329.302591.1411499010840.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH] mtd: bfin-async-flash: Remove unused variable
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net,
 Steven Miao <realmz6@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Avoid the following compile warning:

drivers/mtd/maps/bfin-async-flash.c: In function 'bfin_flash_probe':
drivers/mtd/maps/bfin-async-flash.c:129: warning: unused variable 'ret'

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/maps/bfin-async-flash.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 6ea51e5..41730fe 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -126,7 +126,6 @@ static const char * const part_probe_types[] = {
 
 static int bfin_flash_probe(struct platform_device *pdev)
 {
-	int ret;
 	struct physmap_flash_data *pdata = dev_get_platdata(&pdev->dev);
 	struct resource *memory = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	struct resource *flash_ambctl = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-- 
1.9.1
