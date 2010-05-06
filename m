Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9xki-0007z4-Et
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 09:52:21 +0000
Date: Thu, 6 May 2010 11:52:18 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 0/4] UBI: improve empty flash handling
Message-ID: <20100506095218.GB15335@Chamillionaire.breakpoint.cc>
References: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2010-05-03 13:12:58 [+0300]:

>Hi Sebastian,
Hi Artem,

>Please, review and test the following series.

The code looks fine. I wiped the flash and the test resulted in:

| UBI: attaching mtd9 to ubi0
| UBI: physical eraseblock size:   131072 bytes (128 KiB)
| UBI: logical eraseblock size:    129024 bytes
| UBI: smallest flash I/O unit:    2048
| UBI: sub-page size:              512
| UBI: VID header offset:          512 (aligned 512)
| UBI: data offset:                2048
| UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
| Call Trace:
| [cfbd7c70] [c0008558] show_stack+0x48/0x19c (unreliable)
| [cfbd7cb0] [c01ab6e0] ubi_io_read+0x1a4/0x2ac
| [cfbd7cf0] [c01abb4c] ubi_io_read_ec_hdr+0x48/0x21c
| [cfbd7d10] [c01b0060] ubi_scan+0x194/0x11b8
| [cfbd7d80] [c01a5e48] ubi_attach_mtd_dev+0x67c/0xe30
| [cfbd7e80] [c01a6804] ctrl_cdev_ioctl+0x140/0x1d8
| [cfbd7ec0] [c008bf1c] do_ioctl+0x3c/0xc4
| [cfbd7ee0] [c008c024] vfs_ioctl+0x80/0x448
| [cfbd7f10] [c008c42c] sys_ioctl+0x40/0x88
| [cfbd7f40] [c001008c] ret_from_syscall+0x0/0x38
| --- Exception: c01 at 0xff59908
|     LR = 0xff5986c
| UBI: empty MTD device detected
| UBI: corrupted PEBs will be formatted
| UBI: create volume table (copy #1)
| UBI: create volume table (copy #2)
| UBI: attached mtd9 to ubi0
| UBI: MTD device name:            "ubi"
| UBI: MTD device size:            512 MiB
| UBI: number of good PEBs:        4096
| UBI: number of bad PEBs:         0
| UBI: max. allowed volumes:       128
| UBI: wear-leveling threshold:    4096
| UBI: number of internal volumes: 1
| UBI: number of user volumes:     0
| UBI: available PEBs:             4052
| UBI: total number of reserved PEBs: 44
| UBI: number of PEBs reserved for bad PEB handling: 40
| UBI: max/mean erase counter: 0/0
| UBI: image sequence number: 0
| UBI: background thread "ubi_bgt0d" started, PID 2003
| UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
| Call Trace:
| [cfa7bea0] [c0008558] show_stack+0x48/0x19c (unreliable)
| [cfa7bee0] [c01ab6e0] ubi_io_read+0x1a4/0x2ac
| [cfa7bf20] [c01abb4c] ubi_io_read_ec_hdr+0x48/0x21c
| [cfa7bf40] [c01ad628] erase_worker+0x5c/0x670
| [cfa7bf70] [c01ae794] do_work+0xb0/0x16c
| [cfa7bf90] [c01ae990] ubi_thread+0x140/0x1bc
| [cfa7bfd0] [c0037bec] kthread+0x50/0x88
| [cfa7bff0] [c000fdf8] kernel_thread+0x44/0x60
| UBI error: do_sync_erase: cannot erase PEB 3399, error -5
| Call Trace:
| [cfa7be00] [c0008558] show_stack+0x48/0x19c (unreliable)
| [cfa7be40] [c01ac494] do_sync_erase+0x208/0x220
| [cfa7bec0] [c01ac6bc] ubi_io_sync_erase+0x210/0x400
| [cfa7bf40] [c01ad668] erase_worker+0x9c/0x670
| [cfa7bf70] [c01ae794] do_work+0xb0/0x16c
| [cfa7bf90] [c01ae990] ubi_thread+0x140/0x1bc
| [cfa7bfd0] [c0037bec] kthread+0x50/0x88
| [cfa7bff0] [c000fdf8] kernel_thread+0x44/0x60
| UBI error: erase_worker: failed to erase PEB 3399, error -5
| UBI: reserve more 1 PEBs
| UBI: mark PEB 3399 as bad
| UBI: 40 PEBs left in the reserve

So it looks fine. Attaching partitions with non-ubi material failed.

>P.S. I gave it only a very quick try
Works good for that :)

>
>Artem.

Sebastian
