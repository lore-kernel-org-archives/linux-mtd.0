Received: from mail.visioncatalog.de ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTWzq-0007se-V4
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 10:57:39 +0000
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
 by root.phytec.de (Postfix) with ESMTP id 4B350BF0DC
 for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2011 12:02:44 +0100 (CET)
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandtest: use seed argument
Date: Thu, 24 Nov 2011 11:57:34 +0100
Message-Id: <1322132254-5830-1-git-send-email-j.weitzel@phytec.de>
Cc: Jan Weitzel <j.weitzel@phytec.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

if a seed is provided it is actually not used. First call is
"seed = rand()" killing the given seed.

Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
---
 nandtest.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index db7f427..b3aacaf 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -173,6 +173,7 @@ int main(int argc, char **argv)
 
 		case 's':
 			seed = atol(optarg);
+			srand(seed);
 			break;
 
 		case 'p':
-- 
1.7.0.4
