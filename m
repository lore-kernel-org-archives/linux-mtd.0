Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VA9XY-00063F-W8
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 02:13:30 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 6/6] mtd: update the ABI document about the ecc step size
Date: Fri, 16 Aug 2013 10:10:09 +0800
Message-ID: <1376619009-8622-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1376619009-8622-1-git-send-email-b32955@freescale.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, pekon@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We add a new sys node for ecc step size. So update the ABI document about it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 Documentation/ABI/testing/sysfs-class-mtd |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index 3105644..da112ab 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -173,3 +173,13 @@ Description:
 		This is generally applicable only to NAND flash devices with ECC
 		capability.  It is ignored on devices lacking ECC capability;
 		i.e., devices for which ecc_strength is zero.
+
+What:		/sys/class/mtd/mtdX/ecc_step_size
+Date:		May 2013
+KernelVersion:	3.10
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		The size of each ECC step which is used for ECC.
+		Note that some devices will have multiple ecc steps within each
+		writesize region. See more in the ecc_strength above. This will
+		always be a non-negative integer.
-- 
1.7.1
