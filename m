Received: from web61306.mail.yahoo.com ([216.155.196.149])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmVg1-0006iq-9Z
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2005 06:20:11 -0500
Message-ID: <20050106111925.60960.qmail@web61306.mail.yahoo.com>
Date: Thu, 6 Jan 2005 03:19:25 -0800 (PST)
From: Niraj Maheshwari <neer_mh@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Booting Ramdisk from MTD 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using JFFS2 and MTD on our target for booting the
Ramdisk from MTD device ( Intel W18 Flash ).

Here is the logs for the same. I am getting this error
eveytime when Linux Kernel tries to mount the JFFS2
compressed Ramdisk from the Flash Device.

Can anyone help me out on this ?

Thanks
Niraj
**************************************************

Kernel command line: root=/dev/mtdblock1 rw mem=64M
rootfstype=jffs2 console=ttyS0,115200 ramdisk=8192
physmap flash device: 1000000 at a0000000
phys_mapped_flash: Found 1 x16 devices at 0x0 in
16-bit bank
 Intel/Sharp Extended Query Table at 0x0039
cfi_cmdset_0001: Erase suspend on write enabled
Using word write method
cmdlinepart partition parsing not available
RedBoot partition parsing not available
IntelW18  flash driver (size->0x800000
mem->0xA0300000)
IntelW18 GS504V3.0 Flash: Found 1 x16 devices at 0x0
in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0039
cfi_cmdset_0001: Erase suspend on write enabled
Using word write method
Creating 1 MTD partitions on "IntelW18 Flash":
0x00000000-0x00800000 : "Partition 1"
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind
8192)
NET: Registered protocol family 1
NET: Registered protocol family 17
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 68K
INIT: Eep. Unknown node type 0080 at 00186f34 was
marked REF_UNCHECKED
Node header CRC failed at 00186f34. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000001b4)
Eep. Unknown node type 0080 at 00186e88 was marked
REF_UNCHECKED
Node header CRC failed at 00186e88. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000000ac)
Eep. Unknown node type 0080 at 00186de0 was marked
REF_UNCHECKED
Node header CRC failed at 00186de0. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000000a8)
versionEep. Unknown node type 0080 at 00186bf8 was
marked REF_UNCHECKED
 2Node header CRC failed at 00186bf8. But it must have
been OK earlier.
.7Node was: { 0080, 2080, 00800080, 00800080 }
4 Node totlen on flash (0x00800080) != totlen from
node ref (0x000001e8)
bootEep. Unknown node type 0080 at 001866e0 was marked
REF_UNCHECKED
inNode header CRC failed at 001866e0. But it must have
been OK earlier.
gNode was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x00000518)
Eep. Unknown node type 0080 at 00186124 was marked
REF_UNCHECKED
Node header CRC failed at 00186124. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000005bc)
Eep. Unknown node type 0080 at 00185958 was marked
REF_UNCHECKED
Node header CRC failed at 00185958. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000007cc)
Eep. Unknown node type 0080 at 0018511c was marked
REF_UNCHECKED
Node header CRC failed at 0018511c. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x0000083c)
Eep. Unknown node type 0080 at 00184a2c was marked
REF_UNCHECKED
Node header CRC failed at 00184a2c. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000006f0)

Eep. Unknown node type 0080 at 00184328 was marked
REF_UNCHECKED
Node header CRC failed at 00184328. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x00000704)
Eep. Unknown node type 0080 at 00183e34 was marked
REF_UNCHECKED
Node header CRC failed at 00183e34. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000004f4)
Eep. Unknown node type 0080 at 00183a60 was marked
REF_UNCHECKED
Node header CRC failed at 00183a60. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000003d4)
Eep. Unknown node type 0080 at 00183444 was marked
REF_UNCHECKED
Node header CRC failed at 00183444. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x0000061c)
Eep. Unknown node type 0080 at 00182ca8 was marked
REF_UNCHECKED
Node header CRC failed at 00182ca8. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x0000079c)
Eep. Unknown node type 0080 at 00182550 was marked
REF_UNCHECKED
Node header CRC failed at 00182550. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x00000758)
Eep. Unknown node type 0080 at 00181e14 was marked
REF_UNCHECKED
Node header CRC failed at 00181e14. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x0000073c)
Eep. Unknown node type 0080 at 00181670 was marked
REF_UNCHECKED
Node header CRC failed at 00181670. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000007a4)
Eep. Unknown node type 0080 at 00180da4 was marked
REF_UNCHECKED
Node header CRC failed at 00180da4. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x000008cc)
Eep. Unknown node type 0080 at 00180414 was marked
REF_UNCHECKED
Node header CRC failed at 00180414. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x00000990)
Eep. Unknown node type 0080 at 0018000c was marked
REF_UNCHECKED
Node header CRC failed at 0018000c. But it must have
been OK earlier.
Node was: { 0080, 2080, 00800080, 00800080 }
Node totlen on flash (0x00800080) != totlen from node
ref (0x00000408)


		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - What will yours do?
http://my.yahoo.com 
