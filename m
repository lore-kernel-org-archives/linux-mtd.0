Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QSZ4V-0003ZI-Bi
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 18:26:12 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/2] nanddump: sort options in help message
	alphabetically by shortname
Date: Fri, 3 Jun 2011 11:25:01 -0700
Message-ID: <1307125501-32558-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1307125501-32558-1-git-send-email-computersforpeace@gmail.com>
References: <1307125501-32558-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
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
 nanddump.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 78ea22e..c9d7e8b 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -48,6 +48,7 @@ static void display_help(void)
 "           --help               Display this help and exit\n"
 "           --version            Output version information and exit\n"
 "-a         --forcebinary        Force printing of binary data to tty\n"
+"-b         --omitbad            Omit bad blocks from the dump\n"
 "-c         --canonicalprint     Print canonical Hex+ASCII dump\n"
 "-f file    --file=file          Dump to file\n"
 "-k         --skipbad            Skip over bad blocks (see below)\n"
@@ -55,7 +56,6 @@ static void display_help(void)
 "-n         --noecc              Read without error correction\n"
 "-N         --noskipbad          Read without bad block skipping\n"
 "-o         --omitoob            Omit oob data\n"
-"-b         --omitbad            Omit bad blocks from the dump\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
-- 
1.7.0.4
