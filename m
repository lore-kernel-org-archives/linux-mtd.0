Received: from mail-pa0-f48.google.com ([209.85.220.48])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U0F6y-0006IA-Az
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 17:36:45 +0000
Received: by mail-pa0-f48.google.com with SMTP id fa1so531206pad.7
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2013 09:36:43 -0800 (PST)
Date: Tue, 29 Jan 2013 09:36:41 -0800
From: Olof Johansson <olof@lixom.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] Nomadik devicetree and cleanups
Message-ID: <20130129173641.GA17935@quad.lixom.net>
References: <CACRpkdZM8+6QaGrRtCCMWoZQO23uej7JDr1xz2zG7TtwQ7Ngqw@mail.gmail.com>
 <20130128213135.GA3047@quad.lixom.net>
 <CACRpkdaHo_xLwqUDF9C71HbuGEcJHg_Jrsf0gCSPYXa4E+yJGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaHo_xLwqUDF9C71HbuGEcJHg_Jrsf0gCSPYXa4E+yJGA@mail.gmail.com>
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

On Mon, Jan 28, 2013 at 11:36:59PM +0100, Linus Walleij wrote:
> On Mon, Jan 28, 2013 at 10:31 PM, Olof Johansson <olof@lixom.net> wrote:
> 
> > Would you mind rebasing on top of the depends/cleanup branch in arm-soc, sort
> > out the breakage (and test it) and resubmit?
> 
> So Olof, please try this instead, based on the ARM depends/cleanup HEAD
> when I fetched it:
> 
> The following changes since commit f8060f5446b1f2782f0a8ca9be2d870ea4198aee:
> 
>   Merge tag 'gic-vic-to-irqchip' of
> git://sources.calxeda.com/kernel/linux into next/cleanup (2013-01-14
> 19:55:03 -0800)
> 
> are available in the git repository at:
> 
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
> tags/nmk-dt-on-cleanups

Beautiful! Pulled. Zero conflicts. :)


-Olof
