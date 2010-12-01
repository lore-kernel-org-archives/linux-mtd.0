Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNg3k-0003jC-8y
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 06:20:57 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: [PATCH v2 8/8] nandwrite: use common.h "errmsg_die"
Date: Tue, 30 Nov 2010 22:20:46 -0800
Message-ID: <1291184446-4730-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-8-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-8-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

errmsg_die() should be nearly the equivalent of the error message used
here. This saves a few lines.

Also edited the error message to include the offending option and got
rid of the quotes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 2e45136..7f459cb 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -212,11 +212,9 @@ static void process_options(int argc, char * const argv[])
 		}
 	}
 
-	if (mtdoffset < 0) {
-		fprintf(stderr, "Can't specify a negative device offset `%lld'\n",
-				mtdoffset);
-		exit(EXIT_FAILURE);
-	}
+	if (mtdoffset < 0)
+		errmsg_die("Can't specify negative device offset with option"
+				" -s: %lld", mtdoffset);
 
 	if (blockalign < 0)
 		errmsg_die("Can't specify negative blockalign with option -b:"
-- 
1.7.0.4
