Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYgLm-0006N6-Or
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2012 17:02:08 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so322453bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2012 09:02:04 -0800 (PST)
Message-ID: <50A3CE88.1080402@gmail.com>
Date: Wed, 14 Nov 2012 18:02:00 +0100
From: simon widmer <simonxwidmer@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: /dev/ubi{x} MAJOR number enumeration
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hej,

I'm faceing an issue with ubi-enumeration. I am using UBI out of 
mtd-1.5, i hope its more or less recent.
My issue is as follows. i have 7 ubi partitions. if im detaching every 
partition and try to reattach a single partition, in this case /dev/mtd6
to /dev/ubi2, there is some issue with the MAJOR nummer. I suppose its 
ubiattach's fault, it tells me to have attached the partition to ubi2
but in fact it attached it to the first (ubi0). Please consult the log 
below.
Is it me how is maloperating or is this a bug?

thanks, simon


root@eleiro:~# ubidetach -d 6
UBI: mtd10 is detached from ubi6
root@eleiro:~# ubidetach -d 5
UBI: mtd9 is detached from ubi5
root@eleiro:~# ubidetach -d 4
UBI: mtd8 is detached from ubi4
root@eleiro:~# ubidetach -d 3
UBI: mtd7 is detached from ubi3
root@eleiro:~# ubidetach -d 2
UBI: mtd6 is detached from ubi2

root@eleiro:~# flash_erase /dev/mtd6 0 0
Erasing 128 Kibyte @ 3e0000 -- 100 % complete

root@eleiro:~# ubiformat /dev/mtd6
ubiformat: mtd6 (nand), size 4194304 bytes (4.0 MiB), 32 eraseblocks of 
131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 31 -- 100 % complete
ubiformat: 32 eraseblocks are supposedly empty
ubiformat: formatting eraseblock 31 -- 100 % complete

root@eleiro:~# ubiattach /dev/ubi_ctrl -m 6 -d 2
UBI: attaching mtd6 to ubi2
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd6 to ubi2
UBI: MTD device name:            "soft_ds"
UBI: MTD device size:            4 MiB
UBI: number of good PEBs:        32
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             26
UBI: total number of reserved PEBs: 6
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 0/0
UBI: image sequence number: 690038465
UBI: background thread "ubi_bgt2d" started, PID 616
UBI device number 2, total 32 LEBs (4128768 bytes, 3.9 MiB), available 
26 LEBs (3354624 bytes, 3.2 MiB), LEB size 129024 bytes (126.0 )

root@eleiro:~# ubimkvol /dev/ubi2 -m -N soft_ds
libubi: error!: "/dev/ubi2" has major:minor 251:0, but this does not 
correspond to any existing UBI device or volume
ubimkvol: error!: "/dev/ubi2" is not an UBI device node

root@eleiro:~# ls -l /dev/ubi*
crw-rw-rw-    1 root     root      253,   0 Sep  4 08:55 /dev/ubi0
crw-rw-rw-    1 root     root      253,   1 Sep  4 08:55 /dev/ubi0_0
crw-rw-rw-    1 root     root      252,   0 Sep  4 08:55 /dev/ubi1
crw-rw-rw-    1 root     root      252,   1 Sep  4 08:55 /dev/ubi1_0
crw-rw-rw-    1 root     root      251,   0 Sep  4 08:55 /dev/ubi2
crw-rw-rw-    1 root     root      251,   1 Sep  4 08:55 /dev/ubi2_0
crw-rw-rw-    1 root     root      250,   0 Sep  4 08:55 /dev/ubi3
crw-rw-rw-    1 root     root      250,   1 Sep  4 08:55 /dev/ubi3_0
crw-rw-rw-    1 root     root      249,   0 Sep  4 08:55 /dev/ubi4
crw-rw-rw-    1 root     root      249,   1 Sep  4 08:55 /dev/ubi4_0
crw-rw-rw-    1 root     root      248,   0 Sep  4 08:55 /dev/ubi5
crw-rw-rw-    1 root     root      248,   1 Sep  4 08:56 /dev/ubi5_0
crw-r--r--    1 root     root      247,   0 Nov  9 13:48 /dev/ubi6
crw-r--r--    1 root     root      247,   1 Nov  9 13:48 /dev/ubi6_0
crw-r--r--    1 root     root      246,   0 Nov  9 13:48 /dev/ubi7
crw-r--r--    1 root     root      246,   1 Nov  9 13:48 /dev/ubi7_0
crw-rw-rw-    1 root     root       10,  63 Sep  4 08:55 /dev/ubi_ctrl

root@eleiro:~# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi2

ubi2
Volumes count:                           0
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     32 (4128768 bytes, 3.9 MiB)
Amount of available logical eraseblocks: 26 (3354624 bytes, 3.2 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  2
Current maximum erase counter value:     0
Minimum input/output unit size:          2048 bytes
Character device major/minor:            253:0

root@eleiro:~# ubimkvol /dev/ubi0 -m -N soft_ds
Set volume size to 3354624
Volume ID 0, size 26 LEBs (3354624 bytes, 3.2 MiB), LEB size 129024 
bytes (126.0 KiB), dynamic, name "soft_ds", alignment 1

root@eleiro:~# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi2

ubi2
Volumes count:                           1
Logical eraseblock size:                 129024 bytes, 126.0 KiB
Total amount of logical eraseblocks:     32 (4128768 bytes, 3.9 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  2
Current maximum erase counter value:     1
Minimum input/output unit size:          2048 bytes
Character device major/minor:            253:0
Present volumes:                         0

Volume ID:   0 (on ubi2)
Type:        dynamic
Alignment:   1
Size:        26 LEBs (3354624 bytes, 3.2 MiB)
State:       OK
Name:        soft_ds
Character device major/minor: 253:1
