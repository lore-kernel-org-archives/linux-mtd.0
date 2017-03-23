Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzXa-0007Ql-CY
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:00:27 +0000
Received: by mail-ot0-x22f.google.com with SMTP id y88so28272207ota.2
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:00:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-5-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 11:00:01 +0100
Message-ID: <CACRpkdYsY1eJP49ftaUXK9veTMk1_pQ3d_OLTU4bHD3kuXKAng@mail.gmail.com>
Subject: Re: [PATCH 04/13] mtd: nand: fsmc: move fsmc_nand_data definition
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

> This commit simply moves the "struct fsmc_nand_data" definition to be
> towards the beginning of the file, with the other defines and type
> definitions, instead of in the middle of the driver code. This is much
> more consistent with what most Linux drivers do.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
