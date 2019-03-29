Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E981C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 10:32:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1779206B8
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 10:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qiHzg/X6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1779206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4P4YDjjgik6UfVB4EYz1fkoROpdpqtHFXpzyZRq7J4=; b=qiHzg/X68RsmGC
	lfmNis+HnTXDJSFCgjSDP/KZAzGUsAJR2XyaFWRSLyj/JhvRUlf11UNXkyYHtkHNkkKVEFCwVtORH
	m9tb/d1zhHGZVG0rCfhXvW1xSELsPYrmOGG6XC2IkHbheCVDPlo0vqTi2iTxJQJiuj4D9JXf6iixu
	X3A22aw7t3T5i+gXd6JNKce+KUfjwCf/jSvHSWFLgtgV2zANE1kZjsJYtOQ3Y0q2TpDLW7hUHZyDP
	/zZ4vs0ZyBRg6wC0tu31kwb3ymd44dG5z9xIvQymFO5aUPXMNQiA0BaUOphsm0eKtDQiYIS0oj9tX
	/1EZaiiIhR4NEjj8u6OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9ooT-0000GF-O0; Fri, 29 Mar 2019 10:32:41 +0000
Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9ooO-0000Fe-3M
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 10:32:38 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id DD4854404D2;
 Fri, 29 Mar 2019 13:32:29 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: fix build without openssl
Date: Fri, 29 Mar 2019 13:32:24 +0300
Message-Id: <451b6fd8f6b619ae75d283df02edd835c8e3c627.1553855544.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_033236_355256_9BE64409 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Exclude openssl headers when WITH_CRYPTO is not defined.

Fixes this build failure:

In file included from ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:25:0:
ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error: openssl/rand.h: No such file or directory
 #include <openssl/rand.h>
          ^~~~~~~~~~~~~~~~

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
index aa032392155b..8f0186043079 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -46,7 +46,9 @@
 #include <uuid.h>
 #include <sys/file.h>
 
+#ifdef WITH_CRYPTO
 #include <openssl/rand.h>
+#endif
 
 #include <mtd/ubifs-media.h>
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
