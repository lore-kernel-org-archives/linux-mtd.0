Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PQMXq-0000mR-Q0
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2010 16:07:07 +0000
Subject: [PATCH v3 2/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D3x16UxC NOR chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Wed, 08 Dec 2010 17:00:23 +0100
Message-ID: <20101208160023.22017.21978.stgit@dev.siriade.com>
In-Reply-To: <20101208160018.22017.8779.stgit@dev.siriade.com>
References: <20101208160018.22017.8779.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Matthias Buecher / Germany <mail@maddes.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These chips report CFI v3.3 [1], so patch them on the fly to the more
correct v1.3.
Discussed and tested by the OpenWRT people [2].

[1] http://www.samsung.com/global/system/business/semiconductor/product/2007/6/11/NORFlash/32Mbit/K8D3216UBC/ds_K8D3x16UxC_rev17.pdf
[2] https://dev.openwrt.org/ticket/866

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 7966f07..8ad6ee9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -403,6 +403,14 @@ static void cfi_fixup_major_minor(struct cfi_private *cfi,
 			extp->MajorVersion = '1';
 			extp->MinorVersion = '0';
 		}
+		if (extp->MajorVersion == '3' && extp->MinorVersion == '3') {
+			/*
+			 * Samsung K8D3x16UxC chips report major=3 / minor=3
+			 */
+			printk(KERN_NOTICE "  Fixed Samsung's Amd/Fujitsu Extended Query version from 3.3 to 1.3\n");
+
+			extp->MajorVersion = '1';
+		}
 	}
 
 	/*
