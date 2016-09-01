Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfO1o-0006aL-6p
 for linux-mtd@lists.infradead.org; Thu, 01 Sep 2016 09:11:26 +0000
Received: by mail-oi0-x236.google.com with SMTP id l203so107648550oib.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2016 02:10:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
References: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 1 Sep 2016 11:10:58 +0200
Message-ID: <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
Subject: Re: Micron qspi nor flash and UBIFS
To: Andras Szemzo <szemzo.andras@gmail.com>
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

Andras,

On Thu, Sep 1, 2016 at 10:35 AM, Andras Szemzo <szemzo.andras@gmail.com> wrote:
> Hi,
>
> I try to use the atmel QSPI controller with a Micron N25Q512 64MB qspi flash with 4.8.0-rc2 kernel.
> The driver seems working, mtd_tests runs without error.
>
> (The QSPI clock is 75MHz, the read speed is not the best btw.)
>
> ~ # modprobe mtd_speedtest dev=0
> [  113.310000] mtd_speedtest: not NAND flash, assume page size is 512 bytes.
> [  113.320000] mtd_speedtest: MTD device size 4194304, eraseblock size 65536, page size 512, count of eraseblocks 64, pages per eraseblock 128, OOB size 0
> [  158.360000] mtd_speedtest: testing eraseblock write speed
> [  169.040000] mtd_speedtest: eraseblock write speed is 383 KiB/s
> [  169.040000] mtd_speedtest: testing eraseblock read speed
> [  169.500000] mtd_speedtest: eraseblock read speed is 9061 KiB/s
> [  214.610000] mtd_speedtest: testing page write speed
> [  225.420000] mtd_speedtest: page write speed is 378 KiB/s
> [  225.430000] mtd_speedtest: testing page read speed
> [  225.990000] mtd_speedtest: page read speed is 7380 KiB/s
>
>
> My problem is I got warning at ubimkvol, and at every reboot.
> After boot, read/write works fine without error.
>
> The situation is the same when i try to mount jffs2 formatted partition instead of ubifs.
>
>  Is there anything what I missed?

Not sure, need more info first.
Can you add some debug prints to figure where exactly the write happens?

>
> Thanks,
> Andras
>
>
> ~ # mtdinfo -a
> ...
> mtd2
> Name:                           qspi-rootfs
> Type:                           nor
> Eraseblock size:                65536 bytes, 64.0 KiB
> Amount of eraseblocks:          958 (62783488 bytes, 59.9 MiB)
> Minimum input/output unit size: 1 byte
> Sub-page size:                  1 byte
> Character device major/minor:   90:4
> Bad blocks are allowed:         false
> Device is writable:             true
>
>
> ~ # ubiformat /dev/mtd2
> ubiformat: mtd2 (nor), size 62783488 bytes (59.9 MiB), 958 eraseblocks of 65536 bytes (64.0 KiB), min. I/O size 1 bytes
> libscan: scanning eraseblock 957 -- 100 % complete
> ubiformat: formatting eraseblock 957 -- 100 % complete
>
>
> ~ # ubiattach -m 2 /dev/ubi_ctrl
> ubi0: default fastmap pool size: 45
> ubi0: default fastmap WL pool size: 22
> ubi0: attaching mtd2
> ubi0: scanning is finished
> ubi0: attached mtd2 (name "qspi-rootfs", size 59 MiB)
> ubi0: PEB size: 65536 bytes (64 KiB), LEB size: 65408 bytes
> ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
> ubi0: VID header offset: 64 (aligned 64), data offset: 128
> ubi0: good PEBs: 958, bad PEBs: 0, corrupted PEBs: 0
> ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
> ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 581993421
> ubi0: available PEBs: 952, total reserved PEBs: 6, PEBs reserved for bad PEB handling: 0
> ubi0: background thread "ubi_bgt0d" started, PID 96
> UBI device number 0, total 958 LEBs (62660864 bytes, 59.8 MiB), available 952 LEBs (62268416 bytes, 59.4 MiB), LEB size 65408 bytes (63.9 KiB)
>
>
> ~ # ubimkvol -N rootfs -m /dev/ubi0
> Set volume size to 62268416
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 97 at drivers/mtd/spi-nor/spi-nor.c:1177 0x70126acd
> Writing at offset 64 into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.
> Modules linked in:
> CPU: 0 PID: 97 Comm: ubimkvol Not tainted 4.8.0-rc2 #46
> Hardware name: Atmel SAMx7
> Function entered at [<7000c539>] from [<7000b30b>]
> Function entered at [<7000b30b>] from [<7000eff5>]
> Function entered at [<7000eff5>] from [<7000f03b>]
> Function entered at [<7000f03b>] from [<70126acd>]
> Function entered at [<70126acd>] from [<701231d3>]
> Function entered at [<701231d3>] from [<7012135b>]
> Function entered at [<7012135b>] from [<7012ee33>]
> Function entered at [<7012ee33>] from [<7012f1b3>]
> Function entered at [<7012f1b3>] from [<7012d79f>]
> Function entered at [<7012d79f>] from [<70127c73>]
> Function entered at [<70127c73>] from [<701280ad>]
> Function entered at [<701280ad>] from [<70129123>]
> Function entered at [<70129123>] from [<7012b331>]
> Function entered at [<7012b331>] from [<7005b733>]
> Function entered at [<7005b733>] from [<7005bbed>]
> Function entered at [<7005bbed>] from [<7005bc2f>]
> Function entered at [<7005bc2f>] from [<70009b01>]

Can you please resolve this addresses or re-try using a kernel with
debug symbols available?
I'd like to see which UBI function triggers this exactly.

-- 
Thanks,
//richard
