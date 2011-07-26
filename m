Received: from nm16.bullet.mail.ne1.yahoo.com ([98.138.90.79])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qln8P-0002aS-6a
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2011 19:17:44 +0000
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
	<1310988807.20738.44.camel@sauron>
Message-ID: <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
Date: Tue, 26 Jul 2011 12:17:31 -0700 (PDT)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: UBIFS Corruption
To: dedekind1@gmail.com, MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1310988807.20738.44.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Do you still have these devices? You need to  enable UBIFS recovery
> debugging messages and send them to me, may be then I  can help.
> 


Artem,

Sorry this took so long.  Here is the boot output as the device boots and tries 
to load that partition:

[    1.832000] 0x000000000000-0x000000140000 : "bootloader(nand)"
[    1.840000] 0x000000140000-0x000000440000 : "kernel1"
[    1.848000] 0x000000440000-0x000000e40000 : "rfs1"
[    1.856000] 0x000000e40000-0x000001140000 : "kernel2"
[    1.864000] 0x000001140000-0x000001b40000 : "rfs2"
[    1.876000] 0x000001b40000-0x000007900000 : "home"
[    1.920000] UBI: attaching mtd2 to ubi0
[    1.924000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    1.928000] UBI: logical eraseblock size:    129024 bytes
[    1.932000] UBI: smallest flash I/O unit:    2048
[    1.936000] UBI: sub-page size:              512
[    1.940000] UBI: VID header offset:          512 (aligned 512)
[    1.944000] UBI: data offset:                2048
[    2.004000] UBI: volume 0 ("rfs") re-sized from 74 to 74 LEBs
[    2.008000] UBI: attached mtd2 to ubi0
[    2.012000] UBI: MTD device name:            "rfs1"
[    2.016000] UBI: MTD device size:            10 MiB
[    2.020000] UBI: number of good PEBs:        80
[    2.024000] UBI: number of bad PEBs:         0
[    2.028000] UBI: max. allowed volumes:       128
[    2.032000] UBI: wear-leveling threshold:    4096
[    2.036000] UBI: number of internal volumes: 1
[    2.040000] UBI: number of user volumes:     1
[    2.044000] UBI: available PEBs:             0
[    2.048000] UBI: total number of reserved PEBs: 80
[    2.052000] UBI: number of PEBs reserved for bad PEB handling: 2
[    2.056000] UBI: max/mean erase counter: 1/0
[    2.060000] UBI: image sequence number: 1281595386
[    2.076000] UBI: background thread "ubi_bgt0d" started, PID 294

(snip)

[    5.612000] UBIFS: mounted UBI device 0, volume 0, name "rfs"
[    5.616000] UBIFS: file system size:   8257536 bytes (8064 KiB, 7 MiB, 64 
LEBs)
[    5.620000] UBIFS: journal size:       1677312 bytes (1638 KiB, 1 MiB, 13 
LEBs)
[    5.624000] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    5.628000] UBIFS: default compressor: lzo
[    5.632000] UBIFS: reserved for root:  0 bytes (0 KiB)
[    5.644000] VFS: Mounted root (ubifs filesystem) on device 0:10.

(snip)

[    7.736000] UBI: attaching mtd5 to ubi1
[    7.740000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    7.744000] UBI: logical eraseblock size:    129024 bytes
[    7.748000] UBI: smallest flash I/O unit:    2048
[    7.752000] UBI: sub-page size:              512
[    7.756000] UBI: VID header offset:          512 (aligned 512)
[    7.760000] UBI: data offset:                2048
[    8.228000] UBI: attached mtd5 to ubi1
[    8.228000] UBI: MTD device name:            "home"
[    8.232000] UBI: MTD device size:            93 MiB
[    8.236000] UBI: number of good PEBs:        750
[    8.240000] UBI: number of bad PEBs:         0
[    8.244000] UBI: max. allowed volumes:       128
[    8.248000] UBI: wear-leveling threshold:    4096
[    8.252000] UBI: number of internal volumes: 1
[    8.256000] UBI: number of user volumes:     1
[    8.260000] UBI: available PEBs:             0
[    8.264000] UBI: total number of reserved PEBs: 750
[    8.268000] UBI: number of PEBs reserved for bad PEB handling: 7
[    8.272000] UBI: max/mean erase counter: 3/1
[    8.276000] UBI: image sequence number: 458433007
[    8.292000] UBI: background thread "ubi_bgt1d" started, PID 364
UBI device number 1, total 750 LEBs (96768000 bytes, 92.3 MiB), available 0 LEBs 
(0 bytes), LEB size 129024 bytes (126.0 KiB)
[    8.428000] UBIFS: recovery needed
[    9.056000] UBIFS error (pid 366): ubifs_recover_leb: garbage
[    9.060000] UBIFS error (pid 366): ubifs_scanned_corruption: corruption at 
LEB 172:45056
[    9.064000] UBIFS error (pid 366): ubifs_scanned_corruption: first 8192 bytes 
from LEB 172:45056
[    9.096000] UBIFS error (pid 366): ubifs_recover_leb: LEB 172 scanning failed
mount: mounting ubi1:home on /home failed: Structure needs cleaning

