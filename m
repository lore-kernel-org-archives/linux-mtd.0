Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IE4f-0000lt-2G
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2003 21:51:05 +0100
From: "John Burch" <jburch@vincisystems.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 20 May 2003 16:53:30 -0400
Message-ID: <002701c31f11$e009ce70$1200a8c0@JOHNB>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Mtd block access (jffs2 formatted) and mtd char access
 (unformatted) on different partitions of a single flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is there a preferred way to access different mtd partitions of a single
flash device when certain accesses will be (1) block oriented via
standard file I/O of a jffs2 file system mounted on a /dev/mtdblockN
device and other accesses will be (2) character oriented via 'dd' (or
some other mechanism?) of unformatted/raw flash using /dev/mtdN?  Are
there any possibly bad interactions between mtd char and block device
access to the same device?

I've adopted a system that uses a driver with its own flash support to
read/write raw (non-jffs2) portions of the flash, while application code
uses standard file I/O to read/write jffs2 partitions on the same
device.  I'm concerned that these accesses may clash and possibly result
in corrupted flash, crashed kernel, etc.  Is this a legitimate concern
or does the mtd driver check flash status prior to any operations?


Thanks,
John
