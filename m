Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqzOY-0003Jy-0G
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:51:03 +0000
Received: by mail-oi0-x22a.google.com with SMTP id w81so61490634oig.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 02:50:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2017 10:50:39 +0100
Message-ID: <CACRpkdbGoO0B2EyLch=bL5N0guU11u+KLHzBvcRTf1LFF-A0Lg@mail.gmail.com>
Subject: Re: [PATCH 00/13] mtd: nand: fsmc: fixes, improvements and cleanups
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

> This patch series brings a number of fixes, improvements and cleanups
> to the fsmc MTD NAND driver.

Are you testing this on some specific hardware?

I can give it a spin on the Nomadik later, will review
the series.

Yours,
Linus Walleij
