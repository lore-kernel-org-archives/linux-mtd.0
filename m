Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzec-0004Gu-0g
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:07:39 +0000
Received: by mail-ot0-x22f.google.com with SMTP id o24so183648309otb.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:07:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-14-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 11:07:16 +0100
Message-ID: <CACRpkdZQ5qc4grxBnsP6Egqe-BSsJXn5Rs-pWFRCF2kbzRU5uA@mail.gmail.com>
Subject: Re: [PATCH 13/13] mtd: nand: fsmc: remove CONFIG_OF conditional
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

On Tue, Mar 21, 2017 at 11:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> Since commit 4404d7d821c33 ("mtd: nand: fsmc: remove stale non-DT probe
> path"), the fsmc NAND driver only supports Device Tree probing, and
> therefore has a "depends on OF" in its Kconfig option.
>
> Due to this the #ifdef CONFIG_OF ... #endif condition in the driver code
> is no longer necessary.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
