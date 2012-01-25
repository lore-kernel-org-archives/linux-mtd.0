From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] arm: da830: move NAND and NOR devices as aemif MFD
 slaves
Date: Wed, 25 Jan 2012 15:55:56 +0530
Message-ID: <1327487156-10238-3-git-send-email-prakash.pm@ti.com>
In-Reply-To: <1327487156-10238-1-git-send-email-prakash.pm@ti.com>
References: <1327487156-10238-1-git-send-email-prakash.pm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: davinci-linux-open-source@linux.davincidsp.com,
 Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>,
 Sekhar Nori <nsekhar@ti.com>, "Manjunathappa, Prakash" <prakash.pm@ti.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND and NOR device are made as aemif devices slave, hence device
registration achieved via aemif MFD driver.

Signed-off-by: Manjunathappa, Prakash <prakash.pm@ti.com>
---
Since v1:
Patch is generated using -M option.

 arch/arm/mach-davinci/board-da830-evm.c |   31 +++++++++++++++++++++++--------
 1 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 0b43554..0ad3662 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -396,14 +396,29 @@ static struct resource da830_evm_nand_resources[] = {
 	},
 };
 
-static struct platform_device da830_evm_nand_device = {
-	.name		= "davinci_nand",
-	.id		= 1,
-	.dev		= {
-		.platform_data	= &da830_evm_nand_pdata,
+static struct platform_device da830_evm_devices[] __initdata = {
+	{
+		.name		= "davinci_nand",
+		.id		= 1,
+		.dev		= {
+			.platform_data	= &da830_evm_nand_pdata,
+		},
+		.num_resources	= ARRAY_SIZE(da830_evm_nand_resources),
+		.resource	= da830_evm_nand_resources,
+	},
+};
+
+static struct davinci_aemif_devices da830_emif_devices = {
+	.devices	= da830_evm_devices,
+	.num_devices	= ARRAY_SIZE(da830_evm_devices),
+};
+
+static struct platform_device davinci_emif_device = {
+	.name	= "davinci_aemif",
+	.id	= -1,
+	.dev	= {
+		.platform_data	= &da830_emif_devices,
 	},
-	.num_resources	= ARRAY_SIZE(da830_evm_nand_resources),
-	.resource	= da830_evm_nand_resources,
 };
 
 static inline void da830_evm_init_nand(int mux_mode)
@@ -422,7 +437,7 @@ static inline void da830_evm_init_nand(int mux_mode)
 		pr_warning("da830_evm_init: emif25 mux setup failed: %d\n",
 				ret);
 
-	ret = platform_device_register(&da830_evm_nand_device);
+	ret = platform_device_register(&davinci_emif_device);
 	if (ret)
 		pr_warning("da830_evm_init: NAND device not registered.\n");
 
-- 
1.7.1
