Received: from fmr05.intel.com ([134.134.136.6] helo=hermes.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bwYh-0005DW-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 06:07:03 +0100
Received: from talaria.jf.intel.com (talaria.jf.intel.com [10.7.209.7])
	by hermes.jf.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g7654gK10926
	for <linux-mtd@lists.infradead.org>; Tue, 6 Aug 2002 05:04:42 GMT
Received: from pdsmsxvs01.pd.intel.com (pdsmsxvs01.pd.intel.com [172.16.12.122])
	by talaria.jf.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g7652U303643
	for <linux-mtd@lists.infradead.org>; Tue, 6 Aug 2002 05:02:30 GMT
Message-ID: <957BD1C2BF3CD411B6C500A0C944CA2601499C35@pdsmsx32.pd.intel.com>
From: "Yuan, Cain" <cain.yuan@intel.com>
To: "'nico@cam.org'" <nico@cam.org>
Cc: linux-mtd@lists.infradead.org
Subject: JFFS2 peoblems  with K3  strata flash on  Dalhart
Date: Tue, 6 Aug 2002 13:04:50 +0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,
	I am now test JFFS2 file system on Dalhart with Redboot as
boorloader, Linux version 2.4.18-rmk6-pxa2 and some patches for dalhart.

	When I first burned JFFS2 and linux image into k3 flash and load &
run linux it will report some  warnings but can boot successful.
later  I can   create/del files  on JFFS2 filesystem.  But when I reset the
board,   load linux na drun again, it will report  thousands of warnings.
after linux bootup,  create/del file will all  fail.   Here is the msg:

Probing Lubbock flash at physical address 0x00000000
In check_cmd_set() find CFI Intel Extend command sets.
 Intel/Sharp Extended Query Table at 0x0031
  Feature/Command Support: 01E6
     - Chip Erase:         unsupported
     - Suspend Erase:      supported
     - Suspend Program:    supported
     - Legacy Lock/Unlock: unsupported
     - Queued Erase:       unsupported
     - Instant block lock: supported
     - Protection Bits:    supported
     - Page-mode read:     supported
     - Synchronous read:   supported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0007
     - Lock Bit Active:      yes
     - Valid Bit Active:     yes
     - Unknown Bit 2 Active: yes
  Vcc Logic Supply Optimum Program/Erase Voltage: 0.3 V
Using word write method
cfi probe success.
Using RedBoot partition definition
Creating 7 MTD partitions on "Lubbock flash":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x00080000 : "RedBoot[backup]"
0x00080000-0x00180000 : "unallocated space"
0x00180000-0x00980000 : "JFFS2"
0x00980000-0x00fc0000 : "unallocated space"
0x00fc0000-0x00fc1000 : "RedBoot config"
mtd: partition "RedBoot config" doesn't end on an erase block -- force
read-only
0x00fe0000-0x01000000 : "FIS directory"
Linux Kernel Card Services 3.1.22
  options:  [pm]
...
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000:
0xad74 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004:
0xef02 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008:
0xcf75 instead
  ......  thousands of   such " Magic bitmask ox1985 not found.. "
errors.....................
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 80K
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
Write of 68 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
INIT: version 2.74 booting
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
Write of 293 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00

 thousands of   such  " ARGH: About to write node to 0x0022039c.."   errors.


Linux login: root
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
In function do_write_oneword(), will call cain_deump_state.
Current status is FL_READY.
Current status is FL_READY.
Current status is FL_UNKNOWN.
Current status is FL_UNKNOWN.
Current status is FL_UNKNOWN.
Current status is FL_STATUS.
Write of 299 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
Write of 333 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
Write of 70 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
Write of 70 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
login[41]: root login  on `ttyS0'

[root@Linux /root]$touch jj
ARGH. About to write node to 0x0022039c on flash, but there's data already
there:
0x0022039c: 85 19 02 e0 7b 03 00 00 b3 ad f9 32 3b 01 00 00
Write of 68 bytes at 0x0022039c failed. returned 0, retlen 0
Not marking the space at 0x0022039c as dirty because the flash driver
returned retlen zero
touch: Input/output error
[root@Linux /root]$


Does somebody here counter this problem before?  Any advice?  TIA!!

Best regards.

Cain
