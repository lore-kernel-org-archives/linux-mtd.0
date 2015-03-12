Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0DR-0005Gx-H3
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:19:46 +0000
Received: by oigh136 with SMTP id h136so849758oig.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 03:19:23 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
Date: Thu, 12 Mar 2015 11:19:23 +0100
Message-ID: <CAMuHMdUv2w0chGPK37oYaY5f64X4XK+Ab+aP7egxv2fnWa8k-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Wed, Mar 11, 2015 at 10:57 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
> index 4611aa83531b..1b2997d4cee4 100644
> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> @@ -3,9 +3,12 @@
>  Required properties:
>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>    representing partitions.
> -- compatible : Should be the manufacturer and the name of the chip. Bear in mind
> +- compatible : Should be "nor-jedec" for any SPI NOR flash that can be
> +               identified by the JEDEC READ ID opcode (0x95).
> +               Additionally, may include a device-specific string consisting of
> +               the manufacturer and name of the chip. Bear in mind

For the casual reader, this suggests putting "nor-jedec" first, which is not
what we want. So I would write it like e.g.

"Should be the manufacturer and the name of the chip. Additionally,
 should contain "nor-jedec" for any SPI NOR flash that can be
 identified by the JEDEC READ ID opcode (0x95)."

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
