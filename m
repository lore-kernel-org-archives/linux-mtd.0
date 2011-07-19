Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIyr-0000ug-Hn
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:41:34 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 01/10] faq: nand: grammar fix
Date: Tue, 19 Jul 2011 15:40:38 -0700
Message-ID: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
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
 faq/nand.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/faq/nand.xml b/faq/nand.xml
index a9188c5..75acc72 100644
--- a/faq/nand.xml
+++ b/faq/nand.xml
@@ -240,7 +240,7 @@ which is extremely useful when testing how flash software handles errors (e.g.,
 what does JFFS2 do in case of bit-flips or write errors).</P>
 
 <P>Note, theoretically <CODE>nandsim</CODE> can emulate 16-bit bus width
-devices, but it this may not work.</P>
+devices, but it may not work.</P>
 
 <INCLUDE file="../inc/footer.tmpl" />
 </PAGE>
-- 
1.7.0.4
