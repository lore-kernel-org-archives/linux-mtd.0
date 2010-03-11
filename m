Received: from mail1.numonyx.com ([57.77.12.37]
	helo=smtp1.whdoakpoyel001.gmessaging.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Npi6N-0007e7-P3
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2010 13:07:05 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Can not mount UBIFS
Date: Thu, 11 Mar 2010 08:06:56 -0500
Message-ID: <C3802040CD02A1479510D9C01B53CC98026AACEC@EXDRESBENMX009.numonyx.local>
In-Reply-To: <mailman.11633.1268310802.2173.linux-mtd@lists.infradead.org>
From: "GUIDA, Nicola" <Nicola.GUIDA@numonyx.com>
To: <linux-mtd@lists.infradead.org>, <okpalin@gmail.com>, <Daniele.Bosi@mta.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear okpalin,
I've seen you reached to attach mtd4 to device 0 and to create the
volume named rootfs on this device.

Check if the corresponding character device files (ubi0 and ubi0_0)
are in the /dev directory before launching the mount command.

In order to populate /dev directory with this files (sys info), please
Try:

Mdev -s

If your system does not support this command, try with mknod command

Nicola

----------------------------------------------------------------------

Message: 1
Date: Thu, 11 Mar 2010 20:33:14 +0800
From: ??? <okpalin@gmail.com>
To: Bosi Daniele <Daniele.Bosi@mta.it>, linux-mtd@lists.infradead.org
Subject: Re: Can not mount UBIFS
Message-ID:
	<a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
Content-Type: text/plain; charset=3DISO-8859-1

I have enabled ubi and ubifs in my kernel.
I also find "ubifs" in /proc/filesystems.
Here is it:
# cat /proc/filesystems
cat /proc/filesystems
nodev   sysfs
nodev   rootfs
nodev   bdev
nodev   proc
nodev   cgroup
nodev   debugfs
nodev   sockfs
nodev   usbfs
nodev   pipefs
nodev   anon_inodefs
nodev   tmpfs
nodev   inotifyfs
nodev   configfs
nodev   devpts
        ext3
        ext2
nodev   ramfs
        vfat
        msdos
        yaffs
        yaffs2
nodev   ubifs

2010/3/11 Bosi Daniele <Daniele.Bosi@mta.it>:
> It seems like you have your first problem with the Linux "mount"
command. Please try to be sure that your kernel supports ubi file
systems. To check simply if this is true do on your device a
> cat /proc/filesystem
> and verify that "ubi" is present
>
> If it's not, you have to enable ubi options into your kernel
>
> Bye Daniele
>
>
> -----Messaggio originale-----
> Da: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] Per conto di
okpalin@gmail.com
> Inviato: gioved? 11 marzo 2010 8.44
> A: linux-mtd@lists.infradead.org
> Cc: okpalin@gmail.com
> Oggetto: Can not mount UBIFS
>
> Dear all,
>
> I am trying UBIFS on android on nVidia Tegra T20.
> I add a new MTD partition, flash_eraseall, ubiattach, ubimkvol, and
mount it.
> Error occurs when mount it.
>
> The total command I enter is:
> ? ?# ubidetach /dev/ubi_ctrl -d 0
> ? ?ubidetach /dev/ubi_ctrl -d 0
> ? ?# flash_eraseall /dev/mtd/mtd4
> ? ?flash_eraseall /dev/mtd/mtd4
> ? ?Erasing 128 Kibyte @ 2000000 -- 100 % complete.
> ? ?# ubiattach /dev/ubi_ctrl -m 4
> ? ?ubiattach /dev/ubi_ctrl -m 4
> ? ?UBI device number 0, total 256 LEBs (32505856 bytes, 31.0 MiB),
> available 250 LEBs (31744000 bytes, 30.3 MiB), LEB size 126976 bytes
> (124.0 KiB)
> ? ?# ubimkvol /dev/ubi0 -m -N rootfs
> ? ?ubimkvol /dev/ubi0 -m -N rootfs
> ? ?Set volume size to 31744000
> ? ?Volume ID 0, size 250 LEBs (31744000 bytes, 30.3 MiB), LEB size
> 126976 bytes (124.0 KiB), dynamic, name "rootfs", alignment 1
> ? ?# mount -t ubifs ubi0:rootfs /sdcard
> ? ?mount -t ubifs ubi0:rootfs /sdcard
> ? ?mount: Invalid argument
>
> The NAND flash is HY27UF084G2B.
>
> Below is the debug message from "adb logcat":
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_get_sb: name
> ubi0:rootfs, flags 0x8000
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_open_volume_nm: open
> volume rootfs, mode 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_open_volume: open device
> 0 volume 0, mode 1
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_get_sb: opened
ubi0_0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_open_volume: open device
> 0 volume 0, mode 2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:3
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:4
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:5
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:6
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:7
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:8
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:9
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:10
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:11
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:12
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:13
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:14
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:15
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:16
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:17
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:18
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:19
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:20
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:21
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:22
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:23
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:24
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:25
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:26
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:27
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:28
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:29
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:30
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:31
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:32
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:33
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:34
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:35
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:36
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:37
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:38
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:39
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:40
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:41
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:42
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:43
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:44
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:45
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:46
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:47
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:48
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:49
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:50
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:51
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:52
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:53
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:54
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:55
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:56
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:57
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:58
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:59
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:60
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:61
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:62
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:63
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:64
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:65
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:66
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:67
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:68
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:69
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:70
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:71
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:72
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:73
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:74
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:75
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:76
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:77
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:78
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:79
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:80
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:81
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:82
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:83
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:84
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:85
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:86
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:87
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:88
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:89
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:90
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:91
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:92
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:93
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:94
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:95
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:96
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:97
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:98
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB 0:99
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:100
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:101
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:102
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:103
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:104
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:105
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:106
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:107
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:108
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:109
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:110
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:111
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:112
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:113
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:114
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:115
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:116
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:117
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:118
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:119
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:120
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:121
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:122
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:123
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:124
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:125
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:126
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:127
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:128
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:129
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:130
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:131
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:132
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:133
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:134
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:135
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:136
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:137
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:138
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:139
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:140
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:141
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:142
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:143
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:144
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:145
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:146
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:147
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:148
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:149
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:150
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:151
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:152
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:153
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:154
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:155
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:156
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:157
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:158
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:159
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:160
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:161
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:162
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:163
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:164
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:165
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:166
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:167
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:168
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:169
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:170
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:171
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:172
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:173
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:174
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:175
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:176
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:177
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:178
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:179
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:180
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:181
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:182
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:183
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:184
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:185
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:186
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:187
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:188
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:189
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:190
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:191
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:192
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:193
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:194
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:195
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:196
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:197
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:198
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:199
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:200
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:201
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:202
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:203
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:204
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:205
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:206
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:207
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:208
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:209
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:210
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:211
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:212
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:213
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:214
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:215
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:216
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:217
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:218
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:219
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:220
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:221
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:222
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:223
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:224
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:225
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:226
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:227
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:228
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:229
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:230
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:231
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:232
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:233
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:234
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:235
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:236
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:237
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:238
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:239
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:240
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:241
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:242
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:243
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:244
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:245
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:246
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:247
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:248
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_is_mapped: test LEB
0:249
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): set_ltab: LEB 6 free
> 126976 dirty 0 to 124928 777
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_change: atomically
> write 2048 bytes to LEB 0:6
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 2 EC 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB 2
> EC 1 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_atomic_leb_change:
> change LEB 0:6, PEB -1, write VID hdr to PEB 2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 2:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xb4c0800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 2:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xb4c1000 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
space_bits 14
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
> lpt_lnum_bits 2
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
> lpt_offs_bits 17
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
> lpt_spc_bits 17
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
pcnt_bits 6
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
lnum_bits 8
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
pnode_sz 17
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
nnode_sz 12
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
ltab_sz 11
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
lsave_sz 259
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
lsave_cnt 256
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
lpt_hght 3
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt:
big_lpt 0
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: LPT
> root is at 6:1248
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: LPT
> head is at 6:2048
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_create_dflt_lpt: LPT
> ltab is at 6:1260
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
> LEB Properties Tree created (LEBs 6-7)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 0:0,
> superblock node, length 4096 (aligned 4096)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 4096
> bytes to LEB 0:0:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 1 EC 2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB 1
> EC 2 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
> hdr and 4096 bytes at offset 0 of LEB 0:0, PEB 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 1:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xb4a0800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 4096
> bytes to PEB 1:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xb4a1000 =
len=3D0x1000
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
> default superblock created at LEB 0:0
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 1:0,
> master node, length 512 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:1:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 129 EC 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
> 129 EC 1 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
> hdr and 2048 bytes at offset 0 of LEB 0:1, PEB 129
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 129
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 129:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4a0800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 129:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4a1000 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 2:0,
> master node, length 512 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:2:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 130 EC 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
> 130 EC 1 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
> hdr and 2048 bytes at offset 0 of LEB 0:2, PEB 130
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 130
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 130:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4c0800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 130:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4c1000 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
> default master node created at LEB 1:0
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
> 10:0, indexing node, length 48 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:10:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 131 EC 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
> 131 EC 1 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
> hdr and 2048 bytes at offset 0 of LEB 0:10, PEB 131
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 131
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 131:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4e0800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 131:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4e1000 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
> default root indexing node created LEB 10:0
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
> 11:0, inode node, length 160 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:11:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 132 EC 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
> 132 EC 1 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
> hdr and 2048 bytes at offset 0 of LEB 0:11, PEB 132
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 132
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 132:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc500800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 132:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc501000 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): create_default_filesystem:
> root inode created at LEB 11:0
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB 3:0,
> commit start node, length 32 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:3:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_wl_get_peb: PEB 133 EC 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): prot_queue_add: added PEB
> 133 EC 1 to the protection queue
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write VID
> hdr and 2048 bytes at offset 0 of LEB 0:3, PEB 133
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write_vid_hdr: write
> VID header to PEB 133
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 133:2048
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc520800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 133:4096
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc521000 =
len=3D0x800
>
> I/PrintK ?( 1151): <5>UBIFS: default file-system created
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_read_node: LEB 0:0,
> superblock node, length 4096
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 4096
> bytes from LEB 0:0:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read 4096
> bytes from offset 0 of LEB 0:0, PEB 1
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 4096 bytes
> from PEB 1:4096
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_start_scan: scan LEB
1:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 126976
> bytes from LEB 0:1:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read
> 126976 bytes from offset 0 of LEB 0:1, PEB 129
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 126976
> bytes from PEB 129:4096
>
> V/PrintK ?( 1152): <7>UBIFS DBG (pid 1152): ubifs_bg_thread:
> background thread "ubifs_bgt0_0" started, PID 1152
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
> 1:0 (126976 bytes left)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
> scanning master node
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
> 1:512 (126464 bytes left)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
> scanning padding node
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: 1508
> bytes padded, offset now 2048
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
> 1:2048 (124928 bytes left)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: hit
empty space
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_end_scan: stop
> scanning LEB 1 at offset 2048
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_start_scan: scan LEB
2:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 126976
> bytes from LEB 0:2:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read
> 126976 bytes from offset 0 of LEB 0:2, PEB 130
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 126976
> bytes from PEB 130:4096
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
> 2:0 (126976 bytes left)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
> scanning master node
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
> 2:512 (126464 bytes left)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node:
> scanning padding node
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: 1508
> bytes padded, offset now 2048
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan: look at LEB
> 2:2048 (124928 bytes left)
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_scan_a_node: hit
empty space
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_end_scan: stop
> scanning LEB 2 at offset 2048
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_read_node: LEB 10:0,
> indexing node, length 48
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 48 bytes
> from LEB 0:10:0
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read 48
> bytes from offset 0 of LEB 0:10, PEB 131
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 48 bytes
> from PEB 131:4096
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
> 1:2048, master node, length 512 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:1:2048
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write
> 2048 bytes at offset 2048 of LEB 0:1, PEB 129
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 129:6144
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4a1800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBIFS DBG (pid 1151): ubifs_write_node: LEB
> 2:2048, master node, length 512 (aligned 2048)
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_write: write 2048
> bytes to LEB 0:2:2048
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_write_leb: write
> 2048 bytes at offset 2048 of LEB 0:2, PEB 130
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_write: write 2048
> bytes to PEB 130:6144
>
> D/PrintK ?( 1151): <6>tegra_nand_write: write: to=3D0xc4c1800 =
len=3D0x800
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_leb_read: read 11 bytes
> from LEB 0:6:1260
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_eba_read_leb: read 11
> bytes from offset 1260 of LEB 0:6, PEB 2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_io_read: read 11 bytes
> from PEB 2:5356
>
> E/PrintK ?( 1151): <3>UBIFS error (pid 1151): check_lpt_type: invalid
> type (0) in LPT node type 2
>
> W/PrintK ?( 1151): Backtrace:
>
> V/PrintK ?( 1151):
>
> W/PrintK ?( 1151): [<c002ca74>]
>
> V/PrintK ?( 1151): (dump_backtrace+0x0/0x10c)
>
> V/PrintK ?( 1151): from [<c037a118>]
>
> V/PrintK ?( 1151): (dump_stack+0x18/0x1c)
>
> W/PrintK ?( 1151): ?r7:00000000
>
> V/PrintK ?( 1151): ?r6:00000001
>
> V/PrintK ?( 1151): ?r5:00000000
>
> V/PrintK ?( 1151): ?r4:00000002
>
> V/PrintK ?( 1151):
>
> W/PrintK ?( 1151): [<c037a100>]
>
> V/PrintK ?( 1151): (dump_stack+0x0/0x1c)
>
> V/PrintK ?( 1151): from [<c01967b0>]
>
> V/PrintK ?( 1151): (check_lpt_type+0x70/0x84)
>
> W/PrintK ?( 1151): [<c0196740>]
>
> V/PrintK ?( 1151): (check_lpt_type+0x0/0x84)
>
> V/PrintK ?( 1151): from [<c019926c>]
>
> V/PrintK ?( 1151): (ubifs_lpt_init+0x2e0/0x880)
>
> W/PrintK ?( 1151): ?r4:dbb34000
>
> V/PrintK ?( 1151):
>
> W/PrintK ?( 1151): [<c0198f8c>]
>
> V/PrintK ?( 1151): (ubifs_lpt_init+0x0/0x880)
>
> V/PrintK ?( 1151): from [<c017bd84>]
>
> V/PrintK ?( 1151): (ubifs_fill_super+0xad8/0x1a74)
>
> W/PrintK ?( 1151): [<c017b2ac>]
>
> V/PrintK ?( 1151): (ubifs_fill_super+0x0/0x1a74)
>
> V/PrintK ?( 1151): from [<c017cee4>]
>
> V/PrintK ?( 1151): (ubifs_get_sb+0x1c4/0x354)
>
> W/PrintK ?( 1151): [<c017cd20>]
>
> V/PrintK ?( 1151): (ubifs_get_sb+0x0/0x354)
>
> V/PrintK ?( 1151): from [<c00f4ebc>]
>
> V/PrintK ?( 1151): (vfs_kern_mount+0x58/0xac)
>
> W/PrintK ?( 1151): [<c00f4e64>]
>
> V/PrintK ?( 1151): (vfs_kern_mount+0x0/0xac)
>
> V/PrintK ?( 1151): from [<c00f4f6c>]
>
> V/PrintK ?( 1151): (do_kern_mount+0x3c/0xdc)
>
> W/PrintK ?( 1151): ?r8:00008000
>
> V/PrintK ?( 1151): ?r7:db1fb000
>
> V/PrintK ?( 1151): ?r6:00000000
>
> V/PrintK ?( 1151): ?r5:db1c3000
>
> V/PrintK ?( 1151): ?r4:c04a56b8
>
> V/PrintK ?( 1151):
>
> W/PrintK ?( 1151): [<c00f4f30>]
>
> V/PrintK ?( 1151): (do_kern_mount+0x0/0xdc)
>
> V/PrintK ?( 1151): from [<c010c8d8>]
>
> V/PrintK ?( 1151): (do_mount+0x16c/0x76c)
>
> W/PrintK ?( 1151): ?r9:00000000
>
> V/PrintK ?( 1151): ?r8:00008000
>
> V/PrintK ?( 1151): ?r7:db1c3000
>
> V/PrintK ?( 1151): ?r6:db1fb000
>
> V/PrintK ?( 1151): ?r5:00000000
>
> W/PrintK ?( 1151):
>
> W/PrintK ?( 1151): r4:00000000
>
> V/PrintK ?( 1151):
>
> W/PrintK ?( 1151): [<c010c76c>]
>
> V/PrintK ?( 1151): (do_mount+0x0/0x76c)
>
> V/PrintK ?( 1151): from [<c010cf68>]
>
> V/PrintK ?( 1151): (sys_mount+0x90/0xdc)
>
> W/PrintK ?( 1151): [<c010ced8>]
>
> V/PrintK ?( 1151): (sys_mount+0x0/0xdc)
>
> V/PrintK ?( 1151): from [<c0028b80>]
>
> V/PrintK ?( 1151): (ret_fast_syscall+0x0/0x2c)
>
> W/PrintK ?( 1151): ?r7:00000015
>
> V/PrintK ?( 1151): ?r6:afe47470
>
> V/PrintK ?( 1151): ?r5:00000104
>
> V/PrintK ?( 1151): ?r4:00000000
>
> V/PrintK ?( 1151):
>
> V/PrintK ?( 1152): <7>UBIFS DBG (pid 1152): ubifs_bg_thread:
> background thread "ubifs_bgt0_0" stops
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_close_volume: close
> volume 0, mode 2
>
> V/PrintK ?( 1151): <7>UBI DBG (pid 1151): ubi_close_volume: close
> volume 0, mode 1
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 84, Issue 21
*****************************************
