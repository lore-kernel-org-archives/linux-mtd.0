Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39CBC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 20:55:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705A1218A1
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 20:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e78CGPlB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyHwbbFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 705A1218A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6rgZHoiV5FXRiQbRdVpRs0w5CBjBYJUHFlonJlIab8Q=; b=e78CGPlBNLeiqs
	T8EoNFn8wFzRqAdekxvjUKB8NZQV2suih/d2+A+qlpT4xOhUeS8J9Kp1iyatIj3stl2qSuyALApPl
	mhou9W7YkpgYINu3gP5st/jGiG3/orm6QsnjncNl2TuxUXtprqEG0ySb9qFZHnFpZK0MKu1pdMbWS
	F5in2Rxa/iMt8LPJU5Zl9kBlPPStp17iTogvDfCTde0xALjMm9OHc4Wg93eomvPfvVsOet770vaJ1
	bG1DB0XJi4wO2nLANzJ1wqWyN+2ppSQZ95Bj6iUGS1hC8weqSbuRMMLdJSeOpYS8uIsQKLoOD73gQ
	yyxlURbEF8t5bfzcNueA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4trE-0006fd-Sn; Fri, 15 Mar 2019 20:55:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4trA-00069R-N6
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 20:55:11 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D942218A1;
 Fri, 15 Mar 2019 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552683308;
 bh=ruKCTGuomy9r4qzoPZWSyv/SHscjtfGbePDcTZL1rgo=;
 h=From:To:Cc:Subject:Date:From;
 b=IyHwbbFDxHJH1/mWwXnMP1W9hy9DLLfPp/PsXo8Va1Obn5PlII3i+yzJSRWxIT/TY
 yCdAP6HyyRgOtrkXkGCR/eSJMXfaUVBD+5QLZSksNznTqNgluH0u3h1zvD6cz28tr8
 1mfTIb3BVptL5p7tIvFr2+q0oQ0NciCT3wN5AJ1w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: remove unnecessary #ifdef around
 fscrypt_ioctl_get_policy()
Date: Fri, 15 Mar 2019 13:55:03 -0700
Message-Id: <20190315205503.195400-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_135509_182325_9273C83C 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

When !CONFIG_FS_ENCRYPTION, fscrypt_ioctl_get_policy() is already
stubbed out to return -EOPNOTSUPP, so the extra #ifdef is not needed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/ioctl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 82e4e6a30b04..cd1d4212fc45 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -205,13 +205,8 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return -EOPNOTSUPP;
 #endif
 	}
-	case FS_IOC_GET_ENCRYPTION_POLICY: {
-#ifdef CONFIG_FS_ENCRYPTION
+	case FS_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
-#else
-		return -EOPNOTSUPP;
-#endif
-	}
 
 	default:
 		return -ENOTTY;
-- 
2.21.0.360.g471c308f928-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
