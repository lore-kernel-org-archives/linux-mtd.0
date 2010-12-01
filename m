Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNg2t-0003ef-5l
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 06:20:04 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: [PATCH v2 7/8] nandwrite: add check for negative blockalign
Date: Tue, 30 Nov 2010 22:19:44 -0800
Message-ID: <1291184384-4665-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-7-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-7-git-send-email-computersforpeace@gmail.com>
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

Includes error messages for negative blockalign, telling the user what
the offending option and value were.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 5373a89..2e45136 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -218,6 +218,10 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	if (blockalign < 0)
+		errmsg_die("Can't specify negative blockalign with option -b:"
+				" %d", blockalign);
+
 	argc -= optind;
 	argv += optind;
 
-- 
1.7.0.4
