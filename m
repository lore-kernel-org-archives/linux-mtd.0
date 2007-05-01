Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hitd4-0006QN-Bi
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 10:46:59 -0400
Subject: [PATCH 1/5] Add LZO compression support to the kernel
From: Richard Purdie <rpurdie@openedhand.com>
To: LKML <linux-kernel@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>, herbert@gondor.apana.org.au
Content-Type: text/plain
Date: Tue, 01 May 2007 15:46:47 +0100
Message-Id: <1178030807.5883.52.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-crypto@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add LZO1X compression/decompression support to the kernel.

This is based on the standard userspace lzo library, particularly 
minilzo with the headers much trimmed down and simplified for kernel
use. Its structured so that it should still diff with the userspace
version for ease of future updating.

Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

---
 include/linux/lzo.h |   63 ++
 lib/Kconfig         |    5 +
 lib/Makefile        |    1 +
 lib/lzo/Makefile    |    3 +
 lib/lzo/lzoconf.h   |  186 ++++++
 lib/lzo/lzodefs.h   |  463 ++++++++++++++
 lib/lzo/lzointf.c   |   37 ++
 lib/lzo/minilzo.c   | 1771 +++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 2529 insertions(+), 0 deletions(-)

http://folks.o-hand.com/richard/lzo/lzo_kernel-r1.patch
(since it exceeds the file size limit for LKML)
