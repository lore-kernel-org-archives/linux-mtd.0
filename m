Received: from smtp1.ascom-ws.com ([195.81.148.76] helo=mail.ascom-ws.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btuyU-00027Q-AH
 for linux-mtd@lists.infradead.org; Tue, 11 Oct 2016 11:11:59 +0000
From: Danesh Daroui <Danesh.Daroui@ascom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Failure on MTD sub-page test
Date: Tue, 11 Oct 2016 11:11:26 +0000
Message-ID: <39BC08CB3FF4C84CB6397533D4FC7909015DDE3F@SEGOTEXCH02.ascom-Resource.ads>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We are using UBIFS which is shipped with the Kernel 2.6.39.4 on a NAND Flas=
h memory. When I run "mtd_debug info /dev/mtd0" following info are shown:

mtd.type =3D MTD_NANDFLASH
mtd.flags =3D MTD_CAP_NANDFLASH
mtd.size =3D 1073741824 (1G)
mtd.erasesize =3D 524288 (512K)
mtd.writesize =3D 4096 (4K)
mtd.oobsize =3D 128
regions =3D 0

Now the problem is that when I run mtd tests, only read and NAND ECC tests =
are passed. Then all other tests fail on exactly page 21. For instance this=
 is the output when I run page test:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_subpagetest: MTD device: 0
mtd_subpagetest: MTD device size 1073741824, eraseblock size 524288, page s=
ize 4096, subpage size 1024, count of eraseblocks 2048, pages per erasebloc=
k 128, OOB size 128
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: scanned 2048 eraseblocks, 0 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 2048 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: written up to eraseblock 0
mtd_subpagetest: written up to eraseblock 256
mtd_subpagetest: written up to eraseblock 512
mtd_subpagetest: written up to eraseblock 768
mtd_subpagetest: written up to eraseblock 1024
mtd_subpagetest: written up to eraseblock 1280
mtd_subpagetest: written up to eraseblock 1536
mtd_subpagetest: written up to eraseblock 1792
mtd_subpagetest: written 2048 eraseblocks
mtd_subpagetest: verifying all eraseblocks
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: verified 2048 eraseblocks
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 2048 eraseblocks
mtd_subpagetest: verifying all eraseblocks for 0xff
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
UBIFS error (pid 4243): ubifs_read_node: bad node type (255 but expected 1)
UBIFS error (pid 4243): ubifs_read_node: bad node at LEB 30:98088, LEB mapp=
ing status 1
UBIFS error (pid 4243): do_readpage: cannot read page 21 of inode 791, erro=
r -22


Signal 7 (BUS) caught by ps (procps version 3.2.8).
Please send bug reports to <feedback@lists.sf.net> or <albert@users.sf.net>
UBIFS error (pid 4245): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (pid 4245): ubifs_read_node: bad node at LEB 12:458808, LEB map=
ping status 1
UBIFS error (pid 4245): ubifs_iget: failed to read inode 1470, error -22
UBIFS error (pid 4245): ubifs_lookup: dead directory entry 'free', error -2=
2
UBIFS error (pid 4246): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (pid 4246): ubifs_read_node: bad node at LEB 12:458808, LEB map=
ping status 1
UBIFS error (pid 4246): ubifs_iget: failed to read inode 1470, error -22
UBIFS error (pid 4246): ubifs_lookup: dead directory entry 'free', error -2=
2
sh: free: Invalid argument
mtd_subpagetest: verified 2048 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: written up to eraseblock 0
mtd_subpagetest: written up to eraseblock 256
mtd_subpagetest: written up to eraseblock 512
mtd_subpagetest: written up to eraseblock 768
mtd_subpagetest: written up to eraseblock 1024
mtd_subpagetest: written up to eraseblock 1280
mtd_subpagetest: written up to eraseblock 1536
mtd_subpagetest: written up to eraseblock 1792
mtd_subpagetest: written 2048 eraseblocks
mtd_subpagetest: verifying all eraseblocks
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: ECC correction at 0x300400
mtd_subpagetest: ECC correction at 0x3d80400
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: ECC correction at 0x13500000
mtd_subpagetest: verified up to eraseblock 768
mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: ECC correction at 0x3ba00400
mtd_subpagetest: verified 2048 eraseblocks
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 2048 eraseblocks
mtd_subpagetest: verifying all eraseblocks for 0xff
mtd_subpagetest: verified up to eraseblock 0
mtd_subpagetest: verified up to eraseblock 256
mtd_subpagetest: verified up to eraseblock 512
mtd_subpagetest: verified up to eraseblock 768
UBIFS error (pid 4572): ubifs_read_node: bad node type (255 but expected 1)
UBIFS error (pid 4572): ubifs_read_node: bad node at LEB 30:98088, LEB mapp=
ing status 1
UBIFS error (pid 4572): do_readpage: cannot read page 21 of inode 791, erro=
r -22


Signal 7 (BUS) caught by ps (procps version 3.2.8).
Please send bug reports to <feedback@lists.sf.net> or <albert@users.sf.net>
UBIFS error (pid 4576): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (pid 4576): ubifs_read_node: bad node at LEB 12:458808, LEB map=
ping status 1
UBIFS error (pid 4576): ubifs_iget: failed to read inode 1470, error -22
UBIFS error (pid 4576): ubifs_lookup: dead directory entry 'free', error -2=
2
UBIFS error (pid 4581): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (pid 4581): ubifs_read_node: bad node at LEB 12:458808, LEB map=
ping status 1
UBIFS error (pid 4581): ubifs_iget: failed to read inode 1470, error -22
UBIFS error (pid 4581): ubifs_lookup: dead directory entry 'free', error -2=
2
sh: free: Invalid argument

mtd_subpagetest: verified up to eraseblock 1024
mtd_subpagetest: verified up to eraseblock 1280
mtd_subpagetest: verified up to eraseblock 1536
mtd_subpagetest: verified up to eraseblock 1792
mtd_subpagetest: verified 2048 eraseblocks
mtd_subpagetest: finished with 0 errors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Despite 0 errors reported at the end of the test, UBIFS error has happened =
at least twice during the test exactly at page 21. This even worse when I r=
un page test where the test is interrupted with device boot in the middle o=
f the test which prevents the test to be done, as the log shows:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_pagetest: MTD device: 0
mtd_pagetest: MTD device size 1073741824, eraseblock size 524288, page size=
 4096, count of eraseblocks 2048, pages per eraseblock 128, OOB size 128
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 2048 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 2048 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: written up to eraseblock 0
mtd_pagetest: written up to eraseblock 256
mtd_pagetest: written up to eraseblock 512
UBIFS error (pid 2404): ubifs_read_node: bad node type (255 but expected 1)
UBIFS error (pid 2404): ubifs_read_node: bad node at LEB 30:98088, LEB mapp=
ing status 1
UBIFS error (pid 2404): do_readpage: cannot read page 21 of inode 791, erro=
r -22
UBIFS error (pid 2404): ubifs_read_node: bad node type (255 but expected 1)
UBIFS error (pid 2404): ubifs_read_node: bad node at LEB 30:98088, LEB mapp=
ing status 1
UBIFS error (pid 2404): do_readpage: cannot read page 21 of inode 791, erro=
r -22


Signal 7 (BUS) caught by ps (procps version 3.2.8).
Please send bug reports to <feedback@lists.sf.net> or <albert@users.sf.net>
UBIFS error (pid 2406): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (pid 2406): ubifs_read_node: bad node at LEB 12:463712, LEB map=
ping status 1
UBIFS error (pid 2406): ubifs_iget: failed to read inode 1470, error -22
UBIFS error (pid 2406): ubifs_lookup: dead directory entry 'free', error -2=
2
UBIFS warning (pid 2406): ubifs_ro_mode: switched to read-only mode, error =
-22
UBIFS error (pid 2407): ubifs_read_node: bad node type (255 but expected 9)
UBIFS error (pid 2407): ubifs_read_node: bad node at LEB 12:463712, LEB map=
ping status 1
UBIFS error (pid 2407): ubifs_iget: failed to read inode 1470, error -22
UBIFS error (pid 2407): ubifs_lookup: dead directory entry 'free', error -2=
2
sh: free: Invalid argument
mtd_pagetest: written up to eraseblock 768
mtd_pagetest: written up to eraseblock 1024
mtd_pagetest: written up to eraseblock 1280
mtd_pagetest: written up to eraseblock 1536
mtd_pagetest: written up to eraseblock 1792
mtd_pagetest: written 2048 eraseblocks
mtd_pagetest: verifying all eraseblocks
mtd_pagetest: verified up to eraseblock 0
RomBOOT

Since we are using a quite old and outdated kernel version i.e. 2.6.39.4, I=
 am wondering whether a kernel update would fix this problem or not. Becaus=
e kernel update is a quite big task due to incompatibilities that might hap=
pen, then we would prefer to know if the source of the problem is detectabl=
e and if there is any patch that we can use to pass all the tests with the =
current kernel or if we can use the latest version of UIFS without updating=
 the kernel.

Sincerely,

Danesh Daroui
