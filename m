Received: from dns.heurikon.com ([192.48.245.20] helo=frankfurter.heurikon.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NLaQ-0003nq-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2001 22:43:58 +0100
Received: from frankfurterDMZ.heurikon.com (c3po.heurikon.com [10.64.16.18])
	by bratwurst.heurikon.com (Postfix) with SMTP id A6749CC8D2
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2001 16:49:26 -0500 (CDT)
Message-ID: <F9102D41F595D311ACA7009027DE2C84033D4D78@c3po.heurikon.com>
From: "McNutt, Scott" <smcnutt@artesyncp.com>
To: linux-mtd@lists.infradead.org
Subject: Magic bitmask 0x1985 not found
Date: Thu, 19 Jul 2001 16:49:39 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

If anyone can point me in the right direction in correcting
the following ... I'd be greatful :-)

Basically, I can only mount a jffs2 partition read-only.

I created a jffs2 image padded to the size of the entire mtd
partition ("Primary") using mkfs.jffs2 and programmed the flash
via simple boot monitor. I always observer the bitmask 0x1985
not found message, followed by an erase error, and the partition
ends up being mounted read-only.

The partition mask_flags are set to:
------------------------------------

MTD_CAP_NORFLASH | MTD_WRITEABLE

At boot time:
--------------------
ACP PMPPC: Found 1 x16 devices at 0x0 in 16-bit mode
JEDEC ID: 89 18
0: offset=0x0,size=0x20000,blocks=128
mtd: Giving out device 0 to ACP PMPPC
Creating 3 MTD partitions on "ACP PMPPC":
0x00000000-0x00200000 : "Boot"
mtd: Giving out device 1 to Boot
0x00200000-0x00e00000 : "Primary"
mtd: Giving out device 2 to Primary
0x00e00000-0x01000000 : "Monitor"
mtd: Giving out device 3 to Monitor
mtd: Giving out device 4 to mtdram test device

and /proc/mtd reports:
-----------------------

dev:    size   erasesize  name
mtd0: 01000000 00020000 "ACP PMPPC"
mtd1: 00200000 00020000 "Boot"
mtd2: 00c00000 00020000 "Primary"
mtd3: 00200000 00020000 "Monitor"
mtd4: 00400000 00020000 "mtdram test device"

Upon mounting the partition I observe:
---------------------------------------

sh-2.03# mount -t jffs2 /dev/mtdblock/2 /usr
mtdblock_open
ok
mtdblock_release
ok
mount: block device /dev/mtdblock/2 is write-protected, mounting read-only
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000:
0xe002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004:
0x0a2d instead
<< etc. etc. >>
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005a0024:
0x2080 instead
Further such events for this erase block will not be printed
Eep. Child "halt" (ino #185) of dir ino #169 doesn't exist!
Erase at 0x00be0000 failed immediately: -30
Erase at 0x00bc0000 failed immediately: -30
<< etc. etc. >>
Erase at 0x005e0000 failed immediately: -30
Erase at 0x005c0000 failed immediately: -30

------------------------------
Any ideas?

--Scott
