Return-Path: <SRS0=dRRL=A6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C95C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2020 00:32:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DF9208B3
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jul 2020 00:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ilMXca1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DF9208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/03chKdXxa/vtK3vycoO/J6Dtx8e6ALFFzpUNK9YlU=; b=ilMXca1BaYgyRvXfYP+BiDxg5Y
	UPRQHM6PMvYCla7uV2j2yjfv+UNS735uv+Z2ZMC72C/VMEkHccX1qs7cv7ELhdFYOzNjr5+vZQ+se
	bDkvMRIhtv4wjWJ1oS4hOwfRB5pR/xlq8Ed7MePrCUAfTOEd4Jy2EhQVhQkT171MpjeGQJikyb+Gk
	NoSg/RmMTztXAln+6ipKCnPpdnELPGVn983XwLJ1xCkscwQnhRwXBkbX4eR50MEiMM709qMaKq8af
	Tjoj0iXDNd/dTi4NWOt8YVkHw4D9xI9TJyo8athpAvWiohWTwOy+z0n5Lqf8SywDVohV5lT395/BO
	mI8ITwNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwxFX-000317-S1; Sun, 19 Jul 2020 00:32:15 +0000
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwxFU-0002zR-MC; Sun, 19 Jul 2020 00:32:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MTD: mtd-abi.h: drop a duplicated word
Date: Sat, 18 Jul 2020 17:32:08 -0700
Message-Id: <20200719003208.21200-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Richard Weinberger <richard@nod.at>, Randy Dunlap <rdunlap@infradead.org>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Drop the repeated word "mode" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 include/uapi/mtd/mtd-abi.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/include/uapi/mtd/mtd-abi.h
+++ linux-next-20200717/include/uapi/mtd/mtd-abi.h
@@ -262,7 +262,7 @@ struct mtd_ecc_stats {
  * @MTD_FILE_MODE_OTP_USER:	OTP enabled in user mode
  * @MTD_FILE_MODE_RAW:		OTP disabled, ECC disabled
  *
- * These modes can be set via ioctl(MTDFILEMODE). The mode mode will be retained
+ * These modes can be set via ioctl(MTDFILEMODE). The mode will be retained
  * separately for each open file descriptor.
  *
  * Note: %MTD_FILE_MODE_RAW provides the same functionality as %MTD_OPS_RAW -

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
