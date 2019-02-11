Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C7CC282CE
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 16:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78E221B1C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 16:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+aJ1tvD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUi2iiXo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78E221B1C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0UkE53U98ROg7VxDUjijRuJMJq0wmj59u4yJd8klsko=; b=M+aJ1tvD3pGeU3
	Z2tI48ZRCFiaDW0yF+7bnS0wkbHzqn8XofAzw0rN+3E5wEdkBUz+4Zs18i1Sd6NqCrcZq1tddAof5
	I3NFICPVnTKRf+ENVsZRAHkZrrSShXQ8aS7xdT/7kNVXbiMA4vb8Y2mOP1E0U1MMLLFdhjS4ewa0x
	zU4ZBkph60z0WSzcHY7PnYPY+aM8mo+NQhR9QK1W/tDips1xU/tWshLnDxqs9v6Gd6/1BGeIXuWkr
	gBJFgZCRfgFjSvZl89X0g1pYJFHoyAR7TNuVn7yPWDdqBHcvi4ZhIHkgkuaz0fKP9384zFlmWApOP
	iA9EeE+hIPCY0+LSumvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtEDk-0003ah-VJ; Mon, 11 Feb 2019 16:14:12 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtEDT-0003TF-6F
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 16:14:12 +0000
Received: by mail-lf1-x142.google.com with SMTP id e27so8169830lfj.8
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gF3zUTmtwWOCO+D1hqgnKITRBCRSa02w8mQTEgLIqY8=;
 b=QUi2iiXoLOP+I0jto6vlZwY9t2WtO4M0seSh2OEHvi8LM2JSfa7nMI0fHoPKMzAjpd
 wlXjxlyMsepq0OetrGRf/b7ou+nQKP9W2qaA8T6BTM/PpIT+aO7gPke5MKMgH9kxNyYc
 FZeR7hOHIsCam6JT6KDvBUGzYcaQGUwFXS3+lXjb49z7mjEqBCE6AwFnI9VuSBW6/bfT
 PlfkF3fBDsrr2qGQ2o5lSfCXHX2jFnX4KlU8+CBFluQaJWTwiMqyLENu9hVINirHnaaE
 0POyVHKTrUqag7jHm+0Hn/c2kRMSaDqg7bb+Aot0TSC+oIussBgllzDLmgNN1NeMM+dq
 KrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gF3zUTmtwWOCO+D1hqgnKITRBCRSa02w8mQTEgLIqY8=;
 b=LAB0596mQO/4GJBE75q/cGSC0DQZOcIkikrQAy4axjYzCQkUzWhXIXRbO4ZL762ajc
 Ed64HgKsM44t4G+2AgRQsM8ELoQS9nHthi1RWxO4sxA8y35nKzGgC91wQR2JrBvHvVLa
 hQxQYQmaczUvy5gqLvQqINqTAfZ2upLtiF8W4bFWPP3nX1ea0sFKnC8cZ4NYCIziHfkF
 GeScKzEUDX4ZeKVv0gHbco2EaeSPQn6N9iixghpb0mtHisM7iFDWxiqyv4psFmKDd+ba
 OiA4F0gOw1BoMIDVyBPWazojVC1a5ThHBOCtKYSWnGMoxj5qBKtEQFwJ9VVcDyaR6Bcm
 QTeQ==
X-Gm-Message-State: AHQUAuZwf4z74kCOVpXiJlYUUlgt3x2aFWTxdF5UGft/CfJo4cQGkmsD
 +Hm9YGUnNx8nwYJyKOPMv48Zu1trqFM=
X-Google-Smtp-Source: AHgI3IbvrBq0oCH1mf+8BpQI3ncrm3TfPsRxJEQC6wno6+dd7BNCkybWUAZS6Bpw4nP4cvVI8s3pKg==
X-Received: by 2002:a19:c502:: with SMTP id w2mr21682438lfe.168.1549901631903; 
 Mon, 11 Feb 2019 08:13:51 -0800 (PST)
Received: from localhost.localdomain (ti0038a400-1817.bb.online.no.
 [88.89.117.47])
 by smtp.gmail.com with ESMTPSA id d5sm2432935lfi.65.2019.02.11.08.13.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 08:13:51 -0800 (PST)
From: drolevar@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: fixes verification percent display in flashcp
Date: Mon, 11 Feb 2019 17:13:40 +0100
Message-Id: <20190211161340.12308-1-drolevar@gmail.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_081355_714193_33183921 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Andrij Abyzov <drolevar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Andrij Abyzov <drolevar@gmail.com>

flashcp was always showing 0% progress due to incorrect
printf format specifier.

Signed-off-by: Andrij Abyzov <drolevar@gmail.com>
---
 misc-utils/flashcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 0718733..c46a5b4 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -357,7 +357,7 @@ int main (int argc,char *argv[])
 		if (size < BUFSIZE) i = size;
 		if (flags & FLAG_VERBOSE)
 			log_printf (LOG_NORMAL,
-					"\rVerifying data: %dk/%lluk (%lu%%)",
+					"\rVerifying data: %dk/%lluk (%llu%%)",
 					KB (written + i),
 					KB ((unsigned long long)filestat.st_size),
 					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
-- 
2.20.1.windows.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
