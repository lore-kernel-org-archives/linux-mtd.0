Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dovIl-0002A7-UF
 for linux-mtd@lists.infradead.org; Mon, 04 Sep 2017 17:36:49 +0000
Received: by mail-io0-x242.google.com with SMTP id y123so595228iod.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Sep 2017 10:36:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170819221823.13850-7-hauke@hauke-m.de>
References: <20170819221823.13850-1-hauke@hauke-m.de>
 <20170819221823.13850-7-hauke@hauke-m.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Sep 2017 19:36:06 +0200
Message-ID: <CAFBinCACuJ8gs+k4hu+JqpbfS2oJyu2di_2rqqyAFxh8kDOivw@mail.gmail.com>
Subject: Re: [PATCH v10 06/16] MIPS: lantiq: Enable MFD_SYSCON to be able to
 use it for the RCU MFD
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, john@phrozen.org, linux-spi@vger.kernel.org,
 hauke.mehrtens@intel.com, robh@kernel.org, andy.shevchenko@gmail.com,
 p.zabel@pengutronix.de, kishon@ti.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 20, 2017 at 12:18 AM, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/mips/lantiq/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/lantiq/Kconfig b/arch/mips/lantiq/Kconfig
> index 177769dbb0e8..f5db4a426568 100644
> --- a/arch/mips/lantiq/Kconfig
> +++ b/arch/mips/lantiq/Kconfig
> @@ -17,6 +17,7 @@ config SOC_XWAY
>         bool "XWAY"
>         select SOC_TYPE_XWAY
>         select HW_HAS_PCI
> +       select MFD_SYSCON
>
>  config SOC_FALCON
>         bool "FALCON"
> --
> 2.11.0
>
