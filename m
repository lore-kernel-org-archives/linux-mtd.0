Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av3a4-0003qR-JG
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 14:03:13 +0000
Received: by mail-oi0-x22b.google.com with SMTP id k142so15692887oib.1
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 07:02:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461625501-2160538-1-git-send-email-arnd@arndb.de>
References: <1461625501-2160538-1-git-send-email-arnd@arndb.de>
Date: Tue, 26 Apr 2016 16:02:51 +0200
Message-ID: <CACRpkdZe04RCxc4BOidZamRqpu3AcmS+xB82v6iM3dXmYx8odA@mail.gmail.com>
Subject: Re: [PATCH] physmap_of: ensure versatile code is reachable
From: Linus Walleij <linus.walleij@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2016 at 1:04 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> With the newly added physmap_of_versatile code, we get a build error
> when physmap_of is in a module, because of_flash_probe_versatile
> is not exported:
>
> ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
>
> This adds the export, and changes the Makefile so that the code is
> also put into a loadable module rather than built-in when physmap_of
> itself is a module.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Argh how stupid of me. Strange I didn't see it on the
build servers. Anyway:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
