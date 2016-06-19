From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "wens@csie.org" <wens@csie.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20160619193717.GE26668@lukather>
References: <20160619161435.50404-1-icenowy@aosc.xyz>
 <20160619161435.50404-2-icenowy@aosc.xyz> <20160619193717.GE26668@lukather>
Subject: Re: [PATCH v5 2/2] mtd: nand: sunxi: add reset line support
MIME-Version: 1.0
Message-Id: <3496441466376852@web3g.yandex.ru>
Date: Mon, 20 Jun 2016 06:54:12 +0800
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You're right. This is a copy-n-paste error from the original sunxi-mmc.c file,
which get all the clocks and resets before using them.

20.06.2016, 03:37, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> On Mon, Jun 20, 2016 at 12:14:35AM +0800, Icenowy Zheng wrote:
>>  The NAND controller on some sun8i chips needs its reset line to be
>>  deasserted before they can enter working state.
>>
>>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>>  ---
>>  Changes in v2:
>>    - Corrected the error checking code of reset line.
>>
>>  Changes in v3:
>>    - Corrected a more serious error brought in the "fix" of v2.
>>
>>  Changes in v4:
>>    - Removed unneeded code block after "else".
>>
>>  Changes in v5:
>>    - Added reassertion code in case of initialization error and device
>>      remove.
>>
>>   drivers/mtd/nand/sunxi_nand.c | 27 ++++++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
>>  diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
>>  index a83a690..3b40186 100644
>>  --- a/drivers/mtd/nand/sunxi_nand.c
>>  +++ b/drivers/mtd/nand/sunxi_nand.c
>>  @@ -39,6 +39,7 @@
>>   #include <linux/gpio.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/iopoll.h>
>>  +#include <linux/reset.h>
>>
>>   #define NFC_REG_CTL 0x0000
>>   #define NFC_REG_ST 0x0004
>>  @@ -269,6 +270,7 @@ struct sunxi_nfc {
>>           void __iomem *regs;
>>           struct clk *ahb_clk;
>>           struct clk *mod_clk;
>>  + struct reset_control *reset;
>>           unsigned long assigned_cs;
>>           unsigned long clk_rate;
>>           struct list_head chips;
>>  @@ -1871,26 +1873,41 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>>           if (ret)
>>                   goto out_ahb_clk_unprepare;
>>
>>  + nfc->reset = devm_reset_control_get_optional(dev, "ahb");
>>  +
>>  + if (!IS_ERR(nfc->reset)) {
>>  + ret = reset_control_deassert(nfc->reset);
>>  + if (ret) {
>>  + dev_err(dev, "reset err %d\n", ret);
>>  + goto out_mod_clk_unprepare;
>>  + }
>>  + } else if (PTR_ERR(nfc->reset) != -ENOENT) {
>>  + return PTR_ERR(nfc->reset);
>
> You're leaking all the resources here. Please use a goto.
>
> Thanks,
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
