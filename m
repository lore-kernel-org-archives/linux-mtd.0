Received: from rose.man.poznan.pl ([150.254.173.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uyHL-0005ie-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2002 17:15:31 +0100
Received: from localhost (mschulz@localhost)
	by rose.man.poznan.pl (8.11.0/8.11.0) with ESMTP id g39GFU304172
	for <linux-mtd@lists.infradead.org>; Tue, 9 Apr 2002 18:15:30 +0200 (MET DST)
Date: Tue, 9 Apr 2002 18:15:30 +0200 (MET DST)
From: Michal Schulz <mschulz@rose.man.poznan.pl>
To: linux-mtd@lists.infradead.org
Subject: MTD, 2.2.18 and DT28F320 write problemms
Message-ID: <Pine.GSO.4.20.0204091811260.3357-100000@rose.man.poznan.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
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

Hello Folks!

I have managed to compile MTD taken directly from cvs with 2.2.18
kernel. There were some problemms with both mtd and jffs. I have linked
them together with kernel.

JFFS works fine, the system (386EX with 2.5MB of RAM and 4MB Physycally
mapped flash) boots properly, but I have problemms with writting to the
FLash. Every time I try to do it i get:

SR.4 or SR.5 bits set in buffer write (status 98). Clearing.

and nothing more happes. Please note, that flash is properly
detected. Anyone has noticed similar behaviour? Anyone knows how can I=20
write to my flash?

Here is some output with debug level 3:

physmap flash device: 400000 at 3400000
Number of erase regions: 1
Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
Primary Algorithm Table at 0031
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 3.0 V
Vcc Maximum: 5.5 V
Vpp Minimum: 3.0 V
Vpp Maximum: 5.5 V
Typical byte/word write timeout: 16 =B5s
Maximum byte/word write timeout: 256 =B5s
Typical full buffer write timeout: 64 =B5s
Maximum full buffer write timeout: 1024 =B5s
Typical block erase timeout: 512 =B5s
Maximum block erase timeout: 8192 =B5s
Typical chip erase timeout: 32768 =B5s
Maximum chip erase timeout: 524288 =B5s
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x20
Number of Erase Block Regions: 1
  Erase Region #0: BlockSize 0x10000 bytes, 64 blocks
  Feature/Command Support: 000F
     - Chip Erase:         supported
     - Suspend Erase:      supported
     - Suspend Program:    supported
     - Legacy Lock/Unlock: supported
     - Queued Erase:       unsupported
     - Instant block lock: unsupported
     - Protection Bits:    unsupported
     - Page-mode read:     unsupported
     - Synchronous read:   unsupported
  Supported functions after Suspend: 01
     - Program after Erase Suspend: supported
  Block Status Register Mask: 0003
     - Lock Bit Active:      yes
     - Valid Bit Active:     yes
  Vcc Logic Supply Optimum Program/Erase Voltage: 0.0 V
  Vpp Programming Supply Optimum Program/Erase Voltage: 0.0 V
Using buffer write method
mtd: Giving out device 0 to Physically mapped flash

With best regards,

--=20
Michal Schulz
