Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCC6K-0007J6-Tf
	for linux-mtd@lists.infradead.org; Wed, 31 Jan 2007 04:50:03 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext11.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l0V9l6vx013812
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jan 2007 11:47:08 +0200
Subject: [PATCH] [MTD] clarify interface
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-sU/L2u65dx3mC40VvUYo"
Date: Wed, 31 Jan 2007 11:49:37 +0200
Message-Id: <1170236977.3635.3.camel@sauron>
Mime-Version: 1.0
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sU/L2u65dx3mC40VvUYo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

DQotLSANCkJlc3QgcmVnYXJkcywNCkFydGVtIEJpdHl1dHNraXkgKNCR0LjRgtGO0YbQutC40Lkg
0JDRgNGC0ZHQvCkNCg==


--=-sU/L2u65dx3mC40VvUYo
Content-Disposition: attachment; filename=add-if-comments.diff
Content-Type: message/rfc822; name=add-if-comments.diff

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 31 Jan 2007 11:43:13 +0200
Subject: [PATCH] [MTD] clarify interface
Message-Id: <1170236977.3635.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Add more comment to OOB I/O interface. Read/write are not
symmetric which is confusing and should be documented.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/linux/mtd/mtd.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8a2e8bf..6a8570b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -85,6 +85,10 @@ typedef enum {
  *		mode = MTD_OOB_PLACE)
  * @datbuf:	data buffer - if NULL only oob data are read/written
  * @oobbuf:	oob data buffer
+ *
+ * Note, it is allowed to read more then one OOB area at one go, but not write.
+ * The interface assumes that the OOB write requests program only one page's
+ * OOB area.
  */
 struct mtd_oob_ops {
 	mtd_oob_mode_t	mode;
-- 
1.4.4.2


--=-sU/L2u65dx3mC40VvUYo--
