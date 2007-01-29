Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBTUp-0005nI-Vn
	for linux-mtd@lists.infradead.org; Mon, 29 Jan 2007 05:12:21 -0500
Subject: [PATCH] [MTD] CMD002: use writesize
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-YwaOVRd3ku6T5MHM0sQl"
Date: Mon, 29 Jan 2007 12:11:43 +0200
Message-Id: <1170065503.9477.51.camel@sauron>
Mime-Version: 1.0
Cc: Nicolas Pitre <nico@cam.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YwaOVRd3ku6T5MHM0sQl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

the writev() in cmd002 implementation uses mtd->eccsize but it seems to
really mean mtd->writesize (minimal write unit). Fix this.

P.S.: I actually do not really understand what mtd->eccsize mean. Nobody
initializes it at all and it is 0, so the function should anyway be
broken (?).

The patch is attached.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

--=-YwaOVRd3ku6T5MHM0sQl
Content-Disposition: attachment; filename=cmd002-use-writesize.patch
Content-Type: application/mbox; name=cmd002-use-writesize.patch
Content-Transfer-Encoding: 7bit

>From 9dc396cd4e7dbb5e481e522b3e586f1f6ddbeb9e Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Mon, 29 Jan 2007 12:05:03 +0200
Subject: [PATCH] [MTD] CMD002: use writesize

The cfi_staa_write_buffers() uses mtd->eccsize but means mtd->writesize.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d56849f..69d49e0 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -662,7 +662,7 @@ static int cfi_staa_write_buffers (struct mtd_info *mtd, loff_t to,
  * a small buffer for this.
  * XXX: If the buffer size is not a multiple of 2, this will break
  */
-#define ECCBUF_SIZE (mtd->eccsize)
+#define ECCBUF_SIZE (mtd->writesize)
 #define ECCBUF_DIV(x) ((x) & ~(ECCBUF_SIZE - 1))
 #define ECCBUF_MOD(x) ((x) &  (ECCBUF_SIZE - 1))
 static int
-- 
1.4.4.2


--=-YwaOVRd3ku6T5MHM0sQl--
