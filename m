Received: from gateway-1237.mvista.com ([63.81.120.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ9k4-0003vS-W1
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 23:45:33 +0000
Received: from localhost.localdomain (asshur.mvista.com [10.0.0.11])
	by hermes.mvista.com (Postfix) with ESMTP id AA0A01811F
	for <linux-mtd@lists.infradead.org>;
	Mon,  4 Aug 2008 16:43:27 -0700 (PDT)
Date: Mon, 4 Aug 2008 19:43:25 -0400
From: "George G. Davis" <gdavis@mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add "Spansion" to MTD_CFI_AMDSTD kconfig menu description
Message-ID: <20080804234325.GE22733@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This long overdue trivial change to the MTD_CFI_AMDSTD kconfig menu
description is intended to help clarify that this option also supports
Spansion flash devices.

Signed-off-by: George G. Davis <gdavis@mvista.com>

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 4c35e5d..9401bfe 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -188,7 +188,7 @@ config MTD_CFI_INTELEXT
 	  StrataFlash and other parts.
 
 config MTD_CFI_AMDSTD
-	tristate "Support for AMD/Fujitsu flash chips"
+	tristate "Support for AMD/Fujitsu/Spansion flash chips"
 	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
