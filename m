Received: from mail.icp-ag.de ([212.185.29.13] helo=icpmail-hh.icp-intern.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1SDA-0004i4-EG
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 11:39:37 -0500
Message-ID: <256713DBAA00D911828C00065BF75DEB025F72@icpmail-hh.icp-intern.de>
From: "Bobzin,Heiko" <h.bobzin@icp-ag.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 16 Feb 2005 17:39:39 +0100
MIME-Version: 1.0
Content-Type: text/plain
Subject: Data corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello mtd-fellows,

I ran into trouble with a test I've implemented. It is basically the same
as the mtd-util checkfs: writing into the flash while powering down
the device. The problem is, that files which are never touched are
corrupted, not the data I write.
I diff'd the data and exactly one 4K block is set to zero in a 500k file
in a ~7MB JFFS2 flash partition.
It is reproducible in some hours, but the location differs.

Here is the info about the chips and the system:

MX29LV640T (64Mbit)
Flash:  8 MB

Linux version 2.4.27-vrs1 (root@linux) (gcc version 3.4.3) #16 Wed Feb 16
12:24:31 CET 2005
with latest stable mtd patched.

CPU: Arm920Tid(wb) revision 0
Machine: ATMEL AT91RM9200

 Amd/Fujitsu Extended Query Table at 0x0040
  Silicon revision: 0
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: 4 sectors per group
  Temporary block unprotect: Supported
  Block protect/unprotect scheme: 4
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: Not supported
  Vpp Supply Minimum Program/Erase Voltage: 0.0 V
  Vpp Supply Maximum Program/Erase Voltage: 0.0 V
  Top/Bottom Boot Block: Top boot

Last messages while booting, before detecting the corrupted file:

Node header CRC failed at 001f4ec8. But it must have been OK earlier.
Node was: { 0000, 2000, 00000000, 00000000 }
Eep. Unknown node type 0000 at 00603348 was marked REF_UNCHECKED
Node header CRC failed at 00603348. But it must have been OK earlier.
Node was: { 0000, 2000, 00000000, 00000000 }
jffs2_do_read_inode(): No data nodes found for ino #294
Returned error for crccheck of ino #294. Expect badness...

I've also seen read errors, though after a later reboot the system was
intact
and the "read error" was gone.

Any ideas? Does it look like a hardware (chip timing) or software problem?

Thanks in advance,
Heiko
