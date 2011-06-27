Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGYe-0003IJ-CM
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:29:17 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 10/10] nanddump: remove unused variable
Date: Mon, 27 Jun 2011 11:27:27 -0700
Message-ID: <1309199247-19248-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "bb_default" bool was temporarily being used to straighten out
potential issues with the changing --bb=METHOD options and to warn
users properly. Now, it's unnecessary.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 27b0f7a..0b931db 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -102,7 +102,7 @@ static enum {
 static void process_options(int argc, char * const argv[])
 {
 	int error = 0;
-	bool bb_default = true, oob_default = true;
+	bool oob_default = true;
 
 	for (;;) {
 		int option_index = 0;
@@ -149,7 +149,6 @@ static void process_options(int argc, char * const argv[])
 							bb_method = skipbad;
 						else
 							error++;
-						bb_default = false;
 						break;
 					case 3: /* --omitoob */
 						if (oob_default) {
-- 
1.7.0.4
