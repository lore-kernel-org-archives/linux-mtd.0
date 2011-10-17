Received: from fep19.mx.upcmail.net ([62.179.121.39])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RFnFo-0000Vj-6L
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 13:29:21 +0000
Received: from edge01.upcmail.net ([192.168.13.236]) by viefep19-int.chello.at
	(InterMail vM.8.01.02.02 201-2260-120-106-20100312) with ESMTP
	id <20111017132918.ZKEH2111.viefep19-int.chello.at@edge01.upcmail.net>
	for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2011 15:29:18 +0200
Message-ID: <4E9C2DAC.7090109@swissonline.ch>
Date: Mon, 17 Oct 2011 15:29:16 +0200
From: Daniel Kuhn <cheeef@swissonline.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS recovery fails
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

Hi,

I have a problem with a device which uses UBI + UBIFS on a 32GB NAND 
Flash (16*2GB). The
filesystem worked without problems for a couple of months but now I get 
an error if I try to mount the volume.
Attaching the UBI-Device works fine as you can see in the following 
messages:

===============

UBI: max. sequence number:       18803
UBI: attached mtd3 to ubi2
UBI: MTD device name:            "LogData"
UBI: MTD device size:            32544 MiB
UBI: number of good PEBs:        130119
UBI: number of bad PEBs:         57
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 130119
UBI: number of PEBs reserved for bad PEB handling: 1301
UBI: max/mean erase counter: 30/0
UBI: image sequence number:  1813038814
UBI: background thread "ubi_bgt2d" started, PID 1376

===============


UBIFS prints the following error messages during mount (with dmesg -n8, 
UBIFS debugging enabled):

===============

UBIFS: recovery needed
UBIFS error (pid 611): ubifs_recover_leb: corrupt empty space LEB 
3550:188416, c
orruption starts at 64362
UBIFS error (pid 611): ubifs_scanned_corruption: corruption at LEB 
3550:252778
UBIFS error (pid 611): ubifs_scanned_corruption: first 1174 bytes from 
LEB 3550:
252778
00000000: ffffffbf ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000120: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000140: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000160: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000001a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000001c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000001e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000200: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000220: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000260: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000280: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000002a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000002c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000002e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000300: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000320: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000340: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000360: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000380: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000003a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000003c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
000003e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000400: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000440: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000460: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff 
fffffff
f  ................................
00000480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                            ......................
UBIFS error (pid 611): ubifs_recover_leb: LEB 3550 scanning failed

===============


The Kernel (2.6.38-rc8) runs on an ARM926 CPU (OMAPL138 from TI). I've 
taken the latest UBI + UBIFS sources from the GIT-Repository 
"|git://git.infradead.org/~dedekind/ubifs-v2.6.38.git|" which eliminated 
a segmentation fault I had before updating.

"mtdinfo -a" prints the following information for the broken device mtd3:

===============

mtd3
Name:                           LogData
Type:                           nand
Eraseblock size:                262144 bytes, 256.0 KiB
Amount of eraseblocks:          130176 (34124857344 bytes, 31.8 GiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  1024 bytes
OOB size:                       128 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true

===============


Is there a way to recover the data on the device?

Thanks in advance,
Daniel Kuhn