BTW, is there a command to clean the structure manually?  Can I possibly detect 
this and have a command which will allow me to recover?


Here is the dmesg output:

root:/> dmesg 

[   14.120000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:50184, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:21504, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:21696, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:21888, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:22080, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:22272, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:22464, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:22656, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:22848, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:50376, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:23040, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:23232, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:23424, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:23616, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:23808, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:24000, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:24192, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:24384, indexing 
node, length 188
[   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:53832, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:50568, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:24576, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:24768, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:24960, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:25152, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:25344, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:25536, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:25728, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:25920, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:50760, indexing 
node, length 188
[   14.136000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:26112, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:26304, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:26496, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:26688, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:26880, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:27072, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:27264, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:27456, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:50952, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:27648, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:27840, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:28032, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:28224, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:28416, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:28608, indexing 
node, length 188
[   14.140000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:28800, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:28992, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:51144, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:29184, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:29376, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:29568, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:29760, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:29952, indexing 
node, length 188
[   14.164000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:30144, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:30336, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:30528, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:51336, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:30720, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:30912, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:31104, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:31296, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:31488, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:31680, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:31872, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:32064, indexing 
node, length 188
[   14.176000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:51528, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:32256, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:32448, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:32640, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:32832, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:33024, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:33216, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:33408, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:33600, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:51720, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:33792, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:33984, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:34176, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:34368, indexing 
node, length 188
[   14.180000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:34560, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:34752, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:34944, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:35136, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:51912, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:35328, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:35520, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:35712, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:35904, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:36096, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:36288, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:36480, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:36672, indexing 
node, length 188
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:54024, indexing 
node, length 168
[   14.188000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:52104, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:36864, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:37056, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:37248, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:37440, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:37632, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:37824, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:38016, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:38208, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:52296, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:38400, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:38592, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:38784, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:38976, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:39168, indexing 
node, length 188
[   14.192000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:39360, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:39552, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:39744, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:52488, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:39936, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:40128, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:40320, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:40512, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:40704, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:40896, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:41088, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:41280, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:52680, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:41472, indexing 
node, length 188
[   14.200000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:41664, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:41856, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:42048, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:42240, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:42432, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:42624, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:42816, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:52872, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:43008, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:43200, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:43392, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:43584, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:43776, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:43968, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:44160, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:44352, indexing 
node, length 188
[   14.212000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:53064, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:44544, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:44736, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:44928, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:45120, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:45312, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:45504, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:45696, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:45888, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:53256, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:46080, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:46272, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:46464, indexing 
node, length 188
[   14.216000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:46656, indexing 
node, length 188
[   14.224000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:46848, indexing 
node, length 188
[   14.224000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:47040, indexing 
node, length 188
[   14.224000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:47232, indexing 
node, length 188
[   14.224000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:47424, indexing 
node, length 68
[   14.224000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:56784, indexing 
node, length 128
[   14.224000] UBIFS DBG (pid 330): ubifs_write_node: LEB 1:4096, master node, 
length 512 (aligned 2048)
[   14.236000] UBIFS DBG (pid 330): ubifs_write_node: LEB 2:4096, master node, 
length 512 (aligned 2048)
[   14.236000] UBIFS DBG (pid 330): ubifs_log_post_commit: unmap log LEB 3
[   14.236000] UBIFS DBG (pid 330): do_commit: commit end
[   40.972000] UBIFS DBG (pid 420): ubifs_lookup: 'dmesg' in dir ino 252
[   40.972000] UBIFS DBG (pid 420): ubifs_lookup_level0: search key (252, 
direntry, 0x11163d8b)
[   40.972000] UBIFS DBG (pid 420): ubifs_lookup_level0: found 1, lvl 0, n 1
[   40.972000] UBIFS DBG (pid 420): ubifs_read_node: LEB 28:123544, direntry 
node, length 62
[   40.972000] UBIFS DBG (pid 420): ubifs_iget: inode 331
[   40.972000] UBIFS DBG (pid 420): ubifs_lookup_level0: search key (331, inode)
[   40.972000] UBIFS DBG (pid 420): ubifs_lookup_level0: found 1, lvl 0, n 2
[   40.972000] UBIFS DBG (pid 420): fallible_read_node: LEB 28:123376, key (331, 
inode)
[   40.972000] UBIFS DBG (pid 420): try_read_node: LEB 28:123376, inode node, 
length 167
[   40.972000] UBIFS DBG (pid 420): ubifs_getxattr: xattr 'security.capability', 
ino 360 ('busybox'), buf size 20
[   40.972000] UBIFS DBG (pid 420): ubifs_lookup_level0: search key (360, 
xentry, 0x10888ae6)
[   40.976000] UBIFS DBG (pid 420): ubifs_lookup_level0: found 0, lvl 0, n 2


RP
