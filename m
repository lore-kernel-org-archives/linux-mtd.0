Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9A7C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=616QZ1KE8j2k9kA8YU43kiWutHMv3KmO/tpSKC06ks0=; b=uYnC6z+Z/RKOby
	5wEPUXZlD4b/LjeU7pJaEI/wsvseKrVk8/OO5sRiO1R8DHIu59mMVUT69/ukhmCJR334DBt3OCx3/
	PazouABq6rIguX3lT8n7KbEmf0WsDAc1EzmWS4wHkwRwG6wXbkzYCw8YZhCp8hQs0vKfRouDz7BD8
	Z+lXUDxykueYMPEMOlrOMnRhtbFRMQ8z1ojup2DebJwdFiqE7a+fRFMkheiExf+BK1c8v+MQp5Riv
	gSL6qq6hnJnGKNK8GFkcAaqPONvEfFwqL5i4Kwj08UF5qx7JXzsdCclftBkZrQa902VQQT/um6la9
	nDhLNLnA3I+CfPjyBqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalVb-007KAg-IR; Tue, 20 Sep 2022 22:14:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalVO-007K9T-1e
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 22:14:20 +0000
Received: by mail-lj1-x236.google.com with SMTP id j24so4273415lja.4
        for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2022 15:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=cLWPjsmIR2g1VwqeFSua29T/FJXWRdh0HvGo5yC3sr0=;
        b=b+jU4eZRHomXqd39Q36/hKXcbKvVgAereZm3v+lZD2AhdrgD96ZhI2xraR1JljV8cm
         3hpxPG1fhVmP1iXpfKaqEFzXo6C+XJdOZjROb5ge+i0AnacrXuoqadMGwvGUN/WCOCvF
         aus/KkoFLaF6xszjoMmzEss2Bmm/szYrY2HKCTafgzAP4qd+gHBBiWanwFZoRyjpma3Y
         4dp12uGLuQIvomlRcNEtqpPKLnhV1Yx95F3JbFyia9DqeD+8jbb7Zc3erSIpHG41aiKR
         lkITDGdUce3Y5g8uesV7hUboH+JtF0ys2BwiAcW4zqrRvkiH3p70JkYPbILz4penVyfY
         pghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=cLWPjsmIR2g1VwqeFSua29T/FJXWRdh0HvGo5yC3sr0=;
        b=xcp36oyphoUzeCsqQi9A13PIudwqJIHahFhgacmsTbaEAFIeOgA4SRyoH9sNKYk9Ug
         +Uy1/+BVPyCWnng/0PJ1xFMKczAZoRsCwRb4HDIuBPK23uQchjxgYSNW7mmkwDyrbyT0
         Gva47O3EofwgVckDaItjKtxaY5MevssPcggc5AuqmQjoFp8aclbacFTK4/Us97kI4JY4
         Wv21GVm9tDqRbpCpVTYpmfB0cKsuu2zkNtKEkxaGiSziZpt9KEyl/1pSvECXHkrtezNb
         GgJ6gUYrNW3XcTj27Kswi3XpZwLAfob1tAMyvU7J0Sg0t0tg1ia3iCohTbLT9PVZRmv1
         +5Og==
X-Gm-Message-State: ACrzQf0aRIsI1ngzxm3SuWbkweQ1UxTzSEaPrVectLR1JOpRA91jQgny
	H8X6wBpPz113YTHQMIzxDJsZw0wejZw=
X-Google-Smtp-Source: AMsMyM74VkIGiPPkwQhwu3GtgZnOiP6BLBvDDlsM1KTf6I0o4XVGE8aImGlDEibzjpuKVlgYCA1+3w==
X-Received: by 2002:a05:651c:1141:b0:261:6ea9:ac97 with SMTP id h1-20020a05651c114100b002616ea9ac97mr8004291ljo.434.1663712050578;
        Tue, 20 Sep 2022 15:14:10 -0700 (PDT)
Received: from magpie.lan (c-97f7225c.05-662-7570703.bbcust.telenor.se. [92.34.247.151])
        by smtp.gmail.com with ESMTPSA id u5-20020ac24c25000000b00498ff0f0692sm144603lfq.125.2022.09.20.15.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:14:10 -0700 (PDT)
From: Martin Erik Werner <martinerikwerner@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Martin Erik Werner <martinerikwerner@gmail.com>
Subject: [PATCH] mtd-www: UBIFS: fix some incorrect hyperlinks
Date: Wed, 21 Sep 2022 00:13:52 +0200
Message-Id: <20220920221352.1253593-1-martinerikwerner@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_151414_124275_698695C8 
X-CRM114-Status: GOOD (  13.14  )
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

Signed-off-by: Martin Erik Werner <martinerikwerner@gmail.com>
---
 doc/ubifs.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index 6520d79..aab5d15 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -542,7 +542,7 @@ following is a list of useful hints and advices.</p>
 	<code>-o sync</code> option when mounting UBIFS; however, the file
 	system performance will drop - be careful. Also remember that UBIFS
 	mounted in synchronous mode provides less guarantees than JFFS2 - refer
-	<a href="ubi.html#L_sync_semantics">this</a> section for details.</li>
+	<a href="ubifs.html#L_sync_semantics">this</a> section for details.</li>
 
 	<li>Always keep in mind the above statement from the manual pages and
 	run <code>fsync()</code> for all important files you change; of
@@ -1104,7 +1104,7 @@ not compress.</p>
 
 <p>Well, this does not sound as a big issue. However, compression becomes an
 issue for free space reporting when compression is combined with
-<a href="ubi.html#L_writeback">write-back</a>. Namely, UBIFS cannot know how
+<a href="ubifs.html#L_writeback">write-back</a>. Namely, UBIFS cannot know how
 well the cached dirty data would compress, and the only way to find this out is
 to actually compress it. See below.</p>
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
