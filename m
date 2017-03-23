Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzZI-0000q7-IB
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:02:10 +0000
Received: by mail-ot0-x22a.google.com with SMTP id i1so183910618ota.3
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:01:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-7-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 11:01:46 +0100
Message-ID: <CACRpkdZhx0MX7xxMue7Gy8XYHeZL2sMy4U84qhZWWkwouW86Fg@mail.gmail.com>
Subject: Re: [PATCH 06/13] mtd: nand: fsmc: remove fsmc_select_chip()
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

> host->select_chip used to point to the ->select_bank() function provided
> by the platform data, but the latter no longer exists. Therefore
> host->select_chip is always NULL.
>
> Due to this, the fsmc_select_chip() does nothing, except:
>
>   chip->cmd_ctrl(mtd, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);
>
> when chipnr is -1, which is exactly what the default implementation of
> ->select_chip() does in the NAND framework. So, this commit kills
> fsmc_select_chip() entirely.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As usual, less is more.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
