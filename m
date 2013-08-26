Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDt9p-0001Q4-8v
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 09:32:23 +0000
Received: by mail-lb0-f169.google.com with SMTP id u10so2234319lbi.28
 for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2013 02:31:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5217B101.3040306@nod.at>
References: <CACQ1gAgOS5kpykb1jxnRJUNCmdC1jwmmWr5cQ7aazKVvMjBPWQ@mail.gmail.com>
 <CACQ1gAj2bNOnnCqLjALW0LiXYiDw_CTYUTgsE4Jd5pH9DkWadA@mail.gmail.com>
 <5217B101.3040306@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 26 Aug 2013 11:31:34 +0200
Message-ID: <CACQ1gAjAV-5PX_-YD7JR5uSeaXaUEu1KofLsoeZq+j=64DyifA@mail.gmail.com>
Subject: Re: Fastmap and Atmel sam-ba
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/8/23 Richard Weinberger <richard@nod.at>:
> Hi again,
>
> I have an idea what's going on. As you are using a real (and rather slow) NAND device
> erasing PEBs takes some time.
> If you attach the very first time from an image created by ubinize UBI has to erase
> all PEBs, parallel to that UBIFS requests one PEB but does not get one.
> In this case UBI has to erase one PEB in sync-mode.
>
> I have only nandsim, which is far to fast to hit that bug.
> Who wants to donate me a board with NAND memory? ;-)
>
> Anyway, can you please test the attached patch?
To answer your previous question, yes, I see the issue every time
(i.e. I can never boot)

I tried your patch, and it worked ! Good catch !

Tried it with ubi.fm_autoconvert=0, every thing works fine.

With ubi.fm_autoconvert=1, I see this at the 1st boot (It boots fine):
[    0.812500] UBI: default fastmap pool size: 95
[    0.820312] UBI: default fastmap WL pool size: 25
[    0.820312] UBI: attaching mtd2 to ubi0
[    1.273437] UBI: scanning is finished
[    1.296875] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
[    1.304687] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    1.304687] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    1.312500] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    1.320312] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
[    1.328125] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
[    1.328125] UBI: max/mean erase counter: 0/0, WL threshold: 4096,
image sequence number: 1933127782
[    1.335937] UBI: available PEBs: 306, total reserved PEBs: 1658,
PEBs reserved for bad PEB handling: 40
[    1.343750] UBI: background thread "ubi_bgt0d" started, PID 352
[    1.421875] UBI error: ubi_update_fastmap: could not find any anchor PEB
[    1.429687] UBI warning: ubi_update_fastmap: Unable to write new
fastmap, err=-28
[    1.437500] UBIFS: background thread "ubifs_bgt0_0" started, PID 354
[    1.515625] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    1.515625] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O
unit sizes: 2048 bytes/2048 bytes
[    1.523437] UBIFS: FS size: 61583360 bytes (58 MiB, 485 LEBs),
journal size 8634368 bytes (8 MiB, 68 LEBs)
[    1.531250] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.539062] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
5CA89910-239E-4C4B-9494-94E5C2990E6F, small LPT model
[    1.554687] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    1.554687] devtmpfs: mounted
[    1.562500] Freeing unused kernel memory: 112K (c0335000 - c0351000)
[    2.195312] UBI error: ubi_update_fastmap: could not find any anchor PEB
[    2.195312] UBI warning: ubi_update_fastmap: Unable to write new
fastmap, err=-28


and at the 2nd boot, no more fastmap error and scanning is slow:
[    0.804687] UBI: default fastmap pool size: 95
[    0.804687] UBI: default fastmap WL pool size: 25
[    0.812500] UBI: attaching mtd2 to ubi0
[    1.562500] UBI: scanning is finished
[    1.585937] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
[    1.585937] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    1.593750] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    1.601562] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    1.609375] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
[    1.609375] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
[    1.617187] UBI: max/mean erase counter: 2/0, WL threshold: 4096,
image sequence number: 1933127782
[    1.625000] UBI: available PEBs: 306, total reserved PEBs: 1658,
PEBs reserved for bad PEB handling: 40
[    1.640625] UBI: background thread "ubi_bgt0d" started, PID 352
[    1.656250] UBIFS: background thread "ubifs_bgt0_0" started, PID 354
[    1.718750] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    1.726562] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O
unit sizes: 2048 bytes/2048 bytes
[    1.734375] UBIFS: FS size: 61583360 bytes (58 MiB, 485 LEBs),
journal size 8634368 bytes (8 MiB, 68 LEBs)
[    1.742187] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.750000] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
5CA89910-239E-4C4B-9494-94E5C2990E6F, small LPT model
[    1.757812] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    1.765625] devtmpfs: mounted
[    1.765625] Freeing unused kernel memory: 112K (c0335000 - c0351000)

and at the 3rd boot, every thing is normal (and fast !) \o/ :
[    0.820312] UBI: default fastmap pool size: 95
[    0.828125] UBI: default fastmap WL pool size: 25
[    0.828125] UBI: attaching mtd2 to ubi0
[    0.937500] UBI: attached by fastmap
[    0.937500] UBI: fastmap pool size: 95
[    0.945312] UBI: fastmap WL pool size: 25
[    0.960937] UBI: attached mtd2 (name "UBI", size 245 MiB) to ubi0
[    0.968750] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    0.976562] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    0.984375] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[    0.992187] UBI: good PEBs: 1964, bad PEBs: 0, corrupted PEBs: 0
[    0.992187] UBI: user volume: 3, internal volumes: 1, max. volumes count: 128
[    1.000000] UBI: max/mean erase counter: 2/0, WL threshold: 4096,
image sequence number: 1933127782
[    1.007812] UBI: available PEBs: 306, total reserved PEBs: 1658,
PEBs reserved for bad PEB handling: 40
[    1.015625] UBI: background thread "ubi_bgt0d" started, PID 352
[    1.039062] UBIFS: background thread "ubifs_bgt0_0" started, PID 354
[    1.085937] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[    1.093750] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O
unit sizes: 2048 bytes/2048 bytes
[    1.101562] UBIFS: FS size: 61583360 bytes (58 MiB, 485 LEBs),
journal size 8634368 bytes (8 MiB, 68 LEBs)
[    1.109375] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.117187] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
5CA89910-239E-4C4B-9494-94E5C2990E6F, small LPT model
[    1.125000] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    1.132812] devtmpfs: mounted
[    1.140625] Freeing unused kernel memory: 112K (c0335000 - c0351000)

Thanks !

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
