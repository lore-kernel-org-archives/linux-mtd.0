Received: from mail.breakawaysystems.com ([207.70.162.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsMGY-0006k6-1d
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 19:52:14 +0000
Received: from [192.168.1.100] (dsl-katy-207-70-162-210.consolidated.net
	[207.70.162.210])
	by mail.breakawaysystems.com (Postfix) with ESMTP id 042361481C9
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Sep 2009 14:52:09 -0500 (CDT)
Message-ID: <4AC113E8.2030405@lambsys.com>
Date: Mon, 28 Sep 2009 14:52:08 -0500
From: David Lambert <dave@lambsys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Long attach times attaching MTD to UBI
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

Please excuse me if this is a naive question as I am a newbie to MTD and 
flash file systems.

I am attempting to enable UBIFS on an Atmel AT91RM9200 using kernel 
version 2.6.30.1. One of the attractions was fast mount times compared 
to JFFS2 etc. Unfortunately I am running into VERY long attach times as 
witnessed below. Obviously I must be doing something very wrong as the 
documentation indicates that attaching a 1G partition should take around 
2 seconds, but mine is over 8 minutes!


Any help in how I can identify the bottleneck would be greatly appreciated.



# time ubiattach /tmp/ubi_ctrl -m 6
UBI: attaching mtd6 to ubi2
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd6 to ubi2
UBI: MTD device name:            "NAND3"
UBI: MTD device size:            1200 MiB
UBI: number of good PEBs:        9573
UBI: number of bad PEBs:         27
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             9474
UBI: total number of reserved PEBs: 99
UBI: number of PEBs reserved for bad PEB handling: 95
UBI: max/mean erase counter: 1/1
UBI: background thread "ubi_bgt2d" started, PID 425
UBI device number 2, total 9573 LEBs (1235146752 bytes, 1.2 GiB), 
available 9474 LEBs (1222373376 bytes, 1.1 GiB), LEB size 129024 bytes 
(126.0 KiB)

real    8m3.943s
user    0m0.010s
sys     7m53.621s
#

Formatting the same partition takes around 1.5 minutes

# time ubiformat /dev/mtd6
ubiformat: mtd6 (nand), size 1258291200 bytes (1.2 GiB), 9600 
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 9599 -- 100 % complete 
ubiformat: 9573 eraseblocks have valid erase counter, mean value is 1
ubiformat: 27 bad eraseblocks found, numbers: 70, 164, 533, 885, 2477, 
2807, 3096, 3777, 3972, 4023, 4390, 4506, 4836, 5115, 5245, 5282, 5284, 
5528, 5614, 5720, 5860, 6332, 6616, 7223, 7864, 7948, 8841
ubiformat: formatting eraseblock 9599 -- 100 % complete 

real    1m33.187s
user    0m5.545s
sys     0m33.862s
#
