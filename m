Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVQT-0005Ja-1h
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 10:54:21 +0000
Date: Thu, 12 Aug 2010 18:51:50 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v2 5/6]Update some marcos value as vendor recommended
Message-ID: <20100812105150.GE11634@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom cdf7eed24caaffac24c87a2348979236ea47feed Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 18:27:49 +0800
Subject: [PATCH 5/6] nand/denali: Update some marcos value as vendor recomm=
ended

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 9c244f7..76a7722 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -654,8 +654,8 @@
=20
 #define CUSTOM_CONF_PARAMS      0
=20
-#define ONFI_BLOOM_TIME         1
-#define MODE5_WORKAROUND        0
+#define ONFI_BLOOM_TIME         0
+#define MODE5_WORKAROUND        1
=20
 /* lld_nand.h */
 /*
--=20
1.6.6.1
