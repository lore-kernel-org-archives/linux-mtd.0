Received: from gatekeeper.trintech.com ([62.221.5.212]
	helo=ntdub1e.trintech.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyYd8-00083b-QX
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 11:54:28 -0500
Message-ID: <BBB9FA5E1514D511A88D00B0D0AA8EA60AD22073@ntdub1e.trintech.com>
From: Eoghan Doyle <Eoghan.Doyle@trintech.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Feb 2005 16:50:20 -0000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: ST Flashes and buffer write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem with an ST flash and buffer write. It looks similar to =
what
as discussed in several threads as far back as Aug 2002, but I cannot =
find
the solution.

I am using a M28W640 flash. This claims to be an Intel/Sharp Standard =
flash
supporting buffered write.
But the buffered write it supports is not the same as coded in
cfi_cmdset_0001.c.
It uses a double/quad word write instead of a buffer write.

The Intel buffer write is:
1.	Write buffer write command (0xe8)
2.	Write the number of words to follow.
3.	Write each word.
4.	Write the confirm command (0xd0).
5.	Check status.

The ST version is: (see the datasheet at
http://www.datasheetarchive.com/datasheet/pdf/46/469684.html)

1.	Write double/quad word command (0x30/0x56)
2.	Write 2/4 words.
3.	Check status.

In the ST case you must check that the addresses are consecutive and =
that
only bottom bits change.

If you use one of these chips with the MTD you will get EROFS returned =
from
do_write_buffer.

Currently I am defining FORCE_WORD_WRITE as a work around.
I have attached some debug output below.

The questions I have are:
1.	Is there already code to handle this difference, which I have
missed?
2.	How can you tell the difference between the 2 write buffer methods
without resorting to tying it to a specific vender/chip?
3.	Will this make much of a difference to write speeds?

Thanks for your help,
Eoghan

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Debug output:
Number of erase regions: 2
Primary Vendor Command Set: 0003 (Intel/Sharp Standard)
Primary Algorithm Table at 0035
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
Vpp Minimum: b.4 V
Vpp Maximum: c.6 V
Typical byte/word write timeout: 16 =B5s
Maximum byte/word write timeout: 512 =B5s
Typical full buffer write timeout: 16 =B5s
Maximum full buffer write timeout: 512 =B5s
Typical block erase timeout: 1024 =B5s
Maximum block erase timeout: 8192 =B5s
Chip erase not supported
Device size: 0x800000 bytes (8 MiB)
Flash Device Interface description: 0x0001
  - x16-only asynchronous interface
Max. bytes in buffer write: 0x8
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 127 blocks
  Feature/Command Support: 0066
     - Chip Erase:         unsupported
     - Suspend Erase:      supported
     - Suspend Program:    supported
     - Legacy Lock/Unlock: unsupported
     - Queued Erase:       unsupported
     - Instant block lock: supported
     - Protection Bits:    supported
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
