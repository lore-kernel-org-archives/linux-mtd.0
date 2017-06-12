Received: from gecko.sbs.de ([194.138.37.40])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwX-0003K2-Nz
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:35 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp7bu004153
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:07 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 04/20] mkfs.jffs2: Use defines for exit code values
Date: Mon, 12 Jun 2017 12:50:45 +0200
Message-Id: <20170612105101.18223-5-daniel.wagner@siemens.com>
In-Reply-To: <20170612105101.18223-1-daniel.wagner@siemens.com>
References: <20170612105101.18223-1-daniel.wagner@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make the usage of exit consist. That is use the pre defined exit
values.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 jffsX-utils/mkfs.jffs2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index c77f19005b3e..2fb77301431f 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -1052,7 +1052,7 @@ static void formalize_posix_acl(void *xvalue, int *value_len)
 	if (offset > *value_len) {
 		printf("Length of JFFS2 ACL expression(%u) is longer than general one(%u).\n",
 				offset, *value_len);
-		exit(1);
+		exit(EXIT_FAILURE);
 	}
 	memcpy(xvalue, buffer, offset);
 	*value_len = offset;
-- 
2.9.4
