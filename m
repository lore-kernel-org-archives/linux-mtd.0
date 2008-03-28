Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jf8SZ-00045Z-UU
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 06:53:08 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m2S6qviD022705
	for <linux-mtd@lists.infradead.org>; Fri, 28 Mar 2008 08:53:04 +0200
Subject: [RFC PATCH] UBIFS - new flash file system
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 28 Mar 2008 08:49:25 +0200
Message-Id: <1206686965.3856.69.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[We sent UBIFS patches to LKML, here I forward the first mail.
 Please, refer LKML for the full series. You are welcome to try,
 review, and comment on this. ]

Dear community,

here is a new flash file system developed by Nokia engineers with
help of the University of Szeged. The new file-system is called
UBIFS, which stands for UBI file system. UBI is the wear-leveling/
bad-block handling/volume management layer which is already in
mainline (see drivers/mtd/ubi).

The main objective of UBIFS is better performance and scalability
comparing to JFFS2 which is achieved by
 a) implementing write-back (JFFS2 is write-through)
 b) storing and maintaining the indexing file-system information
    on the media (JFFS2 maintains it in RAM and builds it on each
    mount, which requires full media scanning).

At the same time, UBIFS implements the nice features JFFS2 has -
compression and tolerance to unclean re-boots. Although UBIFS
borrowed basic ideas from JFFS2, it is completely different
file-system.

UBIFS is stable and very close to be production ready. It was
tested on OLPC and N810. The development was done on flash simulator
on a 2-way x86 machine. However, UBIFS needs a good review.

Note, UBIFS works on top of UBI, not on top of bare flash devices.
It delegates crucial things like wear-leveling and bad
eraseblock handling to UBI. One important thing to note is MLC
NAND flashes which tend to have very small eraseblock lifetime -
just few thousand erase-cycles (some have even about 3000 or less).
This makes JFFS2 random wear-leveling algorithm to be not good
enough. In opposite, UBI provides good wear-leveling based on
saved erase-counters.

There is also mkfs.ubifs user-space utility, so it is possible to
prepare UBIFS images. Please, see the URLs given at the end of this
letter.

UBIFS performs quite well - it gives very good write performance
because of write-back (write tests gave us ~100 times faster
performance which is clearly because of the caching) while giving
about the same performance as JFFS2 gives on synchronous operations.
Obviously, it is extremely difficult to compete with JFFS2 on
synchronous operations because it maintains the FS index in RAM,
while UBIFS maintains it on the flash media. However, because of
many tricks and optimization implemented in UBIFS (wandering
and multi-headed journal, write-while-committing, search trees,
etc), it has very good synchronous I/O performance.

UBIFS mount time is considerably faster as well. For example,
In case of OLPC we observed 10-15 seconds faster boot time
comparing to JFFS2 (fast mount, no full media check).

UBIFS is quite complex because it is difficult to maintain
indexing information on the flash media and be fast at the same
time. Please, refer the UBIFS white paper for information
about UBIFS design.

UBIFS documentation and FAQ sections:
http://www.linux-mtd.infradead.org/doc/ubifs.html
http://www.linux-mtd.infradead.org/faq/ubifs.html

UBIFS white-paper:
http://www.linux-mtd.infradead.org/doc/ubifs_whitepaper.pdf

Since UBIFS is closely related to UBI, the UBI documentation/FAQ
is also useful:
http://www.linux-mtd.infradead.org/doc/ubi.html
http://www.linux-mtd.infradead.org/faq/ubi.html

Adrian Hunter
Artem Bityutskiy

The overall diffstat:
 fs/Kconfig                |    3 +
 fs/Makefile               |    1 +
 fs/fs-writeback.c         |    8 +
 fs/ubifs/Kconfig          |   47 +
 fs/ubifs/Kconfig.debug    |  159 ++
 fs/ubifs/Makefile         |    9 +
 fs/ubifs/budget.c         |  822 +++++++++++
 fs/ubifs/build.c          | 1351 ++++++++++++++++++
 fs/ubifs/commit.c         |  708 +++++++++
 fs/ubifs/compress.c       |  264 ++++
 fs/ubifs/debug.c          | 1125 +++++++++++++++
 fs/ubifs/debug.h          |  343 +++++
 fs/ubifs/dir.c            |  989 +++++++++++++
 fs/ubifs/file.c           |  790 ++++++++++
 fs/ubifs/find.c           |  951 +++++++++++++
 fs/ubifs/gc.c             |  773 ++++++++++
 fs/ubifs/io.c             |  921 ++++++++++++
 fs/ubifs/ioctl.c          |  205 +++
 fs/ubifs/journal.c        | 1230 ++++++++++++++++
 fs/ubifs/key.h            |  507 +++++++
 fs/ubifs/log.c            |  769 ++++++++++
 fs/ubifs/lprops.c         | 1341 +++++++++++++++++
 fs/ubifs/lpt.c            | 2239 +++++++++++++++++++++++++++++
 fs/ubifs/lpt_commit.c     | 1628 +++++++++++++++++++++
 fs/ubifs/master.c         |  415 ++++++
 fs/ubifs/misc.h           |  267 ++++
 fs/ubifs/orphan.c         |  952 +++++++++++++
 fs/ubifs/recovery.c       | 1437 +++++++++++++++++++
 fs/ubifs/replay.c         | 1006 +++++++++++++
 fs/ubifs/sb.c             |  581 ++++++++
 fs/ubifs/scan.c           |  368 +++++
 fs/ubifs/shrinker.c       |  410 ++++++
 fs/ubifs/super.c          |  531 +++++++
 fs/ubifs/tnc.c            | 3483
+++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/tnc_commit.c     | 1088 ++++++++++++++
 fs/ubifs/ubifs-media.h    |  701 +++++++++
 fs/ubifs/ubifs.h          | 1519 ++++++++++++++++++++
 fs/ubifs/xattr.c          |  587 ++++++++
 include/linux/writeback.h |    1 +
 39 files changed, 30529 insertions(+), 0 deletions(-)

Note, the code is quite large because of complexity and because
of great deal of comments it has. The debugging stuff also
introduces quite a few lines of code.
