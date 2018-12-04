Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUASW-0008Lq-33
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 13:09:55 +0000
Received: by mail-lj1-x243.google.com with SMTP id g11-v6so14842876ljk.3
 for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2018 05:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20181127205358.32502-1-linus.walleij@linaro.org>
 <20181202094749.07a9687e@bbrezillon>
In-Reply-To: <20181202094749.07a9687e@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Dec 2018 14:09:27 +0100
Message-ID: <CACRpkdaWR1nXSnnpojXyHrm5Qp3VRkBh_iv0f1z=tg_kzZB98Q@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] mtd: maps: Leave assigned complex mappings
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

On Sun, Dec 2, 2018 at 9:48 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Tue, 27 Nov 2018 21:53:57 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > The simple_map_init() may need to be called with some
> > function pointers already assigned for complex mappings,
> > just bail out if complex handlers have already been
> > assigned.
>
> The commit message no longer matches what the patch does.
>
> How about:
>
> "
> mtd: maps: physmap: Leave assigned complex mappings
>
> SoC-specific drivers might provide their own map->xxx() implementation,
> and calling simple_map_init() unconditionally will override those
> implementations.
>
> Make sure map->read is NULL before calling simple_map_init().
> "
>
> If you're okay with this new commit message, I can fix it when applying.

Sure, go ahead Boris, thanks!

Yours,
Linus Walleij
