Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BA2C07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 13:54:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B087061C92
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 13:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B087061C92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i+4tstHjZCJRJbM6204nP2Uo3/+xHnI7Uiy45rYhe1c=; b=TcOZjLmjjQPflc
	bpCuEdYFv6uuz9MoMl/iRfgGTsb3gfj3SvHDyjJ5drggUpHLw2UOewLUe7VT0SPYiOX16EgLZiK6b
	w0dCA2EjN0Go4C2/884I3oioOjCvZ6w0dZ5sH2ziV0d7uPTMZe46pfScbWtRLuHl59nSBiCNt9UsN
	FtTnaWJ52X9HEeps4fEAlxFShIGiOQjrYu0sT6JY3rwF/dh8VPFMCHrPgVOXb5lwhpax8Hsczx49O
	BpPqWWHjsWe2IHkKY0Qd3BDHDZLhE2TTH5yBitwJMlw04dvNPwip0rqE8lGxleAna7uNDlSUcaz7A
	uqnW7cmWlKGKZ63zQjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m180B-00EzjB-Cd; Wed, 07 Jul 2021 13:54:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1808-00EziX-Tp
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 13:54:10 +0000
Received: from mwalle01.kontron.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E8C7B22239;
 Wed,  7 Jul 2021 15:54:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625666046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=463I5Kn83G/zVB2GPiLeqFvap57D0rJfLHdECXpBuRE=;
 b=IV9HpANbPafhl3HpYqL3jLg8qQcVxE1vfNilaqpJl3wSUlbkC5wsU8tWz6WqhYH8daw6bX
 jTtuTCJCW9d6KMqcQPSpvkOQ93BsNuixhwFnbSPeeimwmrBiQSryiDcDuCd3KewXkqdedu
 Tnr5iCguAA4eJ6o6WELtm5uiBxljfXQ=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor.Ambarus@microchip.com, Michael Walle <michael@walle.cc>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] mtd: core: handle flashes without OTP gracefully
Date: Wed,  7 Jul 2021 15:53:59 +0200
Message-Id: <20210707135359.32398-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_065409_154876_785E7C7E 
X-CRM114-Status: GOOD (  10.96  )
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

There are flash drivers which registers the OTP callbacks although the
flash doesn't support OTP regions and return -ENODATA for these
callbacks if there is no OTP. If this happens, the probe of the whole
flash will fail. Fix it by handling the ENODATA return code and skip
the OTP region nvmem setup.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Michael Walle <michael@walle.cc>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
changes since v1:
 - move the check into mtd_otp_size()

 drivers/mtd/mtdcore.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b5ccd3037788..c8fd7f758938 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -806,7 +806,9 @@ static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 
 err:
 	kfree(info);
-	return ret;
+
+	/* ENODATA means there is no OTP region. */
+	return ret == -ENODATA ? 0 : ret;
 }
 
 static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
