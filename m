Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B78C54FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F70206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3Vkx84f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46F70206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbjfY2FkapecS1flojIwo0mlejj1aaitz7cLCT28TxQ=; b=j3Vkx84f9pWDrp
	5+bhV7BxD6+cE4Bqaa57FpwFDd4GV5Yu1bkaou/Ab+UT85rx75RwYttpQkAozyxgGCZWW1eO5Vf+m
	4IlFHBI8YgFOmrCwEbQsqXFFiCaPN5GiJi8KuzENfvZwTrm7ICUzEw0Ywk6uNdfnUxB1AbXeU0pug
	Wx/ftTGNos5TH4IXgzuKhtKB7sdK9tAX72yD0KMRAz3NbVg2/pmeStpEBBwaeXygTCvvccuThB8KJ
	xiwC51xQhPbKREDhKu1sz6tkbFy21CRNSRmLBydeeafCFAi2ZRc8uAcQIQFdNp2U4cwwblu3nO9Yf
	+DNgYRs0ebFsvPtveWog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQw3S-0004hG-AX; Tue, 21 Apr 2020 16:47:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQw2l-0003z1-VZ
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 16:46:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B18E420009;
 Tue, 21 Apr 2020 16:46:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/8] mtd: rawnand: timings: Add mode information to the
 timings structure
Date: Tue, 21 Apr 2020 18:46:30 +0200
Message-Id: <20200421164637.8086-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421164637.8086-1-miquel.raynal@bootlin.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_094644_152341_2AD277EA 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the timings union into a structure containing the mode and the
actual values. The values are still a union in prevision of the
addition of the NVDDR modes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_timings.c |  6 ++++++
 include/linux/mtd/rawnand.h         | 10 +++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index f64b06a71dfa..0061cbaf931d 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -16,6 +16,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 0 */
 	{
 		.type = NAND_SDR_IFACE,
+		.timings.mode = 0,
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
@@ -58,6 +59,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 1 */
 	{
 		.type = NAND_SDR_IFACE,
+		.timings.mode = 1,
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
@@ -100,6 +102,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 2 */
 	{
 		.type = NAND_SDR_IFACE,
+		.timings.mode = 2,
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
@@ -142,6 +145,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 3 */
 	{
 		.type = NAND_SDR_IFACE,
+		.timings.mode = 3,
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
@@ -184,6 +188,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 4 */
 	{
 		.type = NAND_SDR_IFACE,
+		.timings.mode = 4,
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
@@ -226,6 +231,7 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
 	/* Mode 5 */
 	{
 		.type = NAND_SDR_IFACE,
+		.timings.mode = 5,
 		.timings.sdr = {
 			.tCCS_min = 500000,
 			.tR_max = 200000000,
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 1e76196f9829..d91f914d2e9e 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -491,13 +491,17 @@ enum nand_data_interface_type {
 /**
  * struct nand_data_interface - NAND interface timing
  * @type:	 type of the timing
- * @timings:	 The timing, type according to @type
+ * @timings:	 The timing
+ * @timings.mode: Timing mode as referred in the specification
  * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.
  */
 struct nand_data_interface {
 	enum nand_data_interface_type type;
-	union {
-		struct nand_sdr_timings sdr;
+	struct nand_timings {
+		unsigned int mode;
+		union {
+			struct nand_sdr_timings sdr;
+		};
 	} timings;
 };
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
