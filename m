Received: from p02c11o148.mxlogic.net ([208.65.144.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1yuW-0007QR-G5
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:19:53 +0000
Message-ID: <53B2C321.4050407@lutron.com>
Date: Tue, 1 Jul 2014 10:18:09 -0400
From: Akshay Bhat <abhat@lutron.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com> <53B20A42.6020008@huawei.com>
 <53B267E6.7060708@nod.at>
In-Reply-To: <53B267E6.7060708@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue 01 Jul 2014 03:48:54 AM EDT, Richard Weinberger wrote:
> Am 01.07.2014 03:09, schrieb hujianyang:
>>>
>>> Is enabling UBI_FASTMAP the cause for the panic? If so I can disabled the
>>> feature and re-test. Do you see any compatibility issue going from:
>>> Current config -> New config -> Failsafe config
>>>
>>
>> I don't know. But I found func ubi_wl_get_peb() in drivers/mtd/ubi/wl.c
>> will return an error ENOSPC without any error messages. And this func
>> seems related with fastmap feature.
>
> I have sort of an idea what could going on.
> Akshay, can you please confirm that you face the issue only with UBI_FASTMAP=y?

I have not been able to recreate the issue with UBI_FASTMAP=n

To expedite reproducing the problem, the WL threshold was set to 128 
instead of 4096

Unit 1: UBI_FASTMAP=n; No panic
# dmesg |grep -i ubi
[    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd 
mem=256M
root=ubi0:rootfs rw ubi.mtd=11,2048 rootfstype=ubifs rootwait=1 ip=none 
quiet
loglevel=3 panic=3
[    0.478610] TCP: cubic registered
[    0.482445] UBI: attaching mtd11 to ubi0
[    1.735485] UBI: scanning is finished
[    1.747719] UBI: attached mtd11 (name "RFS", size 242 MiB) to ubi0
[    1.747746] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 
bytes
[    1.747763] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 
512
[    1.747779] UBI: VID header offset: 2048 (aligned 2048), data 
offset: 4096
[    1.747795] UBI: good PEBs: 1939, bad PEBs: 0, corrupted PEBs: 0
[    1.747811] UBI: user volume: 6, internal volumes: 1, max. volumes 
count: 128
[    1.747831] UBI: max/mean erase counter: 2811/2558, WL threshold: 
128, image
sequence number: 1541329669
[    1.747848] UBI: available PEBs: 2, total reserved PEBs: 1937, PEBs 
reserved
for bad PEB handling: 40
[    1.762580] UBI: background thread "ubi_bgt0d" started, PID 55
[    1.843707] UBIFS: background thread "ubifs_bgt0_0" started, PID 58
[    1.882095] UBIFS: mounted UBI device 0, volume 0, name 
"rootfs"(null)
[    1.882120] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit
sizes: 2048 bytes/2048 bytes
[    1.882144] UBIFS: FS size: 103485440 bytes (98 MiB, 815 LEBs), 
journal size
9023488 bytes (8 MiB, 72 LEBs)
[    1.882159] UBIFS: reserved for root: 0 bytes (0 KiB)
[    1.882185] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
4E0D06C8-F441-4E9D-9BF6-4EC7D576A269, small LPT model
[    1.883217] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    4.556647] UBIFS: background thread "ubifs_bgt0_4" started, PID 292
[    4.612160] UBIFS: mounted UBI device 0, volume 4, name 
"logging"(null)
[    4.612191] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit
sizes: 2048 bytes/2048 bytes
[    4.612213] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal 
size
1015809 bytes (0 MiB, 6 LEBs)
[    4.612229] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    4.612254] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
AB9F5353-2682-409D-8070-63E40E0108E1, small LPT model
[    4.637764] UBIFS: background thread "ubifs_bgt0_2" started, PID 294
[    4.664091] UBIFS: recovery needed
[    4.755545] UBIFS: recovery completed
[    4.755789] UBIFS: mounted UBI device 0, volume 2, name 
"database"(null)
[    4.755810] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit
sizes: 2048 bytes/2048 bytes
[    4.755832] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal 
size
1015809 bytes (0 MiB, 6 LEBs)
[    4.755848] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    4.755872] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
7243AE4C-AAEB-491F-9006-40B6EE8DCED2, small LPT model
# cat /sys/class/ubi/ubi0/max_ec
2811


