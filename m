Received: from mail.oco.net ([216.171.163.254] helo=oco.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHvOn-0008Vu-2G
	for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2003 01:26:53 +0000
Message-ID: <3FAAF44B.8020804@celerity.net>
Date: Thu, 06 Nov 2003 17:24:27 -0800
From: Chris Ellec <cellec@celerity.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------070509030302040806040708"
Subject: INFTL report
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070509030302040806040708
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


I patched a fresh 2.4.22 with 20031105 from cvs and configured the 
kernel for inftl insead of nftl.

$ modprobe -a doc200 inftl mtdchar mtdblock
$ modprobe -a  docprobe

produced the attached /var/log/messages and also those lines that were 
not in the log file;

INFTL: corrupt block 7140 in chain 7140, chain length 0, erase mark 0x0?
INFTL: formatting chain at block 7140
INFTL: error while formatting block 7140

repeated for a few more addresses.

also the loading of docprobe.o seem to fail most of times, even though 
/dev/inftla1 is available for me to mount and create files on it.

relevant part of /var/log/messages attached.

Chris.

--------------070509030302040806040708
Content-Type: text/plain;
 name="log.inftl"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="log.inftl"

Nov  6 17:49:26  INFTL: inftlcore.c $Revision: 1.14 $, inftlmount.c $Revision: 1.12 $
Nov  6 17:49:40  DiskOnChip 2000 TSOP found at address 0xD8000
Nov  6 17:49:40  Flash chip found: Manufacturer ID: EC, Chip ID: 79 (Samsung:NAND 128MiB 3,3V)
Nov  6 17:49:40  2 flash chips found. Total DiskOnChip size: 256 MiB
Nov  6 17:49:40  mtd: Giving out device 0 to DiskOnChip 2000 TSOP
Nov  6 17:49:40  INFTL: add_mtd for DiskOnChip 2000 TSOP
Nov  6 17:49:40  INFTL: INFTL_mount(inftl=0xcf888400)
Nov  6 17:49:40  INFTL: find_boot_record(inftl=0xcf888400)
Nov  6 17:49:40  _DoC_WaitReady called for out-of-line wait
Nov  6 17:49:40  INFTL: Media Header ->
Nov  6 17:49:40      bootRecordID          = BNAND
Nov  6 17:49:40      NoOfBootImageBlocks   = -1
Nov  6 17:49:40      NoOfBinaryPartitions  = 1
Nov  6 17:49:40      NoOfBDTLPartitions    = 1
Nov  6 17:49:52      BlockMultiplerBits    = 0
Nov  6 17:49:52      FormatFlgs            = 1
Nov  6 17:49:53      OsakVersion           = 0x30323135
Nov  6 17:49:55      PercentUsed           = 98
Nov  6 17:49:55      PARTITION[0] ->
Nov  6 17:49:55          virtualUnits    = 4
Nov  6 17:49:55          firstUnit       = 2
Nov  6 17:49:55          lastUnit        = 5
Nov  6 17:49:55          flags           = 0x20000000
Nov  6 17:49:55          spareUnits      = 0
Nov  6 17:49:55      PARTITION[1] ->
Nov  6 17:49:55          virtualUnits    = 16045
Nov  6 17:49:55          firstUnit       = 10
Nov  6 17:49:55          lastUnit        = 16383
Nov  6 17:49:55          flags           = 0xc0000000
Nov  6 17:49:55          spareUnits      = 2
Nov  6 17:49:55  _DoC_WaitReady called for out-of-line wait
Nov  6 17:49:55   fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:55  3750: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:55  3758: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:55  3760: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:55  3768: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:55  3770: fffe fffe fffe fffe fffe fffe fffe fffe 

<snip>

Nov  6 17:49:56  3fd0: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:56  3fd8: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:56  3fe0: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:56  3fe8: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:56  3ff0: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:56  3ff8: fffe fffe fffe fffe fffe fffe fffe fffe 
Nov  6 17:49:56  -----------------------------------------------------------------------------
Nov  6 17:49:56  INFTL ->
Nov  6 17:49:56    EraseSize       = 16384
Nov  6 17:49:56    h/s/c           = 0/0/0
Nov  6 17:49:56    numvunits       = 16045
Nov  6 17:49:56    firstEUN        = 10
Nov  6 17:49:56    lastEUN         = 16383
Nov  6 17:49:56    numfreeEUNs     = 0
Nov  6 17:49:56    LastFreeEUN     = 0
Nov  6 17:49:56    nb_blocks       = 16384
Nov  6 17:49:56    nb_boot_blocks  = 10
Nov  6 17:49:56  -----------------------------------------------------------------------------
Nov  6 17:49:56  -----------------------------------------------------------------------------
Nov  6 17:49:56  INFTL Virtual Unit Chains:
Nov  6 17:49:56    LOGICAL 0 --> 11 
Nov  6 17:49:56    LOGICAL 1 --> 51 50 49 47 10 29 12 
Nov  6 17:49:56    LOGICAL 17 --> 48 44 28 
Nov  6 17:49:56    LOGICAL 513 --> 45 
Nov  6 17:49:56    LOGICAL 1025 --> 46 
Nov  6 17:49:56    LOGICAL 1537 --> 13 
Nov  6 17:49:56    LOGICAL 2049 --> 14 
Nov  6 17:49:56    LOGICAL 2561 --> 15 
Nov  6 17:49:56    LOGICAL 3073 --> 16 
Nov  6 17:49:56    LOGICAL 3585 --> 17 
Nov  6 17:49:56    LOGICAL 4097 --> 18 
Nov  6 17:49:56    LOGICAL 4609 --> 19 
Nov  6 17:49:56    LOGICAL 5121 --> 20 
Nov  6 17:49:56    LOGICAL 5633 --> 21 
Nov  6 17:49:56    LOGICAL 6145 --> 22 
Nov  6 17:49:56    LOGICAL 6657 --> 23 
Nov  6 17:49:56    LOGICAL 7169 --> 24 
Nov  6 17:49:56    LOGICAL 7681 --> 25 
Nov  6 17:49:56    LOGICAL 8193 --> 26 
Nov  6 17:49:56    LOGICAL 8705 --> 27 
Nov  6 17:49:56    LOGICAL 9217 --> 30 
Nov  6 17:49:56    LOGICAL 9729 --> 31 
Nov  6 17:49:56    LOGICAL 10241 --> 32 
Nov  6 17:49:56    LOGICAL 10753 --> 33 
Nov  6 17:49:56    LOGICAL 11265 --> 34 
Nov  6 17:49:56    LOGICAL 11777 --> 35 
Nov  6 17:49:56    LOGICAL 12289 --> 36 
Nov  6 17:49:56    LOGICAL 12801 --> 37 
Nov  6 17:49:56    LOGICAL 13313 --> 38 
Nov  6 17:49:56    LOGICAL 13825 --> 39 
Nov  6 17:49:56    LOGICAL 14337 --> 40 
Nov  6 17:49:56    LOGICAL 14849 --> 41 
Nov  6 17:49:56    LOGICAL 15361 --> 42 
Nov  6 17:49:56    LOGICAL 15873 --> 43 
Nov  6 17:49:56  -----------------------------------------------------------------------------
Nov  6 17:49:56  INFTL: pass 3, format unused blocks
Nov  6 17:49:56  INFTL: cannot calculate a geometry to match size of 0x7d5a0.
Nov  6 17:49:56  INFTL: using C:1002 H:16 S:32 (== 0x7d400 sects)
Nov  6 17:49:56   inftla:<6>INFTL: inftl_readblock(inftl=0xcf888400,block=0,buffer=0xcd1d1000)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=1,buffer=0xcd1d1200)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=2,buffer=0xcd1d1400)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=3,buffer=0xcd1d1600)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=4,buffer=0xcd1d1800)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=5,buffer=0xcd1d1a00)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=6,buffer=0xcd1d1c00)
Nov  6 17:49:56  INFTL: inftl_readblock(inftl=0xcf888400,block=7,buffer=0xcd1d1e00)
Nov  6 17:49:56   inftla1
Nov  6 17:49:56  Ignoring DiskOnChip 2000 at 0xDA000 - already configured
Nov  6 17:49:56  Ignoring DiskOnChip 2000 at 0xDC000 - already configured
Nov  6 17:49:56  Ignoring DiskOnChip 2000 at 0xDE000 - already configured

--------------070509030302040806040708--
