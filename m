Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEFCF5A8A2
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 01:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rXaYN5Oa6Lgu2CjII312GZzaxCsu/VeVjnFIbMhQQ9M=; b=ai5FuqQzijltrB
	M1dw1jMeHxZHmP7HlgmuBGFQ3QnCUiTAX3b+8oNdQDnz+tygeeREcq2pRKHo9JIKlqfcNtBaGHDOZ
	GMKJxVhP5NFqAtsu1FAMBqaRBuCydJ3udufVZ7JTWPXG6bn5MDO1pi1nacVvsjVFDKvScV+IPfMix
	zWFlasdKZ1IgujAbGF25ezllQ7LPcUGpUif/4SaaMfOfBRZp93dVMr/AsXYchhPghrni/z62aoKxP
	hq0kdQ037qhhMgz9EeMrUHItmX7llShP/9F3qqMY2OtgCSNC2489ZIQoZv+CGRZh4DXPEDPm6vl3x
	wSv6nD4s+oiwg+HfF67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzhU-00000007tI4-0IUR;
	Tue, 21 Apr 2026 01:14:52 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzhR-00000007tHl-3h1K
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 01:14:50 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8acae26e564so43645426d6.2
        for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2026 18:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776734088; x=1777338888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6mJ12VZeI0zbm3RIq0mrgvlSRaTLBa7l+MiRgl2pGY=;
        b=Q8Bokg/eqUtDIj1sXmWD3kU5ouD1J26Og8vcPc8k3DUc01sputHJ1t1fxfG7lUcHpt
         0r6rakTmIpuKKhIKxBL7LrF1nKDnOY2sOAgqtNNafz0fSrW4v2Wo8HKB4ZAV00QiOOZJ
         XsGTEw4KFaeKyBv1sXW5UwJlb4YDdVTa4tv4SLAR2NxjpOAuJ+/w256IVW93ZwGkHKnD
         STFZcotCRrKgObFivLGdMqIZhwbMi2Nm5MiKM+ZYDNbgu2hqtQRDR0nL1DVcUpS5OIoO
         oRzSEIWVtmgvQFMGQW6tSOilZA2LL95+hEoNBeGqNp0qvfzHUDPCnZ/40JmDcppbP3NA
         pqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776734088; x=1777338888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6mJ12VZeI0zbm3RIq0mrgvlSRaTLBa7l+MiRgl2pGY=;
        b=pUmAjlyTlILHpmDX0VWEn3lZs+m8sDb4iyAmu9X+1eSmMtoNBU34037R35pyTsJsoq
         Y9V2EzaIrKIEaGMhxzVAlPw+WDfea93PzGpOFdTuPd4wHpvwkxy5B03G65we7Mwlurpm
         FOYcnbZ9mtOnJco0PtBF+nWhQZrnUMerfC0oEtjo+OnJLViN1KrkPwVhcuwlL45Jvw1m
         t8K9NW8C54KoP/9G/W6eL08dot4TmxqkpQstgt92M85l67Pre8jTgPvzvJBH5h3Sqzo2
         v586cNLxnkUOrXP0j0ux7a9pV+Hzv5RJTab+JegARGub9pFamIt97y3XQrf8aM1YA94C
         ox9A==
X-Gm-Message-State: AOJu0Yyperf+Xfe1yfRXdZRgdX5LpxA81dKGE5bk/bYEK4COG5UFVmbn
	C3z95GOZ3ZRfC0mtZX1L3ahUnWvlHoIKeN0FttnP+LmW0oQbil1eNNKY1QJ8/A==
X-Gm-Gg: AeBDieuyIEufp3wkdxPIesfwYrRaWx1pjQt4QNKOJMlprH8ehr7W9AKPZbm27eUgtsQ
	N/lmPM7eAC1vXUJZeG84U/WbAKVJWK/IufPLxEejD1btV+MgJxjHP0qd39gAsW0y6UEF4lc8MjZ
	wYxBqdj/rLjCVEZEmsN7YhJ1EsfSSYe7MHkSdWgLC1iP3ZOaQgbeBeA7fXn/1iAa1gxouZ/XHR8
	jw6t6BdQX+GKgFY1oCF0SHuk/sSkuPlrHO2Y924glW1heoJfd8S86Q7+BY9jcKzLw0I6NG0+IAl
	HzWICLjFMln7GWxEwFMLc7n9y2JH1YAnxf72Oy7ZOBjuPPIP6qYUyoYaY9rS87l1tSXKT7zc8gA
	17Jo31/Xc4CTq/KrFVIZW6lAF1/++MztKlsaXEbLKkrr2fTUu2xws52GXKhv1ljCOogoGxSHUT+
	uedAwDu3Y4kB7Bc9/6sAhMblNAAEcrYM5wu5FNHqFvmfYWdiv2m+OgU1whgJbWoTgXkA==
X-Received: by 2002:a05:6214:20a8:b0:8ac:b7f1:ae09 with SMTP id 6a1803df08f44-8b0282182bbmr252523606d6.42.1776734087747;
        Mon, 20 Apr 2026 18:14:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8be])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac4685csm88868306d6.6.2026.04.20.18.14.46
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 18:14:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: don't include features.h
Date: Mon, 20 Apr 2026 18:14:10 -0700
Message-ID: <20260421011429.294896-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_181449_942659_4D2F123B 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

This is an internal header that's already included with others.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/common.h b/include/common.h
index 303d30d..d443e17 100644
--- a/include/common.h
+++ b/include/common.h
@@ -26,7 +26,6 @@
 #include <string.h>
 #include <fcntl.h>
 #include <errno.h>
-#include <features.h>
 #include <inttypes.h>
 #include <unistd.h>
 #include <sys/sysmacros.h>
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
