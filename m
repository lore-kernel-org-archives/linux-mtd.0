From: Afzal Mohammed <afzal@ti.com>
To: Tony Lindgren <tony@atomide.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 01/14] ARM: OMAP2+: gpmc: annotate exit sections properly
Date: Mon, 8 Oct 2012 11:06:43 +0530
Message-ID: <a517afd9ed3be069b475caae791156b9c4663849.1349672877.git.afzal@ti.com>
In-Reply-To: <cover.1349672877.git.afzal@ti.com>
References: <cover.1349672877.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Paul Walmsley <paul@pwsan.com>, Afzal Mohammed <afzal@ti.com>,
 linux-mtd@lists.infradead.org, Jon Hunter <jon-hunter@ti.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, linux-omap@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

compiler complained,
`gpmc_remove' referenced in section `.data' of arch/arm/mach-omap2/built-in.o: defined in discarded section `.exit.text' of arch/arm/mach-omap2/built-in.o

Annotate gpmc_remove function and dependents with __devexit.

Reported-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/gpmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index 2cbdcb9..163458d 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -886,7 +886,7 @@ static int gpmc_setup_irq(void)
 	return request_irq(gpmc_irq, gpmc_handle_irq, 0, "gpmc", NULL);
 }
 
-static __exit int gpmc_free_irq(void)
+static __devexit int gpmc_free_irq(void)
 {
 	int i;
 
@@ -992,7 +992,7 @@ static __devinit int gpmc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static __exit int gpmc_remove(struct platform_device *pdev)
+static __devexit int gpmc_remove(struct platform_device *pdev)
 {
 	gpmc_free_irq();
 	gpmc_mem_exit();
-- 
1.7.12
