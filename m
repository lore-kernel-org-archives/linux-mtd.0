Message-ID: <492AA1B4.9030803@nokia.com>
Date: Mon, 24 Nov 2008 14:44:36 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Please fix or remove OMAP2 onenand driver
References: <20081123165011.GB17438@flint.arm.linux.org.uk>
	<492A91E1.50305@nokia.com>
	<20081124120153.GA5330@flint.arm.linux.org.uk>
In-Reply-To: <20081124120153.GA5330@flint.arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Russell King - ARM Linux wrote:
> On Mon, Nov 24, 2008 at 01:37:05PM +0200, Adrian Hunter wrote:
>> From: Adrian Hunter <ext-adrian.hunter@nokia.com>
>> Date: Mon, 24 Nov 2008 13:34:53 +0200
>> Subject: [PATCH] MTD: OMAP: OneNAND: header file relocation
>>
>> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> 
> Thanks.  Only two comments (see below).
> 
>> ---
>> drivers/mtd/onenand/omap2.c |   12 ++++++------
>> 1 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
>> index e39b21d..28034ef 100644
>> --- a/drivers/mtd/onenand/omap2.c
>> +++ b/drivers/mtd/onenand/omap2.c
>> @@ -35,16 +35,16 @@
>>
>> #include <asm/io.h>
> 
> Should be linux/io.h and should be with the other linux/ includes.
> 
>> #include <asm/mach/flash.h>
>> -#include <asm/arch/gpmc.h>
>> -#include <asm/arch/onenand.h>
>> -#include <asm/arch/gpio.h>
>> -#include <asm/arch/pm.h>
>> +#include <mach/gpmc.h>
>> +#include <mach/onenand.h>
>> +#include <mach/gpio.h>
>> +#include <mach/pm.h>
>>
>> #include <linux/dma-mapping.h>
>> #include <asm/dma-mapping.h>
> 
> asm/dma-mapping.h should not be included - only linux/dma-mapping.h, and
> that should be up with the other linux/ includes.
> 
>> -#include <asm/arch/dma.h>
>> +#include <mach/dma.h>
>>
>> -#include <asm/arch/board.h>
>> +#include <mach/board.h>
>>
>> #define DRIVER_NAME "omap2-onenand"
>>
>> -- 
>> 1.5.4.3
> 

From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Mon, 24 Nov 2008 13:34:53 +0200
Subject: [PATCH] MTD: OMAP: OneNAND: header file relocation

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/omap2.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index e39b21d..a7e4d98 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -32,19 +32,18 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
 
-#include <asm/io.h>
 #include <asm/mach/flash.h>
-#include <asm/arch/gpmc.h>
-#include <asm/arch/onenand.h>
-#include <asm/arch/gpio.h>
-#include <asm/arch/pm.h>
+#include <mach/gpmc.h>
+#include <mach/onenand.h>
+#include <mach/gpio.h>
+#include <mach/pm.h>
 
-#include <linux/dma-mapping.h>
-#include <asm/dma-mapping.h>
-#include <asm/arch/dma.h>
+#include <mach/dma.h>
 
-#include <asm/arch/board.h>
+#include <mach/board.h>
 
 #define DRIVER_NAME "omap2-onenand"
 
-- 
1.5.4.3
