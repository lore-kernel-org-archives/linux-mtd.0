Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7aSo-00058K-35
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 23:17:23 +0000
Received: by wgbdt14 with SMTP id dt14so1905992wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 16:17:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120831005234.28732.10624.stgit@muffinssi.local>
References: <20120831004828.28732.902.stgit@muffinssi.local>
 <20120831005234.28732.10624.stgit@muffinssi.local>
Date: Sat, 1 Sep 2012 01:17:20 +0200
Message-ID: <CACRpkdb7ozr8uxTDudVPMF5Lcr3FMtDLo9RUm-hvqbVUCHji6w@mail.gmail.com>
Subject: Re: [PATCH 6/9] ARM: OMAP: Move gpio.h to include/linux/platform_data
From: Linus Walleij <linus.walleij@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Grant Likely <grant.likely@secretlab.ca>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 31, 2012 at 2:52 AM, Tony Lindgren <tony@atomide.com> wrote:

> This way we can remove includes of plat/gpio.h which won't work
> with the single zImage support.
>
> Note that we also remove the cpu_class_is_omap2() check
> in gpio-omap.c as the drivers should not call it as we need to
> make it local to arch/arm/mach-omap2 for single zImage support.
>
> While at it, arrange the related includes in the standard way.
>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: alsa-devel@alsa-project.org
> Acked-by: Tony Lindgren <tony@atomide.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
