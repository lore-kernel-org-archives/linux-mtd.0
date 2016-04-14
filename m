Received: from mail-yw0-x230.google.com ([2607:f8b0:4002:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqczx-0002Lo-TE
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 08:51:38 +0000
Received: by mail-yw0-x230.google.com with SMTP id o66so96992125ywc.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2016 01:51:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEVGjpo0J7nsoSX7LHqypUH=83unohxk5QTyP=dQevmZOLMq_w@mail.gmail.com>
References: <CAEVGjpo0J7nsoSX7LHqypUH=83unohxk5QTyP=dQevmZOLMq_w@mail.gmail.com>
Date: Thu, 14 Apr 2016 10:51:16 +0200
Message-ID: <CAFLxGvyTg=i2RpGyuoCZBRwdANUYt3dJg08Hfgs2qohnGrCfYQ@mail.gmail.com>
Subject: Re: Bit flip detection after boot
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Raphael Pereira <raphael@rmi.inf.br>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 13, 2016 at 11:25 PM, Raphael Pereira <raphael@rmi.inf.br> wrote:
> Hi,
>
> I have a custom board with a GPMI interface (Freescale i.MX233) with
> kernel 4.1.18 using Micron MT29F4G08ABADAWP (nand: 512 MiB, SLC, erase
> size: 128 KiB, page size: 2048, OOB size: 64).
>
> When I boot, the flash gets recognized and works flawless. I can
> ubiformat, ubiattach, mount, copy a lot of files, umount, remount,
> check and test in whatever way I need. No problem arrises.
> The problem is that when I shut the system down (turn it off) and boot
> again, all used blocks are marked as badblocks.

Sounds like you have a massive bitflip problem.
This is where you should start investigating.
Are you facing so massive bitflips that the bad block marker is wrongly set?

> I have used another flash (Toshiba with w/ erase size: 256KiB) and it
> works perfectly, with no problem at all.
>
> Trying to find out what might be the problem, I found BBT DTS option,
> so I enabled it and, instead of marking all blocks as bad, I end up
> with UBI detecting bit-flips on all sectors, but correctable flips, so

You've disabled the bad block scan and tried to paper over the root cause. ;)

> I can use the flash normally (although it takes a lot of time to boot
> because of the many messages "ubi0: fixable bit-flip detected at PEB
> XXX".
>
> I have changed the chip a lot of times and have checked my hardware
> and I am quite sure it is not a hardware problem. I think that some
> structure detection of the flash is wrong in the kernel for this
> particular case (i.MX233 BCH + MT29F4G08ABADAWP).
>
> Can someone guide me in debugging this problem?

As I said, find out why you're facing so much bitflips.

-- 
Thanks,
//richard
