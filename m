Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCUS2-00062a-B1
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:03 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmUw009491
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 30/35] fs-tests: integck: free raw write information
Date: Wed, 20 Apr 2011 13:19:03 +0300
Message-Id: <1303294748-5492-31-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
References: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

The test leaks memory like hell because it does not free the raw writes
information. This patch fixes the leaks.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 50b414f..96937ff 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -610,6 +610,13 @@ static void free_writes_info(struct file_info *file)
 		free(w);
 		w = next;
 	}
+
+	w = file->raw_writes;
+	while (w) {
+		next = w->next;
+		free(w);
+		w = next;
+	}
 }
 
 /*
-- 
1.7.2.3
