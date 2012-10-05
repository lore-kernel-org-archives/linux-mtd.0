Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK7Nw-00033Z-8w
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 12:52:09 +0000
Received: by mail-we0-f177.google.com with SMTP id u50so1060368wey.36
 for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2012 05:52:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
References: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
Date: Fri, 5 Oct 2012 14:52:06 +0200
Message-ID: <CACRpkdYMz05DwtLtHkggvo8VFOtvPLpovwq6fLceeiFK0Wci0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: nomadik: switch over to using the FSMC driver
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Mike Turquette <mturquette@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Mike Turquette <mturquette@linaro.org>, Alessandro Rubini <rubini@unipv.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 4, 2012 at 9:28 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> The Nomadik NAND driver is really just a subset of the existing
> FSMC driver, so let's switch over to using that driver instead,
> since it handles more variants of this chip. The callbacks for
> setting up the chip is doing stuff now handled by the FSMC
> driver.
>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I'm requesting Mike Turquette's ACK on this patch so I can merge
> it through ARM SoC.

Still requesting Mike's ACK, but not for merging through ARM SoC
but through MTD.

If you apply Jean-Christophe's patch first (please do that) I will
send a v2 of this patch set to be applied onto MTD as well
(should be OK).

Yours,
Linus Walleij
