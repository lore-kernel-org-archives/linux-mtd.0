Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMygs-0004mw-Ch
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:02:28 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 8/8] nandwrite: use common.h "errmsg_die"
Date: Mon, 29 Nov 2010 00:02:02 -0800
Message-ID: <1291017722-23985-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index c409878..c51efd7 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -212,11 +212,9 @@ static void process_options(int argc, char * const argv[])
 		}
 	}
 
-	if (mtdoffset < 0) {
-		fprintf(stderr, "Can't specify a negative device offset `%lld'\n",
+	if (mtdoffset < 0)
+		errmsg_die("Can't specify a negative device offset '%lld'",
 				mtdoffset);
-		exit(EXIT_FAILURE);
-	}
 
 	if (blockalign < 0)
 		errmsg_die("Can't specify a negative blockalign '%d'",
-- 
1.7.0.4
