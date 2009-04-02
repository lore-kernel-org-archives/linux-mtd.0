Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLv0-00068O-CH
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 12:21:21 +0000
Subject: Re: Antw: Re: Create, Flash and Mount UBIFS Images
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manuel Sahm <Manuel.Sahm@feig.de>
In-Reply-To: <49D4C59A.187F.00BC.1@feig.de>
References: <49D4BF5A.187F.00BC.1@feig.de>
	<1238672548.20906.83.camel@localhost.localdomain>
	<49D4C59A.187F.00BC.1@feig.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Apr 2009 15:20:59 +0300
Message-Id: <1238674859.20906.92.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-02 at 14:03 +0200, Manuel Sahm wrote:
> Hello, sorry for the previous post without informations...
> 
> Here are the last two steps I did embedded:
> [Attach the /dev/mtd6 to ubifs and try to mount it]
> [Before I did a "flash_eraseall /dev/mtd6" and a "ubiformat /dev/mtd6
> -s512 -f ubi.img"]
> 
> /usr/sbin # ubiattach /dev/ubi_ctrl -m6 -d6 -O512
> UBI: attaching mtd6 to ubi6
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI: attached mtd6 to ubi6

This ubi6 is weird. Do you have 6 UBI devices, or
this is just because of "-d6"? Could you please try
without "-d6"?

> UBI: MTD device name:            "Partition 7 - UPDATE : 32 MByte"
> UBI: MTD device size:            32 MiB
> UBI: number of good PEBs:        256
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             233
> UBI: total number of reserved PEBs: 23
> UBI: number of PEBs reserved for bad PEB handling: 2
> UBI: max/mean erase counter: 0/0
> UBI: background thread "ubi_bgt6d" started, PID 1336
> UBI device number 6, total 256 LEBs (33030144 bytes, 31.5 MiB),
> available 233 LEBs (30062592 bytes, 28.7 MiB), LEB size 129024 bytes
> (126.0 KiB)
> /usr/sbin # mount -t ubifs ubi
> ubiattach     ubidetach     ubimirror     ubinize       ubiupdatevol
> ubicrc32      ubiformat     ubimkvol      ubirename
> ubicrc32.pl   ubigen        ubinfo        ubirmvol
> /usr/sbin # mount -t ubifs ubi6_0 /mnt/OBIDfs_ubi/
> UBIFS: static UBI volume - read-only mode

In the previous e-mail it was said that the volume is dynamic.
Why it is static now? hmm..

> UBIFS error (pid 1391): mount_ubifs: cannot mount read-write -
> read-only media
> UBIFS: static UBI volume - read-only mode
> UBIFS error (pid 1391): validate_sb: bad superblock, error 4
> mount: mounting ubi6_0 on /mnt/OBIDfs_ubi/ failed: Invalid argument

Could you please enable UBIFS debugging ?
And then send what dmesg says you, not only what you see on the
console, please.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
