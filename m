Received: from alias3.ihug.co.nz ([203.96.222.13])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GpD0o-0003xy-00
	for linux-mtd@lists.infradead.org; Tue, 28 Nov 2006 19:09:28 -0500
From: "Gavin Lambert" <gavinl@compacsort.com>
To: <linux-mtd@lists.infradead.org>
Subject: MTD pointer alignment
Date: Wed, 29 Nov 2006 13:09:08 +1300
Message-ID: <01e801c7134a$9c33da20$4800a8c0@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Given that mtdchar assumes that it can mess with the low 2 bits of the
MTD pointer it keeps around with impunity, add_mtd_device in mtdcore.c
should probably refuse to add any MTD device pointer that doesn't fall
on a 4-byte boundary.

As of kernel 2.6.15, at least, it happily adds it, leading to much
weirdness if the pointer wasn't actually aligned that way (which can
happen if it's embedded in a structure -- since struct mtd_info starts
with a byte-sized field then by default the structure as a whole is
allowed to be byte aligned).
