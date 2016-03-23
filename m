Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiiEt-0004Ye-Sx
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 12:50:20 +0000
Received: from mail.kernel.org (localhost [127.0.0.1])
 by mail.kernel.org (Postfix) with ESMTP id 7D3BA203B8
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 12:49:58 +0000 (UTC)
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
 [209.85.161.171])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF83B203E3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 12:49:55 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id g3so16995948ywa.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 05:49:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
 <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 23 Mar 2016 07:49:35 -0500
Message-ID: <CAL_JsqKUMhPwxrhz50D8+UAaVPT_+=xJLm6A6fVy6RgpyOnq8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] doc: dt: mtd: add a DT property to enable the use
 of 4byte-address op codes
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 boris brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 22, 2016 at 10:13 AM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> This patch adds a new optional DT property which enables an alternative
> way of supporting memory size above 16MiB (128Mib). This new mechanism
> translates the regular 3byte-address op codes into their 4byte-address
> version whereas the old/default mecanism makes the SPI memory enter its
> 4byte-address mode, which has annoying side effects for early bootloaders.
>
> We cannot discover at run time whether the SPI NOR memory supports the
> 4byte-address op codes. For instance both Macronix MX25L25635E and
> MX25L25673G share the same JEDEC ID (C22019 without any extension byte).
> However the first one doesn't support 4byte-address op codes whereas the
> second one does.
>
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 2c91c03e7eb0..8be610482089 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -66,6 +66,17 @@ Optional properties:
>                     Refer to your chips' datasheet to check if this is supported
>                     by your chip.
>
> +- m25p,4byte-opcodes: For memory size above 16MiB (128Mib), use the dedicated

m25p is not a vendor. So drop it or m25p-4byte-opcodes.

> +                      4byte-address opcodes instead of entering the 4byte
> +                      address mode. This mode changes the internal state of the
> +                      chip so may conflict with some early boot loaders, which
> +                      expect to use the regular (Fast) Read opcodes with 3byte
> +                      address.
> +                      However 4byte-address opcodes are not supported by all
> +                      chips and support for them can not be detected at runtime.

s/can not/cannot/

> +                      Refer to you chip's datasheet to check if this is
> +                      supported by your chip.
> +
>  Example:
>
>         flash: m25p80@0 {
> --
> 1.8.2.2
>
