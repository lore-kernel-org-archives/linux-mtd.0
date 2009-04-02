Received: from mail.feig.de ([195.145.139.42] helo=srv-mail02.feig.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLhJ-0000oL-Hf
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 12:07:11 +0000
Message-Id: <49D4C682.187F.00BC.1@feig.de>
Date: Thu, 02 Apr 2009 14:07:01 +0200
From: "Manuel Sahm" <Manuel.Sahm@feig.de>
To: <dedekind@infradead.org>
Subject: Re: Re: Create, Flash and Mount UBIFS Images
References: <49D4BF5A.187F.00BC.1@feig.de>
	<1238672548.20906.83.camel@localhost.localdomain>
In-Reply-To: <1238672548.20906.83.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, sorry for the previous post without informations...

Here are the last two steps I did embedded:
[Attach the /dev/mtd6 to ubifs and try to mount it]
[Before I did a "flash_eraseall /dev/mtd6" and a "ubiformat /dev/mtd6
-s512 -f ubi.img"]

/usr/sbin # ubiattach /dev/ubi_ctrl -m6 -d6 -O512
UBI: attaching mtd6 to ubi6
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd6 to ubi6
UBI: MTD device name:            "Partition 7 - UPDATE : 32 MByte"
UBI: MTD device size:            32 MiB
UBI: number of good PEBs:        256
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             233
UBI: total number of reserved PEBs: 23
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 0/0
UBI: background thread "ubi_bgt6d" started, PID 1336
UBI device number 6, total 256 LEBs (33030144 bytes, 31.5 MiB),
available 233 LEBs (30062592 bytes, 28.7 MiB), LEB size 129024 bytes
(126.0 KiB)
/usr/sbin # mount -t ubifs ubi
ubiattach     ubidetach     ubimirror     ubinize       ubiupdatevol
ubicrc32      ubiformat     ubimkvol      ubirename
ubicrc32.pl   ubigen        ubinfo        ubirmvol
/usr/sbin # mount -t ubifs ubi6_0 /mnt/OBIDfs_ubi/
UBIFS: static UBI volume - read-only mode
UBIFS error (pid 1391): mount_ubifs: cannot mount read-write -
read-only media
UBIFS: static UBI volume - read-only mode
UBIFS error (pid 1391): validate_sb: bad superblock, error 4
mount: mounting ubi6_0 on /mnt/OBIDfs_ubi/ failed: Invalid argument



Any idea why this seems to fail ?

By the way if I use:
"flash_eraseall /dev/mtd6" 
"ubiformat /dev/mtd6 -s512"
"ubiattach /dev/ubi_ctrl -d6 -m6 -O512"
"ubimkvol /dev/ubi6 -m -N "TEST""
"mount -t ubifs ubi6_0 /mnt/ubi/"

this works ??


Thank you very much

>>> Artem Bityutskiy <dedekind@infradead.org> 02.04.2009 13:42 >>>
Hi,

On Thu, 2009-04-02 at 13:36 +0200, Manuel Sahm wrote:
> Hello, 
> 
> Could anybody explain me how to build an ubi.img that I could flash
> inside my system ? 
> 
> NAND Flash: Micron 256 MByte 
> Physical Eraseblock Size = 131072 
> Logical Eraseblock Size = 129024 
> Min I/O Size = 2048 
> SubPage = 512 
> 
> The Partition /dev/mtd6 is 32MByte. 
> 
> 
> I did the following steps: 
> On my host I created the file through: 
> 
> mkfs.ubifs -d /exports/ -m 2048 -e 129024 -o ubifs.img -x "none" -c
> 2047 
> ubinize -p 128KiB -m 2048 -s 512 -O 512 -o ubi.img ubi.ini 
> 
> with ubi.ini 
> [TEST] 
> mode=ubi 
> image=ubifs.img 
> vol_id=0 
> vol_size=3MiB 
> vol_type=dynamic 
> vol_alignment=1 
> vol_flags=autoresize 
> 
> Then I copy this creted ubi.img to my embedded system. 
> 
> On my embedded system I did: 
> flash_eraseall /dev/mtd6 
> ubiformat /dev/mtd6 -s 512 -f ubi.img 
> ubiattach /dev/ubi_ctrl -m6 -d6 -O512 
> mount -t ubifs ubi6_0 /mnt/ubi6 
> 
> Then at the mount command I got the error: 
> validate_sb: bad superblock 
> 
> So what´s wrong ? 

Could you please try to enable debugging, as it is asked here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport


And I do not understand why you did not provide all UBIFS output.
The print is:

ubifs_err("bad superblock, error %d", err);

and you did not provide error code number.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
