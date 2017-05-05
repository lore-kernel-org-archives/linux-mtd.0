Received: from mail-io0-f194.google.com ([209.85.223.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6jMI-00057Z-PP
 for linux-mtd@lists.infradead.org; Fri, 05 May 2017 19:57:48 +0000
Received: by mail-io0-f194.google.com with SMTP id v34so3739113iov.2
 for <linux-mtd@lists.infradead.org>; Fri, 05 May 2017 12:57:26 -0700 (PDT)
Date: Fri, 5 May 2017 14:57:24 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maarten ter Huurne <maarten@treewalker.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Paul Burton <paul.burton@imgtec.com>, james.hogan@imgtec.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 02/14] dt/bindings: Document gpio-ingenic
Message-ID: <20170505195724.mph4uov3vd52hscm@rob-hp-laptop>
References: <20170402204244.14216-2-paul@crapouillou.net>
 <20170428200824.10906-1-paul@crapouillou.net>
 <20170428200824.10906-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170428200824.10906-3-paul@crapouillou.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 28, 2017 at 10:08:12PM +0200, Paul Cercueil wrote:
> This commit adds documentation for the devicetree bindings of the
> gpio-ingenic driver, which handles GPIOs of the Ingenic SoCs
> currently supported by the Linux kernel.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/gpio/ingenic,gpio.txt      | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/ingenic,gpio.txt
> 
>  v2: New patch
>  v3: No changes
>  v4: Update for the v4 version of the gpio-ingenic driver
>  v5: Remove gpio-bank-... compatible strings, and add 'reg' property

Acked-by: Rob Herring <robh@kernel.org>
