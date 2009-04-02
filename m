Received: from rv-out-0708.google.com ([209.85.198.249]
	helo=rv-out-0506.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpFj6-0003Ac-VO
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 05:44:40 +0000
Received: by rv-out-0506.google.com with SMTP id k29so2603051rvb.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Apr 2009 22:44:30 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2009 13:44:30 +0800
Message-ID: <e8775dd00904012244o30200226p4e748d89d2a9b9c7@mail.gmail.com>
Subject: ubifs error when do bonnie++ test
From: Jason Liu <liu.h.jason@gmail.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working on the 2.6.26 with ubifs enabled, but after some stress
test, ubifs give some err. The following is the steps to reproduce.

$ ubiattach /dev/ubi_ctrl -m 2
UBI: attaching mtd2 to ubi1
UBI: physical eraseblock size:   1048576 bytes (1024 KiB)
UBI: logical eraseblock size:    1032192 bytes
UBI: smallest flash I/O unit:    8192
UBI: VID header offset:          8192 (aligned 8192)
UBI: data offset:                16384
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI: create volume table (copy #2)
UBI: attached mtd2 to ubi1
UBI: MTD device name:            "nand.rootfs"
UBI: MTD device size:            128 MiB
UBI: number of good PEBs:        128
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             122
UBI: total number of reserved PEBs: 6
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 0/0
UBI: background thread "ubi_bgt1d" started, PID 2166
UBI device number 1, total 128 LEBs (132120576 bytes, 126.0 MiB),
available 122 LEBs (125927424 byt
es, 120.1 MiB), LEB size 1032192 bytes (1008.0 KiB)

$ ubimkvol /dev/ubi1 -N test -m
Set volume size to 125927424
Volume ID 0, size 122 LEBs (125927424 bytes, 120.1 MiB), LEB size
1032192 bytes (1008.0 KiB), dynam
ic, name "test", alignment 1

$ mount -t ubifs ubi1:test /mnt/ubifs
UBIFS: default file-system created
UBIFS: mounted UBI device 1, volume 0, name "test"
UBIFS: file system size:   116637696 bytes (113904 KiB, 111 MiB, 113 LEBs)
UBIFS: journal size:       8257537 bytes (8064 KiB, 7 MiB, 6 LEBs)
UBIFS: media format:       4 (latest is 4)
UBIFS: default compressor: LZO
UBIFS: reserved for root:  5182151 bytes (5060 KiB)

$ ./bonnie\+\+ -d /mnt/ubifs -s 32 -r 16 -u 0:0 -m FSL -x 1000

when running at 390 times, the following error shows up:

Reading intelligently...done
start 'em...done...done...done...
Create files in sequential order...done.
Stat files in sequential order...done.
Delete files in sequential order...done.
Create files in random order...done.
Stat files in random order...done.
Delete files in random order...UBI: scrubbed PEB 54, data moved to PEB 69
UBIFS error (pid 4500): ubifs_check_node: bad magic 0x4811831,
expected 0x6101831
UBIFS error (pid 4500): ubifs_check_node: bad node at LEB 22:163392
UBIFS error (pid 4500): ubifs_read_node: expected node type 2
UBIFS warning (pid 4500): ubifs_ro_mode: switched to read-only mode, error -117
Can't delete file Q0010289
Cleaning up test directory after error.
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 4500): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30

When power down and re-attach the mtd2, I get the following information:
$ ubiattach /dev/ubi_ctrl -m 2
UBI: attaching mtd2 to ubi1
UBI: physical eraseblock size:   1048576 bytes (1024 KiB)
UBI: logical eraseblock size:    1032192 bytes
UBI: smallest flash I/O unit:    8192
UBI: VID header offset:          8192 (aligned 8192)
UBI: data offset:                16384
UBI: attached mtd2 to ubi1
UBI: MTD device name:            "nand.rootfs"
UBI: MTD device size:            128 MiB
UBI: number of good PEBs:        128
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 128
UBI: number of PEBs reserved for bad PEB handling: 2
UBI: max/mean erase counter: 1342/101
UBI: background thread "ubi_bgt1d" started, PID 1994
UBI device number 1, total 128 LEBs (132120576 bytes, 126.0 MiB),
available 0 LEBs (0 bytes), LEB s
ize 1032192 bytes (1008.0 KiB)

I found the available PEBs became 0 and total number of reserved PEBs:
128?  What happened and why happen?
Please give your kind help on this? Thanks,
