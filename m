Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8VhE-0000rM-T5
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 08:38:19 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 11:38:05 +0300
Message-Id: <1243240685.21646.100.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Loong lines in your e-mail make it difficult to read it]

On Tue, 2009-05-19 at 16:16 -0600, Eric Holmberg wrote:
> Yes, I'm still seeing two failures.  One is where I get 2 corrupt
> empty blocks when an LEB erase operation is interrupted by a power
> failure.

You mean you have 2 LEBs containing corrupted nodes?
Just to make it clear - this is the second problem. The first one
was about the NOR write buffering. And this one is separate, right?

>   Erasing one of them manually in U-Boot allows the system 
> to boot.  I believe this happens when an LEB erase operation is
> interrupted and then during the deferred recovery, another erase
> operation is interrupted.  The system never expects to have more
> than one erase operation interrupted and panics.

Hmm, if this is true, it should not be too difficult to fix this.


> I unfortunately didn't get a chance to get an image of the flash to
> see what happened to the data block before the board was reprogrammed.
> I'm trying to reproduce it so I can get more details on what is happening.

Please, provide all messages. UBIFS prints much more of them when
debugging is enabled. It prints them with KERN_DEBUG level, which
means they do not go to your console by default. You should use
'ignore_loglevel' boot option to make kernel print everything to the
serial console, see here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

Please, use that option - it will give us mush more information
about the error, including stackdump and node dumps.


> [42949374.300000] physmap-flash.1: CFI does not contain boot bank location. Assuming top.
> [42949374.310000] number of CFI chips: 1
> [42949374.310000] cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
> [42949374.320000] RedBoot partition parsing not available
> [42949374.330000] Using physmap partition information
> [42949374.330000] Creating 3 MTD partitions on "physmap-flash.1":
> [42949374.340000] 0x00000000-0x00200000 : "kernel"
> [42949374.350000] 0x00200000-0x00400000 : "kernel-failsafe"
> [42949374.360000] 0x00400000-0x02000000 : "root"
> [42949374.370000] UBI: attaching mtd7 to ubi0
> [42949374.370000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [42949374.380000] UBI: logical eraseblock size:    130944 bytes
> [42949374.380000] UBI: smallest flash I/O unit:    1
> [42949374.390000] UBI: VID header offset:          64 (aligned 64)
> [42949374.390000] UBI: data offset:                128
> [42949375.090000] UBI: attached mtd7 to ubi0
> [42949375.090000] UBI: MTD device name:            "root"
> [42949375.100000] UBI: MTD device size:            28 MiB
> [42949375.110000] UBI: number of good PEBs:        224
> [42949375.110000] UBI: number of bad PEBs:         0
> [42949375.110000] UBI: max. allowed volumes:       128
> [42949375.120000] UBI: wear-leveling threshold:    4096
> [42949375.120000] UBI: number of internal volumes: 1
> [42949375.130000] UBI: number of user volumes:     1
> [42949375.130000] UBI: available PEBs:             0
> [42949375.140000] UBI: total number of reserved PEBs: 224
> [42949375.140000] UBI: number of PEBs reserved for bad PEB handling: 0
> [42949375.150000] UBI: max/mean erase counter: 85/21
> ...
> [42949375.620000] UBIFS: recovery needed
> [42949375.630000] UBIFS: recovery needed - but mounted in read-only mode
> [42949375.770000] UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xa2ef18b9, read 0x5ebf03c1
> [42949375.780000] UBIFS error (pid 1): ubifs_check_node: bad node at LEB 120:0
> [42949375.790000] UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data at LEB 120:0
> [42949375.810000] UBIFS error (pid 1): ubifs_recover_leb: LEB 120 scanning failed
> [42949375.820000] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
> [42949375.830000] Please append a correct "root=" boot option; here are the available partitions:

Presumably what happens it: UBIFS scans LEB 120. It checks the first
node, and finds CRC mismatch. Then UBIFS logic is as follows. If this
corrupted node is the last one, then there was a write interrupt,
which is harmless. But if after this node some other data follows,
this is some serious corruption. So the 'is_last_write()' function
is called, it is supposed to check that.

In 'is_last_write()' I see it has different logic depending on whether
c->min_io_size == 1 or not. The former case is NOR case, the latter
is NAND. Well, since I know we never tested UBIFS well for NOR,
I conclude the NOR case may have a bug.

I'll look at this function closer a bit later and let you know.
But please, if you reproduce this, do not fix this in u-boot.
We may come up with a patch for you and you would test it.

Thanks.

> Getting the failures to occur using physical hardware takes 7 or 8
> hours which is why I would like to modify either the
> drivers/mtd/devices/block2mtd.c NOR simulator or the RAM simulator
> and put in the interrupted flash patterns that I've already
> characterized.  Any ideas on how to simulate a power failure in
> either module and then do a UBIFS remount?

But testing on real HW is better anyway. You see real issues in
this case.

But we have mtdram. You could simulate various patterns by
creating various images on you host FS. Then you may do:

dd if=my_simulated_file of=/dev/mtd0

Probably it makes sense to create an UBIFS FS first. Then
dump /deve/mtd0 to a file, and start abusing this file differently.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
