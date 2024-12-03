Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19971E64A8F
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=07eIGm2ghtSBE0ZfW0CYcZt9YSG5+P6/WFMkTfxATmU=; b=bOCNbYxRL4VOcE
	tdBtXs5HdzUY03O1/XXGIhFNyl2l56L4cngyEYKjkVU1nvLns4Dsslwf9nDd0muD9Td2Oxnxd/41Y
	KtSc5Vm//JnD+vP/w+vWOoYxfV1AHu6DA2sNAm6AP1jk9MyWM5CjZ6L8xMHM+K9Pp4T//j/HmVc2q
	MH/PhzZKiLz5tT75xeMt0/LDg1b9UczHdsfnXq0kuSH8GESeXrRMl/I7CniFFTjHpHuwuZreIDoin
	8mYYOORm1gjo+kdcWeLQ1mnNT0fodqMl1jR0YacIgum9VtlVH4wC0h6p+tE8c/52khTByYhw3lgWL
	itZ2o2ibXNV4rZe62l6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT1r-00000009cic-038H;
	Tue, 03 Dec 2024 13:33:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIT1o-00000009ciF-0lh1
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 13:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 954CF5C6D1F;
	Tue,  3 Dec 2024 13:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D542C4CED6;
	Tue,  3 Dec 2024 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733232803;
	bh=rMaSDNSAJrbcxHZSVbXsKcHrwaahyhZiCTadCvujcTM=;
	h=From:Date:Subject:To:Cc:From;
	b=pgtpWOG+zcKRKdVjqh9iU3+hyGm0TqFnqArKydS09r2e6nQw4nV32sg15c9J5ZWcW
	 weNz0O44yMGyHeBQZ24lUrtmxv4Vtgd/vNIj8lujOd4FssrD2lXMTmwMAZrIh/w9Hy
	 xRU1ZGJHZCptYzBhvTsuEttLWozs5fkoaMczl3uoethL50oq8vN7Sv8dtxSJNJ/sNW
	 iaK61o2Wy/CKqjr9PA7jcxKZ3vMK73p/nawAkKOTaOBOzZeTSb+JlD6yZSR4CcmklY
	 jj7rp+J35XKn/AjpVtC62WnVgLTOJcJtQBq+ByWwidLmrrmoSJdcan0r2MSR2x/I5k
	 ehlW7UPixHG2Q==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 03 Dec 2024 15:33:17 +0200
Subject: [PATCH] mtd: rawnand: omap2: Fix build warnings with W=1
MIME-Version: 1.0
Message-Id: <20241203-omap2-doc-fix-v1-1-f46cd2a5c055@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJwIT2cC/x2MQQqAMAzAviI9W9haRfAr4kFn1R50YwMRxL9bP
 CaQPFAkqxToqweyXFo0nga+riDs07kJ6mIM5Kjx5BjjMSXCJQZc9UbhWcQ1XcsrgzUpi+n/N4z
 v+wGJlMBYXwAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4570; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=rMaSDNSAJrbcxHZSVbXsKcHrwaahyhZiCTadCvujcTM=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBnTwih1vcygEgDaCB6oM4tIWffmiDB/Dsp2OrTy
 8ZGkkapbGKJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ08IoQAKCRDSWmvTvnYw
 kyVkD/4p+IhXsNs7coGVFFZDAcqAcc6xwYQahANbTwCI+x3DaH+6Sv9RsR6JocmOjveVkxzdLF5
 yuJVp+ht1pKFtomZd38xrETk9SVGzrutoZB1yH5o4TWukF9+WuZC4Y6myHRD1h9XttLVkLe2Gwe
 Ya8AIhhZ/6xmchoVmt0ijrZro51Ifo9lzw/TwaG7FWxQrqMRLDZvqsXT1NY4ChRK10+kmiqkiuP
 GREWFZ16OAyTSiTDOae4cIbIjd8SZNBS445tYR3oC47HJtT27Iptc39nrW37ewhgdx1d3lzfzCG
 oIhVe4DwqSvWcHZ0bfzRZN6DSOLQ9Y+719MoHUO/n2maCJ8zxwxtSfmSfMp4/vjsFcyNrYOf6gm
 2X/Meaf5KHix3HXZCPwLjIhRTZhdRMKyI4iUZMiPxq82FJP5ay20nsNwbec7j4Gd6IuwFVtR7mW
 /Z6JmavkOuOvPMwhvgIxvCjyyWltKqGNrEJvfZ/soG04ZaEPE4RBP4T26fVcGywIXIof9wBnp8l
 RCv6IcsCRXmAtKhIrD+yRmYxoKdZ6O75sb3dEzY9tU9zTNdJgWQaG95U8Ls7jVuwrKdNjA3aBAH
 UdRs8HKxSSvtHHVGzvNXUFZWqRHaelNGi30QUKK93z50J6f8s8ULdEnuuUxO4q/Mz9dhRNhsXrs
 MxeTBS/DKbbezRQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_053324_311396_979C6797 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add kernel-doc for functions to get rid of below warnings
