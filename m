Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0sln-00050I-Pm
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 17:52:29 +0000
Received: by mail-io0-x231.google.com with SMTP id r18so311007ioa.1
 for <linux-mtd@lists.infradead.org>; Tue, 27 Mar 2018 10:52:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180303223145.27903-1-linus.walleij@linaro.org>
References: <20180303223145.27903-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Mar 2018 19:52:16 +0200
Message-ID: <CACRpkdbyj4Cqd9b14K-iggK8GBhMQ-dsbEHsOBJ-hN7BRJvUMg@mail.gmail.com>
Subject: Re: [PATCH] mtd: jedec_probe: add Eon EN29LV400A IDs
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 3, 2018 at 11:31 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds the JEDEC IDs for Eon EN29LV400A variants
> EN29LV400AB and EN29LV400AT. This chip is found in the
> D-Link DNS-313.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Could someone from the MTD camp please pick up this patch?

I am using this flash chip.

Yours,
Linus Walleij
