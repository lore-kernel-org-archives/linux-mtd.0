Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVeF-0000xl-ND
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:38:04 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/9] faq: general: update "pleonasm" description
Date: Mon, 8 Aug 2011 12:37:12 -0700
Message-ID: <1312832239-21759-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
References: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not really sure why this was mentioned in the first place, but we
might as well be complete and have a little fun with it...

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 faq/general.xml |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/faq/general.xml b/faq/general.xml
index 9cd81ff..2dc64b3 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -30,7 +30,10 @@
 
 <P>
 First off, an MTD is a "Memory Technology Device", so it's just "MTD". An "MTD
-device" is a pleonasm.
+device" is a pleonasm. Of course, at the time of this edit (Thu Aug 4 15:36:10
+PDT 2011) "MTD device" was found at least 520 times in the Linux source tree,
+189 times in the mtd-utils source, and even 119 times in the source for this
+website...
 </P>
 
 <P>
-- 
1.7.0.4
