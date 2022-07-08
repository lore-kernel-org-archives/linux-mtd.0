Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D7FC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Jul 2022 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1Su++4w2ro75aC+bDxA6e88+kChjXKaeQ1ReQi16y4=; b=4vGVlSH3F1UXm5
	PFGD4GEabOJeHsaIXz4drjDjN/JicLA8UZt6njjc2e9luzUr5ecZlfpM2gH9jVcNneuXPM6HzaqTz
	eglS0VNW9y9j3o1ECaADfpTLzyXGDKNh3JlhveWOyvxKstt8Te57AVXb8GVykX0YUux9P1i4ubMWe
	MRkDvvxaCtfpUt73kqbyH0keg54aPAdrZKVJFaoNXEs5N58LnLzV0LvAGhbVuAB+ulXBRFu4dB4TN
	IDxxKE0kVHkMH0HX0XNzoehGiz1/kx7j8SVDHkVVQFpVs+at451638EmlTvarKdK1zNbODWRPpeg3
	jV+bTinIs7v7x+6Co0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oPo-0040FT-Ih; Fri, 08 Jul 2022 13:53:04 +0000
Received: from esa2.hc353-39.eu.iphmx.com ([207.54.65.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oPj-0040Cy-KL
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2022 13:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sequans.com; i=@sequans.com; l=3587; q=dns/txt;
  s=corp; t=1657288379; x=1688824379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GE2pGw+Q9401rO85bl3JUB6YoTd2ET+kVwSytIbJiFg=;
  b=H2fnggVjNGfyip8NQamnsQpeHdvjzYs7Au7pOwRRqvYvps251FlCjqEp
   aN488Jx7773djHn4hDS2OAMWMoU29j1t712tRsmcmlY3F5kY16EFOHtPo
   0FrK44EjCDQ2f1p8/KwPGINGFWh86urgiiXbLbw8bKzpB9Un1Hf5Gtmq2
   4=;
X-IPAS-Result: =?us-ascii?q?A2F4AADDNchil5bSIB9agliEfZVcnHiBfAsBAQEBAQEBA?=
 =?us-ascii?q?QEJQgSFBoUOJzQJDgECBAEBAQEDAgMBAQEBAQEDAQEBBQEBAQEBAQYCAQEBA?=
 =?us-ascii?q?QIQAQEBAQEBAQEJGwYMBRA1hS9GgjUig3crCwFGgVGCfYMZo1QBjBkygQGIG?=
 =?us-ascii?q?oFlgT2JXIVjgUlEglGCLIURhW4EmBWDBgMJBAcFXRKBH2wBCAQGBwoFMAYCD?=
 =?us-ascii?q?BgUBAITElMKDAISDAoZDg5DFwwPAxIDDwEHAgkQCBIlCAMCAwgDAgMbCwIDF?=
 =?us-ascii?q?gkOAx0IChgSEBICBBEaCwgDFj8JAgQOA0IIDgMRBAMPGAkSCBAEBgMyDCULA?=
 =?us-ascii?q?xQNAQYDBgIFBQEDIAMUAwUkBwMhDyYNDQQiHQMDBSUDAgIbBwICAwIGFQYCA?=
 =?us-ascii?q?j8tOQgECAQrJA8FAgcvBQQvAh4EBQYRCAIWAgYEBQIEBBYCEAgCCCcXBxMzG?=
 =?us-ascii?q?QEFWRAJIRwnEAUGFQMhbwUHPg8oNDY8LB8bCoEWLCsWAwQEAwIGGgMDIgIQK?=
 =?us-ascii?q?QYyAxUGKxUVGhMMKl8GIh2dEAEwXYJpPZUiq26DWZ9+S4N1km04kUuWd6J4h?=
 =?us-ascii?q?B8wgT8ighZNI4M4URkPjXYBQo45czsCBgsBAQMJjwUBAQ?=
IronPort-PHdr: A9a23:R2H0KhbVvxzhjxQEwPSwgKP/LTHu14qcDmcuAnoPtbtCf+yZ8oj4O
 wSHvLMx1gSPBNuEoKwUw8Pt8InYEVQa5piAtH1QOLdtbDQizfssogo7HcSeAlf6JvO5JwYzH
 cBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBBr/KRB1JuPoEYLOksi7ze+/94PdbglSmTawYLF/I
 Bq3oAjSq8IbnZZsJqEtxxXTv3BGYf5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ
 7NYCi8mM30u683wqRbDVwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4
 qF2QxHqlSgHLSY0/mHJhMFukaxVrhGvqRtwzIDbe4yZKPlzc7nBcd4AWWZNQsBcXDFBDIOma
 IsPCvIMMulCoIn5uVQOqwe+BQiqBOjyzzFIgWX20rM80+s6FQHG3RAgFM8JvXTKr9X1M70SX
 v6zzKbTyTXDbu9W1Czm6IfWaxAhvOuDXbRrccbL1UYvEAbFg0yWpIf4MDybyv4DvHKH7+p8S
 +2vkWgnphlsrzWuwsogl4bEi4AaxF7E+yh0zpo4K9K5RUJnfdOoDJReuzybOoZ1XM4vR2Blt
 DgnxrMJtpC2fzUHxIonyRPBbfGMbouG4gr7WeufPDt0nnxodKylixqs7ESs1vfwWtS03VpWq
 CdOj8PCuWoX1xPJ78iKUv59/kC81jmRzw3T8eREIVwslarcNp4h3qY8lpoNvkTHGS/7gET3j
 K6Tdko/4Oin8f7rYq74qZ+FKo97kAf+Mr80lsOjBuQ4NxACX2md+euiyL3u5UP0TKhQgvA4j
 KXVqo7WKdkHqqKjHgNY0pov5w66Dzi80dQYmXcHLEhCeBKCl4XpJVLOIPfiDfihhVSjizNrx
 /HaPrD6GZXCMGHDkKr7crZ78E5Q0hY8zdda555MDLEOO+r8WlXtu9zAEh85Lwu0zv7mBdllz
 IMRRXqPArOFMKPVqVKI4+MvI/CRZIALvDbxMeIl6OTujH8/g1AdebKk0oAQaHC/AvRmJ0SZY
 Xz2jtgdFmcKuxIyTPb2h12aTT5Te3GyUrok5jE6D4KmEZ3DRpu2jbOdxii0A4NZZmZaBV+SC
 3vna4KEW/IUZCKIPsBhiiAEVaSmS4I52hGuswr6y71hLurT5C0ZtY7s1Nhu6u3ckBE97z10D
 8CH326RSGF0m3sERyUq06BnvUx91lCD3LB8g/xZCNxT/PNJUgY1NJ7dyex2Fcv/WgLcftiTR
 lepXNSmDSstQdI2xt8Ce1x9FMm6jhDfwyqqBKcYlryWBJMq8qLTxXnxKN18y3bA26kslFkmQ
 tZVOmyomKF/9hLfCJLOk0Wcj6qqb7gT3DbR9GefymqDpEVYUA92UaXYUnETf07Wrcjk6U7ZS
 7+uCK8nMhdaycKYK6tKbNPpjU9cS/j+JtvReX++l323BRaSybPfJLbtLmEc2jjNTU0YnygX/
 G2aLk4/ACm7qm7TBTAoEkjgMG329uwrlnq/Q0kozgfCTEp72ry//h8JzaiCSPQJ07QOvCY9g
 y55BUu02cmQAN2F8VkyNJ5AaM8wtQ8UnVnSsBZwa8TIEg==
IronPort-Data: A9a23:kz3AbK+bzqL0j0WAKv1dDrUDeX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WoaXTvUa6rYZWajLdp+Pt6//U9XvMSAnNdkSQc6rywxFiIbosfsO42lIxarNUt+DCFioGFPv
 55OOoeYfKjYaleG+39B55C49SEUOYegGOKkUIYoHQguGVQ7IMsZoUs/3bZ/2OaEuPDha++3k
 YqaT/b3ZRn0gVaYDkpOs/jZ8Ew37Kyo0N8llgVWic5j7Qe2e0Y9Ucp3yZGZdxMUlaENQ4ZW7
 86apF2I1juxEyUFU7tJoZ6iGqE+eYM+CCDX4pZgc/b920AS9nJuukoMHKN0hU9/011llvgrm
 IUV7fRcQy9wVkHHsL11vxVwTHsmZcWqUVIISJSymZX78qHIT5fj6+gtK2QkPqQBw+9+D2tu8
 NEmOg8XdB/W0opawJrjIgVtrtYiKcPxNcUEt2h9xDfCS/0hRPgvQY2RvJkDhnFq35gIRKuGD
 yYaQWMHgBDofR5IIFoRApY/gM+zi2DiejtD7lmSoMLb5kCIk1Eqiea1WDbTUviPVfdZoBnJn
 VjX/jjWKTYACubD6gPQpxpAgceVx3qhA+r+DoaQ8/9znVCXgHYaGRsfUXOxpv6ljk+4HdlYL
 iQ84ispsbIp3EeiQtT7VBD+q3mB1jYTXN9XFeok+QqN4qXR6gedQGMDS1ZpbN07r883VT0sj
 HeJgtr2CD0pu7qQIVqM67qUpDK4OC4aBW8fbDAJTE0O5NyLiIUyiA/fC9N/HIaxj8bpAnfxx
 T6QpSQzjrlVitQEv5hX5njVgjemvJGPVQMs+wzRRSSu6QYRiJOZi5KA9Bv8yORDBZ+gR1CPt
 lgBtvaM0/oUAsTY/MCSe9nhDI1F9t7cbmCD2wczQMl7n9i+0yLzLdsKulmSMG8zbp5bJFcFd
 WeK4WtsCIlv0GyCQ5Ufj2iZM80wzLOI+T/NCa2MN4ImjnRZ3+mD8WRiaAu+xWnrm0VErE3eB
 Xt4WZ/3ZZriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlYbwHXPr5isPLf8W05F
 uqz0ePXm32zt8WgOkHqHXI7fTjm0FBkXcGt9pQLHgJ9ClM2Rz54YxMu/V/RU9Y/xv4O/gs51
 nu6R15X1VfkzWHKLQiBbXULVV8cdcgXkJ7PBgR1ZQzA8yF6Oe6Htf5PH7NqLehP3LEylpZcE
 qhaE/hs99wSE1wrDRxGNsKjxGGjHTz27T+z092NO2dkJ8EwH1CYo7cJvGLHrUEzM8Z+juNmy
 5XI6+8RacNrq9hKZCoOVM+S8g==
IronPort-HdrOrdr: A9a23:+ReGJq2sx7PvAnoTzCM12QqjBKUkLtp133Aq2lEZdPWaSKylfq
 eV7ZImPHDP+VQssR0b9+xoW5PwJk80i6QFhLX5VI3KNGKK1ASVxepZnOjfKlPbehEWjtQtsZ
 uIrJIVNOHN
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.92,255,1650924000"; 
   d="scan'208";a="3753160"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Virus-Scanned: amavisd-new at sequans.com
From: Valentin Korenblit <vkorenblit@sequans.com>
To: linux-mtd@lists.infradead.org
Cc: piotrs@cadence.com,
	yuehaibing@huawei.com,
	gomonovych@gmail.com,
	miquel.raynal@bootlin.com,
	liushixin2@huawei.com,
	Valentin Korenblit <vkorenblit@sequans.com>
Subject: [PATCH 1/1] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Fri,  8 Jul 2022 15:52:47 +0200
Message-Id: <20220708135247.26122-1-vkorenblit@sequans.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_065300_033444_68775079 
X-CRM114-Status: GOOD (  14.52  )
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

32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.

Check dma capabilities before reading/writing from/to sdma interface.

Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>
---
 .../mtd/nand/raw/cadence-nand-controller.c    | 56 +++++++++++++++----
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 0b52c1280cf8..9e3216cc1d8e 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1882,17 +1882,33 @@ static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return status;
 
 	if (!cdns_ctrl->caps1->has_dma) {
-		int len_in_words = len >> 2;
+		u8 data_dma_width = cdns_ctrl->caps2.data_dma_width;
+
+		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
 
 		/* read alingment data */
-		ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+		if (data_dma_width == 4)
+			ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+		else
+			ioread64_rep(cdns_ctrl->io.virt, buf, len_in_words);
+
 		if (sdma_size > len) {
+			int read_bytes = (data_dma_width == 4) ?
+				len_in_words << 2 : len_in_words << 3;
+
 			/* read rest data from slave DMA interface if any */
-			ioread32_rep(cdns_ctrl->io.virt, cdns_ctrl->buf,
-				     sdma_size / 4 - len_in_words);
+			if (data_dma_width == 4)
+				ioread32_rep(cdns_ctrl->io.virt,
+					     cdns_ctrl->buf,
+					     sdma_size / 4 - len_in_words);
+			else
+				ioread64_rep(cdns_ctrl->io.virt,
+					     cdns_ctrl->buf,
+					     sdma_size / 8 - len_in_words);
+
 			/* copy rest of data */
-			memcpy(buf + (len_in_words << 2), cdns_ctrl->buf,
-			       len - (len_in_words << 2));
+			memcpy(buf + read_bytes, cdns_ctrl->buf,
+			       len - read_bytes);
 		}
 		return 0;
 	}
@@ -1936,16 +1952,32 @@ static int cadence_nand_write_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return status;
 
 	if (!cdns_ctrl->caps1->has_dma) {
-		int len_in_words = len >> 2;
+		u8 data_dma_width = cdns_ctrl->caps2.data_dma_width;
+
+		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
+
+		if (data_dma_width == 4)
+			iowrite32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+		else
+			iowrite64_rep(cdns_ctrl->io.virt, buf, len_in_words);
 
-		iowrite32_rep(cdns_ctrl->io.virt, buf, len_in_words);
 		if (sdma_size > len) {
+			int written_bytes = (data_dma_width == 4) ?
+				len_in_words << 2 : len_in_words << 3;
+
 			/* copy rest of data */
-			memcpy(cdns_ctrl->buf, buf + (len_in_words << 2),
-			       len - (len_in_words << 2));
+			memcpy(cdns_ctrl->buf, buf + written_bytes,
+			       len - written_bytes);
+
 			/* write all expected by nand controller data */
-			iowrite32_rep(cdns_ctrl->io.virt, cdns_ctrl->buf,
-				      sdma_size / 4 - len_in_words);
+			if (data_dma_width == 4)
+				iowrite32_rep(cdns_ctrl->io.virt,
+					      cdns_ctrl->buf,
+					      sdma_size / 4 - len_in_words);
+			else
+				iowrite64_rep(cdns_ctrl->io.virt,
+					      cdns_ctrl->buf,
+					      sdma_size / 8 - len_in_words);
 		}
 
 		return 0;
-- 
2.20.1

-- IMPORTANT NOTICE:



The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.



Thank you.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
