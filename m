Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMygt-0004mU-2i
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:02:29 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/8] nanddump: check for negative inputs
Date: Mon, 29 Nov 2010 00:01:59 -0800
Message-ID: <1291017722-23985-5-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index b0dd7dc..96b46d4 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -173,6 +173,13 @@ static void process_options(int argc, char * const argv[])
 		}
 	}
 
+	if (start_addr < 0)
+		errmsg_die("Can't specify a negative device offset '%lld'",
+				start_addr);
+
+	if (length < 0)
+		errmsg_die("Can't specify a negative length '%lld'", length);
+
 	if (quiet && pretty_print) {
 		fprintf(stderr, "The quiet and pretty print options are mutually-\n"
 				"exclusive. Choose one or the other.\n");
-- 
1.7.0.4
