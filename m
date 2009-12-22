Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NN5Vm-00077h-Uj
	for linux-mtd@lists.infradead.org; Tue, 22 Dec 2009 14:14:59 +0000
Received: by ewy21 with SMTP id 21so6505197ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Dec 2009 06:14:51 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 22 Dec 2009 09:14:50 -0500
Message-ID: <dbdb2ea60912220614r656df531sae2be73e8f7f8163@mail.gmail.com>
Subject: ubiattach taking very long time
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does it make any sense that a ubiattach would take > 20 secs?  The
flash I'm using is Samsung 4GiB MLC NAND flash.  I'm running 2.6.28
kernel.  Here's the capture...

[    1.753280] Creating 6 MTD partitions on "Samsung 32Gibx8":
[    1.758855] 0x000000000000-0x000000080000 : "bootloader-alt"
[    1.765676] 0x000000080000-0x000000100000 : "environment-alt"
[    1.772290] 0x000000100000-0x000000400000 : "kernel-alt"
[    1.778403] 0x000000400000-0x000000800000 : "kernelrecovery-alt"
[    1.785252] 0x000000800000-0x000004000000 : "maintenance"
[    1.791577] 0x000004000000-0x000100000000 : "system"
[    1.799725] UBI: attaching mtd5 to ubi0
[    1.803630] UBI: physical eraseblock size:   524288 bytes (512 KiB)
[    1.809901] UBI: logical eraseblock size:    516096 bytes
[    1.815365] UBI: smallest flash I/O unit:    4096
[    1.820067] UBI: VID header offset:          4096 (aligned 4096)
[    1.826109] UBI: data offset:                8192
[   23.124750] UBI: attached mtd5 to ubi0
[   23.128505] UBI: MTD device name:            "system"
[   23.133702] UBI: MTD device size:            4032 MiB
[   23.138757] UBI: number of good PEBs:        8064
[   23.143495] UBI: number of bad PEBs:         0
[   23.147945] UBI: max. allowed volumes:       128
[   23.152592] UBI: wear-leveling threshold:    256
[   23.157211] UBI: number of internal volumes: 1
[   23.161689] UBI: number of user volumes:     4
[   23.166135] UBI: available PEBs:             4
[   23.170612] UBI: total number of reserved PEBs: 8060
[   23.175584] UBI: number of PEBs reserved for bad PEB handling: 80
[   23.181715] UBI: max/mean erase counter: 2/0
[   23.186120] UBI: background thread "ubi_bgt0d" started, PID 421