when built with W=1.

drivers/mtd/nand/raw/omap2.c:260: warning: Function parameter or struct member 'chip' not described in 'omap_nand_data_in_pref'
drivers/mtd/nand/raw/omap2.c:260: warning: Function parameter or struct member 'buf' not described in 'omap_nand_data_in_pref'
drivers/mtd/nand/raw/omap2.c:260: warning: Function parameter or struct member 'len' not described in 'omap_nand_data_in_pref'
drivers/mtd/nand/raw/omap2.c:260: warning: Function parameter or struct member 'force_8bit' not described in 'omap_nand_data_in_pref'
drivers/mtd/nand/raw/omap2.c:304: warning: Function parameter or struct member 'chip' not described in 'omap_nand_data_out_pref'
drivers/mtd/nand/raw/omap2.c:304: warning: Function parameter or struct member 'buf' not described in 'omap_nand_data_out_pref'
drivers/mtd/nand/raw/omap2.c:304: warning: Function parameter or struct member 'len' not described in 'omap_nand_data_out_pref'
drivers/mtd/nand/raw/omap2.c:304: warning: Function parameter or struct member 'force_8bit' not described in 'omap_nand_data_out_pref'
drivers/mtd/nand/raw/omap2.c:446: warning: Function parameter or struct member 'chip' not described in 'omap_nand_data_in_dma_pref'
drivers/mtd/nand/raw/omap2.c:446: warning: Function parameter or struct member 'buf' not described in 'omap_nand_data_in_dma_pref'
drivers/mtd/nand/raw/omap2.c:446: warning: Function parameter or struct member 'len' not described in 'omap_nand_data_in_dma_pref'
drivers/mtd/nand/raw/omap2.c:446: warning: Function parameter or struct member 'force_8bit' not described in 'omap_nand_data_in_dma_pref'
drivers/mtd/nand/raw/omap2.c:467: warning: Function parameter or struct member 'chip' not described in 'omap_nand_data_out_dma_pref'
drivers/mtd/nand/raw/omap2.c:467: warning: Function parameter or struct member 'buf' not described in 'omap_nand_data_out_dma_pref'
drivers/mtd/nand/raw/omap2.c:467: warning: Function parameter or struct member 'len' not described in 'omap_nand_data_out_dma_pref'
drivers/mtd/nand/raw/omap2.c:467: warning: Function parameter or struct member 'force_8bit' not described in 'omap_nand_data_out_dma_pref'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412031716.JfNIh1Uu-lkp@intel.com/
Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/omap2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index d9141f3c0dd1..b8af3a3533fc 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -254,6 +254,10 @@ static int omap_prefetch_reset(int cs, struct omap_nand_info *info)
 
 /**
  * omap_nand_data_in_pref - NAND data in using prefetch engine
+ * @chip: NAND chip
+ * @buf: output buffer where NAND data is placed into
+ * @len: length of transfer
+ * @force_8bit: force 8-bit transfers
  */
 static void omap_nand_data_in_pref(struct nand_chip *chip, void *buf,
 				   unsigned int len, bool force_8bit)
@@ -297,6 +301,10 @@ static void omap_nand_data_in_pref(struct nand_chip *chip, void *buf,
 
 /**
  * omap_nand_data_out_pref - NAND data out using Write Posting engine
+ * @chip: NAND chip
+ * @buf: input buffer that is sent to NAND
+ * @len: length of transfer
+ * @force_8bit: force 8-bit transfers
  */
 static void omap_nand_data_out_pref(struct nand_chip *chip,
 				    const void *buf, unsigned int len,
@@ -440,6 +448,10 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 
 /**
  * omap_nand_data_in_dma_pref - NAND data in using DMA and Prefetch
+ * @chip: NAND chip
+ * @buf: output buffer where NAND data is placed into
+ * @len: length of transfer
+ * @force_8bit: force 8-bit transfers
  */
 static void omap_nand_data_in_dma_pref(struct nand_chip *chip, void *buf,
 				       unsigned int len, bool force_8bit)
@@ -460,6 +472,10 @@ static void omap_nand_data_in_dma_pref(struct nand_chip *chip, void *buf,
 
 /**
  * omap_nand_data_out_dma_pref - NAND data out using DMA and write posting
+ * @chip: NAND chip
+ * @buf: input buffer that is sent to NAND
+ * @len: length of transfer
+ * @force_8bit: force 8-bit transfers
  */
 static void omap_nand_data_out_dma_pref(struct nand_chip *chip,
 					const void *buf, unsigned int len,

---
base-commit: cdd30ebb1b9f36159d66f088b61aee264e649d7a
change-id: 20241203-omap2-doc-fix-e3bee04753f3

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
