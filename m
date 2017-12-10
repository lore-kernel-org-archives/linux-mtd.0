Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNpS7-0007PG-JK
 for linux-mtd@lists.infradead.org; Sun, 10 Dec 2017 00:26:46 +0000
Received: by mail-io0-x242.google.com with SMTP id d14so6081165ioc.5
 for <linux-mtd@lists.infradead.org>; Sat, 09 Dec 2017 16:26:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171206172714.ABE156C6B0@po15668-vm-win7.idsi0.si.c-s.fr>
References: <20171206172714.ABE156C6B0@po15668-vm-win7.idsi0.si.c-s.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Dec 2017 01:26:21 +0100
Message-ID: <CACRpkdYRTiVZOcUpbQ31tx-YSwDGwvF7NuSGrWXJfH1BEg1ASQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: gpio: Fix ALE gpio configuration
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 6, 2017 at 6:27 PM, Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> Fixes a copy/paste error in commit f3d0d8d938b4d ("mtd: nand: gpio:
> Convert to use GPIO descriptors") which breaks gpio-nand driver
>
> Fixes: f3d0d8d938b4d ("mtd: nand: gpio: Convert to use GPIO descriptors")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Sorry about that :(
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
