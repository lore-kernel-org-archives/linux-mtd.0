Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536EEC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X3vqz4S27CqDOA9WgEgi9syrcJ8IFvQ6n+1Vsc6wjoU=; b=L7FGyby4VK27vy
	dj09E6DYJ3hWbs1e7Vy0jwXkYPnicNqCsxSPOXalsjsB5agydrWx6ekyiAKpQiG3KNeo/cFFU/Iny
	54xGqfQmOYsUp6Ks7iUQD9sWUDcBJW7KHnDYDI0p9pN2Wqdu1I9kXWe6pVEnYaVd5MdN/MLOReiJK
	ZSRFS8lnWsRH/Q6Hveh2kv+vp4eJLwl9V12EEtdKlbvQtdyxQHU4DLzyKfwu0N5oQnox7CjTO9N2k
	i/efkn2xYIg3FBmima0O/7qphF6aub0RNg4SiAAVATE/W6+vM/O3KNNoT1WaYG+oYVU0xlpSTZfkb
	QrvXmE0LmitUSliuH2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okS24-00DFDh-Rc; Mon, 17 Oct 2022 15:28:01 +0000
Received: from esa2.hc353-39.eu.iphmx.com ([207.54.65.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okS10-00DEgI-3Z
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2022 15:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sequans.com; i=@sequans.com; l=5235; q=dns/txt;
  s=corp; t=1666020413; x=1697556413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0u8g96BqY2wXy7+NKOXvdgOoKUoSdPGa8OIFCPH8VW8=;
  b=Pl8eT8FqwumF8fmVXNrHoZ4yj64mH7d089JCCKrdhFifDTI2iDM9+jw8
   RVfkyBadwUO8K3ncZRFfwhdOJ37bbxSDa/V8hWBEifxLTyD7ccsD0HCzP
   DmRExzUEN37dPIPXox4jR9RKLEUmGV276wNbtuTxxdK6k3psfe1i8GH7F
   U=;
X-IPAS-Result: =?us-ascii?q?A2FlAQBPc01jl5bSIB9agliDJoFYA5VinR6BcwkLAQEBA?=
 =?us-ascii?q?QEBAQEBCSwNCQQFBIR+hG8nNgcOAQIEAQEBAQMCAwEBAQEBAQMBAQEFAQEBA?=
 =?us-ascii?q?QEBBgIBAQEBAhABAQEBAQEBATYFEDWFLzkNgjUifIEIAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBARYCDVJpAQQmCwFGgQlIgn0BgyATn1sBjBkzgQGDUAGETYFfBoE9i?=
 =?us-ascii?q?n2FeYFJRIJRgiyCYgWIGgSSD4kJAwkDBwVJQAMLGA0WMxgDFAMFIQcDGQ8jD?=
 =?us-ascii?q?Q0EHQwDAwUlAwICGwcCAgMCBhMFAgI1GDQIBAgEKyQPBQIHLwUELwIeBAUGE?=
 =?us-ascii?q?QgCFgIGBAQEBBUCEAgCCCYXBxMzGQEFWQ4JIRwoDQUGEwMgbwUHOw8oL2krH?=
 =?us-ascii?q?BsHgQwqKBUDBAQDAgYTAyICDSkxFAQpEw8tByNxCQIDImoDAwQoLAMJIR8HJ?=
 =?us-ascii?q?SQ8B1g6BQMCECI8BgMJAwIiWXUwEhQFAw0XJQgFNxoECDwCBQZSEgIKEQMSD?=
 =?us-ascii?q?y1ID0o+ORYGJ0UBNg8Om0qCGAEwXSxQgW09wX+DaotBjQaHYEyDdpJ+OZFil?=
 =?us-ascii?q?xaLUoFvlEqBGIQhMIFAKQOCDE0jUIIzAQEBMVEZD44sDQmIZIVMcwIBOAIGC?=
 =?us-ascii?q?wEBAwmKVwEB?=
IronPort-PHdr: A9a23:vZbrhRfh2riCW7rF6rSm6sGElGM+ltnLVj580XLHo4xHfqnrxZn+J
 kuXvawr0AWSG96LurkU16L/iOPJYSQ4+5GPsXQPItRndiQuroEopTEmG9OPEkbhLfTnPGQQF
 cVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZvJuTyB4Xek9m72/q99pHNbQhEnjSwbLB2I
 Rm5rgjcudQdjJd/JKo21hbHuGZDdf5MxWNvK1KTnhL86dm18ZV+7SleuO8v+tBZX6nicKs2U
 bJXDDI9M2Ao/8LrrgXMTRGO5nQHTGoblAdDDhXf4xH7WpfxtTb6tvZ41SKHM8D6Uaw4VDK/5
 KptVRTmijoINyQh/W/XlMJ9kr9VrhyiqRJ4zIHab5qYOOZ9c67HYd8XX3ZNUtpXWidcAo28d
 YwPD+8ZMOlXtYb9o0UBrR2iBQmtAuPk1zpGhnjs3aIk1eQuCgXG3A08H9kTt3nUstb1NKAIU
 e+ryqnH1jHDb/JK2Trm84jHbAkhoeyWUrJ2asrd01UgFwTAjliJr4HuIjya2PgXvWeB8+pgS
 fygi3QhqwxpoTWixdsghpTJi4wV1l3J6Tl1zYgpKdC8TEN2Y8OpHptfuiybOIZ7Q98vTn9pt
 Sg1zrALp5+2cDYFxpklyBPSaPqKeJWG7BLkUeaeOzZ4hHR9db6jmhq+60+gyvfzVsSyzV1Er
 TJFn8HCu3wQzRDe5NaLRuFj8ku8xTqDzR3f5+FYLU0yiKHVMYQuwqQqmZoWqUnDGyj2l1jog
 6KObUUk//So6/zgYrX7up+QL490hR/6MqQpgsG+AOU4Mg0VUGiB4+uwzqbj8lPgQLVXlPI2l
 LLZvIrGKsQco661Gw5V0oA95BajFzqr3skUkWMJIV5bYh6LkZXlN03ULPzlDfqzn0ygkDJxy
 PDHOr3hDI/NLn/GkLr5Y7Z96ElcyBAtwtBZ/J1UDrABIO7oV0/qqtPYFwI5PBayw+b8Etlyy
 oQeWWeXDq+fK6zdqUWI6f43I+mQeI8Vvy7wJvc96/70kXA5gUMdfbWu3ZYPcn+4BPJmLFiCb
 HX2mNcBF3oFsREkQOP3llKOSSRTaGqqX6Ig+jE7D5qrDYLCRoC0nbyOwiO7EodMZm9cClGMF
 23nd4GfVvgXbyKSJdNhkjgFVbinUYMuyRautArix7p9MuXU4jEYtY7k1NVt4+3TlBcy9SF7D
 siE1mGNU3x7k3gMRz83x6B/vVd9xk2C0ah+jfxYD8Zc6O5XXQggKJHQ1et6C8r9Wg7ZZNeGV
 E6mQsm6ATE2Vt8ww8EBb1xyGtWjiBDD0DalA78LmLyNH5E1877c0GbrK8lhzHbG0bMtgEUgQ
 pgHCWrzgq956hiWApLFu0GYjLqxM6Ua0jTE+GqKwSyJpk4LfhR3VPD7VHQSYFfXq5za4VnPS
 bWqCKhvZhVCztSPLKFOa8HBllhfWf7lI5LVZGfnyDT4PgqB2r7ZNNmiQG4axiiIUCA5
IronPort-Data: A9a23:ixz+867Qug3Eso9LUbbQWAxRtNrHchMFZxGqfqrLsTDasY5as4F+v
 jdMWTqOPa2MNmv8etEnaIm+pEoC6pSBmNQyTgRv/y09Eysa+MHILOrAEkqhZCn6wu8v7a5Ex
 5VFOomedJBcolv0/ErF3m3J9CEkvU2ubuSkULas1gdZGlM/F0/NsTo6x6hjxNYAbeGRW2ulo
 cn1r9DUJGir0jt1NnN8w6+YoVZkse+aVAkw5zTSXtgW+g6D/5UpJMhHf/vodyKnGtA88tOSH
 o4v8pnopgs1wD9wUrtJop6jGmUWT7jbOxS5i3Y+c8BOVTAb+0Teeo5iXBYtQR8/Zwehxrid+
 /0U3XCEcjrFC4WV8Agre0cHSnkubfMakFPwCSHXXcS7lyUqelO2k6U2VCnaN6VBkgp8KTgmG
 fAwd2pVNnhvLg95qV62YrAEuygtECXkFIIm5VJQzWrZN+4BZ6zubrzR78J+hzhl06iiHd6GD
 yYYQShuaR7aaltUN04KAZQl2uyvgxETcRUD8RTO/+xtujCVlVEpuFTuGIO9ltiiW8ZShEuer
 GbH40ziDwgHPdqEjzGC9xpAg8eTx3yrBd9OfFG+3vowp0bU/3ABMzA1b3GZ8dy4qEebXPsKf
 iT4/QJ09/ForyRHVOLVVge+rFaNpBgQUZxcHoUS7QCU16fQpRyQF24NShZLb9s6sM4wAzct0
 zehm9LvGCwqtaGZYXac7auP6zK0NzIcIWILaWkDVwRty8ju5pEyiB3ETttlOLypg5v+HjS2y
 DbikcQlr6cSiMQR3uOg8EnaijS34JPOS2bZ+zk7QEqk11xaVI7+Z7awzn7nwNtZN4yEaAKO6
 S1sd9el0AweMX2cvHXTHrhSRerzu6/t3C703Q4+Q8l9n9i50yT5INkLiN1rDB0xWvvobwMFd
 2f9g2u9Drd6JnSna7N6foO1YyjB5fm9TIy9Phw4RnGoZpU0eALC0jtnY0Wdt10BcXTAcolma
 P93ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOiPFFOdbagXRML5RAEa4TOP9r
 Yw32yyilUw3bQECSnm/HXM7cghbdiVjWfgaVeQOKLbZe2KK513N+9eLm+p7IOSJboxfkfrZ8
 WywQQdExV7yjnrCQThmmVg9AI4Dqa1X9CphVQR1ZA7A8yF6Me6SAFI3KsJfkU8Pr7c4k5aZj
 pAtJq29Pxi4Ym2YompNMMSh99EKmdbCrVvmAhdJqQMXJ/ZILzElMPe/Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:Xq5DFa++MsYY2wkslzhuk+DPI+orL9Y04lQ7vn2ZhyY0TiX+rb
 HJoB11726XtN98Yh8dcLO7Sc69qA3nhPtICOAqVN/IMWWIhILCFvAA0WKN+Vzd8lXFh4pgPH
 hbGZRDNA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,191,1661810400"; 
   d="scan'208";a="4278554"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Virus-Scanned: amavisd-new at sequans.com
From: Valentin Korenblit <vkorenblit@sequans.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	arnd@arndb.de,
	ye.xingchen@zte.com.cn,
	Valentin Korenblit <vkorenblit@sequans.com>
Subject: [PATCH v2] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Mon, 17 Oct 2022 17:26:40 +0200
Message-Id: <20221017152640.32362-1-vkorenblit@sequans.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_082654_519169_2470E01B 
X-CRM114-Status: GOOD (  15.91  )
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

Link to discussion:
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B/

Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>

---

Changes v1 -> v2:
	- Replaced ioread64_rep by cadence_nand_readsq (suggested by Arnd)
	- Replaced iowrite64_rep by cadence_nand_writesq (suggested by Arnd)
	- Do not try to access 64-bit sdma if __raw_readq/__raw_writeq are not defined
---
 .../mtd/nand/raw/cadence-nand-controller.c    | 96 ++++++++++++++++---
 1 file changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 9dac3ca69d57..0309a6b0d3d3 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1869,6 +1869,46 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 	return -EIO;
 }
 
+static inline void cadence_nand_readsq(struct cdns_nand_ctrl *cdns_ctrl,
+				       void *buffer, unsigned int count)
+{
+#ifdef __raw_readq
+	const volatile void __iomem *addr = cdns_ctrl->io.virt;
+
+        if (count) {
+                u64 *buf = buffer;
+
+                do {
+                        u64 x = __raw_readq(addr);
+                        *buf++ = x;
+                } while (--count);
+        }
+#else
+	dev_err(cdns_ctrl->dev,
+		"cannot read 64-bit sdma on !64-bit architectures");
+#endif
+}
+
+static inline void cadence_nand_writesq(struct cdns_nand_ctrl *cdns_ctrl,
+					const void *buffer,
+					unsigned int count)
+{
+#ifdef __raw_writeq
+	volatile void __iomem *addr = cdns_ctrl->io.virt;
+
+        if (count) {
+                const u64 *buf = buffer;
+
+                do {
+                        __raw_writeq(*buf++, addr);
+                } while (--count);
+        }
+#else
+	dev_err(cdns_ctrl->dev,
+		"cannot write 64-bit sdma on !64-bit architectures");
+#endif
+}
+
 static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
 				 u8 *buf, int len)
 {
@@ -1882,17 +1922,33 @@ static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
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
+			cadence_nand_readsq(cdns_ctrl, buf, len_in_words);
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
+				cadence_nand_readsq(cdns_ctrl,
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
@@ -1936,16 +1992,32 @@ static int cadence_nand_write_buf(struct cdns_nand_ctrl *cdns_ctrl,
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
+			cadence_nand_writesq(cdns_ctrl, buf, len_in_words);
 
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
+				cadence_nand_writesq(cdns_ctrl,
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
