Received: from web20729.mail.yahoo.com ([216.136.226.119])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ar3l0-0002px-OF
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 23:27:02 +0000
Message-ID: <20040211232659.2415.qmail@web20729.mail.yahoo.com>
Date: Wed, 11 Feb 2004 15:26:59 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: linuxmtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Help: Error on mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have some error when mounting a JFFS2 root
filesystem. My flash is Am29PL320D on a MPC8245 board,
16MB at two banks (0xFF800000, and 0xFF000000).
CONFIG_MTD_CFI_B8 and CONFIG_MTD_CFI_I2 are set. The
root fs image has benn programmed to bank 1 which
starts at 0xFF000000. The error message is shown
below.

MTD do_write_oneword(): WRITE 0x00051b40(0x000000f0)
MTD do_write_oneword(): Check 0x6f6c65ff 0x1985e002
MTD do_write_oneword(): Check 0x6f6c65ff 0x1985e002
MTD do_write_oneword(): Wacky!  Unable to decode
failure status
Possible buggy device - try increasing retry_cmd_max
from 5
MTD do_write_oneword(): 0x00051b40(0x00000000):
0x6f6c65ff 0x1985c002 0x6f6c65ff
 0x1985e002
Write error in obliterating obsoleted node at
0x00051b44: -5
MTD do_erase_oneblock(): ERASE 0x00680000
Chip not ready after erase suspended: status = 0x1032
error -5 reading node at 0x0004faac in
get_inode_nodes()
jffs2_get_inode_nodes() for ino 2 returned -5
Returned error for crccheck of ino #2. Expect
badness...
Chip not ready after erase suspended: status = 0x1032
error -5 reading node at 0x000574b0 in
get_inode_nodes()
jffs2_get_inode_nodes() for ino 4 returned -5
Returned error for crccheck of ino #4. Expect
badness...

The following debugging information about the flash
chip may be helpful.

ep8245:Probing 0x00800000 at 0xff000000
Number of erase regions: 4
Primary Vendor Command Set: 0002 (AMD/Fujitsu
Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
No Vpp line
Typical byte/word write timeout: 16 µs
Maximum byte/word write timeout: 512 µs
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 65536 ms
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0005
  - Unknown
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 4
  Erase Region #0: BlockSize 0x8000 bytes, 1 blocks
  Erase Region #1: BlockSize 0x4000 bytes, 2 blocks
  Erase Region #2: BlockSize 0x30000 bytes, 1 blocks
  Erase Region #3: BlockSize 0x40000 bytes, 15 blocks
EP8245 Flash Bank #1: Found 2 x32 devices at 0x0 in
64-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
EP8245 Flash Bank #1: Swapping erase regions for
broken CFI table.
number of CFI chips: 1
Using word write method
cfi_cmdset_0002: Disabling fast programming due to
code brokenness.

Any help is appreciated!

-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html
