Received: from thoth.sbs.de ([192.35.17.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwY-0003Jy-Qh
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:40 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp7LC004083
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 03/20] mkfs.jffs2: Return error code if command line option
 is unknown
Date: Mon, 12 Jun 2017 12:50:44 +0200
Message-Id: <20170612105101.18223-4-daniel.wagner@siemens.com>
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

The tool will quit with an exit code 0 if the command line option was
not recognized. By returning an error code a calling script has the
possibility to distinguish between a real success and an invalid
invocation.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 jffsX-utils/mkfs.jffs2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index ca5e0d560f98..c77f19005b3e 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -1629,9 +1629,11 @@ int main(int argc, char **argv)
 				break;
 
 			case 'h':
-			case '?':
 				puts(helptext);
 				exit(EXIT_SUCCESS);
+			case '?':
+				puts(helptext);
+				exit(EXIT_FAILURE);
 
 			case 'v':
 				verbose = 1;
-- 
2.9.4
