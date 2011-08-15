Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QswH5-0008Vy-Le
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 12:28:12 +0000
Received: by iyf13 with SMTP id 13so7555305iyf.16
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 05:28:07 -0700 (PDT)
Subject: Re: UBIFS Corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Mon, 15 Aug 2011 15:29:47 +0300
In-Reply-To: <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
	<1310988807.20738.44.camel@sauron>
	<1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313411391.2583.22.camel@sauron>
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2011-07-26 at 12:17 -0700, Reginald Perrin wrote:
> Artem,
> 
> Sorry this took so long.  Here is the boot output as the device boots and tries 
> to load that partition:
> 
> [    1.832000] 0x000000000000-0x000000140000 : "bootloader(nand)"
> [    1.840000] 0x000000140000-0x000000440000 : "kernel1"
> [    1.848000] 0x000000440000-0x000000e40000 : "rfs1"
> [    1.856000] 0x000000e40000-0x000001140000 : "kernel2"
> [    1.864000] 0x000001140000-0x000001b40000 : "rfs2"
> [    1.876000] 0x000001b40000-0x000007900000 : "home"
> [    1.920000] UBI: attaching mtd2 to ubi0
> [    1.924000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    1.928000] UBI: logical eraseblock size:    129024 bytes
> [    1.932000] UBI: smallest flash I/O unit:    2048
> [    1.936000] UBI: sub-page size:              512
> [    1.940000] UBI: VID header offset:          512 (aligned 512)
> [    1.944000] UBI: data offset:                2048
> [    2.004000] UBI: volume 0 ("rfs") re-sized from 74 to 74 LEBs
> [    2.008000] UBI: attached mtd2 to ubi0
> [    2.012000] UBI: MTD device name:            "rfs1"
> [    2.016000] UBI: MTD device size:            10 MiB
> [    2.020000] UBI: number of good PEBs:        80
> [    2.024000] UBI: number of bad PEBs:         0
> [    2.028000] UBI: max. allowed volumes:       128
> [    2.032000] UBI: wear-leveling threshold:    4096
> [    2.036000] UBI: number of internal volumes: 1
> [    2.040000] UBI: number of user volumes:     1
> [    2.044000] UBI: available PEBs:             0
> [    2.048000] UBI: total number of reserved PEBs: 80
> [    2.052000] UBI: number of PEBs reserved for bad PEB handling: 2
> [    2.056000] UBI: max/mean erase counter: 1/0
> [    2.060000] UBI: image sequence number: 1281595386
> [    2.076000] UBI: background thread "ubi_bgt0d" started, PID 294
> 
> (snip)
> 
> [    5.612000] UBIFS: mounted UBI device 0, volume 0, name "rfs"
> [    5.616000] UBIFS: file system size:   8257536 bytes (8064 KiB, 7 MiB, 64 
> LEBs)
> [    5.620000] UBIFS: journal size:       1677312 bytes (1638 KiB, 1 MiB, 13 
> LEBs)
> [    5.624000] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [    5.628000] UBIFS: default compressor: lzo
> [    5.632000] UBIFS: reserved for root:  0 bytes (0 KiB)
> [    5.644000] VFS: Mounted root (ubifs filesystem) on device 0:10.
> 
> (snip)
> 
> [    7.736000] UBI: attaching mtd5 to ubi1
> [    7.740000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    7.744000] UBI: logical eraseblock size:    129024 bytes
> [    7.748000] UBI: smallest flash I/O unit:    2048
> [    7.752000] UBI: sub-page size:              512
> [    7.756000] UBI: VID header offset:          512 (aligned 512)
> [    7.760000] UBI: data offset:                2048
> [    8.228000] UBI: attached mtd5 to ubi1
> [    8.228000] UBI: MTD device name:            "home"
> [    8.232000] UBI: MTD device size:            93 MiB
> [    8.236000] UBI: number of good PEBs:        750
> [    8.240000] UBI: number of bad PEBs:         0
> [    8.244000] UBI: max. allowed volumes:       128
> [    8.248000] UBI: wear-leveling threshold:    4096
> [    8.252000] UBI: number of internal volumes: 1
> [    8.256000] UBI: number of user volumes:     1
> [    8.260000] UBI: available PEBs:             0
> [    8.264000] UBI: total number of reserved PEBs: 750
> [    8.268000] UBI: number of PEBs reserved for bad PEB handling: 7
> [    8.272000] UBI: max/mean erase counter: 3/1
> [    8.276000] UBI: image sequence number: 458433007
> [    8.292000] UBI: background thread "ubi_bgt1d" started, PID 364
> UBI device number 1, total 750 LEBs (96768000 bytes, 92.3 MiB), available 0 LEBs 
> (0 bytes), LEB size 129024 bytes (126.0 KiB)
> [    8.428000] UBIFS: recovery needed
> [    9.056000] UBIFS error (pid 366): ubifs_recover_leb: garbage
> [    9.060000] UBIFS error (pid 366): ubifs_scanned_corruption: corruption at 
> LEB 172:45056
> [    9.064000] UBIFS error (pid 366): ubifs_scanned_corruption: first 8192 bytes 
> from LEB 172:45056
> [    9.096000] UBIFS error (pid 366): ubifs_recover_leb: LEB 172 scanning failed
> mount: mounting ubi1:home on /home failed: Structure needs cleaning
> 
> BTW, is there a command to clean the structure manually?  Can I possibly detect 
> this and have a command which will allow me to recover?

Unfortunately, this does not include all the UBIFS diagnostic messages.
I should definitely make them to be always present and more verbose by
default in the next kernel release. But for now you should enable UBIFS
debugging. Do not enable any other extra messages. Reproduce the issue
and type dmesg.

> root:/> dmesg 
> 
> [   14.120000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:50184, indexing 
> node, length 188
> [   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:21504, indexing 
> node, length 188
> [   14.128000] UBIFS DBG (pid 330): ubifs_read_node: LEB 34:21696, indexing 
> node, length 188

There are no interesting messages:

1. You enabled all UBIFS debugging messages which are too verbose and
not needed. Do not enable them because they "push out" the interesting
diagnostic messages from the kernel printk ring buffer.

2. And it is strange that the last messages are about the commit and not
about mount failure - are you sure that you typed dmesg right after the
UBIFS mount failure without rebooting ?

-- 
Best Regards,
Artem Bityutskiy
