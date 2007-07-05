Received: from mail.cvg.de ([62.153.82.30])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I6VF3-0006CN-2V
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 13:35:48 -0400
Received: from ensc-pc.intern.sigma-chemnitz.de
	(ensc-pc.intern.sigma-chemnitz.de [192.168.2.231])
	by mail.cvg.de (8.13.8/8.13.8) with SMTP id l65HRmcR016385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 5 Jul 2007 19:27:49 +0200
Resent-Message-ID: <ly7iperca3.fsf@ensc-pc.intern.sigma-chemnitz.de>
Subject: Using nand_chip for hardware NAND controllers (here: PXA3xx DFC)?
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 05 Jul 2007 17:58:32 +0200
Message-ID: <ly644yg7vb.fsf@ensc-pc.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=

Hello,

while working on a driver for the PXA3xx NAND controller (short:
DFC), I stumbled about some problems. Current state of work is
available at

           https://www.cvg.de/people/ensc/pxa3xx_dfc/

but this is not meant for submission (it does not build as pxa3xx
arch is not supported by kernel, and beside the write_oob problem,
parts like pure-IO and perhaps polling (for bootloaders) are not
implemented yet).


Some details about the DFC:

* hardware ECC; read operations correct single bit errors and
  report double bit errors.

  Due to this, visible OOB area is reduced by 8 (6 ECC + 2 padding
  bytes) resp. 24 bytes.


  --> in practice, the used ECC algorithm is somehow broken by
  resulting into an ECC sum of 0x00 for erased pages. This causes
  double-byte errors on reading erased pages :(

  I workaround this by comparing read data against 0xff when a
  double byte error occurs and ignoring this error then. Not very
  efficiently, but it works....


  --> I had some problems to find the correct ECC_XXX type.
  Finally I decided to use ECC_NONE, ignore the warnings at
  bootup and fix some settings between nand_scan_ident() +
  _tail().


  --> Raw (reading without ECC checks and perhaps the ECC bytes
  too) and normal read operations can not be distinguished;
  nand_do_read_ops() executes:

  | chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
  | if (...)
  |   chip->ecc.read_page_raw(...);
  | else
  |   chip->ecc.read_page(...);

  Unfortunately, the bits which decide whether to use raw- or normal
  mode (NDCR_ECC_EN) are set already by the cmdfunc(). Hence, I can
  not read plain ECC bytes with the current software interface.  This
  is a minor problem only; for debugging I use a module parameter to
  configure ECC mode.

  In future, it would be nice when cmdfunc() already knows what
  the READ0 is supposed to do (see comments below regarding
  verify_buf() too).


  --> nand_base.c contains a lot of non-trivial code (all the ECC
  functions) which is not used. As pxa3xx is somehow a processor
  for embedded platforms, I would like avoid any bloat in the
  kernel.


* data operation have to happen page-wise; it is not possible to
  read only a single byte or to write only OOB information

  --> this is a huge and still unsolved problem. E.g. using the
  'flash_erase' and 'nand_write' tools in a way like

  | flash_erase /dev/mtd2
  | nandwrite -n -o /dev/mtd2 /tmp/page

  results into a sequence of:

  1. erase page  (from 'flash_erase')
  2. ioctl(..., MEMWRITEOOB, ...)
  3. pwrite(..., data, ...);

  On the NAND layer, step 2 (MEMWRITEOOB) will write OOB data and
  probably a non-FF ECC which is calculated over:

  - the empty data (all 0xFF) and
  - the new OOB.


  Step 3 (data-write) calculates an ECC over:

  - the new data and
  - the previously written OOB

  Both ECCs probably differ and will cause read errors.


  How can I implement write_oob() that it works with current upper
  layers (e.g. JFFS2, YAFFS)?  Is it always used as 'write-oob();
  write-data();'?


  --> partial reads are not supported; reading e.g. only 20
  bytes will set the pxa internal ringbuffer into a state that
  subsequent reads return old data but not the new page.

  A non-DMA based read_buf() implementation will have to read
  into a temporary buffer and copy the content then. This
  makes the implementation ineffienctly.

  It would be nice when a finished-with-current-page callback
  would be added, that is called after all requested data of a
  page have been read. In this callback, the pxa internal buffer
  can be flushed.


* data and command operations are DMA capable; multiple pages can
  be read/written in a single operation

  --> I first tried to implement a zero-copy strategy using
  NAND_OWN_BUFFERS option and publishing internal DMA
  buffers. This would reduce read_buf() to wait for a
  command-done event.

  Unfortunately, this did not worked well, because:

  1. verify_buf() can not implemented
  2. upper layers use own buffers which would nullify the zero-copy
     effect

  Hence, read_buf() is now a wait-for-done and a memcpy()
  operation.


  --> multi-page operations are not supported by the current
  nand_base driver. Dunno, about the possible performance gain.


* there is support for two 8 bit chips connected in parallel. This
  implicates a pagesize of 1024 bytes and bad-block positions of
  10 and 11

  --> I solved this, by not calling nand_scan() but by executing
  nand_scan_ident() and nand_scan_tail() separately and fixing
  some values between these calls.

  | nand_scan_ident(&mtd);
  | dfc_fill_mtd_info();
  | nand_scan_tail(&mtd);

  Such a double-buswidth setup can/should be solved in nand_base.

* the internal boot ROM expects a certain format for the relocation
  information of bad blocks (e.g. last 28 pages of the first block
  contain [bad-block, new-block] pairs by reserving the last 127
  blocks for relocation)

  --> I had no time yet to implement this. Does there exist
  already a relocation scheme which works similarly?


* erase & program can execute a READSTATUS command automatically
  and report the result through some status register

  --> nand_base executes this command explicitly; removing these
  calls might improve performance.


* only READ0, PROGRAM, ERASE, RESET, STATUS and READ_ID operations
  are supported, but not READ1 or READOOB or the advanced stuff
  like copy-back.

  --> Some ops (READOOB) are emulated, others (READ1) are assumed
  never to be called. Can become a maintenance problem but is not
  important atm.


* Multi-command operations are handled by the controller (it
  knows when to sent CMD1, addresses, data and CMD2).

  --> Implementation of the cmdfunc looks a little bit hacky. Some
  commands are executed immediately (READ*), others are delayed
  (SEQIN) and others are noops (ERASE2).

  This is the main reason why I am in doubt that nand_base is
  the right choice for hardware NAND controllers. My current
  driver is somehow a NAND emulator which makes some effort to
  downgrade the existing high-level functionality into this of a
  bit-banging interface.

  Unfortunately, higher MTD layers require features like
  non-aligned/non-padded access and shuffling of OOB data.
  Because this is solved in nand_base, I made my driver based
  upon 'nand_chip'.




Enrico

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iQEVAwUARo0VMQc3PX/XHFA7AQpgfQgAmkUJha1QMgU0zChIfd22LOPq0DMjMqHZ
86C7S6/qoWmsSf9xV+KRMT2Z7WhWoV4l14kRl+WnhVpdTd9ciIEvNeZT05Xp9jcV
enHL+gEq8lV6gGAc9kcMUBDPNUPmsDEhrvUT9VG6S3z3RYJ9RtcKMG7vRlC6/MfJ
GqjfvEfaf2uuEwXbYyKC0Xo0TJ3zANvntmXzq+HveBu9WQeVa+jtlg/u+ylHqN5W
xdmlzwKNA/eDD+nm3Hj8MzMji67OzKmyLgSR1O0HFdtTJ51D66NFN/037AKS8Ujx
sQWloBApH3CjG346KOuCeBF2ZLXXPQL6h8b5w9pPgLSYEFmhiKdNMA==
=PMGr
-----END PGP SIGNATURE-----
--=-=-=--
