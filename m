Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCC4C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 16:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 179E3218AE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 16:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZOPGOu1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="0mPuIKgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 179E3218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvogliqoQKse/vaeXcdAEQtpCVRwzFYbzO3Pvccw3LI=; b=jZOPGOu1EfJwZQ
	1esXKvHcWrehZFR5A8kkcnP6GRsqsH5pLDVQmlp3i6Ffl21OyMXr+D1ZE12lgTWiJl/qfm7OplBEU
	JuCrSQzoioxZH2TT4hoeC9Y7XR1YjrO16gBqpYmXWD52Y3//4ucgOSDLbHvA5cGUCvGc4KDkgfuY/
	KrrHtMQgx8DzAApu7N/CDeBfd3ZMh8Jkv0jvIBTRgnKnWRpeuhQ1SoL0mVeZD7wwgZBTws89vJFsr
	nYElQW8xzCss1Qp1mMAfLOOlA0A3HqvsbGIQ8hqlqSimhEMVOwxD/2PTAt59bIyqAO0jwC6y0quSN
	tgv7wgcGpxHe2B8rWwyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzOju-0004Ta-Aa; Thu, 28 Feb 2019 16:40:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzOjr-0004TD-IF
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 16:40:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id r5so22694407wrg.9
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2019 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgirjT0qFE68j1eVnVV2sv+BMnvp1dC63+nQ3JQdAUQ=;
 b=0mPuIKgifEO2EENOHKHp4uII9+2tWam2a0naQhyCcEKIMILjgJ3drzh6vImG9kqd2O
 LGjnKwJzcMHoJBAPTF8cN1c8vSAveoao3u5SeCgaz42uCfRkxulDNFnl20ru2gFij7JH
 5OkkOzr9RP3mz0RQdQowaKelCiEqtRj28g59PFY/5EqAAvQqZSE231RtB2hqyfS5+0rI
 WoQc+YYjr0x1Q4ng7NybdfaRPAnPAcTnusHZe+ev6O85locO2g998RdtvuV6p/vauKEK
 K3AqpX/aHtOIwvGioPCrx6c+rAERTHzeKAuQtii5qFm57eY8wxnsiY/hE3qX/yO5/rlV
 /G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgirjT0qFE68j1eVnVV2sv+BMnvp1dC63+nQ3JQdAUQ=;
 b=R9J9WsBgh4mq0Z75tTYOuz8WIlLhoaPxwNxWEXdD17bCMjCS2FFcoqc3tWrQKj48Cg
 lG5nHdZdiDlXGFGpFyaJaFbPJTyukzPcWdT/1tppcHaTFqFu1QWtmE83EwsRotRiAX/y
 Dz/CzAln9n2HWWeTnMJW0IJBvqyT6RDBXhnKAr4Ukr6eQXLggIYmLtSz9/SIxSoDrv/Y
 z1BEOwKNQNzq9HzjMcJBJ53wteBDvFfKPPGfRYlvz1z8RM2k06ecS3Jb8DA7+2jtJWEU
 KSpOwTK9bN8GCehp22hfKuIFfiexg6Gx2MO6FlxkIfdrFkIKWpdffoG9HfHQ65yyR1kF
 Gs4A==
X-Gm-Message-State: APjAAAVh3MoNzppXcbkLTq3vf4HyJ1MLbeA1o2t0Yo9wZWqu78XmVh1j
 iPNWAjA28R/RoLIfl6fjkKhz87pFD60Gtds2JoTAC6WY4g0=
X-Google-Smtp-Source: APXvYqyp/HUOEZOXnrjwvYOu9vME4oqucQFZI8FVsPR9eFzZFExA46si2a6XeosBfxz4flKEo8i/7CVv8MxgA7VMOpc=
X-Received: by 2002:a5d:6846:: with SMTP id o6mr197211wrw.160.1551372049606;
 Thu, 28 Feb 2019 08:40:49 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
 <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
 <CAJ+vNU1xtj3f7GefcyY=s7RmNxtBjFpefaG57Xmeq80w0=monQ@mail.gmail.com>
 <1778492.l5RC12KMDO@blindfold>
