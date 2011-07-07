Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QevTN-0004dh-Ie
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 20:46:58 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 3/3] Makefile: show nice message when checking version.h
Date: Thu, 7 Jul 2011 13:44:27 -0700
Message-ID: <1310071467-9017-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
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
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 78f5f9f..27e8a01 100644
--- a/Makefile
+++ b/Makefile
@@ -71,6 +71,7 @@ cscope:
 	cscope -bR
 
 include/version.h: include/version.h.tmp
+	$(call BECHO,CHK)
 	$(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
 include/version.h.tmp:
 	$(Q)echo '#define VERSION "$(VERSION)"' > $@
-- 
1.7.0.4
