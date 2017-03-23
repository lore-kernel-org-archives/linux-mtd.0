Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzUy-0006lt-0N
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:57:41 +0000
Received: by mail-ot0-x230.google.com with SMTP id y88so28234624ota.2
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 02:57:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-3-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 10:57:17 +0100
Message-ID: <CACRpkdZWJKw1=UbJZcAbXn7Z==6F7cT_nfrUjK3XnPzCEqgOdg@mail.gmail.com>
Subject: Re: [PATCH 02/13] mtd: nand: fsmc: rework fsmc_nand_setup() to use
 ->setup_data_interface()
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 21, 2017 at 11:03 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Since a few kernel versions, the NAND subsystem has introduced a
> callback called ->setup_data_interface(), which NAND controller drivers
> are supposed to use to perform all the NAND data interface.
>
> This commit therefore converts the fsmc_nand driver to use this callback
> instead of the home-grown fsmc_nand_setup() function.
>
> For now, the NAND timings are not used, and we simply use the timings
> provided from the Device Tree, or otherwise the default timings. Support
> for the NAND timings is added in a follow-up patch.
>
> The call to fsmc_nand_setup() in the ->resume() hook is simply replaced
> by a call to nand_reset(), which internally will call the
> ->setup_data_interface() callback.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Looks good to me, whether you go with Boris' suggestion or not.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