In-Reply-To: <1778492.l5RC12KMDO@blindfold>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 28 Feb 2019 08:40:38 -0800
Message-ID: <CAJ+vNU3VuR_VeN8WsPRBgyvW43UJnEMDKkPzkZEjnvH6TFZ02w@mail.gmail.com>
Subject: Re: ubi/ubifs performance comparison on two NAND devices
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_084051_646865_86CE9341 
X-CRM114-Status: GOOD (  29.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 27, 2019 at 2:59 PM Richard Weinberger <richard@nod.at> wrote:
>
> Tim,
>
> Am Mittwoch, 27. Februar 2019, 23:43:17 CET schrieb Tim Harvey:
> > On Wed, Feb 27, 2019 at 2:13 PM Richard Weinberger
> > <richard.weinberger@gmail.com> wrote:
> > >
> > > On Wed, Feb 27, 2019 at 9:39 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > >
> > > > Greetings,
> > > >
> > > > I've got two embedded boards (IMX6 using gpmi-nand driver) that are
> > > > identical except for the NAND FLASH and am trying to understand why
> > > > I'm seeing a massive performance difference when it comes to ubi and
> > > > ubifs (in particular ubi scanning and UBIFS resizing).
> > > >
> > > > Micron MT29F16G08ADACAH4:
> > > > - page size: 4320 bytes (4096 + 224 bytes)
> > > > - block size: 64 pages (256K + 14K bytes)
> > > > - device size: 16Gb
> > > > - 30ns per-block read
> > > > - 300us per-block program
> > > > - 2.0ms per-block erase
> > > >
> > > > Cypress S34ML16G202BHI000
> > > > - page size: 2176 bytes (2048+128)
> > > > - block size: 64 pages (128K + 8K)
> > > > - device size: 16Gb
> > > > - 25ns per-block read
> > > > - 300us per-block program
> > > > - 3.5ms per-block erase
> > > >
> > > > The parts are relatively close in per-block performance but because
> > > > the Micron has twice the block size I think of it being twice as fast
> > > > on a per-byte basis compared to the Cypress and I do see this relative
> > > > performance when testing read/write/erase both in modern U-Boot and
> > > > latest Linux. What doesn't add up is that the Cypress part takes about
> > > > 7x longer to complete the ubi attach (between 'attaching mtd' and
>
> Here you say attach takes 7 times longer.
>
> > > > 'scanning is finished' and about 100x longer to complete the UBIFS
> > > > free space fixup (between 'start fixing up free space' and 'free space
> > > > fixup complete') performed on the first mount of a ubifs filesystem
> > > > that was created with auto-resize enabled.
> > > >
> > > > Both parts are 2GiB and the ubi scanning on attach in the kernel goes
> > > > from ~4s on Micron to ~28s on Cypress and the UBIFS free space fixup
> > > > goes from 0.5s on Micron to a whopping 56s on Cypress.
> > > >
> > > > Any ideas why would I be seeing this kind of performance difference
> > > > when the raw erase/read/write performance is (both datasheet and Linux
> > > > tests) only 2x slower? Anywhere I can look to improve performance of
> > > > the Cypress part?
> > >
> > > Let's focus as first step on UBI attach by scanning. Here UBI reads
> > > the first two
> > > (sub)pages of each block.
> > >
> > > Please figure whether in both setup subpages are used or not. Then
> > > measure how long
> > > it takes to read a single page.
> > > Given this numbers we can start with the detective work.
> > >
> >
> > Hi Richard,
> >
> > I suppose I should have provided:
> >
> > [    6.438793] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
> > [    6.445240] nand: Micron MT29F16G08ADACAH4
> > [    6.449362] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
> > 4096, OOB size: 224
> > [    6.459037] Scanning device for bad blocks
> > [    8.784007] 3 fixed-partitions partitions found on MTD device gpmi-nand
> > [    8.790716] Creating 3 MTD partitions on "gpmi-nand":
> > [    8.795823] 0x000000000000-0x000001000000 : "uboot"
> > [    8.810841] 0x000001000000-0x000001100000 : "env"
> > [    8.819356] 0x000001100000-0x000080000000 : "rootfs"
> > [    9.355834] gpmi-nand 112000.gpmi-nand: driver registered.
> >
> > and
> >
> > [    6.014529] nand: device found, Manufacturer ID: 0x01, Chip ID: 0xd5
> > [    6.020907] nand: AMD/Spansion S34ML16G2
> > [    6.024917] nand: 2048 MiB, SLC, erase size: 128 KiB, page size:
> > 2048, OOB size: 128
> > [    6.033385] Scanning device for bad blocks
> > [   10.689345] 3 fixed-partitions partitions found on MTD device gpmi-nand
> > [   10.696056] Creating 3 MTD partitions on "gpmi-nand":
> > [   10.701143] 0x000000000000-0x000001000000 : "uboot"
> > [   10.720392] 0x000001000000-0x000001100000 : "env"
> > [   10.729253] 0x000001100000-0x000080000000 : "rootfs"
> > [   11.793715] gpmi-nand 112000.gpmi-nand: driver registered.
> >
> > So its taking 2.3s to scan the Micron and 5.4s to scan the Cypress
> > which is what I would expect (Micron 2x faster as it has similar read
> > time per block but half as many blocks)
>
> And now all is good.
> I'm confused.
>

Richard,

Whatever 'scan' mtd is doing achieves reasonable results in my opinion
as well as erase/read/write (tested with 'flash_erase' and 'dd' the
Micron part is about 2x faster MB/s than the Cypress part).

What doesn't provide reasonable results is the ubi scan and UBIFS
'free space fixup' (the fixup only occurs on first mount of a ubifs
created with the 'autoresize' flag):

With the Cypress FLASH:
[   10.141066] ubi0: default fastmap pool size: 256
[   10.145968] ubi0: default fastmap WL pool size: 128
[   10.150875] ubi0: attaching mtd2
[   10.206733] ubi0: scanning started
^^^ ubi scan takes ~12s compared to ~4s on Micron FLASH
[   22.539385] ubi0: scanning is finished
[   22.587780] ubi0 warning: ubi_eba_init: cannot reserve enough PEBs
for bad PEB handling, reserved 316, need 320
[   22.624958] ubi0: attached mtd2 (name "rootfs", size 2031 MiB)
[   22.630826] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[   22.637798] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[   22.644663] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[   22.651647] ubi0: good PEBs: 16248, bad PEBs: 0, corrupted PEBs: 0
[   22.657897] ubi0: user volume: 1, internal volumes: 1, max. volumes
count: 128
[   22.665188] ubi0: max/mean erase counter: 1/0, WL threshold: 4096,
image sequence number: 789781498
[   22.674302] ubi0: available PEBs: 0, total reserved PEBs: 16248,
PEBs reserved for bad PEB handling: 316
[   22.684179] ubi0: background thread "ubi_bgt0d" started, PID 233
...
[   24.326892] UBIFS (ubi0:0): start fixing up free space
[   51.460774] UBIFS (ubi0:0): free space fixup complete
[   51.473525] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 274
^^^ UBIFS free space fixup (first mount of fs created with
'autoresize' flag) takes ~27s compared to ~0.5s on Micron

So my question is why is the Cypress NAND taking way more than twice
as long compared to Micron with 'ubi' scan and 'ubifs resize' when the
read/write/erase performance is only 2x slower between the two.

> > > Did you also check what timings both NANDs are using?
> >
> > No, where would I see these? Would this be something that can be
> > provided in device-tree or a nand chip-specific driver?
>
> Usually the driver computes them based on various sources.
> See drivers/mtd/nand/raw/nand_timings.c
>

Ok, thanks for the pointer. Is there a sysfs node that contains all of
those? I didn't see anything obvious. I can printk them for comparison
but I don't see this as a raw nand issue, I see it as a ubi/ubifs
issue. There is something going on at the ubi/ubifs layer that makes
the Cypress FLASH very slow for the ubi scan that occurs on attach and
the UBIFS resize that occurs on first mount.

Thanks,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
