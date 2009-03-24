Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm8ZS-0006HU-Vf
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 15:29:50 +0000
Message-ID: <49C8FC89.7040709@nokia.com>
Date: Tue, 24 Mar 2009 17:30:17 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: Re: UBIFS Corrupt during power failure
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Holmberg wrote:
> Using kernel 2.6.27 on NOR flash memory, I'm seeing corruption of UBIFS
> when power is removed from the device during a write to flash.  We are
> doing this as a torture test and it appears that we typically make it
> around 50 power cycles during the Linux boot-up sequence before the
> failure occurs.
> 
> Note that the system runs fine if we do continuous writes, but do an
> orderly shutdown.  Pulling the power during a write or during recovery
> seems to cause this issue.
>  
> Kernel:  2.6.27
> Memory type:  NOR Flash
> Usage pattern:  Robustness testing - removing power during normal
> operation
> Result:  Unable to mount UBIFS resulting in total loss of data
> Write caching:  Enabled
> 
> I'm going to disabled write caching and see if that improves
> reliability.
> 
> My main questions are:
>  1) Is this a known issue

No

>  2) Has this been fixed in 2.6.28

No

>  3) Is there a way to do a recovery

Possibly, but we need more information - see below

>  4) Any other robustness suggestions

Not at the moment

> 
> Thanks,
> 
> Eric Holmberg
> 
> Kernel log: 
>  
> [42949373.970000] Using physmap partition information
> [42949373.970000] Creating 3 MTD partitions on "physmap-flash.1":
> [42949373.980000] 0x00000000-0x00200000 : "kernel"
> [42949373.990000] 0x00200000-0x00400000 : "kernel-failsafe"
> [42949373.990000] 0x00400000-0x02000000 : "root"
> [42949374.010000] UBI: attaching mtd7 to ubi0
> [42949374.010000] UBI: physical eraseblock size:   131072 bytes (128
> KiB)
> [42949374.020000] UBI: logical eraseblock size:    130944 bytes
> [42949374.020000] UBI: smallest flash I/O unit:    1
> [42949374.030000] UBI: VID header offset:          64 (aligned 64)
> [42949374.030000] UBI: data offset:                128
> [42949374.920000] UBI: attached mtd7 to ubi0
> [42949374.930000] UBI: MTD device name:            "root"
> [42949374.930000] UBI: MTD device size:            28 MiB
> [42949374.940000] UBI: number of good PEBs:        224
> [42949374.940000] UBI: number of bad PEBs:         0
> [42949374.950000] UBI: max. allowed volumes:       128
> [42949374.950000] UBI: wear-leveling threshold:    4096
> [42949374.960000] UBI: number of internal volumes: 1
> [42949374.960000] UBI: number of user volumes:     1
> [42949374.970000] UBI: available PEBs:             0
> [42949374.970000] UBI: total number of reserved PEBs: 224
> [42949374.980000] UBI: number of PEBs reserved for bad PEB handling: 0
> [42949374.980000] UBI: max/mean erase counter: 7/2
> ...
> [42949375.450000] UBIFS: recovery needed
> [42949375.510000] UBIFS error (pid 1): ubifs_scan: corrupt empty space
> at LEB 4:44512
> [42949375.510000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corrupted data at LEB 4:44512
> [42949375.540000] UBIFS error (pid 1): ubifs_scan: LEB 4 scanning failed
> [42949375.590000] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
> space at LEB 4:480
> [42949375.590000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corrupted data at LEB 4:480
> [42949375.620000] UBIFS error (pid 1): ubifs_recover_leb: LEB 4 scanning
> failed
> [42949375.630000] VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(0,0)
> [42949375.640000] Please append a correct "root=" boot option; here are
> the available partitions:
> [42949375.640000] 1f00         16 mtdblock0 (driver?)
> [42949375.650000] 1f01          8 mtdblock1 (driver?)
> [42949375.650000] 1f02          8 mtdblock2 (driver?)
> [42949375.660000] 1f03         32 mtdblock3 (driver?)
> [42949375.660000] 1f04        960 mtdblock4 (driver?)
> [42949375.670000] 1f05       2048 mtdblock5 (driver?)
> [42949375.670000] 1f06       2048 mtdblock6 (driver?)
> [42949375.680000] 1f07      28672 mtdblock7 (driver?)
> [42949375.680000] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(0,0)

Please enable UBIFS debugging and set the UBIFS Default message level to 3.

Or for fewer messages, enable UBIFS debugging and set the kernel command line parameter
ubifs.debug_msgs=6144

And send us the log.

Also, could you tell us what MTD drivers you are using?
