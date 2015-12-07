Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5n7z-0007zm-IC
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 04:10:20 +0000
Received: by vkbs1 with SMTP id s1so95501938vkb.1
 for <linux-mtd@lists.infradead.org>; Sun, 06 Dec 2015 20:09:55 -0800 (PST)
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1449460394-31601-1-git-send-email-bayi.cheng@mediatek.com>
References: <1449460394-31601-1-git-send-email-bayi.cheng@mediatek.com>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Mon, 7 Dec 2015 12:09:35 +0800
Message-ID: <CAGS+omCuB3VGcPk3fezakdVDnFB3GAmMD+wZ_6nGdv+uHoB40g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Add nor flash node
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bayi,

On Mon, Dec 7, 2015 at 11:53 AM, Bayi Cheng <bayi.cheng@mediatek.com> wrote:
> Add Mediatek nor flash node
>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Previous version of this patch is
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386005.html
> Drop flash node from mt8173.dtsi accroding review comment

Is there a flash on mt8173-evb that can be accessed by the nor_flash ?
If so, can you include flash@0 node in the mt8173-evb.dts.

-Dan

>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 4dd5f93..af08e97 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -387,6 +387,17 @@
>                         status = "disabled";
>                 };
>
> +               nor_flash: spi@1100d000 {
> +                       compatible = "mediatek,mt8173-nor";
> +                       reg = <0 0x1100d000 0 0xe0>;
> +                       clocks = <&pericfg CLK_PERI_SPI>,
> +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +                       clock-names = "spi", "sf";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
>                 i2c3: i2c@11010000 {
>                         compatible = "mediatek,mt8173-i2c";
>                         reg = <0 0x11010000 0 0x70>,
> --
> 1.8.1.1.dirty
>
