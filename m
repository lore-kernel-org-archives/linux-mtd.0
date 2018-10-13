Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBMkC-0003Vx-5C
 for linux-mtd@lists.infradead.org; Sat, 13 Oct 2018 16:26:25 +0000
Received: by mail-io1-xd33.google.com with SMTP id n18-v6so11366351ioa.9
 for <linux-mtd@lists.infradead.org>; Sat, 13 Oct 2018 09:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181011185326.1371-1-linus.walleij@linaro.org>
 <20181012112054.2c74b9c7@bbrezillon>
In-Reply-To: <20181012112054.2c74b9c7@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 13 Oct 2018 18:26:00 +0200
Message-ID: <CACRpkdYin5kj1p3Z2h2ugwMSSHeLMCabb5gdLMSNhmX+_EZADA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: physmap_of: Move custom initialization
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Mark Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 12, 2018 at 11:21 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> wrote:

> > In order to be able to assign custom complex mappings
> > to the physmap_of plugin for Gemini, move the initialization
> > so that the simple map is initialized before we enter the
> > platform-specific functions so the latter can override
> > them.
>
> I forgot to Cc you but I'm currently reworking the physmap driver to
> merge the physmap_of logic in it [1]. I'll probably ask you to rebase
> this patchset on top of mtd/next once [1] is applied.

No problem. Will you apply it after v4.20-rc1?

Yours,
Linus Walleij
