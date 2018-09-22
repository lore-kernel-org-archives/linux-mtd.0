MIME-Version: 1.0
References: <1537433449-65213-1-git-send-email-jianxin.pan@amlogic.com>
 <1537433449-65213-3-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1537433449-65213-3-git-send-email-jianxin.pan@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Sep 2018 17:32:46 +0200
Message-ID: <CAFBinCAaphyifUNyDQr7th2Mt=A+UQnzai0edKLCPNbxhh2w+Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: rawnand: meson: add support for Amlogic NAND
 flash controller
To: jianxin.pan@amlogic.com
Cc: boris.brezillon@bootlin.com, linux-mtd@lists.infradead.org,
 liang.yang@amlogic.com, yixun.lan@amlogic.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 jbrunet@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 carlo@caione.org,
 khilman@baylibre.com, robh@kernel.org, jian.hu@amlogic.com,
 hanjie.lin@amlogic.com, victor.wan@amlogic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Sep 20, 2018 at 10:51 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
[snip]
> +static int meson_nfc_clk_init(struct meson_nfc *nfc)
> +{
> +       int ret;
> +
> +       /* request core clock */
> +       nfc->core_clk = devm_clk_get(nfc->dev, "core");
> +       if (IS_ERR(nfc->core_clk)) {
> +               dev_err(nfc->dev, "failed to get core clk\n");
> +               return PTR_ERR(nfc->core_clk);
> +       }
> +
> +       nfc->device_clk = devm_clk_get(nfc->dev, "device");
> +       if (IS_ERR(nfc->device_clk)) {
> +               dev_err(nfc->dev, "failed to get device clk\n");
> +               return PTR_ERR(nfc->device_clk);
> +       }
> +
> +       nfc->phase_tx = devm_clk_get(nfc->dev, "tx");
> +       if (IS_ERR(nfc->phase_tx)) {
> +               dev_err(nfc->dev, "failed to get tx clk\n");
> +               return PTR_ERR(nfc->phase_tx);
> +       }
> +
> +       nfc->phase_rx = devm_clk_get(nfc->dev, "rx");
> +       if (IS_ERR(nfc->phase_rx)) {
> +               dev_err(nfc->dev, "failed to get rx clk\n");
> +               return PTR_ERR(nfc->phase_rx);
> +       }
neither the "rx" nor the "tx" clock are documented in the dt-bindings patch

> +       /* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
> +       regmap_update_bits(nfc->reg_clk, 0,
> +                          CLK_SELECT_NAND | CLK_ALWAYS_ON | CLK_DIV_MASK,
> +                          CLK_SELECT_NAND | CLK_ALWAYS_ON | CLK_DIV_MASK);
clk_set_rate also works for clocks that are not enabled yet (except if
they have the flag CLK_SET_RATE_UNGATE)
this should help you to remove CLK_DIV_MASK here

is CLK_SELECT_NAND a bit that switches the clock output from the sdmmc
controller to the NAND controller?
if so: can this be modeled as a mux clock?

the public S905 datasheet doesn't mention CLK_ALWAYS_ON at bit 28 but
uses bit 24 instead. the description from the datasheet:
Cfg_always_on:
1: Keep clock always on
0: Clock on/off controlled by activities.
    Any APB3 access or descriptor execution will turn clock on.
Recommended value: 0

can you please explain what CLK_ALWAYS_ON does and why it has to be 1?


Regards
Martin
