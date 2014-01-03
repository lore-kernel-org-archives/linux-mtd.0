Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz3CW-000511-Eo
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 11:46:05 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Subject: UBIFS seeing corrupt blank pages when image flashed via u-boot
Date: Fri, 3 Jan 2014 11:45:28 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have been facing a weird problem, may be someone has a solution.

*_Case-1_ Flashing UBIFS image from u-boot using 'nand write' utility*

For a partially written erased-block..
(a) 1st page is written with 'erase-header'
(b) 2nd page is written with 'volume-header'
(c) '3rd page' is written with 'some data'
(d) '4th to last-page of block' should be left blank, but they are written =
with 0xFF.
As a effect of (d), the ECC calculated for (all 0xff data) is written to
OOB area of all pages from 4th-page till last-page of the PEB.

As per my understanding, after mounting UBIFS as root, kernel tries to
append some data to some files in rootfs, due to which leftover pages (d)
get written by appended data, _without_ PEB getting erased.
This causes ECC bytes to get corrupted, because OOB of 'unused-pages'
was already written with ECC of (all 0xff data) by u-boot in step(d).
And on next reboot, kernel sees 'un-corrected ECC' errors while booting.


*_Case-2_ Flashing UBIFS image from kernel using 'ubiformat' utility*

Whereas when same image is flashed using 'ubiformat' utility, after booting
Kernel from other root source. 'ubiformat' automatically skips empty pages
(4th to last-page) in erased-block. Thus OOB area of pages from 4th-page
till last-page are un-touched.
Hence, when kernel 'appends' the rootfs files there is no ECC corruption
as the OOB area of 4th to last-page of PEB were blank. So everything works =
fine.


Now my queries:
(1) while _appending_ a file
  (a) does UBIFS writes appended data to same existing PEB, if there is
  enough space in PEB to accommodate new data ?
 OR
  (b) does UBIFS copies the existing data to newer PEB  along with the
   appended data ?

(2) In-case (b), then can someone point me to what can possibly be the issu=
e ?
 (Any references to UBIFS docs on infradead.org may also help).


with regards, pekon
