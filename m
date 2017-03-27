Received: from mail-it0-x22d.google.com ([2607:f8b0:4001:c0b::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csV6u-0003p8-Jn
 for linux-mtd@lists.infradead.org; Mon, 27 Mar 2017 13:55:06 +0000
Received: by mail-it0-x22d.google.com with SMTP id 190so53447763itm.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2017 06:54:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170326122725.5594-1-linus.walleij@linaro.org>
References: <20170326122725.5594-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Mar 2017 15:54:41 +0200
Message-ID: <CACRpkdaLR2v9hX60BDANd8QJGRp2t4aFN-+yWyJrFXBaoXEgjQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of: really fix the physmap add-ons
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 26, 2017 at 2:27 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> The current way of building the of_physmap add-ons result in just
> the add-on being in the object code, and not the actual core
> implementation and regress the Gemini and Versatile.
>
> There is no way around exporting these functions. If they are
> built as modules, they will become modules with exported functions,
> if they are builtins they will become builtins.
>
> Fixes: 4f04f68e1598 ("mtd: physmap_of: fixup gemini/versatile dependencies")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> The previous attempts to bake a single module from several *optional*
> pieces doesn't play well with tristate, and if there is a way to
> achieve that except making everything an #ifdef in the same file,
> I sure haven't figured it out. I guess #include "physmap_addon.c"
> directly into the C file would work but ugh that is ugly.

Bah, the build servers claim this doesn't work either.

OK investigating again, sigh. Kbuild always bites my ass.

Yours,
Linus Walleij
