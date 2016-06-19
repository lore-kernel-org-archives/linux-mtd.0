Received: from forward1m.cmail.yandex.net ([2a02:6b8:b030::18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEcVc-0002hI-0w
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 13:11:30 +0000
From: icenowy@aosc.xyz
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 "wens@csie.org" <wens@csie.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20160619145303.0bdf59ea@bbrezillon>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
 <20160619113739.30362-2-icenowy@aosc.xyz>
 <20160619140652.07ab03c9@bbrezillon>
 <2686901466340069@web27g.yandex.ru> <20160619145303.0bdf59ea@bbrezillon>
Subject: Re: [PATCH 2/2] mtd: nand: sunxi: add reset line support
MIME-Version: 1.0
Message-Id: <2748041466341860@web7m.yandex.ru>
Date: Sun, 19 Jun 2016 21:11:00 +0800
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

Then I will soon make the v2 patch set, with the error detection part fixed.

But why does sunxi-mmc check only EPROBE_DEFER?

19.06.2016, 20:53, "Boris Brezillon" <boris.brezillon@free-electrons.com>:
> On Sun, 19 Jun 2016 20:41:09 +0800
> icenowy@aosc.xyz wrote:
>
>>  To be honest, I copied them from sunxi-mmc.c.
>>
>>  What function should be chosen better?
>
> You did the right thing (except for the error detection part). My
> question was addressed to Philipp (the reset subsystem maintainer).
>
>>  19.06.2016, 20:06, "Boris Brezillon" <boris.brezillon@free-electrons.com>:
>>  > +Philipp
>>  >
>>  > On Sun, 19 Jun 2016 19:37:39 +0800
>>  > Icenowy Zheng <icenowy@aosc.xyz> wrote:
>>  >
>>  >>  The NAND controller on some sun8i chips needs its reset line to be deasserted
>>  >>  before they can enter working state. This commit added the reset line process
>>  >>  to the driver.
>>  >>
>>  >>  Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>>  >>  ---
>>  >>   drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
>>  >>   1 file changed, 14 insertions(+)
>>  >>
>>  >>  diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
>>  >>  index a83a690..1502748 100644
>>  >>  --- a/drivers/mtd/nand/sunxi_nand.c
>>  >>  +++ b/drivers/mtd/nand/sunxi_nand.c
>>  >>  @@ -39,6 +39,7 @@
>>  >>   #include <linux/gpio.h>
>>  >>   #include <linux/interrupt.h>
>>  >>   #include <linux/iopoll.h>
>>  >>  +#include <linux/reset.h>
>>  >>
>>  >>   #define NFC_REG_CTL 0x0000
>>  >>   #define NFC_REG_ST 0x0004
>>  >>  @@ -269,6 +270,7 @@ struct sunxi_nfc {
>>  >>           void __iomem *regs;
>>  >>           struct clk *ahb_clk;
>>  >>           struct clk *mod_clk;
>>  >>  + struct reset_control *reset;
>>  >>           unsigned long assigned_cs;
>>  >>           unsigned long clk_rate;
>>  >>           struct list_head chips;
>>  >>  @@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
>>  >>           if (ret)
>>  >>                   goto out_ahb_clk_unprepare;
>>  >>
>>  >>  + nfc->reset = devm_reset_control_get_optional(dev, "ahb");
>>  >>  + if (PTR_ERR(nfc->reset) == -EPROBE_DEFER)
>>  >>  + return PTR_ERR(nfc->reset);
>>  >
>>  > Actually you should test for != -ENOENT, because all error codes except
>>  > this one should stop the ->probe().
>>  >
>>  > BTW, this devm_reset_control_get_optional() is really weird. While most
>>  > _optional() methods return NULL when the element is not defined in the
>>  > DT, this one returns -ENOTENT, which makes it impossible to
>>  > differentiate a real error from a undefined reset line (which is a
>>  > valid case for _optional()).
>>  >
>>  > Philipp, is there a good reason for doing that?
>>  >
>>  >>  +
>>  >>  + if (!IS_ERR(nfc->reset)) {
>>  >>  + ret = reset_control_deassert(nfc->reset);
>>  >>  + if (ret) {
>>  >>  + dev_err(dev, "reset err %d\n", ret);
>>  >>  + goto out_mod_clk_unprepare;
>>  >>  + }
>>  >>  + }
>>  >>  +
