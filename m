Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644A1C04A6B
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 01:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34606208C0
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 01:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MSryyrhC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrL8GI8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34606208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EFmPTyE7G9h67VGU7RkprsgLKCCJ50wKLc7sbJrIgeA=; b=MSr
	yyrhCzaKrF64qUpXQUtAgwz1UInbrxQnZ7eNMP7I0G4qM4muYil5d0eyE3EjiD+WtaVUbO89/Jxxi
	MexaNSnZZckKvivyKy3dbNnnFRMlhw9PLfOj+/8/JaViyhSBGEtENN8+Ms5EcNUaeHRX7Shf55273
	beI0lCbjXbVAYZWFbncaOeIPA4liqnt2ypEak/krlmPCq+cqCBMjYJKtgasXxFy3dHhMydkKGgNQS
	nY3BwOhapD0mcMCQ4glp7q0dyEwYS1EvP/GCFL2INkY+bYE+cluWkP17zfWA7ksUTWcVZ8R3oucGB
	6PmSMQJ7uAxm8jP3uRY8tntLa6kullQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPzL3-0006Kx-Rf; Mon, 13 May 2019 01:01:09 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPzL1-0006KY-1o
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 01:01:08 +0000
Received: by mail-pf1-x441.google.com with SMTP id y11so6218984pfm.13
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2019 18:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=k/bhzTyPNIvIefKDz59YPmo/3t/+c2TzSeTHkjFw4ig=;
 b=GrL8GI8euWDIaBHfsmk35MrpEy3tL79Fghiz+3UnijRbU95sI4P8YVUjUChgAxssLQ
 Dm5D6ohn9SwR+wuNTJisw0a1ectN/awM9fFvnDASJB7jXIk6PlTNRqkDTua/w4k+VrA/
 Dv1EqyzbKbsFePbyaFW0Ap3+hx7TdVYobyDMt0ecbvKCz+YrF04edECCYAVFixna8Hyv
 UaZ1ZE84p5kvo43CTV70yhQ2EzRtUgy8J8TIEyl0qaFcjBChm8ZJLaB00OinaALlOYym
 zBWnsDt+ZZNrSyPf4cAqG8fa1wNWHBT5YAcBY5Man2Wk/MFmpnmVNoBWN+BB90Z20HGw
 roHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k/bhzTyPNIvIefKDz59YPmo/3t/+c2TzSeTHkjFw4ig=;
 b=c7xxBOjH3xnPWZSnpjvFfUOLgfgQ0WC3ZDvcx74z9hrbymYrX0Y1UcQ7X0hSbE8NZk
 b41RKgw/MKXLurRAIqksHtTx7MbzByAuUp+lpahKoxg6cDrAgBqicJm8CzsoKeuLN1Gc
 cJfz0RkLTnIaW00dT8vekX4w4wphIj2U/fl+v2hNwqfKJG5ZG7JqDBXwW03EsFElpihO
 AYuoPqILVMeuzJcNL3/7veKevXQq0WOV3oCiQXgfpUv7bszK/1SwBqVlUR6xpzUi7Okx
 CKOXtg5oRDYf/lvuBH9j7LjMdiiaI+RmxF1kEpx2B/jzEeg9BmgFrEPPl9PUpkzh+XF1
 67/Q==
X-Gm-Message-State: APjAAAW8I70l0lshHbwj2y8sndpg12jUHelaW8y5v7EHN8i691r6GzOE
 rDMFZT45cOm23hllAC+afTyncwWT
X-Google-Smtp-Source: APXvYqznfJP3Fej7e4++GVGdVJ6ZQqoHbb0bBF1NIOhW0FP3ba1yeSgkQeg8DfAbkBGtxTEta/CYiw==
X-Received: by 2002:a63:cf54:: with SMTP id b20mr27985674pgj.307.1557709265359; 
 Sun, 12 May 2019 18:01:05 -0700 (PDT)
Received: from amolsystem.hsd1.wa.comcast.net
 ([2601:600:9500:9a45:2da1:5e3f:dd49:27a5])
 by smtp.gmail.com with ESMTPSA id g72sm28043546pfg.63.2019.05.12.18.01.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 12 May 2019 18:01:04 -0700 (PDT)
From: Amol Vengurlekar <amolsven@gmail.com>
X-Google-Original-From: Amol Vengurlekar <amol.sven@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubiformat: Dont ignore sequence number CLI option
Date: Sun, 12 May 2019 17:59:19 -0700
Message-Id: <1557709159-26360-1-git-send-email-amol.sven@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_180107_122153_3A0DBA0E 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Amol Vengurlekar <amol.sven@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Image sequence number for the UBI header can be specified for the
ubiformat tool according to the documentation and the help message for
ubiformat. The CLI option --image-seq for image sequence number is not
supported. -Q option for image sequence number is silently ignored.
This patch adds the CLI support for image sequence number.

Signed-off-by: Amol Vengurlekar <amol.sven@gmail.com>
---
 ubi-utils/ubiformat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index aedb27b..a90627c 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -120,6 +120,7 @@ static const struct option long_options[] = {
 	{ .name = "ubi-ver",         .has_arg = 1, .flag = NULL, .val = 'x' },
 	{ .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "image-seq",       .has_arg = 1, .flag = NULL, .val = 'Q' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -132,7 +133,7 @@ static int parse_opt(int argc, char * const argv[])
 		int key, error = 0;
 		unsigned long int image_seq;
 
-		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:", long_options, NULL);
+		key = getopt_long(argc, argv, "nh?Vyqve:x:s:O:f:S:Q:", long_options, NULL);
 		if (key == -1)
 			break;
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
