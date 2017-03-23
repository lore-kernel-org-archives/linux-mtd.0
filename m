Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzWt-0007AM-OM
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:59:41 +0000
Received: by mail-oi0-x22a.google.com with SMTP id w81so61584775oig.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 02:59:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-4-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 10:59:17 +0100
Message-ID: <CACRpkdZ9kGNfe0LXJAdWjXi1WC5dAw7L-B-p6rtcUnk8bm7ONA@mail.gmail.com>
Subject: Re: [PATCH 03/13] mtd: nand: fsmc: add support to use NAND timings
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

> Until now, the fsmc_nand driver was either using controller timings
> specified in the Device Tree (through FSMC specific DT properties) or
> alternatively default/fallback timings.
>
> This commit implements support to use the timings advertised by the NAND
> chip itself, and passed by the NAND core to the ->setup_data_interface()
> callback.
>
> Many thanks to Boris Brezillon for coming up with the logic to convert
> the NAND chip timings into the timings expected by the FSMC controller.
>
> Also, since the timings are now not only coming from the DT, the message
> warning that default timings will be used is removed.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Obviously the right thing to do. If NAND manufacturers give us
plug-n-play capabilities, we should use it.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
