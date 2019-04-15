Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B118DC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:20:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4EF20674
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NYCVC882";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="B2SONHBD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4EF20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=schinagl.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjNNzQ0YqCOjmZX4LeXUKyrqzF+5dtTZrL4gS9h4h84=; b=NYCVC882cruS/W
	TCuSVguMKLbkPxZnU3t9w4SK8Jrjhwbry7i7ctbvnj1DOTrVj5X42LtDXoo96/6nQy/ImftS7TmRa
	MZuphF/AKZw7F8huAW8HtWXYSwhDszkBOfbIx0y+aSwpjlLZfID330q6XJvIQh/6V9PpVof7zK5Lp
	+43CFI2J13eIpyy+tGbzzQe5bhjQXcqJEnihi4An97/NW/Mdj1tCr+6JU5YD3ceuFkWvPBf/oEVKM
	e28cl+cer0aoivBVak+YL0ftRBHhDGqOvWbEWzyp+aC6XZbUMC8Ila1EW6K52/krzkFLwa6aRdgKK
	HJKl6xjmhvC2034KUaeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFwrA-0000iw-V2; Mon, 15 Apr 2019 08:20:48 +0000
Received: from 7of9.schinagl.nl ([62.251.20.244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwr3-0000ZU-FB
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 08:20:42 +0000
Received: from 3of9.evbox.com (90-145-215-130.bbserv.nl [90.145.215.130])
 by 7of9.schinagl.nl (Postfix) with ESMTPA id 0D59BEE2611;
 Mon, 15 Apr 2019 10:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
 t=1555316440; bh=B4Xbqi/Xif7FP3mrYG1I4Tp2NXiBtU5TUzfsyghO6F4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B2SONHBDXTi83u6ZsPrTgoweRPfC97WWiQyKmvQErXlNrPcOgcYx4iV4GZRs/pAIY
 NFHU397Y/WzIvH65+rvpEXwpRdz00yunV+mF0mOR7k+YXbq4PjfXJ/Sf/iZgzkB9Jq
 sqhMXIDpEbZSLFjKzJWzoRRT+0FIAXZ4Iqbe7PgM=
From: Olliver Schinagl <oliver@schinagl.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] unittests/test_lib: Include proper header for _IOC_SIZE
Date: Mon, 15 Apr 2019 10:20:29 +0200
Message-Id: <20190415082031.600-2-oliver@schinagl.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415082031.600-1-oliver@schinagl.nl>
References: <20190415082031.600-1-oliver@schinagl.nl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_012041_665264_E6684AAA 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The macro _IOC_SIZE is not part of sys/ioctl.h but lives in asm/ioctl.h
so we should include the proper header. If we do not, some systems
complain during linking that they cannot find the symbol _IOC_SIZE()
which was not expanded by the pre-compiler.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 tests/unittests/test_lib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unittests/test_lib.h b/tests/unittests/test_lib.h
index 7a6a003..cd94d9f 100644
--- a/tests/unittests/test_lib.h
+++ b/tests/unittests/test_lib.h
@@ -1,3 +1,4 @@
+#include <asm/ioctl.h>
 #include <stdarg.h>
 #include <setjmp.h>
 #include <stddef.h>
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
