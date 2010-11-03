Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYjt-0007lK-6u
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:37 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/10] mtd-utils: nanddump: Allow 64-bit lengths
Date: Wed, 3 Nov 2010 01:27:18 -0700
Message-ID: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Jehan Bing <jehan@orb.com>,
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

We should allow the dump length to be 64-bit, especially since the value
was read in as a "long long" by strtoll().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 86a71c9..fe29596 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -83,7 +83,7 @@ static bool			noecc = false;		// don't error correct
 static bool			noskipbad = false;	// don't skip bad blocks
 static bool			omitoob = false;	// omit oob data
 static unsigned long long	start_addr;		// start address
-static unsigned long		length;			// dump length
+static unsigned long long	length;			// dump length
 static const char		*mtddev;		// mtd device name
 static const char		*dumpfile;		// dump file name
 static bool			omitbad = false;
-- 
1.7.0.4
