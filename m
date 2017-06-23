Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOXfW-0005oG-QN
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 23:07:16 +0000
Received: by mail-pf0-x235.google.com with SMTP id c73so29529458pfk.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 16:06:53 -0700 (PDT)
Received: from eliptus.pao.corp.google.com ([100.96.178.104])
 by smtp.gmail.com with ESMTPSA id f1sm10794300pgc.8.2017.06.23.16.06.51
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 23 Jun 2017 16:06:52 -0700 (PDT)
From: harpreet@nestlabs.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: tests: Fix nandbiterrs Failure Check
Date: Fri, 23 Jun 2017 16:06:50 -0700
Message-Id: <20170623230650.4669-1-harpreet@nestlabs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>

After a page read, the old failure statistics are compared against the
new failure statistics before the new values are actually read.

Signed-off-by: Harpreet "Eli" Sangha
---
 tests/mtd-tests/nandbiterrs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
index 6acbfee..de9d0dd 100644
--- a/tests/mtd-tests/nandbiterrs.c
+++ b/tests/mtd-tests/nandbiterrs.c
@@ -268,15 +268,15 @@ static int read_page(void)
 		return -1;
 	}
 
+	if (ioctl(fd, ECCGETSTATS, &new) != 0)
+		goto failstats;
+
 	if (new.failed > old.failed) {
 		fprintf(stderr, "Failed to recover %d bitflips\n",
 				new.failed - old.failed);
 		return -1;
 	}
 
-	if (ioctl(fd, ECCGETSTATS, &new) != 0)
-		goto failstats;
-
 	return new.corrected - old.corrected;
 failstats:
 	perror("ECCGETSTATS");
-- 
2.13.1.611.g7e3b11ae1-goog
