Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1evfcZ-0003QZ-Kt
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2018 08:49:25 +0000
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
 [209.85.213.46]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id w2D8mgTa027034
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2018 17:48:43 +0900
Received: by mail-vk0-f46.google.com with SMTP id t126so7980227vkb.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2018 01:48:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
References: <5461eb1c-597a-e100-c325-b0fed0eb0d10@linutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Mar 2018 17:48:01 +0900
Message-ID: <CAK7LNASK=ENQC6f8EB78YSYz9n067uj8=tHarNT1J627FPRuhA@mail.gmail.com>
Subject: Re: DENALI: can't detect NAND chip
To: Philipp Rosenberger <p.rosenberger@linutronix.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Benedikt Spranger <b.spranger@linutronix.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2018-03-12 23:29 GMT+09:00 Philipp Rosenberger <p.rosenberger@linutronix.de>:
> Hi,
>
> I'm currently porting Linux 4.14 to a Altera Cyclone V based board. The
> Denali NAND Driver isn't able to detect the NAND chip Micron MT29F4G08) correctly.
>
> [    0.862242] nand: device found, Manufacturer ID: 0x00, Chip ID: 0x2c
> [    0.868604] nand: Unknown denali-nand
> [    0.872253] nand: bus width 8 instead of 16 bits
> [    0.876899] nand: No NAND device found
> [    0.880688] denali-nand-dt: probe of ff900000.nand failed with error -22
>
> The correct ManufID is 0x2c and the DevID is 0xdc. Currently we are
> running a 4.1 kernel with the "old" denali driver without this problem.
> While researching the issue I found the following Mail in the
> Rocketboards archive, which seems to be the same issue.
>
> https://lists.rocketboards.org/pipermail/rfi/2017-September/003627.html
>
>
> We also tested Linux 4.16-rc5 without any additional patches with the same behavior.
>


I got a similar report before for SOCFPGA.

The reporter found a problem in his clock setting:
http://linux-mtd.infradead.narkive.com/MMBF5wzm/nand-denali-issue-with-4-13



-- 
Best Regards
Masahiro Yamada
