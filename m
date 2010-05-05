Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9XIE-0003Xn-9D
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 05:37:11 +0000
Subject: Re: UBIFS failure after extended use
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4BD98D81.7030504@lambsys.com>
References: <4BD98D81.7030504@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 08:30:49 +0300
Message-ID: <1273037449.3702.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2010-04-29 at 08:45 -0500, David Lambert wrote:
> I am a relative newbie to UBI/MTD but the following puzzles me. I have a 
> UBI partition "bulkdata" that suddenly appeared to be corrupted after 
> around a week of working perfectly. The kernel is 2.6.30.1 running on an 
> Atmel ARM9 ATRM9200. Any suggestions would be very welcome, as I have no 
> idea on how to proceed from here.

Is this SLC or MLC NAND?

> AT91 NAND: 8-bit, Software ECC

Probably SLC, MLCs usually have HW ECC support, AFAIK.

> Scanning device for bad blocks
> Bad eraseblock 347 at 0x0000056c0000
> Bad eraseblock 1613 at 0x000019340000
> Bad eraseblock 1981 at 0x00001ef40000
> Bad eraseblock 2174 at 0x000021f80000
> Bad eraseblock 3004 at 0x00002ef00000
> Bad eraseblock 3940 at 0x00003d900000
> Bad eraseblock 4132 at 0x000040900000
> Bad eraseblock 4321 at 0x000043840000
> Bad eraseblock 4487 at 0x0000461c0000
> Bad eraseblock 4642 at 0x000048880000
> Bad eraseblock 5120 at 0x000050000000
> Bad eraseblock 5521 at 0x000056440000
> Bad eraseblock 5904 at 0x00005c400000
> Bad eraseblock 5946 at 0x00005ce80000
> Bad eraseblock 6288 at 0x000062400000
> Bad eraseblock 6364 at 0x000063700000
> Bad eraseblock 6510 at 0x000065b80000
> Bad eraseblock 6602 at 0x000067280000
> Bad eraseblock 6781 at 0x000069f40000
> Bad eraseblock 6861 at 0x00006b340000
> Bad eraseblock 7144 at 0x00006fa00000
> Bad eraseblock 7223 at 0x000070dc0000
> Bad eraseblock 7344 at 0x000072c00000
> Bad eraseblock 7432 at 0x000074200000
> Bad eraseblock 7997 at 0x00007cf40000
> Creating 2 MTD partitions on "NAND 2GiB 3,3V 8-bit":
> 0x000000000000-0x000006400000 : "ubirootfs"
> 0x000006400000-0x000080000000 : "bulkdata"
> UBI: attaching mtd4 to ubi0
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    258048 bytes
> UBI: smallest flash I/O unit:    4096
> UBI: sub-page size:              1024
> UBI: VID header offset:          1024 (aligned 1024)
> UBI: data offset:                4096
> UBI: attached mtd4 to ubi0
> UBI: MTD device name:            "ubirootfs"
> UBI: MTD device size:            100 MiB
> UBI: number of good PEBs:        399
> UBI: number of bad PEBs:         1
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 399
> UBI: number of PEBs reserved for bad PEB handling: 3
> UBI: max/mean erase counter: 3/0
> UBI: background thread "ubi_bgt0d" started, PID 264
> 
> UBI: attaching mtd5 to ubi1
> UBI: physical eraseblock size:   262144 bytes (256 KiB)
> UBI: logical eraseblock size:    258048 bytes
> UBI: smallest flash I/O unit:    4096
> UBI: sub-page size:              1024
> UBI: VID header offset:          1024 (aligned 1024)
> UBI: data offset:                4096
> UBI: attached mtd5 to ubi1
> UBI: MTD device name:            "bulkdata"
> UBI: MTD device size:            1948 MiB
> UBI: number of good PEBs:        7768
> UBI: number of bad PEBs:         24
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 7768
> UBI: number of PEBs reserved for bad PEB handling: 77
> UBI: max/mean erase counter: 8306/75
> UBI: background thread "ubi_bgt1d" started, PID 355
> UBI device number 1, total 7768 LEBs (2004516864 bytes, 1.9 GiB), 
> available 0 LEBs (0 bytes), LEB size 258048 bytes (252.0 KiB)
> UBIFS: recovery needed
> UBIFS: recovery completed
> UBIFS: mounted UBI device 1, volume 0, name "bulkdata"
> UBIFS: file system size:   1980260352 bytes (1933848 KiB, 1888 MiB, 7674 
> LEBs)
> UBIFS: journal size:       33546240 bytes (32760 KiB, 31 MiB, 130 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: none
> UBIFS: reserved for root:  4952683 bytes (4836 KiB)
> 
> All seems OK up to here - then all hell breaks loose...
> 
> # uncorrectable error : <3>UBI error: ubi_io_read: error -74 while 
> reading 13 bytes from PEB 718:175672, read 13 bytes

So, the NAND driver prints 'uncorrectable error', which means that data
in that NAND page is corrupted, and your ECC could not fix the
corruption.

> UBIFS error (pid 85): make_reservation: cannot reserve 4144 bytes in 
> jhead 2, error -74

Probably 'make_reservation()' tried to find a free eraseblock, for which
it had to walk lprops and read from flash. The read operation failed, so
the reservation also failed.

> UBIFS error (pid 85): do_writepage: cannot write page 1981 of inode 
> 6925, error -74
> UBIFS warning (pid 85): ubifs_ro_mode: switched to read-only mode, error 
> -74

And UBIFS switched to R/O mode, because it started getting errors when
it tries to write. This is just a protective measure.

> UBIFS error (pid 85): make_reservation: cannot reserve 160 bytes in 
> jhead 1, error -30

I'm sure there were more prints, e.g., a stackdump. You just did not
look at your dmesg. Please, follow this guide if you send more
bugreports:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

Anyway, my suggestions are:

1. Try to understand why your NAND returns -EBADMSG (= -74 =
uncorrectable ECC error). There may be many reasons, e.g.:
  a). Your ECC algorithms are too weak
  b) Some one wrote more than once to the same page.
  c) There may be SW bugs in the driver
  d) You may have HW issues (e.g., timings)

2. Validate your flash with the MTD tests. This may help you catching
problems c and d. Try to run the torture test for several days, for
example.

3. Enable I/O debugging checks in UBI - there is debugging code which
will read flash region before every write and make sure this region
contains all 0xFFs.

4. Try to even enable all debugging checks in both UBI and UBIFS.
Everything will be very slow, but this may help.

Please, see the bug report guide. Play with your flash, and report your
findings, but properly, including all messages.

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
