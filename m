Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqhXr-00022y-37
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 13:10:43 +0000
Received: by oiad129 with SMTP id d129so99649402oia.0
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 06:10:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
Date: Mon, 26 Oct 2015 14:10:17 +0100
Message-ID: <CACRpkdbH3yP3jbeeGxrAJXoJeXJQtnPfZpQ1dtx7DpP9_uaZhQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM MTD AFS v2 partition support
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

On Thu, Oct 15, 2015 at 3:08 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Years ago, the ARM reference platforms moved away from the footer
> format parsed by the current AFS code in MTD. As far as I can
> tell this begun with the RealView reference designs (mach-realview)
> and the new format has been used in RealView, Versatile Express
> and recently the Juno Development platform (64bit).
>
> The code has not been working for newer designs for a long time.
> Proper parsing of the flash image partitions is very helpful when
> you want to replace firmware when running full Linux and none of
> the boot monitors or boot loaders.
>
> After this, AFS parsing will work on all ARM reference designs,
> or well, all I could test. I tested the Integrator/AP, RealView
> PB11MPCore and Juno Development Platform.
>
> The first 9 patches basically refactors the current code to
> make the old partition format more encapsulated, while the last
> patch adds the new v2 format.

If there are no comments on this series, then can it be
applied for v4.4?

Yours,
Linus Walleij
