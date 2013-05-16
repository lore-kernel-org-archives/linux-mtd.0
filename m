Received: from mail-db9lp0250.outbound.messaging.microsoft.com
 ([213.199.154.250] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucpla-0006xJ-Fc
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 04:26:11 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 append] mtd: update the ABI document about the ecc step
Date: Thu, 16 May 2013 12:09:43 +0800
Message-ID: <1368677383-29224-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1368619642.15764.96.camel@sauron.fi.intel.com>
References: <1368619642.15764.96.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We add a new sys node for ecc step. So update the ABI document about it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 Documentation/ABI/testing/sysfs-class-mtd |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 3105644..62a1cda 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -173,3 +173,14 @@ Description:
 		This is generally applicable only to NAND flash devices with ECC
 		capability.  It is ignored on devices lacking ECC capability;
 		i.e., devices for which ecc_strength is zero.
+
+What:		/sys/class/mtd/mtdX/ecc_step
+Date:		May 2013
+KernelVersion:	3.10
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The size of ecc step which is used for per ecc correction.
+		See more in the ecc_strength above. This will always be a
+		non-negative integer.
+
+		In the case of devices lacking any ECC capability, it is 0.
-- 
1.7.1
