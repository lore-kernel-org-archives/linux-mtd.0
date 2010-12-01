Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNg1S-00036f-AS
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 06:18:35 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: [PATCH v2 5/8] nanddump: check for negative inputs
Date: Tue, 30 Nov 2010 22:18:23 -0800
Message-ID: <1291184303-4596-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-5-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-5-git-send-email-computersforpeace@gmail.com>
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

Includes error messages for negative device offsets and negative lengths,
telling the user what the offending option and value were.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index b0dd7dc..9f52878 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -173,6 +173,13 @@ static void process_options(int argc, char * const argv[])
 		}
 	}
 
+	if (start_addr < 0)
+		errmsg_die("Can't specify negative offset with option -s: %lld",
+				start_addr);
+
+	if (length < 0)
+		errmsg_die("Can't specify length with option -l: %lld", length);
+
 	if (quiet && pretty_print) {
 		fprintf(stderr, "The quiet and pretty print options are mutually-\n"
 				"exclusive. Choose one or the other.\n");
-- 
1.7.0.4
