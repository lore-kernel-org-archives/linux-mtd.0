Received: from na3sys009aog136.obsmtp.com ([74.125.149.85])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMSVo-0007aU-OZ
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 23:49:58 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so2444335pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 16:49:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
From: Mike Turquette <mturquette@ti.com>
In-Reply-To: <CACRpkdYMz05DwtLtHkggvo8VFOtvPLpovwq6fLceeiFK0Wci0Q@mail.gmail.com>
References: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
 <CACRpkdYMz05DwtLtHkggvo8VFOtvPLpovwq6fLceeiFK0Wci0Q@mail.gmail.com>
Message-ID: <20121011234952.2941.18793@nucleus>
Subject: Re: [PATCH 1/2] ARM: nomadik: switch over to using the FSMC driver
Date: Thu, 11 Oct 2012 16:49:52 -0700
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alessandro Rubini <rubini@unipv.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Linus Walleij (2012-10-05 05:52:06)
> On Thu, Oct 4, 2012 at 9:28 AM, Linus Walleij <linus.walleij@linaro.org> =
wrote:
> =

> > The Nomadik NAND driver is really just a subset of the existing
> > FSMC driver, so let's switch over to using that driver instead,
> > since it handles more variants of this chip. The callbacks for
> > setting up the chip is doing stuff now handled by the FSMC
> > driver.
> >
> > Cc: Alessandro Rubini <rubini@unipv.it>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > I'm requesting Mike Turquette's ACK on this patch so I can merge
> > it through ARM SoC.
> =

> Still requesting Mike's ACK, but not for merging through ARM SoC
> but through MTD.
> =


Sorry for the late response but I just returned from vacation.  Might be
too late but:

Acked-by: Mike Turquette <mturquette@linaro.org>

Thanks,
Mike

> If you apply Jean-Christophe's patch first (please do that) I will
> send a v2 of this patch set to be applied onto MTD as well
> (should be OK).
> =

> Yours,
> Linus Walleij