Unit 2:  UBI_FASTMAP=y; Panic at max_ec = 165

[48173.891239] UBIFS error (pid 516): ubifs_write_inode: can't write 
inode 66, error -30
[48203.906863] UBIFS error (pid 516): make_reservation: cannot reserve 
160 bytes in jhead 1, error -30

#########REBOOT the device##############
# dmesg |grep -i ubi
[    0.000000] Kernel command line: console=ttyO0,115200n8 noinitrd 
mem=256M
root=ubi0:rootfs rw ubi.mtd=11,2048 rootfstype=ubifs rootwait=1 ip=none 
quiet
loglevel=3 panic=3
[    0.477729] TCP: cubic registered
[    0.481541] UBI: default fastmap pool size: 95
[    0.481555] UBI: default fastmap WL pool size: 25
[    0.481570] UBI: attaching mtd11 to ubi0
[    1.697741] UBI: scanning is finished
[    1.710069] UBI: attached mtd11 (name "RFS", size 242 MiB) to ubi0
[    1.710096] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 
bytes
[    1.710113] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 
512
[    1.710129] UBI: VID header offset: 2048 (aligned 2048), data 
offset: 4096
[    1.710145] UBI: good PEBs: 1939, bad PEBs: 0, corrupted PEBs: 0
[    1.710161] UBI: user volume: 6, internal volumes: 1, max. volumes 
count: 128
[    1.710180] UBI: max/mean erase counter: 165/126, WL threshold: 128, 
image
sequence number: 119408202
[    1.710197] UBI: available PEBs: 0, total reserved PEBs: 1939, PEBs 
reserved
for bad PEB handling: 40
[    1.724904] UBI: background thread "ubi_bgt0d" started, PID 55
[    1.806465] UBIFS: background thread "ubifs_bgt0_0" started, PID 58
[    1.807324] UBIFS: recovery needed
[    2.166247] UBIFS: recovery completed
[    2.166539] UBIFS: mounted UBI device 0, volume 0, name 
"rootfs"(null)
[    2.166560] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit
sizes: 2048 bytes/2048 bytes
[    2.166583] UBIFS: FS size: 103485440 bytes (98 MiB, 815 LEBs), 
journal size
9023488 bytes (8 MiB, 72 LEBs)
[    2.166598] UBIFS: reserved for root: 0 bytes (0 KiB)
[    2.166623] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
4E0D06C8-F441-4E9D-9BF6-4EC7D576A269, small LPT model
[    2.168698] VFS: Mounted root (ubifs filesystem) on device 0:11.
[    4.826134] UBIFS: background thread "ubifs_bgt0_4" started, PID 292
[    4.836046] UBIFS: recovery needed
[    4.980129] UBIFS: recovery completed
[    4.981698] UBIFS: mounted UBI device 0, volume 4, name 
"logging"(null)
[    4.981722] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit
sizes: 2048 bytes/2048 bytes
[    4.981743] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal 
size
1015809 bytes (0 MiB, 6 LEBs)
[    4.981759] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    4.981783] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
91E2E462-16AE-4DAB-8DD4-03095DA66B01, small LPT model
[    5.021855] UBIFS: background thread "ubifs_bgt0_2" started, PID 294
[    5.033250] UBIFS: recovery needed
[    5.202984] UBIFS: recovery completed
[    5.203230] UBIFS: mounted UBI device 0, volume 2, name 
"database"(null)
[    5.203251] UBIFS: LEB size: 126976 bytes (124 KiB), min./max. I/O 
unit
sizes: 2048 bytes/2048 bytes
[    5.203272] UBIFS: FS size: 6094848 bytes (5 MiB, 48 LEBs), journal 
size
1015809 bytes (0 MiB, 6 LEBs)
[    5.203288] UBIFS: reserved for root: 287874 bytes (281 KiB)
[    5.203313] UBIFS: media format: w4/r0 (latest is w4/r0), UUID
D3BF3ADD-4A86-4ACD-BF4C-C86ABEF571EE, small LPT model
# cat /sys/class/ubi/ubi0/max_ec
165

> Thanks,
> //richard
>
>
