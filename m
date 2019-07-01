Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D627DC0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 18:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CC42146F
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 18:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kWe6qg6k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjj11gfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2CC42146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C/uDiRdxLKdWxcZjjfNjAtAnRE2MS8ZOt33o0Q25Jbg=; b=kWe
	6qg6kpYsxyEE+PFPVLSbMDuaE2yZ+bEOOcm5xGARAVI+EVRyZFeETuz1LCxzBBCT2KmQNBdtSqA3g
	ggHre89cNrTMyDeAU7cI9LVjtwBto/o4ISXvp0TXE4AMoqxqBKBKha13Rutw6kfB/9K04G1Ps9j1u
	dumXlIpklpdiJty/gdkE+jDwL1dn7EwuWgM3hztuGRA/86wOkAZEQoiDIPqQzHtNHk3rxmRHToVcO
	XTwh6aIbZWfgEjWofFzWXf78sEVINuoCIcrPAkyaYECVPXT3fkQ8hFg3zzMI/hZeLIzBA/Elj9P+r
	Oix10fw1nZiHMBfeBVJkx7pvAH9xGmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hi0zk-0001ob-3H; Mon, 01 Jul 2019 18:25:40 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hi0zh-0001o8-6f
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 18:25:38 +0000
Received: by mail-qk1-x741.google.com with SMTP id i125so11809994qkd.6
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2019 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NYASaQzIqrMpmbB8TOwSwKNNK5Lig/rQkjmVG3DOy1E=;
 b=qjj11gfFHGjJmpur2ybeLi5W04cuF7enlAQIcu+Q2ECVX+zChl/qLSwFw06Zrwj0qw
 P8InovDnfjS4wqlejx7fROJ2oY+xJBWLOsLUn6fUfOZfKzUvJIp2yGeKste4BGKK8kAx
 hN0TndS1CaoDnA8HgR1mAXmbtJIyC/A6lzSR+cOfq2wTwZdJnSj+Zhy5Gu+BYkJgwvKR
 Lv40SmjTsg+HpsUpXsokaXyw2rJTrUlrLD4JxjykiuJDEHQXbJK8ma+7mcPg8n6cIkhP
 gx2oByaguC8GVAnDli1a6vxxM/059DWNG0d4x+FbAAR4kvANu7Pi9nwOXnbakNhdrBw4
 Dflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NYASaQzIqrMpmbB8TOwSwKNNK5Lig/rQkjmVG3DOy1E=;
 b=CSoeg76sELEZPYj6Je5QW66p+ZsV+MyM4+Ua/7dxp6gvtUTrX/SZbGTfewj4jujnog
 jKubPQNdd9XacaKYBVguviiDHGam7XIfTZnXqer0f2UcSxugTOvbsVF/u9sAhuktF5lU
 9/v65oVixxAZBw2rptszMYaMYn4Gb63efo27EEiSnqyU5U5d/6j8EL3/k55d6ZDR0tA0
 vgaS2fqT5imMwifOuOn5HNlh+M/7+VGVoUsvEW0gkLFY9lDmdCBFD6wu9Qxq30ASeSX6
 EGReqkK3JGcojT14mhn36ncGbRkdf/FJ5SkqC/OECOSHLdCe5oOm5Ytop6Cxq8M2IIWJ
 vv5w==
X-Gm-Message-State: APjAAAWrHsc0lZfuXXzm29lPvtyg9S5jV5mN0beDSWUSUa5f3tkHFHtc
 4Yg0+hyFGGGCmStQM69l5+XGY6r4
X-Google-Smtp-Source: APXvYqztir7elhp+AJQ8riQ01rRrh7KzXMCGVt537Bc4NB7b7cURDV+MWRre2xu5fVrQol6V63M2eg==
X-Received: by 2002:a37:a542:: with SMTP id o63mr23057598qke.368.1562005535692; 
 Mon, 01 Jul 2019 11:25:35 -0700 (PDT)
Received: from wpd-p910.wardrobe.irobot.com ([192.58.132.250])
 by smtp.googlemail.com with ESMTPSA id 34sm5932400qtq.59.2019.07.01.11.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 11:25:35 -0700 (PDT)
From: Patrick Doyle <wpdster@gmail.com>
X-Google-Original-From: Patrick Doyle <pdoyle@irobot.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubinize: Exit with non-zero exit code on error.
Date: Mon,  1 Jul 2019 14:25:28 -0400
Message-Id: <1562005528-22272-1-git-send-email-pdoyle@irobot.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_112537_267704_842E435F 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Patrick Doyle <pdoyle@irobot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

...specifically -1 in all of the new cases.

Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
---
 ubi-utils/ubinize.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index c85ff9b..4e16871 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -430,11 +430,14 @@ int main(int argc, char * const argv[])
 	verbose(args.verbose, "UBI image sequence number: %u", ui.image_seq);
 
 	vtbl = ubigen_create_empty_vtbl(&ui);
-	if (!vtbl)
+	if (!vtbl) {
+                err = -1;
 		goto out;
+        }
 
 	args.dict = iniparser_load(args.f_in);
 	if (!args.dict) {
+                err = -1;
 		errmsg("cannot load the input ini file \"%s\"", args.f_in);
 		goto out_vtbl;
 	}
@@ -444,17 +447,20 @@ int main(int argc, char * const argv[])
 	/* Each section describes one volume */
 	sects = iniparser_getnsec(args.dict);
 	if (sects == -1) {
+                err = -1;
 		errmsg("ini-file parsing error (iniparser_getnsec)");
 		goto out_dict;
 	}
 
 	verbose(args.verbose, "count of sections: %d", sects);
 	if (sects == 0) {
+                err = -1;
 		errmsg("no sections found the ini-file \"%s\"", args.f_in);
 		goto out_dict;
 	}
 
 	if (sects > ui.max_volumes) {
+                err = -1;
 		errmsg("too many sections (%d) in the ini-file \"%s\"",
 		       sects, args.f_in);
 		normsg("each section corresponds to an UBI volume, maximum "
@@ -464,6 +470,7 @@ int main(int argc, char * const argv[])
 
 	vi = calloc(sizeof(struct ubigen_vol_info), sects);
 	if (!vi) {
+                err = -1;
 		errmsg("cannot allocate memory");
 		goto out_dict;
 	}
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
