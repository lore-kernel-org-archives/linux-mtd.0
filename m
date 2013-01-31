Received: from mail-da0-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U13QX-0006x9-7E
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2013 23:20:17 +0000
Received: by mail-da0-f44.google.com with SMTP id z20so1476947dae.31
 for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2013 15:20:15 -0800 (PST)
Date: Thu, 31 Jan 2013 15:20:15 -0800
From: Olof Johansson <olof@lixom.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] Nomadik devicetree and cleanups
Message-ID: <20130131232015.GA3314@quad.lixom.net>
References: <CACRpkdZM8+6QaGrRtCCMWoZQO23uej7JDr1xz2zG7TtwQ7Ngqw@mail.gmail.com>
 <20130128213135.GA3047@quad.lixom.net>
 <CACRpkdaHo_xLwqUDF9C71HbuGEcJHg_Jrsf0gCSPYXa4E+yJGA@mail.gmail.com>
 <20130129173641.GA17935@quad.lixom.net>
 <CACRpkdaVOV4d9xeuKnMyfGgM+Su3M6dmo2pyeEQE9Qb2sErzzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaVOV4d9xeuKnMyfGgM+Su3M6dmo2pyeEQE9Qb2sErzzA@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, arm@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 30, 2013 at 11:21:06PM +0100, Linus Walleij wrote:
> On Tue, Jan 29, 2013 at 6:36 PM, Olof Johansson <olof@lixom.net> wrote:
> > On Mon, Jan 28, 2013 at 11:36:59PM +0100, Linus Walleij wrote:
> >> On Mon, Jan 28, 2013 at 10:31 PM, Olof Johansson <olof@lixom.net> wrote:
> >>
> >> > Would you mind rebasing on top of the depends/cleanup branch in arm-soc, sort
> >> > out the breakage (and test it) and resubmit?
> >>
> >> So Olof, please try this instead, based on the ARM depends/cleanup HEAD
> >> when I fetched it:
> >>
> >> The following changes since commit f8060f5446b1f2782f0a8ca9be2d870ea4198aee:
> >>
> >>   Merge tag 'gic-vic-to-irqchip' of
> >> git://sources.calxeda.com/kernel/linux into next/cleanup (2013-01-14
> >> 19:55:03 -0800)
> >>
> >> are available in the git repository at:
> >>
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> >> tags/nmk-dt-on-cleanups
> >
> > Beautiful! Pulled. Zero conflicts. :)
> 
> So as I heard this blew up for selecting OF instead of USE_OF here
> is yet another pull request, with this oneliner change in the relevant
> patch ("ARM: nomadik: delete old board files"):
> 
> - select OF
> + select USE_OF
> 
> I have tried to provoke builderrors with the defconfig but couldn't.
> 
> Here is then yet another pull request, and let's hope it works this
> time around:

Dropping and replacing branches is awkward, and you rewrote history here. It'd
be better to just take a fixup patch on top that switches the two selects.


-Olof
