Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZ3C2-00087g-W9
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2011 15:48:51 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 4/7] nanddump: warn about new default BB handling
Date: Tue, 21 Jun 2011 08:46:38 -0700
Message-ID: <1308671201-18197-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308671201-18197-1-git-send-email-computersforpeace@gmail.com>
References: <1308671201-18197-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In an upcoming release, we will no longer default to --bb=padbad. Instead,
the default will be --bb=skipbad. This makes nanddump a better inverse
operation to nandwrite.

This patch prints warnings for users so that they get a chance to update
their scripts before the default changes officially.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index d9f24a1..81ada28 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -251,6 +251,11 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	if (bb_default)
+		fprintf(stderr, "Warning: you did not specify a default bad-block handling\n"
+				"  method. In future versions, the default will change to\n"
+				"  --bb=skipbad. Use \"nanddump --help\" for more information.\n");
+
 	if ((argc - optind) != 1 || error)
 		display_help();
 
-- 
1.7.0.4
