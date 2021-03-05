Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE8DC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 23:47:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765CA650A2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 23:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765CA650A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AhdCszgNLqYa8gg/VQoITHagfltwvZdZVqraQFkHjWg=; b=qhsx8c92Kqq39X53EfVF5s5huP
	FY351ZJ2bhEIBCPd7655E6Q/mknHaVInSdgqMyjPpP4y/GLAKM/xwYfew5OGSNLkgZTUTt4tU2OEe
	S/xnX7hf0OqNH7TcRcHbTsuaTm9FknBaE2UuGXLHJq/vVi7HaPia6/PomiXXGZScQmcwCxtjvlHp7
	Gu1/hYEkvXN7rOOfbfsp0lvfqBTcM6c853Vl+Ma6wdRrMzek1YtqZZrJNScR4alXhZnOGRyaWkj4J
	B/LTbI4CFPbc0VQdoYGvEWehlVR5qw0lrXGraVfOGSPo35ArCcjG6N8kZS7Lhh4Zx3TKuxiYoHK8j
	DBz6oQzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIK9D-00HBXx-0n; Fri, 05 Mar 2021 23:46:19 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIK96-00HBV1-7n
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 23:46:16 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6C2BD22172;
 Sat,  6 Mar 2021 00:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614987964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eN73zw785LDN9Maeb4EKVdz3vl/qy3K7dluHlBvPFMk=;
 b=C21hvFv5AvHFAKzlLETGUAPy+zSKh7Gbr9wZeOEcMLzMI0wxnGDaurc3hoPxM5dvbsryi/
 pR9HFxa9aBByDCZBvCIUMWvR+plslxrddbYSMwpBQ4Fypwd2QSlRwU3XapccSQWxyNWX9E
 KY2TaCucxZXx0wP+pTp0CxN6rsXhNvU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: spi-nor: use is_power_of_2()
Date: Sat,  6 Mar 2021 00:45:52 +0100
Message-Id: <20210305234552.19204-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_234612_859201_5772FDC6 
X-CRM114-Status: GOOD (  13.66  )
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

There is already a function to check if an integer is a power of 2. Use
it.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..4a315cb1c4db 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2336,11 +2336,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		 * If page_size is a power of two, the offset can be quickly
 		 * calculated with an AND operation. On the other cases we
 		 * need to do a modulus operation (more expensive).
-		 * Power of two numbers have only one bit set and we can use
-		 * the instruction hweight32 to detect if we need to do a
-		 * modulus (do_div()) or not.
 		 */
-		if (hweight32(nor->page_size) == 1) {
+		if (is_power_of_2(nor->page_size)) {
 			page_offset = addr & (nor->page_size - 1);
 		} else {
 			uint64_t aux = addr;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
