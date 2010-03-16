Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrRuH-0000Ix-4h
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 08:13:45 +0000
Received: by wwb17 with SMTP id 17so1271249wwb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Mar 2010 01:13:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
Date: Tue, 16 Mar 2010 16:13:38 +0800
Message-ID: <a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
Subject: Re: Can not mount UBIFS
From: =?Big5?B?qkykX65t?= <okpalin@gmail.com>
To: Bosi Daniele <Daniele.Bosi@mta.it>, GUIDA Nicola <Nicola.GUIDA@numonyx.com>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I try to sync /driver/mtd/ubi/*, /fs/ubifs/*, and
/include/linux/mtd/ubi.h with
git://git.infradead.org/~dedekind/ubifs-v2.6.29.git
But mount still fail.
I will try nandsim latter.

To get more information, I enable UBI and UBIFS debugging message,
described below..
I enable UBI debugging: UBI debugging messages, Extra self-check, and
all Aditional UBI debugging messages.
I also enable UBIFS: Enable debugging with message level 3 and Enable
extra checks.

Below are my entered command and debug message get from "adb logcat"

My entered command:
    # cat /proc/mtd
    cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 00500000 00020000 "recovery"
    mtd1: 00800000 00020000 "boot"
    mtd2: 077a0000 00020000 "system"
    mtd3: 02000000 00020000 "cache"
    mtd4: 14b00000 00020000 "userdata"

    # flash_eraseall /dev/mtd/mtd3
    flash_eraseall /dev/mtd/mtd3
    Erasing 128 Kibyte @ 2000000 -- 100 % complete.

    # ubiattach /dev/ubi_ctrl -m 3
    ubiattach /dev/ubi_ctrl -m 3
    UBI device number 0, total 256 LEBs (32505856 bytes, 31.0 MiB),
available 250 LEBs (31744000 bytes, 30.3 MiB), LEB size 126976 bytes
(124.0 KiB)

    # ubinfo
    ubinfo
    UBI version:                    1
    Count of UBI devices:           1
    UBI control device major/minor: 10:57
    Present UBI devices:            ubi0

    # ubimkvol /dev/ubi0 -N rootfs -s 10MiB
    ubimkvol /dev/ubi0 -N rootfs -s 10MiB
    Volume ID 0, size 83 LEBs (10539008 bytes, 10.1 MiB), LEB size
126976 bytes (124.0 KiB), dynamic, name "rootfs", alignment 1

    # ubinfo -a
    ubinfo -a
    UBI version:                    1
    Count of UBI devices:           1
    UBI control device major/minor: 10:57
    Present UBI devices:            ubi0

    ubi0
    Volumes count:                           1
    Logical eraseblock size:                 126976 bytes, 124.0 KiB
    Total amount of logical eraseblocks:     256 (32505856 bytes, 31.0 MiB)
    Amount of available logical eraseblocks: 167 (21204992 bytes, 20.2 MiB)
    Maximum count of volumes                 128
    Count of bad physical eraseblocks:       0
    Count of reserved physical eraseblocks:  2
    Current maximum erase counter value:     2
    Minimum input/output unit size:          2048 bytes
    Character device major/minor:            249:0
    Present volumes:                         0

    Volume ID:   0 (on ubi0)
    Type:        dynamic
    Alignment:   1
    Size:        83 LEBs (10539008 bytes, 10.1 MiB)
    State:       OK
    Name:        rootfs
    Character device major/minor: 249:1

    # mount -t ubifs ubi0_0 /cache
    mount -t ubifs ubi0_0 /cache
    mount: Invalid argument

    # mount -t ubifs ubi0:rootfs /cache
    mount -t ubifs ubi0:rootfs /cache
    mount: Invalid argument

Debug message from "adb logcat":
<7>UBIFS DBG (pid 1378): ubifs_get_sb: name ubi0:rootfs, flags 0x8000
<7>UBI DBG (pid 1378): ubi_open_volume_path: open volume ubi0:rootfs, mode =
1
<7>UBI DBG (pid 1378): ubi_open_volume_nm: open device 0, volume rootfs, mo=
de 1
<7>UBI DBG (pid 1378): ubi_open_volume: open device 0, volume 0, mode 1
<7>UBIFS DBG (pid 1378): ubifs_get_sb: opened ubi0_0
<7>UBI DBG (pid 1378): ubi_open_volume: open device 0, volume 0, mode 2
<7>UBI DBG (pid 1378): ubi_is_mapped: test LEB 0:0
<7>UBIFS DBG (pid 1378): ubifs_read_node: LEB 0:0, superblock node, length =
4096
<7>UBI DBG (pid 1378): ubi_leb_read: read 4096 bytes from LEB 0:0:0
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 4096 bytes from offset 0
of LEB 0:0, PEB 1
<7>UBI DBG (pid 1378): ubi_io_read: read 4096 bytes from PEB 1:4096
<7>UBIFS DBG (pid 1378): ubifs_start_scan: scan LEB 1:0
<7>UBI DBG (pid 1378): ubi_leb_read: read 126976 bytes from LEB 0:1:0
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 126976 bytes from offset
0 of LEB 0:1, PEB 129
<7>UBI DBG (pid 1378): ubi_io_read: read 126976 bytes from PEB 129:4096
<7>UBIFS DBG (pid 1380): ubifs_bg_thread: background thread
"ubifs_bgt0_0" started, PID 1380
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:0 (126976 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:512 (126464 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 2=
048
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:2048 (124928 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:2560 (124416 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 4=
096
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 1:4096 (122880 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: hit empty space
<7>UBIFS DBG (pid 1378): ubifs_end_scan: stop scanning LEB 1 at offset 4096
<7>UBIFS DBG (pid 1378): ubifs_start_scan: scan LEB 2:0
<7>UBI DBG (pid 1378): ubi_leb_read: read 126976 bytes from LEB 0:2:0
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 126976 bytes from offset
0 of LEB 0:2, PEB 130
<7>UBI DBG (pid 1378): ubi_io_read: read 126976 bytes from PEB 130:4096
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:0 (126976 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:512 (126464 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 2=
048
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:2048 (124928 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning master node
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:2560 (124416 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: scanning padding node
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: 1508 bytes padded, offset now 4=
096
<7>UBIFS DBG (pid 1378): ubifs_scan: look at LEB 2:4096 (122880 bytes left)
<7>UBIFS DBG (pid 1378): ubifs_scan_a_node: hit empty space
<7>UBIFS DBG (pid 1378): ubifs_end_scan: stop scanning LEB 2 at offset 4096
<7>UBIFS DBG (pid 1378): ubifs_read_node: LEB 10:0, indexing node, length 4=
8
<7>UBI DBG (pid 1378): ubi_leb_read: read 48 bytes from LEB 0:10:0
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 48 bytes from offset 0
of LEB 0:10, PEB 131
<7>UBI DBG (pid 1378): ubi_io_read: read 48 bytes from PEB 131:4096
<5>UBIFS: recovery needed
<7>UBIFS DBG (pid 1378): ubifs_recover_inl_heads: checking index head at 10=
:2048
<7>UBI DBG (pid 1378): ubi_leb_read: read 2048 bytes from LEB 0:10:2048
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 2048 bytes from offset
2048 of LEB 0:10, PEB 131
<7>UBI DBG (pid 1378): ubi_io_read: read 2048 bytes from PEB 131:6144
<7>UBIFS DBG (pid 1378): ubifs_recover_inl_heads: checking LPT head at 6:20=
48
<7>UBI DBG (pid 1378): ubi_leb_read: read 2048 bytes from LEB 0:6:2048
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 2048 bytes from offset
2048 of LEB 0:6, PEB 2
<7>UBI DBG (pid 1378): ubi_io_read: read 2048 bytes from PEB 2:6144
<7>UBI DBG (pid 1378): ubi_leb_read: read 11 bytes from LEB 0:6:419
<7>UBI DBG (pid 1378): ubi_eba_read_leb: read 11 bytes from offset 419
of LEB 0:6, PEB 2
<7>UBI DBG (pid 1378): ubi_io_read: read 11 bytes from PEB 2:4515
<3>UBIFS error (pid 1378): check_lpt_type: invalid type (0) in LPT node typ=
e 2

Backtrace:

[<c002da74>]
(dump_backtrace+0x0/0x10c)
from [<c038c2f0>]
(dump_stack+0x18/0x1c)
 r7:00000000
 r6:00000001
 r5:00000000
 r4:00000002

[<c038c2d8>]
(dump_stack+0x0/0x1c)
from [<c019d178>]
(check_lpt_type+0x70/0x84)

[<c019d108>]
(check_lpt_type+0x0/0x84)
from [<c019fc34>]
(ubifs_lpt_init+0x2e0/0x880)
 r4:dbbe7000

[<c019f954>]
(ubifs_lpt_init+0x0/0x880)
from [<c0181e3c>]
(ubifs_fill_super+0xb74/0x1a80)

[<c01812c8>]
(ubifs_fill_super+0x0/0x1a80)
from [<c0182e34>]
(ubifs_get_sb+0xec/0x36c)

[<c0182d48>]
(ubifs_get_sb+0x0/0x36c)
from [<c00fb4e4>]
(vfs_kern_mount+0x58/0xac)

[<c00fb48c>]
(vfs_kern_mount+0x0/0xac)
from [<c00fb594>]
(do_kern_mount+0x3c/0xdc)
 r8:00008000
 r7:d6bee000
 r6:00000000
 r5:d6bf7000
 r4:c04bb958

[<c00fb558>]
(do_kern_mount+0x0/0xdc)
from [<c0112e4c>]
(do_mount+0x16c/0x76c)
 r9:00000000
 r8:00008000
 r7:d6bf7000
 r6:d6bee000
 r5:00000000
 r4:00000000

[<c0112ce0>]
(do_mount+0x0/0x76c)
from [<c01134dc>]
(sys_mount+0x90/0xdc)

[<c011344c>]
(sys_mount+0x0/0xdc)
from [<c0029b80>]
(ret_fast_syscall+0x0/0x2c)
 r7:00000015
 r6:afe47470
 r5:00000104
 r4:00000000

<7>UBIFS DBG (pid 1380): ubifs_bg_thread: background thread "ubifs_bgt0_0" =
stops
<7>UBI DBG (pid 1378): ubi_close_volume: close device 0, volume 0, mode 2
<7>UBI DBG (pid 1378): ubi_close_volume: close device 0, volume 0, mode 1



2010/3/11 Bosi Daniele <Daniele.Bosi@mta.it>:
> After the "ubiattatch" command you should be able to use the command "ubi=
nfo" just to see some informations on your attached ubi volumes on the devi=
ce.
>
> You should see something like...
>
> UBI version: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01
> Count of UBI devices: =A0 =A0 =A0 =A0 =A0 1
> UBI control device major/minor: 10:63
> Present UBI devices: =A0 =A0 =A0 =A0 =A0 =A0ubi0
>
> If this is ok I suppose there's something wrong into your "mount" command=
 sintax
>
> Bye Daniele
>
>
> -----Messaggio originale-----
> Da: okpalin@gmail.com [mailto:okpalin@gmail.com]
> Inviato: gioved=EC 11 marzo 2010 13.33
> A: Bosi Daniele; linux-mtd@lists.infradead.org
> Oggetto: Re: Can not mount UBIFS
>
> I have enabled ubi and ubifs in my kernel.
> I also find "ubifs" in /proc/filesystems.
> Here is it:
> # cat /proc/filesystems
> cat /proc/filesystems
> nodev =A0 sysfs
> nodev =A0 rootfs
> nodev =A0 bdev
> nodev =A0 proc
> nodev =A0 cgroup
> nodev =A0 debugfs
> nodev =A0 sockfs
> nodev =A0 usbfs
> nodev =A0 pipefs
> nodev =A0 anon_inodefs
> nodev =A0 tmpfs
> nodev =A0 inotifyfs
> nodev =A0 configfs
> nodev =A0 devpts
> =A0 =A0 =A0 =A0ext3
> =A0 =A0 =A0 =A0ext2
> nodev =A0 ramfs
> =A0 =A0 =A0 =A0vfat
> =A0 =A0 =A0 =A0msdos
> =A0 =A0 =A0 =A0yaffs
> =A0 =A0 =A0 =A0yaffs2
> nodev =A0 ubifs
>
> 2010/3/11 Bosi Daniele <Daniele.Bosi@mta.it>:
>> It seems like you have your first problem with the Linux "mount" command=
. Please try to be sure that your kernel supports ubi file systems. To chec=
k simply if this is true do on your device a
>> cat /proc/filesystem
>> and verify that "ubi" is present
>>
>> If it's not, you have to enable ubi options into your kernel
>>
>> Bye Daniele
>>
>>
>> -----Messaggio originale-----
>> Da: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@list=
s.infradead.org] Per conto di okpalin@gmail.com
>> Inviato: gioved=EC 11 marzo 2010 8.44
>> A: linux-mtd@lists.infradead.org
>> Cc: okpalin@gmail.com
>> Oggetto: Can not mount UBIFS
>>
>> Dear all,
>>
>> I am trying UBIFS on android on nVidia Tegra T20.
>> I add a new MTD partition, flash_eraseall, ubiattach, ubimkvol, and moun=
t it.
>> Error occurs when mount it.
>>
>> The total command I enter is:
>> =A0 =A0# ubidetach /dev/ubi_ctrl -d 0
>> =A0 =A0ubidetach /dev/ubi_ctrl -d 0
>> =A0 =A0# flash_eraseall /dev/mtd/mtd4
>> =A0 =A0flash_eraseall /dev/mtd/mtd4
>> =A0 =A0Erasing 128 Kibyte @ 2000000 -- 100 % complete.
>> =A0 =A0# ubiattach /dev/ubi_ctrl -m 4
>> =A0 =A0ubiattach /dev/ubi_ctrl -m 4
>> =A0 =A0UBI device number 0, total 256 LEBs (32505856 bytes, 31.0 MiB),
>> available 250 LEBs (31744000 bytes, 30.3 MiB), LEB size 126976 bytes
>> (124.0 KiB)
>> =A0 =A0# ubimkvol /dev/ubi0 -m -N rootfs
>> =A0 =A0ubimkvol /dev/ubi0 -m -N rootfs
>> =A0 =A0Set volume size to 31744000
>> =A0 =A0Volume ID 0, size 250 LEBs (31744000 bytes, 30.3 MiB), LEB size
>> 126976 bytes (124.0 KiB), dynamic, name "rootfs", alignment 1
>> =A0 =A0# mount -t ubifs ubi0:rootfs /sdcard
>> =A0 =A0mount -t ubifs ubi0:rootfs /sdcard
>> =A0 =A0mount: Invalid argument
>>
>> The NAND flash is HY27UF084G2B.
>>
>> Below is the debug message from "adb logcat":
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_get_sb: name
>> ubi0:rootfs, flags 0x8000
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_open_volume_nm: open
>> volume rootfs, mode 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_open_volume: open device
>> 0 volume 0, mode 1
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_get_sb: opened ubi0_=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_open_volume: open device
>> 0 volume 0, mode 2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:25
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:26
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:27
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:28
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:29
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:30
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:31
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:32
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:33
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:34
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:35
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:36
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:37
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:38
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:39
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:40
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:41
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:42
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:43
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:44
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:45
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:46
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:47
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:48
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:49
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:50
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:51
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:52
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:53
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:54
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:55
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:56
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:57
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:58
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:59
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:60
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:61
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:62
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:63
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:64
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:65
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:66
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:67
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:68
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:69
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:70
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:71
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:72
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:73
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:74
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:75
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:76
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:77
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:78
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:79
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:80
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:81
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:82
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:83
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:84
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:85
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:86
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:87
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:88
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:89
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:90
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:91
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:92
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:93
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:94
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:95
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:96
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:97
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:98
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:99
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23=
9
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
3
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
4
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
5
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
7
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
8
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24=
9
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): set_ltab: LEB 6 free
>> 126976 dirty 0 to 124928 777
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_change: atomically
>> write 2048 bytes to LEB 0:6
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 2 EC 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB 2
>> EC 1 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_atomic_leb_change:
>> change LEB 0:6, PEB -1, write VID hdr to PEB 2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 2:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xb4c0800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 2:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xb4c1000 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: spa=
ce_bits 14
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
>> lpt_lnum_bits 2
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
>> lpt_offs_bits 17
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
>> lpt_spc_bits 17
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: pcn=
t_bits 6
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: lnu=
m_bits 8
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: pno=
de_sz 17
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: nno=
de_sz 12
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: lta=
b_sz 11
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: lsa=
ve_sz 259
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: lsa=
ve_cnt 256
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: lpt=
_hght 3
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: big=
_lpt 0
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: LPT
>> root is at 6:1248
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: LPT
>> head is at 6:2048
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: LPT
>> ltab is at 6:1260
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
>> LEB Properties Tree created (LEBs 6-7)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 0:0,
>> superblock node, length 4096 (aligned 4096)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 4096
>> bytes to LEB 0:0:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 1 EC 2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB 1
>> EC 2 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
>> hdr and 4096 bytes at offset 0 of LEB 0:0, PEB 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 1:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xb4a0800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 4096
>> bytes to PEB 1:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xb4a1000 len=3D0x=
1000
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
>> default superblock created at LEB 0:0
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 1:0,
>> master node, length 512 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:1:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 129 EC 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
>> 129 EC 1 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
>> hdr and 2048 bytes at offset 0 of LEB 0:1, PEB 129
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 129
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 129:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4a0800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 129:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4a1000 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 2:0,
>> master node, length 512 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:2:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 130 EC 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
>> 130 EC 1 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
>> hdr and 2048 bytes at offset 0 of LEB 0:2, PEB 130
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 130
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 130:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4c0800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 130:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4c1000 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
>> default master node created at LEB 1:0
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
>> 10:0, indexing node, length 48 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:10:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 131 EC 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
>> 131 EC 1 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
>> hdr and 2048 bytes at offset 0 of LEB 0:10, PEB 131
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 131
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 131:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4e0800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 131:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4e1000 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
>> default root indexing node created LEB 10:0
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
>> 11:0, inode node, length 160 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:11:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 132 EC 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
>> 132 EC 1 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
>> hdr and 2048 bytes at offset 0 of LEB 0:11, PEB 132
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 132
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 132:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc500800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 132:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc501000 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
>> root inode created at LEB 11:0
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 3:0,
>> commit start node, length 32 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:3:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 133 EC 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
>> 133 EC 1 to the protection queue
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
>> hdr and 2048 bytes at offset 0 of LEB 0:3, PEB 133
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
>> VID header to PEB 133
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 133:2048
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc520800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 133:4096
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc521000 len=3D0x=
800
>>
>> I/PrintK =A0( 1151): <5>UBIFS: default file-system created
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_read_node: LEB 0:0,
>> superblock node, length 4096
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 4096
>> bytes from LEB 0:0:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read 4096
>> bytes from offset 0 of LEB 0:0, PEB 1
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 4096 bytes
>> from PEB 1:4096
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_start_scan: scan LEB=
 1:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 126976
>> bytes from LEB 0:1:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read
>> 126976 bytes from offset 0 of LEB 0:1, PEB 129
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 126976
>> bytes from PEB 129:4096
>>
>> V/PrintK =A0( 1152): <7>UBIFS DBG (pid 1152): ubifs_bg_thread:
>> background thread "ubifs_bgt0_0" started, PID 1152
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
>> 1:0 (126976 bytes left)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
>> scanning master node
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
>> 1:512 (126464 bytes left)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
>> scanning padding node
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: 1508
>> bytes padded, offset now 2048
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
>> 1:2048 (124928 bytes left)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: hit emp=
ty space
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_end_scan: stop
>> scanning LEB 1 at offset 2048
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_start_scan: scan LEB=
 2:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 126976
>> bytes from LEB 0:2:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read
>> 126976 bytes from offset 0 of LEB 0:2, PEB 130
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 126976
>> bytes from PEB 130:4096
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
>> 2:0 (126976 bytes left)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
>> scanning master node
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
>> 2:512 (126464 bytes left)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
>> scanning padding node
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: 1508
>> bytes padded, offset now 2048
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
>> 2:2048 (124928 bytes left)
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: hit emp=
ty space
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_end_scan: stop
>> scanning LEB 2 at offset 2048
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_read_node: LEB 10:0,
>> indexing node, length 48
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 48 bytes
>> from LEB 0:10:0
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read 48
>> bytes from offset 0 of LEB 0:10, PEB 131
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 48 bytes
>> from PEB 131:4096
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
>> 1:2048, master node, length 512 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:1:2048
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write
>> 2048 bytes at offset 2048 of LEB 0:1, PEB 129
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 129:6144
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4a1800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
>> 2:2048, master node, length 512 (aligned 2048)
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
>> bytes to LEB 0:2:2048
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write
>> 2048 bytes at offset 2048 of LEB 0:2, PEB 130
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
>> bytes to PEB 130:6144
>>
>> D/PrintK =A0( 1151): <6>tegra_nand_write: write: to=3D0xc4c1800 len=3D0x=
800
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 11 bytes
>> from LEB 0:6:1260
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read 11
>> bytes from offset 1260 of LEB 0:6, PEB 2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 11 bytes
>> from PEB 2:5356
>>
>> E/PrintK =A0( 1151): <3>UBIFS error (pid 1151): check_lpt_type: invalid
>> type (0) in LPT node type 2
>>
>> W/PrintK =A0( 1151): Backtrace:
>>
>> V/PrintK =A0( 1151):
>>
>> W/PrintK =A0( 1151): [<c002ca74>]
>>
>> V/PrintK =A0( 1151): (dump_backtrace+0x0/0x10c)
>>
>> V/PrintK =A0( 1151): from [<c037a118>]
>>
>> V/PrintK =A0( 1151): (dump_stack+0x18/0x1c)
>>
>> W/PrintK =A0( 1151): =A0r7:00000000
>>
>> V/PrintK =A0( 1151): =A0r6:00000001
>>
>> V/PrintK =A0( 1151): =A0r5:00000000
>>
>> V/PrintK =A0( 1151): =A0r4:00000002
>>
>> V/PrintK =A0( 1151):
>>
>> W/PrintK =A0( 1151): [<c037a100>]
>>
>> V/PrintK =A0( 1151): (dump_stack+0x0/0x1c)
>>
>> V/PrintK =A0( 1151): from [<c01967b0>]
>>
>> V/PrintK =A0( 1151): (check_lpt_type+0x70/0x84)
>>
>> W/PrintK =A0( 1151): [<c0196740>]
>>
>> V/PrintK =A0( 1151): (check_lpt_type+0x0/0x84)
>>
>> V/PrintK =A0( 1151): from [<c019926c>]
>>
>> V/PrintK =A0( 1151): (ubifs_lpt_init+0x2e0/0x880)
>>
>> W/PrintK =A0( 1151): =A0r4:dbb34000
>>
>> V/PrintK =A0( 1151):
>>
>> W/PrintK =A0( 1151): [<c0198f8c>]
>>
>> V/PrintK =A0( 1151): (ubifs_lpt_init+0x0/0x880)
>>
>> V/PrintK =A0( 1151): from [<c017bd84>]
>>
>> V/PrintK =A0( 1151): (ubifs_fill_super+0xad8/0x1a74)
>>
>> W/PrintK =A0( 1151): [<c017b2ac>]
>>
>> V/PrintK =A0( 1151): (ubifs_fill_super+0x0/0x1a74)
>>
>> V/PrintK =A0( 1151): from [<c017cee4>]
>>
>> V/PrintK =A0( 1151): (ubifs_get_sb+0x1c4/0x354)
>>
>> W/PrintK =A0( 1151): [<c017cd20>]
>>
>> V/PrintK =A0( 1151): (ubifs_get_sb+0x0/0x354)
>>
>> V/PrintK =A0( 1151): from [<c00f4ebc>]
>>
>> V/PrintK =A0( 1151): (vfs_kern_mount+0x58/0xac)
>>
>> W/PrintK =A0( 1151): [<c00f4e64>]
>>
>> V/PrintK =A0( 1151): (vfs_kern_mount+0x0/0xac)
>>
>> V/PrintK =A0( 1151): from [<c00f4f6c>]
>>
>> V/PrintK =A0( 1151): (do_kern_mount+0x3c/0xdc)
>>
>> W/PrintK =A0( 1151): =A0r8:00008000
>>
>> V/PrintK =A0( 1151): =A0r7:db1fb000
>>
>> V/PrintK =A0( 1151): =A0r6:00000000
>>
>> V/PrintK =A0( 1151): =A0r5:db1c3000
>>
>> V/PrintK =A0( 1151): =A0r4:c04a56b8
>>
>> V/PrintK =A0( 1151):
>>
>> W/PrintK =A0( 1151): [<c00f4f30>]
>>
>> V/PrintK =A0( 1151): (do_kern_mount+0x0/0xdc)
>>
>> V/PrintK =A0( 1151): from [<c010c8d8>]
>>
>> V/PrintK =A0( 1151): (do_mount+0x16c/0x76c)
>>
>> W/PrintK =A0( 1151): =A0r9:00000000
>>
>> V/PrintK =A0( 1151): =A0r8:00008000
>>
>> V/PrintK =A0( 1151): =A0r7:db1c3000
>>
>> V/PrintK =A0( 1151): =A0r6:db1fb000
>>
>> V/PrintK =A0( 1151): =A0r5:00000000
>>
>> W/PrintK =A0( 1151):
>>
>> W/PrintK =A0( 1151): r4:00000000
>>
>> V/PrintK =A0( 1151):
>>
>> W/PrintK =A0( 1151): [<c010c76c>]
>>
>> V/PrintK =A0( 1151): (do_mount+0x0/0x76c)
>>
>> V/PrintK =A0( 1151): from [<c010cf68>]
>>
>> V/PrintK =A0( 1151): (sys_mount+0x90/0xdc)
>>
>> W/PrintK =A0( 1151): [<c010ced8>]
>>
>> V/PrintK =A0( 1151): (sys_mount+0x0/0xdc)
>>
>> V/PrintK =A0( 1151): from [<c0028b80>]
>>
>> V/PrintK =A0( 1151): (ret_fast_syscall+0x0/0x2c)
>>
>> W/PrintK =A0( 1151): =A0r7:00000015
>>
>> V/PrintK =A0( 1151): =A0r6:afe47470
>>
>> V/PrintK =A0( 1151): =A0r5:00000104
>>
>> V/PrintK =A0( 1151): =A0r4:00000000
>>
>> V/PrintK =A0( 1151):
>>
>> V/PrintK =A0( 1152): <7>UBIFS DBG (pid 1152): ubifs_bg_thread:
>> background thread "ubifs_bgt0_0" stops
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_close_volume: close
>> volume 0, mode 2
>>
>> V/PrintK =A0( 1151): <7>UBI DBG (pid 1151): ubi_close_volume: close
>> volume 0, mode 1
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
