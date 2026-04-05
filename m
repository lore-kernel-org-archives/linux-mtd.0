Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA67E9D800
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Apr 2026 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m7ujC5QKX7dXDPv8C06SAZChgh8WCBI61RXThqv6BVU=; b=eqIKMmoQs8wlI7
	4j/3j3ihGPVEadQ7fU4zK62iOr28sqPeUrlfgjYQ4tVoUg1pJ5dTrot/CCjAM0GWnprXa20ed0spO
	TDloYBEjcRMbmMYgIPI3+7KPTh1wIIX5erz4D2jHmkiHySwCLzM0vmU5M0hnvvapLZHqvUuKAp7Ah
	2ltmSefusgZbndO2Iy6KyHGy5+r8Ivy/JEOfCJiUvi9iT6YrTQN99UhifjrYYfVsEquDTG/+7fuQf
	fBp/mfgfp58GN3fMAvHgOTWM9En11XbOdul+tOF6DjijhUW7ynTuoZFAKcyPzmRexKyhHBTHpatpk
	/zge/OlCD38RSYzdEO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9QFh-00000004L6A-3Ddw;
	Sun, 05 Apr 2026 16:23:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9QFd-00000004L5M-0Wtg
	for linux-mtd@lists.infradead.org;
	Sun, 05 Apr 2026 16:23:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso2729455e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2026 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775406182; x=1776010982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K0J4Lnp3C5ItsHinm8I1puNCYkuJ6gslpQqXTXzYE4w=;
        b=ig6XUumjfKJ8JjuUQJ2zdrNPsl0TI/nAD03PLG+RZueyfKMKJQFVVKbVlihKY+yXtO
         YRkHazRIf0/Tc65+tY/n76W08js/JYhdnl4UgAQUgUAA/hPJUBH5MvwHUM7cW1+zeyaV
         7b0/LXQLO3M7AXg9SakzvM4fMNMGP5zY3tejqNFOkWkFZp2oLMpmPDHZsHpY/rf+yXGW
         uONpiRVge/xVmgtdXmGtv/LqnjRYA5jt1VwX0kdwS8cq3+6R/wxiX8CcDBJqWoeEMEsh
         6bZ2+gYlOdtFBOSwp20lfIGkyDhKrkw4vh206IoQ27pCH9iBxUuye21vU9fh3YsTA9Dj
         m+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775406182; x=1776010982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0J4Lnp3C5ItsHinm8I1puNCYkuJ6gslpQqXTXzYE4w=;
        b=U81MSA5SPZpXoCLznjwTyh05zFyV/oZldSU3KMQ+OqambbrQ0GldMVUzpiiuTndZjX
         R2rxztBFTboqtuiCIzYIbaeafW70Sj0+g3sPUvsMi6ub+OCFE5nF83rVmA/8zdqP1kVS
         R8Lq4HAtKIQhZdP2b1ERHIzkSses1PjKdCpOnmuLh6JTivCubX2KeiQ9ZoHCoc9Ezucy
         Nn70kqmPiaMN0jGuVmxCoKZYXU4FdJG4K0SGlvLfEuXW9no+KpPcse/KdVlydzwpdfMk
         7rJJpgupuf1+Rth/Tcv2vSZFzbrXMgbTGOuxKhQmoJJmJusD9gcBmWsngAy1StHCnnu/
         O08A==
X-Gm-Message-State: AOJu0YzUEpDYogTEKSuy5TdUzcofIm9BAqzmicgCNMr61EgEXaVZm4iq
	8BxgXBVQ+4UeoSEVlbml9clgkVU0Zbks39p95S6EaTTMotrqp21D7VV/
X-Gm-Gg: AeBDiesGFvq/1PScORgOVdMN7aeqdh8/cw72pJKn3jNG/8AbpOj7cgemHHQE9jPibmS
	raj7lVXGWIL7dSaahaDs+6hfoqF8y6G4Q2DPYDCb7K0mimcV8Y3j771qB3XDWJj4UL0j90ePRTh
	x4RrQvH1VBp4C6n2Pqd/guNHF1e+jI3nmSnBW79OcgM4hQydKk/VVwhQ8LQa+g71Q3vG3aDn5b4
	Ti4ADkzBlKQscgLBwQQilfgtzE2821SxrTZvKUlDnF9kes8HLfcYPLotD4UwAMGE6aleaH/obGu
	0zA8Dqh5gVRKzBiP7u5XWVwN+dfeiLRxUZ/rtAoGuQc1iBMckMaOpCf3NHch6V7PU9IwJhqbVby
	zDv0+SQ5G7WoodSlYCAjJQRFNGuF0s2imMGf3/P1M0ryj40j/yG9fOWRQbbDZhtXhv/iuwyqtHk
	Xm6Xq3XWuzaEWxHVnMoFgSWfg5BbLmMtWlq0mIReYYIwixzvW95zkHdcY=
X-Received: by 2002:a05:600c:820e:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-488997ee0bdmr148068135e9.30.1775406182255;
        Sun, 05 Apr 2026 09:23:02 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm34090458f8f.25.2026.04.05.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 09:23:01 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at,
	adobriyan@gmail.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] [JFFS2] update dead link in kconfig help text
Date: Sun,  5 Apr 2026 17:22:52 +0100
Message-ID: <20260405162252.163276-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_092305_192923_96D2CF3C 
X-CRM114-Status: GOOD (  10.14  )
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

The existing http://www.gzip.org/zlib/ link in the help text gives a 404
error. I believe the most up-to-date website for zlib
is https://www.zlib.net/

Let's update it.

This dead link was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 fs/jffs2/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index 560187d61562..289dc25f62cb 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -119,7 +119,7 @@ config JFFS2_ZLIB
 	help
 	  Zlib is designed to be a free, general-purpose, legally unencumbered,
 	  lossless data-compression library for use on virtually any computer
-	  hardware and operating system. See <http://www.gzip.org/zlib/> for
+	  hardware and operating system. See <https://www.zlib.net/> for
 	  further information.
 
 	  Say 'Y' if unsure.
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
