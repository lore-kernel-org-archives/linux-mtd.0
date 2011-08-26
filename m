Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qwto9-0004uk-Pr
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2011 10:38:42 +0000
Received: by gwb1 with SMTP id 1so3098886gwb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Aug 2011 03:38:39 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Aug 2011 16:08:39 +0530
Message-ID: <CAMjNe_fj+FQSV9fX-sjh3hdW-CTNaqwmnS+36if6NcvLtpxOKw@mail.gmail.com>
Subject: [PATCH] UBIFS: fix the dark space calculation
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
The dark space calculation should be 64 bit type-casted ,when
assigning to tmp64( similar to how total_free is calculated).
Overflow will occur for very large flashes.

Signed-off-by: srimugunthan <srimugunthan.dhandapani@gmail.com>
---
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 93d938a..6094c5a 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -247,7 +247,7 @@ static int create_default_filesystem(struct ubifs_info *c)
        mst->total_dirty = cpu_to_le64(tmp64);

        /*  The indexing LEB does not contribute to dark space */
-       tmp64 = (c->main_lebs - 1) * c->dark_wm;
+       tmp64 = ((long long)(c->main_lebs - 1) * c->dark_wm);
        mst->total_dark = cpu_to_le64(tmp64);

        mst->total_used = cpu_to_le64(UBIFS_INO_NODE_SZ);
--
