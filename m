Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB673C33CAA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF4224683
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRMX3z0m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="B1qARC/k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DF4224683
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S72ZXCHDEr5erKrTXT8mxrTurOvdD4Ra59c6zRcjjrQ=; b=WRMX3z0m5wrNgC
	6Z4QY2UUgRshOL/dSTcionywLS6ad1Og2b21X+SF0cYo2n/WHV9wqqyyQvjpPWu32ugarboL0XX0X
	4sbDGedyYRpeO54gsGpnzozXSgFF7PPES1IzLBD9EiDGPdNPnOtyJ302oNKstJha0pjJCvbwfokhu
	YQ4UuNmBn+baLTXah10xNcKRVHl1a4D0bjjnRXItUiXgJizoD3zH7VDSHhA05HRiQvTQybkkmdUfz
	K6zsUSusshUS0ZtC6RtztCgGkuOmsmXWD2zsYCLr+YDCK0U0LrsFRxK4r2QIGTy91isnMbNY0s61p
	GQc8veeTuQ9Y7SvypQUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuXm0-0001JB-Bn; Thu, 23 Jan 2020 08:23:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuXlv-00019G-2i
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 08:23:28 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N8DfUn017496; Thu, 23 Jan 2020 09:23:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=v2rNH4Gsw0bzUghfyGUw+uoKwXzibWz9pq9H3oEz7bQ=;
 b=B1qARC/kP+m68l3RIC3OE6xFWuO4hUxfbL9cUkfn2YW57LnXOqBB8SUJNsmrn91P2fTd
 0h0xHn+Jc3ekuiajiilRpYjrQqk0e8hKKrToyrUalnWsqbL+hv+4/oTknEbr35rnoSsO
 RIno2e0Z4jOum+2O21AfF7qB6U1P7ndkFQyTFUs96UKY4lZsWrNLApZ2vqpGsmXzb8di
 TVOcjNaySGjBhi70Lm+zT+yRRdS7pATwSldb3YNJ85XCMtxmGl1526YTJv+j+LOcZlmT
 VhCG8naFSmDqaCDBvUB4nXNiANarXYEpG4TQ5gnWsnJsTBwiQKNI2rHX7ifA4sEBDcLC QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssp8r8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 09:23:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BA75100038;
 Thu, 23 Jan 2020 09:23:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9A4320EDDA;
 Thu, 23 Jan 2020 09:23:16 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Thu, 23 Jan 2020 09:23:16 +0100
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: mtd: rawnand: free the nand_device object
Date: Thu, 23 Jan 2020 09:22:48 +0100
Message-ID: <1579767768-32295-1-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-22_08:2020-01-22,
 2020-01-22 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_002327_694929_A5E286EE 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: Christophe Kerello <christophe.kerello@st.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch releases the resources allocated in nanddev_init function.

Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f64e3b6..47c6396 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5907,6 +5907,8 @@ void nand_cleanup(struct nand_chip *chip)
 	    chip->ecc.algo == NAND_ECC_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
+	nanddev_cleanup(&chip->base);
+
 	/* Free bad block table memory */
 	kfree(chip->bbt);
 	kfree(chip->data_buf);
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
