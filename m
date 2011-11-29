Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVVhg-0002sp-9k
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 21:59:08 +0000
Received: by lagu2 with SMTP id u2so1443111lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2011 13:59:02 -0800 (PST)
Subject: Re: Corrupted UBIFS, bad CRC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Date: Tue, 29 Nov 2011 23:58:58 +0200
In-Reply-To: <1322052589.58154.YahooMailNeo@web121503.mail.ne1.yahoo.com>
References: <1322052589.58154.YahooMailNeo@web121503.mail.ne1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322603940.2150.18.camel@koala>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On Wed, 2011-11-23 at 04:49 -0800, Karsten Jeppesen wrote:
> Uncompressing Linux........... done, booting the kernel.
> [    1.570000] UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x7d62d42c, read 0x1173c109
> [    1.580000] UBIFS error (pid 1): ubifs_check_node: bad node at LEB 84:50696
> [    1.580000] UBIFS error (pid 1): ubifs_read_node: expected node type 9
> [    1.590000] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Well, difficult to say - you have a node with bad CRC. There may be
different reasons. Did you try to validate your flash with mtd tests?

Here are some hints:
http://linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

> I am running a kernel 2.6.32.8 with most patches applied. Especially
> the recovery.c patch and the mtd (8 byte write buffer patch) applied.
> The target that showed this error does not have these patches applied.
> 
> Even so... I copied the FLASH content to a target with these patches
> and tried again in order to see if these patches would allow the
> kernel to rectify the problem. No cigar.
> Of course I ran with debug enabled so here are the output (but even
> better I hope - here is the flash image for download:
> http://download.gnist.skov.com/corrupt_ubifs.img )

I've downloaed this image and could mount it when I use mtdram:

$ sudo modprobe mtdram erase_size=128 total_size=60000
$ sudo dd if=~/tmp/corrupt_ubifs.img of=/dev/mtd0
$ sudo modprobe ubi mtd=0

[dedekind@koala l2-mtd-2.6 (master)]$ sudo modprobe mtdram
erase_size=128 total_size=29440
[dedekind@koala l2-mtd-2.6 (master)]$ sudo dd if=~/tmp/corrupt_ubifs.img
of=/dev/mtd0
58880+0 records in
58880+0 records out
30146560 bytes (30 MB) copied, 0.0739408 s, 408 MB/s
[dedekind@koala l2-mtd-2.6 (master)]$ sudo modprobe ubi mtd=0

[ 5920.203998] UBI: attaching mtd0 to ubi0
[ 5920.204016] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[ 5920.204019] UBI: logical eraseblock size:    130944 bytes
[ 5920.204022] UBI: smallest flash I/O unit:    1
[ 5920.204028] UBI: VID header offset:          64 (aligned 64)
[ 5920.204034] UBI: data offset:                128
[ 5920.204330] UBI: max. sequence number:       325
[ 5920.204799] UBI: attached mtd0 to ubi0
[ 5920.204801] UBI: MTD device name:            "mtdram test device"
[ 5920.204804] UBI: MTD device size:            28 MiB
[ 5920.204805] UBI: number of good PEBs:        230
[ 5920.204807] UBI: number of bad PEBs:         0
[ 5920.204809] UBI: number of corrupted PEBs:   0
[ 5920.204810] UBI: max. allowed volumes:       128
[ 5920.204812] UBI: wear-leveling threshold:    4096
[ 5920.204814] UBI: number of internal volumes: 1
[ 5920.204815] UBI: number of user volumes:     1
[ 5920.204817] UBI: available PEBs:             0
[ 5920.204819] UBI: total number of reserved PEBs: 230
[ 5920.204820] UBI: number of PEBs reserved for bad PEB handling: 0
[ 5920.204822] UBI: max/mean erase counter: 2/0
[ 5920.204824] UBI: image sequence number:  1748877991
[ 5920.204832] UBI: background thread "ubi_bgt0d" started, PID 4759


I was using my fedora kernel. Did you try to pull the ubifs-v2.6.32
back-port tree? 

http://linux-mtd.infradead.org/doc/ubifs.html#L_source

Artem.
