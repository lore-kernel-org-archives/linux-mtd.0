Received: from elasmtp-galgo.atl.sa.earthlink.net ([209.86.89.61])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5cBq-0000N3-1k
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 02:48:47 -0400
Message-ID: <4689F10B.9040401@mindspring.com>
Date: Tue, 03 Jul 2007 02:47:39 -0400
From: Chuck Meade <chuckmeade@mindspring.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	"Chuck Meade (mindspring)" <chuckmeade@mindspring.com>
Subject: jffs2 eraseblock size, and actual flash device eraseblock size
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am generating a jffs2 image for a target that can have one of two
different flash devices installed.  One of these flash devices has
an eraseblock size of 0x20000 bytes, and one has an eraseblock size of
0x10000 bytes.  The storage size of the flash devices is the same.
It would be nice to be able to use the same jffs2 image on both target
flash variants.

I have read what I could find related to this, including the FAQ, such
as here:  http://www.linux-mtd.infradead.org/doc/jffs2.html
which states "creating an image with smaller eraseblock size than the
actual hardware is harmless -- it just gives annoying messages".

I would like to get your expert opinions on what would be the _best_
approach here.  The possible approaches are to create an image with the
eraseblock set to 0x10000, or to 0x20000.  The 0x10000 size would be
smaller than the actual flash eraseblock size on the flash device with
actual eraseblock size=0x20000.  And the opposite problem occurs if you
create an image with eraseblock 0x20000 -- it is larger than the actual
erase block size when using the flash device with eraseblock size 0x10000.

What are the pros and cons here, with respect to efficiency?  Would
both of the above choices even work?

Thanks,
Chuck
