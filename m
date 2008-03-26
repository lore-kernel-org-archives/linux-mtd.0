Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeO1X-0003ty-3X
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 05:18:07 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1JeO1U-0004u0-66
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 00:18:04 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1JeO1P-0008ME-5Z
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 16:17:59 +1100
Date: Wed, 26 Mar 2008 16:17:59 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: don't use argp.h
Message-ID: <20080326051759.GA32079@cloud.net.au>
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

Don't include argp.h as it's glibc-specific, and not used anyway.

Signed-Off-By: Hamish Moffatt <hamish@cloud.net.au>
--
--- mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c.orig	2008-03-26 16:08:13.000000000 +1100
+++ mtd-utils-e6088d987c545d60a86e1f44836ab8ba072fffd9/ubi-utils/new-utils/src/ubicrc32.c	2008-03-26 16:08:20.000000000 +1100
@@ -26,7 +26,6 @@
 #include <stdint.h>
 #include <stdlib.h>
 #include <getopt.h>
-#include <argp.h>
 #include <unistd.h>
 #include <mtd/ubi-header.h>
 
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
