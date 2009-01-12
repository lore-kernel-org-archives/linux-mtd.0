Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LMUub-0008SW-Ac
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 22:05:36 +0000
Received: by bwz5 with SMTP id 5so23545021bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jan 2009 14:05:31 -0800 (PST)
Message-ID: <8b67d60901121401o752dd888m70d3e2bcaffc170d@mail.gmail.com>
Date: Mon, 12 Jan 2009 22:01:48 +0000
From: "Adrian McMenamin" <lkmladrian@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Hot unplugging a device in the middle of a read
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Adrian McMenamin <adrian@newgolddream.dyndns.info>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working on a map driver for the virtual memory unit (VMU) flash
on the SEGA Dreamcast. I have a specifc concurrency issue which maybe
somebody here could help with.

The VMUs are pluggable devices - users can just push them in and pull
them out when they like.

It would be a perverse way to behave but it does mean users can whack
the thing in and pull it out straight away.

With the block translation layer turned on this results in a crash -
how do I tell the mtd/translation/block layer that the device has
gone?

(The ouput below has some additional debug messages I have added)

[  184.105630] mtdblock: read on "vmu1.1.0" at 0x7400, size 0x200
[  184.122698] mtdblock: read on "vmu1.1.0" at 0x7600, size 0x200
[  184.139001] mtdblock: read on "vmu1.1.0" at 0x7800, size 0x200
[  184.156062] mtdblock: read on "vmu1.1.0" at 0x7a00, size 0x200
[  184.172359] mtdblock: read on "vmu1.1.0" at 0x7c00, size 0x200
[  184.189424] mtdblock: read on "vmu1.1.0" at 0x7e00, size 0x200
[  184.206051] mtdblock: read on "vmu1.1.0" at 0x8000, size 0x200
[  184.222790] mtdblock: read on "vmu1.1.0" at 0x8200, size 0x200
[  184.239093] mtdblock: read on "vmu1.1.0" at 0x8400, size 0x200
[  184.256158] mtdblock: read on "vmu1.1.0" at 0x8600, size 0x200
[  184.268478] Maple bus device detaching at (1, 1) busy is 1
[  184.275221] In vmu_disconnect
[  184.277538] Removing MTD device #0 (vmu1.1.0) with use count 1
[  184.302421] releasing device at (1, 1) and address 0x8C8B1980 with
queue at 0x8C5C8180
[  185.570107] end_request: I/O error, dev mtdblock0, sector 64
[  185.575136] Buffer I/O error on device mtdblock0, logical block 8
[  185.584332] Unable to handle kernel paging request at virtual
address 6b6b6b6b
[  185.590955] pc = 8c1511e8
[  185.593649] *pde = 00000000
[  185.596531] Oops: 0000 [#1]
[  185.599395] Modules linked in:
[  185.602626]
[  185.604072] Pid : 824, Comm:                 mtdblockd
[  185.608210] CPU : 0                  Not tainted
(2.6.28-06142-ga079e18-dirty #188)
[  185.608240]
[  185.617027] PC is at strnlen+0x8/0x60
[  185.620791] PR is at string+0x2e/0xc0
