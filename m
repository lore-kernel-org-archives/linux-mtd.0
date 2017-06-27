Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPxTg-0001vd-4Z
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 20:52:53 +0000
Received: by mail-pf0-x22a.google.com with SMTP id q86so22163193pfl.3
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 13:52:31 -0700 (PDT)
From: Harpreet Eli Sangha <harpreet@nestlabs.com>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at
Subject: [PATCH] mtd-utils: tests: Fix nandbiterrs Failure Check
Date: Tue, 27 Jun 2017 13:52:26 -0700
Message-Id: <20170627205226.18734-1-harpreet@nestlabs.com>
In-Reply-To: <CAOMZO5CPDSsG9oe5ZV-VVxp9BVB=WU_i03LYtPe8LWy+d=5uAw@mail.gmail.com>
References: <CAOMZO5CPDSsG9oe5ZV-VVxp9BVB=WU_i03LYtPe8LWy+d=5uAw@mail.gmail.com>
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

Signed-off-by: Harpreet "Eli" Sangha <harpreet@nestlabs.com>
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
2.13.2.725.g09c95d1e9-goog
