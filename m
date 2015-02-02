Received: from mail-am1on0773.outbound.protection.outlook.com
 ([2a01:111:f400:fe00::773]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIHUV-0001MD-SQ
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 13:56:40 +0000
From: "Sharma, Abhishek (A.)" <asharm14@visteon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Regarding integck failure
Date: Mon, 2 Feb 2015 13:55:55 +0000
Message-ID: <DB4PR06MB0160562E38A78408A7CF5CDC83C0@DB4PR06MB016.eurprd06.prod.outlook.com>
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

Hi All,

I am running the integck test on a UBIFS file system with power cut enabled=
.
Below steps were followed:

1. enabling the power cut after every minute using echo 1 > /sys/kernel/deb=
ug/ubifs/ubi2_0/tst_recovery
2. run the integck with -p option. (integck -p /meta  where meta is a UBIFS=
 partition)

After around 4 hours the integck stops with the following error message

UBIFS error (pid 594): ubifs_scan: bad node
UBIFS error (pid 594): ubifs_scanned_corruption: corruption at LEB 187:2652=
16
UBIFS error (pid 594): ubifs_scanned_corruption: first 8192 bytes from LEB =
187:265216
UBIFS error (pid 594): ubifs_scan: LEB 187 scanning failed
UBIFS error (pid 594): ubifs_dump_leb: scan error -117
UBIFS error (pid 594): do_writepage: cannot write page 11769 of inode 7424,=
 error -30
UBIFS error (pid 1413): make_reservation: cannot reserve 4144 bytes in jhea=
d 2, error -30
UBIFS error (pid 1413): do_writepage: cannot write page 11770 of inode 7424=
, error -30
UBIFS error (pid 1413): make_reservation: cannot reserve 160 bytes in jhead=
 1, error -30
UBIFS error (pid 1413): ubifs_write_inode: can't write inode 7424, error -3=
0



UBIFS error (pid 2116): ubifs_leb_write: writing 4096 bytes to LEB 190:4915=
20 failed, error -30
UBIFS error (pid 637): make_reservation: cannot reserve 4144 bytes in jhead=
 2, error -30
UBIFS error (pid 594): make_reservation: cannot reserve 4144 bytes in jhead=
 2, error -30
UBIFS error (pid 594): do_writepage: cannot write page 16125 of inode 7518,=
 error -30
UBIFS error (pid 2116): do_commit: commit failed, error -30
UBIFS error (pid 637): do_writepage: cannot write page 564 of inode 7526, e=
rror -30
UBIFS error (pid 637): make_reservation: cannot reserve 160 bytes in jhead =
1, error -30
UBIFS error (pid 637): ubifs_write_inode: can't write inode 7526, error -30
UBIFS error (pid 2129): ubifs_leb_write: writing 4096 bytes to LEB 598:4915=
2 failed, error -30
UBIFS error (pid 1413): make_reservation: cannot reserve 4144 bytes in jhea=
d 2, error -30
UBIFS error (pid 1413): do_writepage: cannot write page 2638 of inode 7613,=
 error -30
UBIFS error (pid 2129): do_commit: commit failed, error -30
UBIFS error (pid 1413): make_reservation: cannot reserve 160 bytes in jhead=
 1, error -30
UBIFS error (pid 1413): ubifs_write_inode: can't write inode 7613, error -3=
0
integck: error!: cannot open file /meta/integck_test_dir_594/605695
         error 2 (No such file or directory)
integck: error!: condition '0' failed in file_check() at integck.c:1568
integck: error 2 (No such file or directory)

Please let me know if it is a valid failure or I am missing something.

Thanks
Abhishek
