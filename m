Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIyr-0000uh-MD
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:41:34 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 02/10] doc: nand: remove reference to
 CONFIG_MTD_PARTITIONS
Date: Tue, 19 Jul 2011 15:40:39 -0700
Message-ID: <1311115247-20636-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
References: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
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
 doc/nand.xml |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/doc/nand.xml b/doc/nand.xml
index b9ad4a7..7254af5 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -312,7 +312,6 @@ maintainer to include it</p>
 if one of these settings is missing.</p>
 				
 <p>CONFIG_MTD=y<br />
-CONFIG_MTD_PARTITIONS=y<br />
 CONFIG_MTD_CHAR=y<br />
 CONFIG_MTD_BLOCK=y<br />
 CONFIG_MTD_NAND=y<br />
-- 
1.7.0.4
