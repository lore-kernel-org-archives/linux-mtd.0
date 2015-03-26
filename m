Received: from mail-qg0-f54.google.com ([209.85.192.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaxIt-0007rP-U5
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 02:13:52 +0000
Received: by qgf60 with SMTP id 60so60233191qgf.3
 for <linux-mtd@lists.infradead.org>; Wed, 25 Mar 2015 19:13:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427267091-227474-1-git-send-email-wangzhou1@hisilicon.com>
References: <1427267091-227474-1-git-send-email-wangzhou1@hisilicon.com>
Date: Thu, 26 Mar 2015 10:13:29 +0800
Message-ID: <CAD6h2NQr_Z600vC+7RRuLgoGvV4MCXz8TAd4C5eCnqbA0ZdPWw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3] mtd: hisilicon: add device tree node for NAND
 controller
From: Haojian Zhuang <haojian.zhuang@linaro.org>
To: Zhou Wang <wangzhou1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Wei Xu <xuwei5@hisilicon.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 March 2015 at 15:04, Zhou Wang <wangzhou1@hisilicon.com> wrote:
> This patch adds dts support for NAND flash controller of Hisilicon Soc Hip04.
> Now it is based on v4.0-rc5
>
> Changes in v3:
> - Change E-mail address in signed-off-by to "wangzhou1@hisilicon.com"
> Changes in v2:
> - Base on v3.19-rc1
> - Use nand-ecc-strength, nand-ecc-step-size to replace hisi,nand-ecc-bits
> Changes in v1:
> - Move partition and other board related information into board dts file:
>   hip04-d01.dts
>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> ---
>  arch/arm/boot/dts/hip04-d01.dts | 27 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/hip04.dtsi    |  7 +++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/hip04-d01.dts b/arch/arm/boot/dts/hip04-d01.dts
> index 40a9e33..ba04dd5 100644
> --- a/arch/arm/boot/dts/hip04-d01.dts
> +++ b/arch/arm/boot/dts/hip04-d01.dts
> @@ -28,5 +28,32 @@
>                 uart0: uart@4007000 {
>                         status = "ok";
>                 };
> +
> +               nand: nand@4020000 {
> +                       nand-bus-width = <8>;
> +                       nand-ecc-mode = "hw";
> +                       nand-ecc-strength = <16>;
> +                       nand-ecc-step-size = <1024>;
> +
> +                       partition@0 {
> +                               label = "nand_text";
> +                               reg = <0x00000000 0x00400000>;
> +                       };
> +
> +                       partition@00400000 {
> +                               label = "nand_monitor";
> +                               reg = <0x00400000 0x00400000>;
> +                       };
> +
> +                       partition@00800000 {
> +                               label = "nand_kernel";
> +                               reg = <0x00800000 0x00800000>;
> +                       };
> +
> +                       partition@01000000 {
> +                               label = "nand_fs";
> +                               reg = <0x01000000 0x1f000000>;
> +                       };
> +               };
>         };
>  };
> diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
> index 2388145..ac32fce 100644
> --- a/arch/arm/boot/dts/hip04.dtsi
> +++ b/arch/arm/boot/dts/hip04.dtsi
> @@ -269,6 +269,13 @@
>                         interrupts = <0 372 4>;
>                 };
>
> +               nand: nand@4020000 {
> +                       compatible = "hisilicon,504-nfc";
> +                       reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
> +                       interrupts = <0 379 4>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +               };
>         };
>
>         etb@0,e3c42000 {
> --
> 1.9.1
>

Acked-by: Haojian Zhuang <haojian.zhuang@linaro.org>
