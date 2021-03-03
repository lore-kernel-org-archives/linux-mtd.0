Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDDAC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:05:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3759164E89
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3759164E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DqZ7ACnwEOG4P1JaHYB6ZHsXcyFfqcA8LKn7UtWTh3U=; b=F4Rn1hzVfxS+UaKyekXjjwGi/l
	2BLArKHE38451Ii0VzzqdHEpACp/f/3UAx4X+u8Z4jp9iuu1Gx1cqF33PBhytyjlTWMawRj+keFeH
	C7DYaBuu8AGRGVuh23iSeNXh/BAtJu55D4Cn4nntFTxG6nZQzc/J2xUNq1hlKbf2nYuEEEZGba3Su
	TrecX5H/QA0XuEADv3uVV3rENk0IKbJ2SNnY9IbjE9ITt10qRRpgKP4OWMBmcAl7OzW0HyruoRsrn
	sQSFL4AxVb9rFZA7fjwYIzrwiISy8VFoEMTHP6MIdN8V8/LYcMoPvnIh4y9rHOkmuvS0IEYO0r4HB
	EHdS540w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHS6k-0052YT-He; Wed, 03 Mar 2021 14:04:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS3u-0051t1-5d
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=9V1la8w1FGLjhvDOf3id67TUCZu9jyzdWHII7WZ1A5A=; b=AJDxU9a6EnEdFkmrn3SnralwZc
 wnL9WL9HYHxQ38IBTKClTmdpBw07eEIgpZkkoxGWJN7bqm45lzdZetoWTfNbCLb2NmdMaLOUK3DEy
 5T4k161L4YrieWS8EJsQGcDmq4/nLUJ19n++TWZDu8AqMwCYadCuJmGwp9nFDUKzB2B0OpuCwRa+J
 jff9qkpEWkQtYcqWq0S/ptuJl7vMajHghAbkWcpsoIIUR0M7zo1T3PjtNIQqQEVRfVwlZrnmLudqV
 cpqocpTvbXfgcL4hJpaHV3OemVKbE3NxHV6FdBg1ThGCPndI+cEslu8sXcb/RuFdiZ7MUUS66mjfV
 ol6ScGYw==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHO1t-0023TQ-30
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 09:42:54 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lHO1m-0000ol-IK; Wed, 03 Mar 2021 09:42:46 +0000
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: nand: Fix error handling in nand_prog_page_op
Date: Wed,  3 Mar 2021 09:42:46 +0000
Message-Id: <20210303094246.5724-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_094254_225450_FF9C1D29 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Colin Ian King <colin.king@canonical.com>

The less than zero comparison with status is always false because status
is a u8. Fix this by using ret as the return check for the call to
chip->legacy.waitfunc() and checking on this and assigning status to ret
if it is OK.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 52f67def97f1 ("mtd: nand: fix error handling in nand_prog_page_op() #1")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/nand_base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 0f6babefaed2..4f263c22c80d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1462,9 +1462,10 @@ int nand_prog_page_op(struct nand_chip *chip, unsigned int page,
 				     page);
 		chip->legacy.write_buf(chip, buf, len);
 		chip->legacy.cmdfunc(chip, NAND_CMD_PAGEPROG, -1, -1);
-		status = chip->legacy.waitfunc(chip);
-		if (status < 0)
-			return status;
+		ret = chip->legacy.waitfunc(chip);
+		if (ret < 0)
+			return ret;
+		status = ret;
 	}
 
 	if (status & NAND_STATUS_FAIL)
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
