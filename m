Received: from rproxy.gmail.com ([64.233.170.199])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D2am0-0000gX-0z
	for linux-mtd@lists.infradead.org; Sat, 19 Feb 2005 15:00:18 -0500
Received: by rproxy.gmail.com with SMTP id y7so88368rne
	for <linux-mtd@lists.infradead.org>;
	Sat, 19 Feb 2005 12:00:14 -0800 (PST)
Message-ID: <196b7d31050219120065170409@mail.gmail.com>
Date: Sat, 19 Feb 2005 21:00:14 +0100
From: Lior Balkohen <balkohen@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: JFFS3 & performance checksum test results.
Reply-To: Lior Balkohen <balkohen@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I don't know where/whom to provide to results, so I send the results
for my IBM embedded powerpc 405 based set top box to the linux-mtd
list. I hope, I'm right here.
/hdd > uname -a
Linux dreambox 2.6.9 #1 Wed Feb 2 18:18:47 CET 2005 ppc unknown

/hdd > cat /proc/cpuinfo
processor       : 0
cpu             : STB04xxx
clock           : 252MHz
revision        : 9.82 (pvr 4181 0952)
bogomips        : 250.88
machine         : Dream Multimedia TV Dreambox
plb bus clock   : 63MHz

/hdd > cat /proc/meminfo
MemTotal:        30048 kB
MemFree:          2440 kB
Buffers:          3860 kB
Cached:          10068 kB
SwapCached:          0 kB
Active:          11728 kB
Inactive:         9840 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:        30048 kB
LowFree:          2440 kB
SwapTotal:           0 kB
SwapFree:            0 kB
Dirty:               0 kB
Writeback:           0 kB
Mapped:          12260 kB
Slab:             2628 kB
Committed_AS:    86572 kB
PageTables:        240 kB
VmallocTotal:   475136 kB
VmallocUsed:     40976 kB
VmallocChunk:   432104 kB

/hdd > cat /proc/filesystems
nodev   sysfs
nodev   rootfs
nodev   bdev
nodev   proc
nodev   sockfs
nodev   usbfs
nodev   usbdevfs
nodev   futexfs
nodev   tmpfs
nodev   pipefs
nodev   eventpollfs
nodev   devpts
        ext3
        cramfs
        squashfs
nodev   ramfs
        vfat
        iso9660
nodev   devfs
nodev   nfs
nodev   jffs2
nodev   rpc_pipefs

/hdd > cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00600000 00020000 "DreamBOX cramfs+squashfs"
mtd1: 001c0000 00020000 "DreamBOX jffs2"
mtd2: 00040000 00020000 "DreamBOX OpenBIOS"
mtd3: 007c0000 00020000 "DreamBOX (w/o bootloader)"
mtd4: 00800000 00020000 "DreamBOX (w/ bootloader)"
mtd5: 004e0000 00020000 "DreamBOX SquashedFS"
mtd6: 00120000 00020000 "DreamBOX Cramfs"

