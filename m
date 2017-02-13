Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdOFi-0008By-T4
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 21:33:48 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dwmw2@infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 3/5] Mention nand bit errors test in mtd-tests section
Date: Mon, 13 Feb 2017 22:31:16 +0100
Message-Id: <20170213213118.7857-4-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
References: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 doc/general.xml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/doc/general.xml b/doc/general.xml
index 10ea02b..35763e0 100644
--- a/doc/general.xml
+++ b/doc/general.xml
@@ -124,6 +124,10 @@ git://git.infradead.org/users/ahunter/nand-tests.git
 
 <p>The MTD test-suite contains the following tests:</p>
 <ul>
+	<li><b>mtd_nandbiterrs</b>: relevant only for NAND flashes, introduces
+	bit errors and tests for multi-bit error recovery on a NAND page. This
+	mostly tests the ECC controller / driver.</li>
+
 	<li><b>mtd_speedtest</b>: measures and reports read/write/erase speed
 	of the MTD device.</li>
 
-- 
2.11.0
