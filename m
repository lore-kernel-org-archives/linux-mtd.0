Received: from astoria.ccjclearline.com ([64.235.106.9])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TRNiU-00077H-QK
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2012 13:43:26 +0000
Received: from cpe78cd8ec702a0-cm78cd8ec7029d.cpe.net.cable.rogers.com
 ([174.116.193.149]:50969 helo=crashcourse.ca)
 by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
 (Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
 id 1TRNiL-0008HM-Bq
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2012 09:43:13 -0400
Date: Thu, 25 Oct 2012 09:43:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: Fix kernel-doc content to avoid warning.
Message-ID: <alpine.DEB.2.02.1210250941170.27692@oneiric>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Add missing colons to fix kernel-doc generation warnings.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 24e9159..9d8a604 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -471,8 +471,8 @@ struct nand_buffers {
  *			non 0 if ONFI supported.
  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
  *			supported, 0 otherwise.
- * @onfi_set_features	[REPLACEABLE] set the features for ONFI nand
- * @onfi_get_features	[REPLACEABLE] get the features for ONFI nand
+ * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
+ * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
  * @ecclayout:		[REPLACEABLE] the default ECC placement scheme
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
