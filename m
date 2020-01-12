Return-Path: <SRS0=jxJ8=3B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4831AC33CA2
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 20:33:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7EE21556
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 20:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQRGTWKj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=grussling-com.20150623.gappssmtp.com header.i=@grussling-com.20150623.gappssmtp.com header.b="Yi1RyL27"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7EE21556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grussling.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uYHov/dpE3dyAHBJQ8R5Fza16Pjk826AOJ/E8eePJ0M=; b=MQRGTWKj0dMVSN
	4WTcx1sFaUkI7cEGHeyKuCLsuS7fzCCMId6a3pCPyXwoLQ9/oDn5xNiNfYXaXlYUdVZipoy+XngHr
	qcOVA6QC7wEXdyW8T2SNkUeeNorF4pNynNG0BG9EruDtG+aSdV4bkydrjD0KWK2cDPZ3yGgeWVc/s
	HFWE8iUv7pyaU5UqOC/XEGf2RfblzPF0bmq+WesoVo2NNklwbwdas1mRdgw4IFxpoqiShIhYusWuI
	nbt7N72yItcYt3x8V7ceOwipMalYyxJpAoV0h4I6klF9Ip4HH8tf587X4yghdH1pfwMJuTb4wWwLP
	9/ugkAtTWgx/etsv5DEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqjvZ-0006aS-6x; Sun, 12 Jan 2020 20:33:41 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqjvV-0006Zi-OG
 for linux-mtd@lists.infradead.org; Sun, 12 Jan 2020 20:33:39 +0000
Received: by mail-pl1-x643.google.com with SMTP id bd4so2996093plb.8
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2020 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grussling-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+u94wnLVQwk3l5brMI1mkmcvkht7sOB+HVcAx0S+FPM=;
 b=Yi1RyL274eDgVCrV1djztmvfM/Ji9YuH3T8c4NXvivmtK2seph+McCZULE5zqCrZ1b
 9VH13eMd7tiNq79Nkl2VnkWhwn1jvJKVnMYyZ1qy5XWdVUtGJoYgo64tTRkPKSfDGXF3
 BnVIfjCBQ2fCF/hvhDA61ZA2d1r+tni8EWsxVS2pY4jH7YKi1ugx97DIz06XqAkUzrPR
 M0cIHPj36+FjjUarAyQAI4Oax7a0E37CB2LNoqIONLrt/VCXrf69UXvbJHm/srGTYIL8
 UXUAO9745E6Cw9Jnz7ryY/4lMs+WA5d2ACbTS1VUiD3LaxmV/cudebTKb0WRcwWA3uZr
 YF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+u94wnLVQwk3l5brMI1mkmcvkht7sOB+HVcAx0S+FPM=;
 b=MZBoMI2liAMVUUNgTrXH3Eqj3aEg64dax5PRlom3AUPWJx5uULa4VipavDIFXOAEH7
 Dk8QPj2AmTS7cvPWfDzNB1u5sNo6csmnQ8QTI/SEX0BuH9EI0uAP51kOr0OnxqqnRDyD
 kfjRZ9sWSQkOZG0TfBZrgwX3n9iE5uzwG6MDc2CdGN7jsbBoOMI2RIeZIxbVjX0ZDs2Q
 xNMEPF9Tr7MCmC1e1ZDbCD2tKDzjOtzRCPZiJIqbgpNEsuf4C24FWZUub1F5Ae35fMvA
 4U0j31ZBuuZ0T8PsnnUgMDcSR92g5gxKcfWH2e+UWxmUL3qraR2rwB0/IEWaVWybFJGL
 30ww==
X-Gm-Message-State: APjAAAWys38VPLeWRVgRz2HNpD4SKv4wHXB33UKK7I/IgOfPPWDyKXG4
 c8p7pjehYW5eFYEgPKSwn5TPQOkDnRY=
X-Google-Smtp-Source: APXvYqzU9frq5soKBBsxPLlrgrmyb6ZOZgxbv8mInl/2S1Fc3jF7nIqrq56MXgFg9M4mrTnIZcbd6g==
X-Received: by 2002:a17:902:7d95:: with SMTP id
 a21mr11027447plm.198.1578861216145; 
 Sun, 12 Jan 2020 12:33:36 -0800 (PST)
Received: from ciri.pullman ([2606:6000:4442:e04:3194:6ecf:9900:1792])
 by smtp.gmail.com with ESMTPSA id u3sm10812935pga.72.2020.01.12.12.33.34
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 12:33:35 -0800 (PST)
From: Barry Grussling <barry@grussling.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: Fix return value of ubiformat
Date: Sun, 12 Jan 2020 12:33:32 -0800
Message-Id: <20200112203332.24216-1-barry@grussling.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_123337_929868_BCA7BE15 
X-CRM114-Status: GOOD (  12.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This changeset fixes a feature regression in ubiformat.  Older versions of
ubiformat, when invoked with a flash-image, would return 0 in the case no error
was encountered.  Upon upgrading to latest, it was discovered that ubiformat
returned 255 even without encountering an error condition.

This changeset corrects the above issue and causes ubiformat, when given an
image file, to return 0 when no errors are detected.

Tested by running through my loading scripts and verifying ubiformat returned
0.

Signed-off-by: Barry Grussling <barry@grussling.com>
---
 ubi-utils/ubiformat.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 64afad2..be40e52 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	struct ubi_vtbl_record *vtbl;
 	int eb1 = -1, eb2 = -1;
 	long long ec1 = -1, ec2 = -1;
+	int ret = -1;
 
 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
 	write_size /= mtd->subpage_size;
@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 	if (!args.quiet && !args.verbose)
 		printf("\n");
 
-	if (novtbl)
+	if (novtbl) {
+		ret = 0;
 		goto out_free;
+	}
 
 	if (eb1 == -1 || eb2 == -1) {
 		errmsg("no eraseblocks for volume table");
@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 
 out_free:
 	free(hdr);
-	return -1;
+	return ret;
 }
 
 int main(int argc, char * const argv[])
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
