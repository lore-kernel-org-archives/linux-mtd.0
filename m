Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDEU-0003HJ-DZ
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:42:46 +0000
Message-ID: <1413812506.7906.286.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: Does init_constants_early ignore LEBs being erased?
 Complains about amount.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 20 Oct 2014 16:41:46 +0300
In-Reply-To: <CACna6rxV9UbXOtq7w+HGYZQVi8-4v+pZOtK98cGJaCwA+njUVg@mail.gmail.com>
References: <CACna6rxV9UbXOtq7w+HGYZQVi8-4v+pZOtK98cGJaCwA+njUVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-10-17 at 08:29 +0200, Rafał Miłecki wrote:
> UBI: available PEBs: 0, total reserved PEBs: 986, PEBs reserved for
> bad PEB handling: 20
> UBI: background thread "ubi_bgt0d" started, PID 257
> UBI: ubiblock0_0 created from ubi0:0(rootfs)
> UBIFS error (pid 1): init_constants_early: too few LEBs (15), min. is 17

UBIFS wants more LEBs in the volume.

> *** 5 seconds later ***
> UBIFS: default file-system created
> UBIFS: background thread "ubifs_bgt0_1" started, PID 302
> UBIFS: mounted UBI device 0, volume 1, name "rootfs_data"
> UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:
> 2048 bytes/2048 bytes
> UBIFS: FS size: 118849536 bytes (113 MiB, 936 LEBs), journal size
> 5967872 bytes (5 MiB, 47 LEBs)

This is a different volume mounted, it seems, it has 47 LEBs.

> UBIFS: reserved for root: 4952683 bytes (4836 KiB)
> UBIFS: media format: w4/r0 (latest is w4/r0), UUID
> A3D6B177-D8CC-43AA-A15F-5A0480428338, small LPT model
> 
> My guess is there is nothing wrong happening above.

No, UBIFS refused to mount one of the UBI volumes. The
'init_constants_early()' function is called from the mount path.

>  I guess UBIFS
> aborted because there weren't enough LEBs and later (after UBI
> prepared empty LEBs) UBIFS was triggered again.
> 
> However this "UBIFS error" looks like a serious error, a bit scary ;)
> Would it be possible to detect that there are some LEBs being prepared
> and if so, change the above message to something like
> "UBIFS: too few LEBs (15), min. is 17, waiting for UBI to prepare more"

I do not think there is anything being prepared. The messages are for
different volumes. Do you have more than 1?

Tanya's patch should improve the messages - they will print the volume
ID they belong to. Now you see messages, but they may be for different
volumes.
