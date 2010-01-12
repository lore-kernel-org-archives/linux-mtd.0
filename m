Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUoDL-0005Ku-5o
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 21:23:52 +0000
Received: by fxm22 with SMTP id 22so27240886fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 13:23:46 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <152584231001121249j32f9a03ax415a322f5d4b4195@mail.gmail.com>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
	<152584231001121249j32f9a03ax415a322f5d4b4195@mail.gmail.com>
Date: Tue, 12 Jan 2010 16:23:45 -0500
Message-ID: <152584231001121323r1a910797ic0465deb4417f71d@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_speedtest results:
(initramfs) modprobe mtd_speedtest dev=1
[   34.930000]
[   34.930000] =================================================
[   34.940000] mtd_speedtest: MTD device: 1
[   34.940000] mtd_speedtest: not NAND flash, assume page size is 512 bytes.
[   34.950000] mtd_speedtest: MTD device size 32636928, eraseblock
size 131072, page size 512, count of eraseblocks 249, pages per
eraseblock 131072, OOB size 0
[   34.970000] mtd_speedtest: scanning for bad eraseblocks
[   34.970000] mtd_speedtest: scanned 249 eraseblocks, 0 are bad
[  247.150000] mtd_speedtest: testing eraseblock write speed
[  280.020000] mtd_speedtest: eraseblock write speed is 969 KiB/s
[  280.030000] mtd_speedtest: testing eraseblock read speed
[  295.500000] mtd_speedtest: eraseblock read speed is 2060 KiB/s
[  508.300000] mtd_speedtest: testing page write speed
[  545.620000] mtd_speedtest: error: write failed at 0x1f20000
[  545.620000] mtd_speedtest: error -22 occurred
[  545.630000] =================================================
FATAL: Error inserting mtd_speedtest
(/lib/modules/2.6.31.11-isc/kernel/drivers/mtd/tests/mtd_speedtest.ko):
Invalid argument

The device size is 32636928 (0x1f20000), so why is the test trying to
write at 0x1f20000? This is one byte past the end of device address
space.

Jon
