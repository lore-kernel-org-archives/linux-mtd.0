Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzYN-0000To-Ke
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:01:18 +0000
Received: by mail-ot0-x231.google.com with SMTP id y88so28285232ota.2
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:00:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-6-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 11:00:49 +0100
Message-ID: <CACRpkdaw2i_zBQHSb9FmU9KQ3xwjTk1G6uQ77=LwASe7SMAN8Q@mail.gmail.com>
Subject: Re: [PATCH 05/13] mtd: nand: fsmc: remove ->select_bank() from
 fsmc_nand_platform_data
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

> Since commit 4404d7d821c3 ("mtd: nand: fsmc: remove stale non-DT probe
> path"), only DT probing is used for the fsmc_nand driver. Due to this,
> the ->select_bank() field of fsmc_nand_platform_data is never used, so
> this commit gets rid of it.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
