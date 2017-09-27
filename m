Subject: Re: [PATCH v3 5/5] mtd: spi-nor: cadence-quadspi: Add runtime PM
 support
To: <matthew.gerlach@linux.intel.com>
CC: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20170924105924.23923-1-vigneshr@ti.com>
 <20170924105924.23923-6-vigneshr@ti.com>
 <3a1160f9-a0ae-c84c-d209-af97c3c3b0f6@gmail.com>
 <4ee69ea4-14cc-4305-bf3f-8fe76d43bf6b@ti.com>
 <fa700cdf-f0b5-779b-4f38-3138a7612cc2@gmail.com>
 <038919d3-ff32-d0a7-4c0a-3be16436052d@ti.com>
 <e4ad5d80-9093-b667-f0a5-d3105be4e8cf@gmail.com>
 <alpine.DEB.2.20.1709251538420.2472@mgerlach-VirtualBox>
 <fdfe29bf-ff46-7542-8e36-e8e45e1ca85f@gmail.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <7237fa9e-4d3a-8a82-10c6-76737c23ed6f@ti.com>
Date: Wed, 27 Sep 2017 16:18:49 +0530
MIME-Version: 1.0
In-Reply-To: <fdfe29bf-ff46-7542-8e36-e8e45e1ca85f@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthew,

On Tuesday 26 September 2017 05:19 AM, Marek Vasut wrote:
[...]
>>>> Ok thanks! Do you know if pm_runtime_get_sync() can enable clocks for
>>>> QSPI on SoCFPGA or if clk_prepare_enable() is needed? Just trying to see
>>>> if its possible to get rid of clk_*() calls in favor of pm_*() calls.
>>>
>>> Not of the top of my head, sorry. +CC Matthew, he should know.
>>
>> I am not an expert at the clock framework nor the power management, but I
>> did ask around a bit.  No one I asked was planning to change the clk_*()
>> calls to pm_*() call, but the feedback was that it would be a good idea.
> 
> The question is, if we do the replacement, will it break on socfpga ?
> A quick test might be useful.
> 

yes, a quick qspi test with clk_prepare_enable() replaced by pm_*() calls
like below patch would be helpful:


diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 53c7d8e0327a..7ad3e176cc88 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -34,6 +34,7 @@
 #include <linux/sched.h>
 #include <linux/spi/spi.h>
 #include <linux/timer.h>
+#include <linux/pm_runtime.h>
 
 #define CQSPI_NAME                     "cadence-qspi"
 #define CQSPI_MAX_CHIPSELECT           16
@@ -1206,11 +1207,8 @@ static int cqspi_probe(struct platform_device *pdev)
                return -ENXIO;
        }
 
-       ret = clk_prepare_enable(cqspi->clk);
-       if (ret) {
-               dev_err(dev, "Cannot enable QSPI clock.\n");
-               return ret;
-       }
+       pm_runtime_enable(dev);
+       pm_runtime_get_sync(dev);
 
        cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
 
 



-- 
Regards
Vignesh
