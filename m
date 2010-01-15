Received: from [206.15.93.42] (helo=visionfs1.visionengravers.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NVqc5-00079D-US
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 18:09:43 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] cfi.h: quiet sparse noise
Date: Fri, 15 Jan 2010 11:09:32 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201001151109.32890.hartleys@visionengravers.com>
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cfi.h: quiet sparse noise

In the inline function cfi_build_cmd_addr, the cast of cmd_ofs to an
uint8_t produces a sparse warning of the type:

warning: cast truncates bits from constant value (2aa becomes aa)

Quiet the warning by masking cmd_ofs with 0xff and remove the cast.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index df89f42..a4eefc5 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -297,7 +297,7 @@ static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs,
 	 * and 32bit devices on 16 bit busses
 	 * set the low bit of the alternating bit sequence of the address.
 	 */
-	if (((type * interleave) > bankwidth) && ((uint8_t)cmd_ofs == 0xaa))
+	if (((type * interleave) > bankwidth) && ((cmd_ofs & 0xff) == 0xaa))
 		addr |= (type >> 1)*interleave;
 
 	return  addr;
