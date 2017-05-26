Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEAZQ-000792-DG
 for linux-mtd@lists.infradead.org; Fri, 26 May 2017 08:26:06 +0000
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v4Q8PDIi004775
 for <linux-mtd@lists.infradead.org>; Fri, 26 May 2017 17:25:13 +0900
Received: by mail-yw0-f176.google.com with SMTP id l74so1650987ywe.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 May 2017 01:25:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1495786662-27862-1-git-send-email-yamada.masahiro@socionext.com>
References: <1495786662-27862-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 26 May 2017 17:25:12 +0900
Message-ID: <CAK7LNARuk-DseT2mrCQvYOK_34LUOXU_v1GpgYhNnR6oriSnkA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: uniphier: reserve more memory for LD11/LD20
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To MTD developers,

Please ignore this.
I sent this to a wrong ML by accident.  Sorry for noise.



2017-05-26 17:17 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Reserve enough space below the kernel base.
> The assumed address map is:
>   80000000 - 80ffffff : for IPP
>   81000000 - 81ffffff : for ARM secure
>   82000000 -          : for Linux
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 +-
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> index 53ede23d68cb..702f5b175456 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
> @@ -43,7 +43,7 @@
>   *     OTHER DEALINGS IN THE SOFTWARE.
>   */
>
> -/memreserve/ 0x80000000 0x00080000;
> +/memreserve/ 0x80000000 0x02000000;
>
>  / {
>         compatible = "socionext,uniphier-ld11";
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> index aa4dad51bf46..f120059e6e24 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> @@ -43,7 +43,7 @@
>   *     OTHER DEALINGS IN THE SOFTWARE.
>   */
>
> -/memreserve/ 0x80000000 0x00080000;
> +/memreserve/ 0x80000000 0x02000000;
>
>  / {
>         compatible = "socionext,uniphier-ld20";
> --
> 2.7.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Best Regards
Masahiro Yamada
