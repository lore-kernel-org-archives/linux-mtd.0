Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqb1R-0001MB-GA
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 22:08:46 +0000
Message-ID: <48F7BBC1.8090804@logix.net.nz>
Date: Fri, 17 Oct 2008 11:10:09 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: nandwrite/ubi memory corruption?
References: <48F71315.5080707@logix.net.nz> <1224168560.4466.2.camel@sauron>
	<1224168977.4466.4.camel@sauron>
In-Reply-To: <1224168977.4466.4.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Thu, 2008-10-16 at 17:49 +0300, Artem Bityutskiy wrote:
>> On Thu, 2008-10-16 at 23:10 +1300, Michal Ludvig wrote:
>>> Hi all,
>>>
>>> I've got an ARM board with 64MB of NAND flash with 3 logical partitions
>>> and am experiencing (probably) memory corruption of UBI/UBIFS on
>>> /dev/mtd2 after writing data with nandwrite to /dev/mtd1.
>>>
>>> These are my logical partitions on NAND:
>>> [...]
>>>
>>> ~ # ls
>>> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
>>> 2414:15360, written 0 bytes
>>> UBI warning: ubi_eba_write_leb: failed to write data to PEB 2414
>>> UBI: recover PEB 2414, move data to PEB 2428
>>> UBI warning: ubi_io_read_vid_hdr: bad magic number at PEB 2414: 00000000
>>> instead of 55424921
>>> UBI warning: ubi_ro_mode: switch to read-only mode
>>> UBIFS error (pid 224): ubifs_wbuf_sync_nolock: cannot write 512 bytes to
>>> LEB 746:14336
>>> UBIFS error (pid 224): ubifs_bg_wbufs_sync: cannot sync write-buffer,
>>> error -5
>>> UBIFS warning (pid 224): ubifs_ro_mode: switched to read-only mode, error -5
>> Could you please try ubiformat instead of nandwrite? 

~ # ubiformat /dev/mtd1 -v
ubiformat: mtd1 (NAND), size 1900544 bytes (1.8 MiB), 16384 eraseblocks
of 16384 bytes (16.0 KiB), min. I/O size 512 bytes
libscan: start scanning eraseblocks 0-116
libscan: scanning eraseblock 0: alien
libscan: scanning eraseblock 1: alien
[...]
libscan: scanning eraseblock 90: alien
libscan: scanning eraseblock 91: alien
libscan: scanning eraseblock 92: empty
libscan: scanning eraseblock 93: empty


[...]
libscan: scanning eraseblock 115: empty
libscan: finished, mean EC 0, 0 OK, 0 corrupted, 24 empty, 92 alien, bad 0
ubiformat: 24 eraseblocks are supposedly empty
ubiformat: warning!: 92 of 116 eraseblocks contain non-ubifs data
ubiformat: continue? (yes/no)  yes
ubiformat: warning!: only 0 of 116 eraseblocks have valid erase counter
ubiformat: erase counter 0 will be used for all eraseblocks
ubiformat: note, arbitrary erase counter value may be specified using -e
option
ubiformat: continue? (yes/no)  yes
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: eraseblock 0: erase, do not write EC, leave for vtbl
ubiformat: eraseblock 1: erase, do not write EC, leave for vtbl
ubiformat: eraseblock 2: erase, write EC 0
ubiformat: eraseblock 3: erase, write EC 0


[...]
ubiformat: eraseblock 115: erase, write EC 0
ubiformat: write volume table to eraseblocks 0 and 1
~ #

Nothing was apparently broken after ubiformat, system kept running
smoothly. But I can't use ubiformat for writing kernel image, can I?

Is there any other way to write raw kernel image to /dev/mtd1 other than
using nandwrite?

> Also, please, give me your page and sub-page size. 

UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   16384 bytes (16 KiB)
UBI: logical eraseblock size:    15360 bytes
UBI: smallest flash I/O unit:    512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                1024
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "ubi"
UBI: MTD device size:            61 MiB
UBI: number of good PEBs:        3960
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       89
UBI: wear-leveling threshold:    256
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             2054
UBI: total number of reserved PEBs: 1906
UBI: number of PEBs reserved for bad PEB handling: 195
UBI: max/mean erase counter: 4/0

Michal
