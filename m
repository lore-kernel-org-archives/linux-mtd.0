Received: from mta-fs-be-01.sunrise.ch ([194.158.229.16]
	helo=mail-fs.sunrise.ch)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DY4M1-0006Hg-Ne
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 11:51:34 -0400
Received: from W2KGUTH (62.167.41.27) by mail-fs.sunrise.ch (7.0.043)
	id 42534D1A01063DB3 for linux-mtd@lists.infradead.org;
	Tue, 17 May 2005 17:51:36 +0200
From: "Hamish Guthrie" <hamish@prodigi.ch>
To: "MTD" <linux-mtd@lists.infradead.org>
Date: Tue, 17 May 2005 17:57:09 +0200
Message-ID: <LDEKLCIFJMAFIOPNLICOIEEGFBAA.hamish@prodigi.ch>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Bad blocks and NAND devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am working on a project to replace the firmware in a numnber of embedded
systems currently running WinCE 2.1. The hardware includes a Toshiba
TC58V64FT 8M NAND flash device.

I have written the hardware interface for the platform for MTD, and am able
to identify the devices, and am able to read with no problems at all, the
only issue is that it appears as though the current flash file system on the
devices does not comply at all with any recommended standard for bad block
handling. On first scan of the device, MTD reported that 998 of the 1024
blocks were considered bad - I have looked at the contents of the OOB data,
and it would appear to me as though the first 8 bytes of this are being used
for filesystem information, the last 8 bytes always being 0xff. Also, byte
517 does not appear to be used to indicate bad blocks.

I have not yet erased any devices, as I am afraid to do so, because I have
no known valid bad block data.

The device I am testing with has in excess of 7.5M of firmware in it, and
that firmware still runs (even after all of my thrashing around with it!) as
long as I put the original NOR boot flash into the device.

Obviously, for long-term reliability purposes, I would like to retain the
original bad block table, so I will continute to persevere and attempt to
figure out how the bad block table is stored in the current flash file
system.

I have a few questions, and wonder if anyone would mind answering them?

1. If I cannot retrieve the original factory bad block table, is there a
GOOD way of detecting the existing bad blocks?

2. If a bad block develops, can I rely on MTD moving data programmed to that
bad block somewhere else?

3. 98% of the flash contents will be essentially static, and the other 2%
will seldom change (configuration data), this means that data is almost
never moved around, now the issue is, if I cannot find the bad block table
from the existing rubbish flash file system, what are the implications if I
do not initially detect a bad block.

4. Can anyone provide hints as to how to go about locating the existing bad
block tables in rubbish filesystems, knowing that the bad block data has
definately been erased from byte 517? The existing devices are reliable
enough for me to assume that they are in fact doing bad block sparing, and
having had a look at 2 devices with the identical firmware in the devices, I
am almost certain I can see (from deduction only) what appears to be a bad
block on the once device and a few on the second device (purely from the
data patturns and knowing that they have the same firmware in them).

5. Is the bad block handling in MTD good enough that I should not be
worrying about this, ot should I still have major concerns. For my root
fileystem and kernel, I intend using squashfs and a raw partition
respectively (both obviously read-only). I was considering using a small
JFFS2 filesystem for my parameters.

Any advice would be most appreciated.

Hamish
--
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.11.11 - Release Date: 16.05.2005
