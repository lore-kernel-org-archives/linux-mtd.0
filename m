Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO0MU-0003OM-Q6
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 04:01:40 +0000
Received: by bwz5 with SMTP id 5so7116854bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 20:01:37 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20101201164447.2215bc58@wker>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 06:01:32 +0200
Message-ID: <1291262492.14534.23.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-01 at 16:44 +0100, Anatolij Gustschin wrote:
> On Wed, 1 Dec 2010 13:05:34 +0100
> Anatolij Gustschin <agust@denx.de> wrote:
> ... 
> > My question is:
> > Is it possible that the reset occured while running in
> > nor_erase_prepare() just after clearing the VID header magic,
> > but before clearing the EC header magic?
> 
> yes, it is possible and it seems this is the reason for
> that next issue we've observed. Adding the call to the
> machine restart callback in nor_erase_prepare() just before
> clearing EC header magic to simulate this hypothetical case
> we see:
> ...
> UBI DBG (pid 1287): ubi_eba_read_leb: read 160 bytes from offset 80112 of LEB 0:10, PEB 12
> UBI DBG (pid 1287): ubi_close_volume: close device 0, volume 0, mode 1
> nor_erase_prepare: ### RESET before clearing EC magic in peb # 177, off: 0xf6780000
> 
> and now we dump the EC and VID headers and some UBIFS
> nodes of the PEB # 177:
> 
> => md f6780000 50
> f6780000: 55424923 01000000 00000000 00000034    UBI#...........4
> f6780010: 00000040 00000080 753746f3 00000000    ...@....u7F.....
> f6780020: 00000000 00000000 00000000 00000000    ................
> f6780030: 00000000 00000000 00000000 6533c6f3    ............e3..
> f6780040: 00000000 01010000 00000000 00000004    ................
> f6780050: 00000000 00000000 00000000 00000000    ................
> f6780060: 00000000 00000000 00000000 00003343    ..............3C
> f6780070: 00000000 00000000 00000000 478a9cae    ............G...
> f6780080: 31181006 f0deeea3 20b21600 00000000    1....... .......
> f6780090: 20000000 0a000000 49040000 00000000     .......I.......
> f67800a0: 31181006 5412d762 21b21600 00000000    1...T..b!.......
> f67800b0: 40000000 08000000 1c000000 30920300    @...........0...
> f67800c0: 01000000 0001c808 0001c808 00000005    ................
> f67800d0: 00040000 00000001 0001cc60 0005cc60    ...........`...`
> f67800e0: 31181006 2a49116c 22b21600 00000000    1...*I.l".......
> f67800f0: 40000000 08000000 16000000 60230100    @...........`#..
> f6780100: 02000000 00000000 bfaf7600 c0000000    ..........v.....
> f6780110: 00000000 00000000 00000000 00000000    ................
> f6780120: ffffffff ffffffff ffffffff ffffffff    ................
> f6780130: ffffffff ffffffff ffffffff ffffffff    ................
> 
> After booting Linux and attaching the MTD device I can see
> very similar things happen:
> ...
> UBI DBG (pid 1277): ubi_scan: process PEB 177
> UBI DBG (pid 1277): process_eb: scan PEB 177
> UBI DBG (pid 1277): ubi_io_read_vid_hdr: bad magic number at PEB 177: 00000000 instead of 55424921
> UBI error: check_corruption: PEB 177 contains corrupted VID header, and the data does not contain all 0xFF, this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection

Oh oh, this is my new shiny code which is supposed to make UBI more
careful about not wiping corrupted eraseblocks.

Someone reported a problem that his eraseblocks disappear, and I though
this might be because the corrupt partially, e.g., the VID headers
becomes corrupted, and then UBI just wipes them, and leaves no chance
to look at what exactly was corrupted and possibly find the root cause.

So, my new shiny code simply misses the NOR case, where we have this
quirk, where we deliberately corrupt the VID header before erasing.
And if you have a power cut before you have erased but after you have
invalidated the VID header, UBI thinks the PEB is one of those corrupted
ones and it should be preserved.

Take a look at scan.h header comment - I tried to explained the logic.

Anyway, this code is broken for NOR, apparently. This code was merged
only to 2.6.37, so it was not released, and we have chance to fix it.
Or disabled it for NOR.

For quick test, please, hack UBI and make check_corruption() in scan.c
always return 0. Than you effectively disable this new shiny buggy
feature.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
