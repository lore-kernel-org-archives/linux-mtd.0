Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eiKab-0004xk-Ii
 for linux-mtd@lists.infradead.org; Sun, 04 Feb 2018 13:44:15 +0000
Received: by mail-wr0-x236.google.com with SMTP id i56so26925374wra.7
 for <linux-mtd@lists.infradead.org>; Sun, 04 Feb 2018 05:44:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 4 Feb 2018 14:44:00 +0100
Message-ID: <CAFLxGvwhwy8_1piyn6WnS1XsD-eifc55C8nCsv8Eh5mmLz1GMg@mail.gmail.com>
Subject: Re: UBI assert failed in ubi_wl_init
To: Timo Ketola <timo@exertus.fi>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Timo,

On Thu, Feb 1, 2018 at 7:44 AM, Timo Ketola <timo@exertus.fi> wrote:
> Hi,
>
> Could someone please give some ideas...
>
> I'm trying to deploy UBI fastmap. Basically it seems to work but there
> are some messages I'm not comfortable with.
>
> I made UBI image with ubinize with fixed size empty volume (autoresize
> seems not to work with fastmap at all). I flashed it with U-Boot 'nand
> write.trimffs'. On first boot the fastmap complains about not to be able
> to write fastmap:
>
>
>> ubi1: default fastmap pool size: 256
>> ubi1: default fastmap WL pool size: 128
>> ubi1: attaching mtd1
>> ubi1: scanning is finished
>> ubi1: attached mtd1 (name "user", size 1984 MiB)
>> ubi1: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> ubi1: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> ubi1: VID header offset: 2048 (aligned 2048), data offset: 4096
>> ubi1: good PEBs: 15864, bad PEBs: 8, corrupted PEBs: 0
>> ubi1: user volume: 1, internal volumes: 1, max. volumes count: 128
>> ubi1: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 18
>> 6152832
>> ubi1: available PEBs: 2331, total reserved PEBs: 13533, PEBs reserved for bad PE
>> B handling: 312
>> ubi1: background thread "ubi_bgt1d" started, PID 98
> ...
>> ubi1 error: ubi_update_fastmap: could not get any free erase block
>> ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28

Most likely because you have absolutely no free erase blocks available
and fastmap
was also unable to move blocks around to produce free space within the
first 64 blocks.

>> UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 105
>> UBIFS (ubi1:0): UBIFS: mounted UBI device 1, volume 0, name "user"
>> UBIFS (ubi1:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048
>>  bytes/2048 bytes
>> UBIFS (ubi1:0): FS size: 1675702272 bytes (1598 MiB, 13197 LEBs), journal size 9
>> 023488 bytes (8 MiB, 72 LEBs)
>> UBIFS (ubi1:0): reserved for root: 0 bytes (0 KiB)
>> UBIFS (ubi1:0): media format: w4/r0 (latest is w5/r0), UUID C8D0E8D3-8394-445A-9
>> 089-95BD864D5949, big LPT model
>
>
> However, the image still mounts and works and on next boots also the
> fastmap seems to be functional. Scanning is fast. But now UBI complains
> about failing assert:
>
>
>> ubi1: default fastmap pool size: 256
>> ubi1: default fastmap WL pool size: 128
>> ubi1: attaching mtd1
>> ubi1: attached by fastmap
>> ubi1: fastmap pool size: 256
>> ubi1: fastmap WL pool size: 128
>> UBI assert failed in ubi_wl_init at 1666 (pid 1)
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.1 #3
>> Hardware name: Freescale i.MX6 SoloX (Device Tree)
>> Backtrace:
>> [<c010a1b8>] (dump_backtrace) from [<c010a454>] (show_stack+0x18/0x1c)
>>  r7:eee39b00 r6:c0912ac8 r5:60000013 r4:00000000
>> [<c010a43c>] (show_stack) from [<c029edd0>] (dump_stack+0x80/0xa0)
>> [<c029ed50>] (dump_stack) from [<c03d2394>] (ubi_wl_init+0x430/0x540)
>>  r7:eee39b00 r6:eee39b04 r5:00003df7 r4:eee38040
>> [<c03d1f64>] (ubi_wl_init) from [<c03d4c94>] (ubi_attach+0x28c/0x364)
>>  r10:00000800 r9:eee37040 r8:00000040 r7:eee39c00 r6:eee39b00 r5:eee38040
>>  r4:00000000
>> [<c03d4a08>] (ubi_attach) from [<c03c9668>] (ubi_attach_mtd_dev+0x788/0xbc0)
>>  r9:eee38080 r8:00000840 r7:ef349bc0 r6:00000001 r5:eee38040 r4:00000800
>> [<c03c8ee0>] (ubi_attach_mtd_dev) from [<c0823d60>] (ubi_init+0x148/0x1e8)
>>  r10:00000000 r9:c0933600 r8:00000000 r7:c0989024 r6:ef349bc0 r5:c0989074
>>  r4:00000001
>> [<c0823c18>] (ubi_init) from [<c0101780>] (do_one_initcall+0xb0/0x154)
>>  r8:00000000 r7:c083edd0 r6:c0835838 r5:c0823c18 r4:00000007
>> [<c01016d0>] (do_one_initcall) from [<c0800e30>] (kernel_init_freeable+0x130/0x1
>> f8)
>>  r8:c0933600 r7:c083edd0 r6:c0835838 r5:0000008d r4:00000007
>> [<c0800d00>] (kernel_init_freeable) from [<c056ab6c>] (kernel_init+0x10/0x114)
>>  r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c056ab5c r4:00000000
>> [<c056ab5c>] (kernel_init) from [<c01070c8>] (ret_from_fork+0x14/0x2c)
>>  r5:c056ab5c r4:00000000
>> ubi1: attached mtd1 (name "user", size 1984 MiB)
>> ubi1: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
>> ubi1: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
>> ubi1: VID header offset: 2048 (aligned 2048), data offset: 4096
>> ubi1: good PEBs: 15864, bad PEBs: 8, corrupted PEBs: 0
>> ubi1: user volume: 1, internal volumes: 1, max. volumes count: 128
>> ubi1: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 18
>> 6152832
>> ubi1: available PEBs: 2331, total reserved PEBs: 13533, PEBs reserved for bad PE
>> B handling: 312
>> ubi1: background thread "ubi_bgt1d" started, PID 98
> ...
>> UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 105
>> UBIFS (ubi1:0): UBIFS: mounted UBI device 1, volume 0, name "user"
>> UBIFS (ubi1:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048
>>  bytes/2048 bytes
>> UBIFS (ubi1:0): FS size: 1675702272 bytes (1598 MiB, 13197 LEBs), journal size 9
>> 023488 bytes (8 MiB, 72 LEBs)
>> UBIFS (ubi1:0): reserved for root: 0 bytes (0 KiB)
>> UBIFS (ubi1:0): media format: w4/r0 (latest is w5/r0), UUID C8D0E8D3-8394-445A-9
>> 089-95BD864D5949, big LPT model
>
>
> The line 1666 reads:
>
>>       ubi_assert(ubi->good_peb_count == found_pebs);
>
>
> Why the assert fails? Where should I look at to fix this? Is this
> something to worry about?

Now things get interesting. If UBI is unable to write a new fastmap it
makes sure that the current one,
which is now outdated and wrong, will be erased.
This seemed to happen in your case since I don't see a "Unable to
invalidate current fastmap!" message
and UBI did not change to read-only mode.

As it looks the fastmap invalidation code has a problem and you end up
with an outdated fastmap which
is obviously bad.

Can you share me this UBI image such that I can have a quick look why
the invalidation did not work?

-- 
Thanks,
//richard
