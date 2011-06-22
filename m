Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZQeP-00058t-Ta
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 16:51:38 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v3 6/7] nanddump: add --oob option
Date: Wed, 22 Jun 2011 09:49:22 -0700
Message-ID: <1308761363-16512-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
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

Adds an explicit option for including OOB data in our data dump.
Currently, this is the default behavior, but in the next release, the
default will be to exclude OOB data. This is done to mirror the '-o'
option in nandwrite.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index b6307cf..e19a45f 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -54,6 +54,7 @@ static void display_help(void)
 "-l length  --length=length      Length\n"
 "-n         --noecc              Read without error correction\n"
 "-o         --omitoob            Omit oob data\n"
+"           --oob                Dump OOB data\n"
 "-p         --prettyprint        Print nice (hexdump)\n"
 "-q         --quiet              Don't display progress and status messages\n"
 "-s addr    --startaddress=addr  Start address\n"
@@ -127,6 +128,7 @@ static void process_options(int argc, char * const argv[])
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
 			{"bb", required_argument, 0, 0},
+			{"oob", no_argument, 0, 0},
 			{"forcebinary", no_argument, 0, 'a'},
 			{"canonicalprint", no_argument, 0, 'c'},
 			{"file", required_argument, 0, 'f'},
@@ -168,6 +170,9 @@ static void process_options(int argc, char * const argv[])
 							error++;
 						bb_default = false;
 						break;
+					case 3: /* --oob */
+						omitoob = false;
+						break;
 				}
 				break;
 			case 'b':
-- 
1.7.0.4
