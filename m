Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQO85-0002D5-UC
	for linux-mtd@lists.infradead.org; Tue, 05 Aug 2008 15:07:18 +0000
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 2F2BABECB
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Aug 2008 17:07:03 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8EMPV7YFKJ4 for <linux-mtd@lists.infradead.org>;
	Tue,  5 Aug 2008 17:06:46 +0200 (CEST)
Received: from [172.31.65.135] (inside.kranj.cetrtapot.si [192.168.66.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 3C718BEC5
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Aug 2008 17:06:46 +0200 (CEST)
Message-ID: <48986C4E.4060901@cetrtapot.si>
Date: Tue, 05 Aug 2008 17:05:50 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: flash_info and MEMGETREGIONCOUNT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would like to know some info about the flash chip present on the board. I found flash_info utility and can't seem to get information about the region count with MEMGETREGIONCOUNT.
# /flash_info /dev/mtd0 
Device /dev/mtd0 has 0 erase regions
# /flash_info /dev/mtd1 
Device /dev/mtd1 has 0 erase regions
# /flash_info /dev/mtd2
Device /dev/mtd2 has 0 erase regions

Although during boot these messages are shown (with CFI debug on):
...
[42949374.037212] Probing cse0 at physical address 0x00000000 (16-bit bankwidth)
[42949374.044444] Number of erase regions: 4
[42949374.054706] Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
[42949374.064951] Primary Algorithm Table at 0040
[42949374.069392] Alternative Vendor Command Set: 0000 (None)
[42949374.079548] No Alternate Algorithm Table
[42949374.083729] Vcc Minimum:  2.7 V
[42949374.087113] Vcc Maximum:  3.6 V
[42949374.097284] Vpp Minimum: 11.5 V
[42949374.100662] Vpp Maximum: 12.5 V
[42949374.104043] Typical byte/word write timeout: 16 Âµs
[42949374.114211] Maximum byte/word write timeout: 512 Âµs
[42949374.119413] Full buffer write not supported
[42949374.129580] Typical block erase timeout: 1024 ms
[42949374.134452] Maximum block erase timeout: 16384 ms
[42949374.144596] Chip erase not supported
[42949374.148426] Device size: 0x400000 bytes (4 MiB)
[42949374.158590] Flash Device Interface description: 0x0002
[42949374.163975]   - supports x8 and x16 via BYTE# with asynchronous interface
[42949374.174140] Max. bytes in buffer write: 0x1
[42949374.178570] Number of Erase Block Regions: 4
[42949374.188759]   Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
[42949374.198948]   Erase Region #1: BlockSize 0x2000 bytes, 2 blocks
[42949374.205157]   Erase Region #2: BlockSize 0x8000 bytes, 1 blocks
[42949374.215347]   Erase Region #3: BlockSize 0x10000 bytes, 63 blocks
[42949374.221744] cse0: Found 1 x16 devices at 0x0 in 16-bit bank
[42949374.235520]  Amd/Fujitsu Extended Query Table at 0x0040
[42949374.245764] number of CFI chips: 1
[42949374.249441] cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
[42949374.259647] Probing cse1 at physical address 0x04000000 (16-bit bankwidth)
[42949374.270098] Using static partitions on cse0
[42949374.274538] NOR flash size: 4194304 b (4 Mb)
[42949374.284722] Creating 3 MTD partitions on "cse0":
[42949374.289640] 0x00000000-0x00010000 : "Rescue"
[42949374.310538] 0x00010000-0x00130000 : "Kernel"
[42949374.329690] 0x00130000-0x00400000 : "Filesystem"
[42949374.350519] cse1 is absent. Skipping
...

It is clearly seen that there are four regions reported by the kernel, but the 
userspace does not agree with the kernel !?

Thank you,
Hinko

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
