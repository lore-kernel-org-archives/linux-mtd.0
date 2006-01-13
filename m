Received: from dexter.ooi.net ([66.251.134.16])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ExTa1-0004X3-HP
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 13:23:23 -0500
From: "Ron Kundla" <ron@eccincorp.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 13 Jan 2006 13:23:15 -0500
Message-ID: <JCEOLKMAAGHNKFADCFPFCEFBCCAA.ron@eccincorp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Any reported issues with mtd and Intel Strataflash TE28F128 J3D75?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I do software work on a board that is moving from the TE28F128 J3C150 to the
TE28F128 J3D75 because the J3C parts are going obsolete.

According to the Intel migration guide, the J3D part is a drop in
replacement for the J3C with a couple of exceptions, such as a change when
reading the block
locking configuration identifier codes (J3D uses 0x0000/0x0001 versus J3C
using 0xFFFC/0xFFFF) and some minor detail about the Enhanced Configuration
Register (ECR).

I am using the mtd driver from the 2.4.20 build of Linux and the problem I
am seeing with the new flash is I getting IO errors during the write cycle,
not as much when using cat /dev/mtd2 >/dev/mtd1 but using the program curl
to load images into a mtd partition. Reading partitions and erasing
partitions seem to work okay.

The timings of the J3D are the same or faster than the J3C, so I don't think
it is a chip select configuration issue.

I appreciate any insight you all might have.

Regards,
Ron Kundla
