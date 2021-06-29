Return-Path: <SRS0=bXaR=LX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BE4C11F69
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 15:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74D1E61DC4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 15:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74D1E61DC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nP5Xiy6p2Z7meLfu6QxPrnyFUPYu6krZCRHHPeadTBg=; b=1x2f5wjGRjuNWX
	ykX3j5wYl/r45RhqaJNGyJN45CqtWJwgfN7LtKOG0D8GvwKL7dpejTI7LN/2VZvLiD/Q9Dsm/oxHC
	yTqNJP8psoriAY94Mtw8/b9hJEhkZb0tdaipOalAknpmNjWZYa6uR5Uo7GLhUAJaWEj1oPAStMJMN
	MEg0v+QwU7D04ajQ5lk0Y+VaPa9SU32trbXRTyOpSvLn4OZ7dgGSQkLelKjI+FLFOy1nT6aEzilWb
	YvCpbAg1qkd/pKbPn+1xAi6gwPYyduZ3hz7xl0wTJCxrIo9MH6IE0P/eO/Rscckyf4jElhCqIEB0A
	NaHNLI2/5t0ZzfLRZPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyFNe-00BPyh-Di; Tue, 29 Jun 2021 15:10:30 +0000
Received: from atlmailgw1.ami.com ([63.147.10.40])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyFNS-00BPuJ-Bx
 for linux-mtd@lists.infradead.org; Tue, 29 Jun 2021 15:10:19 +0000
X-AuditID: ac1060b2-3d7ff70000000c56-e9-60db37d80924
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 EC.16.03158.8D73BD06; Tue, 29 Jun 2021 11:10:16 -0400 (EDT)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Tue, 29 Jun 2021 11:10:16 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>
CC: Hongwei Zhang <hongweiz@ami.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
Date: Tue, 29 Jun 2021 11:08:46 -0400
Message-ID: <20210629150846.21547-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629150846.21547-1-hongweiz@ami.com>
References: <20210629150846.21547-1-hongweiz@ami.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWyRiBhgu4N89sJBmveG1lc3jWHzWJ30zJ2
 i7enN7Bb3H3+g93i4xIHB1aPzUvqPe78WMrocfzGdiaPz5vkPA7sbWELYI3isklJzcksSy3S
 t0vgyji99CxzQSNnxaNV69kaGJvZuxg5OSQETCR+/upk6WLk4hAS2MUk8ePpUjaQBJDDKPFi
 iheIzSagJrF38xwmEFtEoERiTfsXMJtZIF3i1dfzzCC2sIClxMSNL1m7GDk4WARUJX71CIGE
 eQVMJR692cICsUteYvWGA2DlnAJmEnunP2KBWGUq8WxNDxtEvaDEyZlPWCDGS0gcfPGCGaJG
 VuLWocdMEHMUJR78+s46gVFgFpKWWUhaFjAyrWIUSizJyU3MzEkvN9RLzM3US87P3cQICdZN
 OxhbLpofYmTiYDzEKMHBrCTC+zbvVoIQb0piZVVqUX58UWlOavEhRmkOFiVx3lXuR+OFBNIT
 S1KzU1MLUotgskwcnFINjKtCcpbdvs7z9JGzcF7pHIc/i+Zk/7h+NMdt2eqiP7+v14vqvzXL
 K/HbKtXpGNIe1yJjaPfib+IT9Tw+xZdKzxwC1FmjVpXz7SoKvWqwwWnntvZ1biW3fshryS/u
 1tK+ylnZyRv1MtEvP1bl176aop07lF96reEQ49K8d2Ri4aIfgpoeHNxaSizFGYmGWsxFxYkA
 mtAyL0QCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_081018_527686_FD0EE140 
X-CRM114-Status: GOOD (  11.72  )
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

Add some Micron M45PEx flash memeories into the IDs table.

Fixes: dd1e9367157f900616f (ARM: dts: everest: Add phase corrections for
eMMC)

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/mtd/spi-nor/micron-st.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index ef3695080710..379b14e339ff 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -95,8 +95,12 @@ static const struct flash_info st_parts[] = {
 	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
 
 	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
+	{ "m45pe20", INFO(0x204012,  0, 64 * 1024,    4, 0) },
+	{ "m45pe40", INFO(0x204013,  0, 64 * 1024,    8, 0) },
 	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
 	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
+	{ "m45pe32", INFO(0x204016,  0, 64 * 1024,   64, 0) },
+	{ "m45pe64", INFO(0x204017,  0, 64 * 1024,  128, 0) },
 
 	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
 	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
