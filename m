Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxAfR-0004Ef-Bi
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 12:42:50 +0000
Received: by mail-it0-x241.google.com with SMTP id d10-v6so4703589itj.5
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2018 05:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180904091438.3755-1-boris.brezillon@bootlin.com>
In-Reply-To: <20180904091438.3755-1-boris.brezillon@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Sep 2018 14:42:26 +0200
Message-ID: <CACRpkdaORSM73HaGz=2j4vvRkZxZCfo_GoTFRy4jk9SLMdMVaQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Fix Hamming ECC
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>,
 stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 4, 2018 at 11:14 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Apparently ECC bytes are not ordered as expected by nand_correct_data()
> in the ecc_calc buffer which leads to invalid bitflip correction when
> an ECC error is detected (can be reproduced with 'nandbiterrs -i').
>
> Re-ordering ECC bytes seems to fix the problem.
>
> While at it, get rid of the useless u8 cast.
>
> Fixes: 6c009ab89a21 ("mtd: generic FSMC NAND MTD driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
