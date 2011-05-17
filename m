Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnS-0004gk-1I
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:27 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFWx006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:24 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/11] fs-tests: integck: return error if fsync fails
Date: Tue, 17 May 2011 10:38:13 +0300
Message-Id: <1305617896-23711-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

If 'fsync()' or 'fdatasync()' fail we have to return an error, but we by
mistake were returning 0 (success).

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 81d384f..83706f8 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1280,6 +1280,8 @@ static int file_write(struct file_info *file, int fd)
 				pcv("fdatasync failed for %s",
 				    get_file_name(file));
 		}
+		if (ret)
+			return -1;
 		file->clean = 1;
 	}
 
-- 
1.7.2.3
