Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7kH-0001vC-BZ
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 06:22:05 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 20/27] ubifs: introduce lprops lib
Date: Fri, 13 Nov 2015 14:13:31 +0800
Message-ID: <1447395218-7061-21-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1447395218-7061-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Copy lprops.c from kernel to ubifs-utils/.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/lprops.h |  6 ++++
 ubifs-utils/lib/lprops.c     | 79 ++++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 85 insertions(+)
 create mode 100644 ubifs-utils/include/lprops.h
 create mode 100644 ubifs-utils/lib/lprops.c

diff --git a/ubifs-utils/include/lprops.h b/ubifs-utils/include/lprops.h
new file mode 100644
index 0000000..5bf3108
--- /dev/null
+++ b/ubifs-utils/include/lprops.h
@@ -0,0 +1,6 @@
+#ifndef __UBIFS_LPROPS_H__
+#define __UBIFS_LPROPS_H__
+
+int ubifs_categorize_lprops(const struct ubifs_info *c,
+			    const struct ubifs_lprops *lprops);
+#endif
diff --git a/ubifs-utils/lib/lprops.c b/ubifs-utils/lib/lprops.c
new file mode 100644
index 0000000..818d220
--- /dev/null
+++ b/ubifs-utils/lib/lprops.c
@@ -0,0 +1,79 @@
+/*
+ * This file is part of UBIFS.
+ *
+ * Copyright (C) 2006-2008 Nokia Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as publishe=
d by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along=
 with
+ * this program; if not, write to the Free Software Foundation, Inc., 51
+ * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ *
+ * Authors: Adrian Hunter
+ *          Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=
=D0=B9 =D0=90=D1=80=D1=82=D1=91=D0=BC)
+ */
+
+/*
+ * This file implements the functions that access LEB properties and their
+ * categories. LEBs are categorized based on the needs of UBIFS, and the
+ * categories are stored as either heaps or lists to provide a fast way of
+ * finding a LEB in a particular category. For example, UBIFS may need to =
find
+ * an empty LEB for the journal, or a very dirty LEB for garbage collectio=
n.
+ */
+
+#include "ubifs_common.h"
+
+/* common.h requires the PROGRAM_NAME macro */
+#define PROGRAM_NAME "ubifs-lprops"
+#include "common.h"
+
+#include "ubifs.h"
+
+/**
+ * ubifs_categorize_lprops - categorize LEB properties.
+ * @c: UBIFS file-system description object
+ * @lprops: LEB properties to categorize
+ *
+ * LEB properties are categorized to enable fast find operations. This fun=
ction
+ * returns the LEB category to which the LEB properties belong. Note howev=
er
+ * that if the LEB category is stored as a heap and the heap is full, the
+ * LEB properties may have their category changed to %LPROPS_UNCAT.
+ */
+int ubifs_categorize_lprops(const struct ubifs_info *c,
+			    const struct ubifs_lprops *lprops)
+{
+	if (lprops->flags & LPROPS_TAKEN)
+		return LPROPS_UNCAT;
+
+	if (lprops->free =3D=3D c->leb_size) {
+		ubifs_assert(!(lprops->flags & LPROPS_INDEX));
+		return LPROPS_EMPTY;
+	}
+
+	if (lprops->free + lprops->dirty =3D=3D c->leb_size) {
+		if (lprops->flags & LPROPS_INDEX)
+			return LPROPS_FRDI_IDX;
+		else
+			return LPROPS_FREEABLE;
+	}
+
+	if (lprops->flags & LPROPS_INDEX) {
+		if (lprops->dirty + lprops->free >=3D c->min_idx_node_sz)
+			return LPROPS_DIRTY_IDX;
+	} else {
+		if (lprops->dirty >=3D c->dead_wm &&
+		    lprops->dirty > lprops->free)
+			return LPROPS_DIRTY;
+		if (lprops->free > 0)
+			return LPROPS_FREE;
+	}
+
+	return LPROPS_UNCAT;
+}
--=20
1.8.4.2