results:
[crctst] (get_cycles) Data pass both forward, 32 bytes: delta 168, ts1
1900967224, ts2 1900967392
[crctst] (get_cycles) Data pass both backward, 32 bytes: delta 133,
ts1 1902292182, ts2 1902292315
[crctst] (get_cycles) Data pass backward/forward, 32 bytes: delta 151,
ts1 1903616602, ts2 1903616753
[crctst] (get_cycles) Data pass forward/backward, 32 bytes: delta 141,
ts1 1904941004, ts2 1904941145
[crctst] (get_cycles) Data pass both forward, 4096 bytes: delta 12260,
ts1 1906265395, ts2 1906277655
[crctst] (get_cycles) Data pass both backward, 4096 bytes: delta 9936,
ts1 1907601961, ts2 1907611897
[crctst] (get_cycles) Data pass backward/forward, 4096 bytes: delta
11263, ts1 1908936265, ts2 1908947528
[crctst] (get_cycles) Data pass forward/backward, 4096 bytes: delta
10911, ts1 1910271873, ts2 1910282784
[crctst] (get_cycles) Data pass both forward, 32768 bytes: delta
104016, ts1 1911607110, ts2 1911711126
[crctst] (get_cycles) Data pass both backward, 32768 bytes: delta
87914, ts1 1913035490, ts2 1913123404
[crctst] (get_cycles) Data pass backward/forward, 32768 bytes: delta
92824, ts1 1914447816, ts2 1914540640
[crctst] (get_cycles) Data pass forward/backward, 32768 bytes: delta
91547, ts1 1915865013, ts2 1915956560
[crctst] (get_cycles) Data pass both forward, 65536 bytes: delta
208032, ts1 1917280917, ts2 1917488949
[crctst] (get_cycles) Data pass both backward, 65536 bytes: delta
175761, ts1 1918813312, ts2 1918989073
[crctst] (get_cycles) Data pass backward/forward, 65536 bytes: delta
188753, ts1 1920313475, ts2 1920502228
[crctst] (get_cycles) Data pass forward/backward, 65536 bytes: delta
187477, ts1 1921826629, ts2 1922014106
[crctst] (get_cycles) Data pass both forward, 131072 bytes: delta
416040, ts1 1923338509, ts2 1923754549
[crctst] (get_cycles) Data pass both backward, 131072 bytes: delta
351457, ts1 1925078969, ts2 1925430426
[crctst] (get_cycles) Data pass backward/forward, 131072 bytes: delta
380570, ts1 1926754905, ts2 1927135475
[crctst] (get_cycles) Data pass forward/backward, 131072 bytes: delta
379361, ts1 1928459900, ts2 1928839261
[crctst] (get_cycles) adler32, 32 bytes: delta 22, ts1 1928841073, ts2
1928841095
[crctst] (get_cycles) adler32, 4096 bytes: delta 1439, ts1 1929185219,
ts2 1929186658
[crctst] (get_cycles) adler32, 32768 bytes: delta 17190, ts1
1929213252, ts2 1929230442
[crctst] (get_cycles) adler32, 65536 bytes: delta 34363, ts1
1929269598, ts2 1929303961
[crctst] (get_cycles) adler32, 131072 bytes: delta 68704, ts1
1929385001, ts2 1929453705
[crctst] (get_cycles) adler32r, 32 bytes: delta 22, ts1 1929473296,
ts2 1929473318
[crctst] (get_cycles) adler32r, 4096 bytes: delta 1377, ts1
1929477555, ts2 1929478932
[crctst] (get_cycles) adler32r, 32768 bytes: delta 18489, ts1
1929506634, ts2 1929525123
[crctst] (get_cycles) adler32r, 65536 bytes: delta 36961, ts1
1929564783, ts2 1929601744
[crctst] (get_cycles) adler32r, 131072 bytes: delta 73900, ts1
1929686740, ts2 1929760640
[crctst] (get_cycles) engel32, 32 bytes: delta 25, ts1 1929770941, ts2
1929770966
[crctst] (get_cycles) engel32, 4096 bytes: delta 1761, ts1 1929779631,
ts2 1929781392
[crctst] (get_cycles) engel32, 32768 bytes: delta 19769, ts1
1929803626, ts2 1929823395
[crctst] (get_cycles) engel32, 65536 bytes: delta 39518, ts1
1929870497, ts2 1929910015
[crctst] (get_cycles) engel32, 131072 bytes: delta 79013, ts1
1929997549, ts2 1930076562
[crctst] (get_cycles) engel32r, 32 bytes: delta 26, ts1 1930089784,
ts2 1930089810
[crctst] (get_cycles) engel32r, 4096 bytes: delta 1871, ts1
1930093462, ts2 1930095333
[crctst] (get_cycles) engel32r, 32768 bytes: delta 14927, ts1
1930111477, ts2 1930126404
[crctst] (get_cycles) engel32r, 65536 bytes: delta 29853, ts1
1930163350, ts2 1930193203
[crctst] (get_cycles) engel32r, 131072 bytes: delta 59696, ts1
1930260093, ts2 1930319789
[crctst] (get_cycles) 16-bit CRC CCITT, 32 bytes: delta 42, ts1
1930330225, ts2 1930330267
[crctst] (get_cycles) 16-bit CRC CCITT, 4096 bytes: delta 4390, ts1
1930337184, ts2 1930341574
[crctst] (get_cycles) 16-bit CRC CCITT, 32768 bytes: delta 40829, ts1
1930383747, ts2 1930424576
[crctst] (get_cycles) 16-bit CRC CCITT, 65536 bytes: delta 81646, ts1
1930518699, ts2 1930600345
[crctst] (get_cycles) 16-bit CRC CCITT, 131072 bytes: delta 163270,
ts1 1930777816, ts2 1930941086
[crctst] (get_cycles) CRC32, 32 bytes: delta 34, ts1 1930963004, ts2 1930963038
[crctst] (get_cycles) CRC32, 4096 bytes: delta 2748, ts1 1930968343,
ts2 1930971091
[crctst] (get_cycles) CRC32, 32768 bytes: delta 27673, ts1 1931000739,
ts2 1931028412
[crctst] (get_cycles) CRC32, 65536 bytes: delta 55315, ts1 1931091292,
ts2 1931146607
[crctst] (get_cycles) CRC32, 131072 bytes: delta 110611, ts1
1931267188, ts2 1931377799
[crctst] (get_cycles) CRC32c, 32 bytes: delta 44, ts1 1931394196, ts2 1931394240
[crctst] (get_cycles) CRC32c, 4096 bytes: delta 4392, ts1 1931401121,
ts2 1931405513
[crctst] (get_cycles) CRC32c, 32768 bytes: delta 40834, ts1
1931453919, ts2 1931494753
[crctst] (get_cycles) CRC32c, 65536 bytes: delta 81651, ts1
1931587734, ts2 1931669385
[crctst] (get_cycles) CRC32c, 131072 bytes: delta 163274, ts1
1931851834, ts2 1932015108
