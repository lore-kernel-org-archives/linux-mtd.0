Return-Path: <SRS0=xL5s=IL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BDCC433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Mar 2021 10:59:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB2D764F11
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Mar 2021 10:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB2D764F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uKwEi61ByCM/pUuwRHKHhtoW809Lfm5FBNLa1KyQJRo=; b=RlTe3jGUKix1vh4NgJH5BbyApX
	Q7rDyfLYAU6JtU4NlAg29vkmlr/iZHp2Yse2ajUH4s5DGNnBgi/DANKElYvOtVxLbKWl6wFBK15eJ
	VLThbLKZTMpE6VdUAtbgivHlRV7b5oAsVuK3ivTDH5CKwNG7H7jngErTcZE7EG1PmJjJEG5TOR6Aj
	uCMgyO2ZySkRN0dxafuc4a3oug+5m3Bnv9CW6PL4fo0L5ImOxYAUxP7VJmkfVJJZ5Us4HdtFdwSFH
	+zvj5MaOwCJsj3YV6GGSzJC4I0qJ2Dc+amb/ySZ+PDUtG6pZ7XiiN/B/TkLdXPgmIdSGloJrQ4LaZ
	im49QUdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lL1xr-00D7zO-TZ; Sat, 13 Mar 2021 10:57:48 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lL1xF-00D7wr-O8
 for linux-mtd@lists.infradead.org; Sat, 13 Mar 2021 10:57:14 +0000
Received: by mail-pj1-x1043.google.com with SMTP id s21so6398002pjq.1
 for <linux-mtd@lists.infradead.org>; Sat, 13 Mar 2021 02:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cf9U3m1rqRNi6855v4YFmZ3jb95Xgz7XQOcp+CqCqzI=;
 b=PUBjwR+0S5+7JzmlOfitCR38CohYfi5iywij2LBgk70A89ukEjJ5soKdlNjPuICW37
 ed1QOHRmG7hkhGDE2KygH2X7CWb4axAEomQhroiKKcFXOPD/e8afcllVfptZW5gZSk8b
 r1bwk9Win8shHKGJqsujWTMp6j+pFOTQ3/JzGMehHAPoC52SgHXLpPrw9TGeUw2+MNSn
 08lojiu5ym0CiHDBt6qeF5p5R/OBlh+m/ZMawmrJ5PT+fKig5f9fjnbPrYXitB1I26io
 E6m8HeRN4ctb2QbfX4F8ljO0txhUDqVfA0/Vw4UOuUTPusSy8nru8JUsz4UPQA98K7/r
 abNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cf9U3m1rqRNi6855v4YFmZ3jb95Xgz7XQOcp+CqCqzI=;
 b=a/A3vX4DSbG0k89SIpfMjvEUw7q3kO1af9uL2z/y04hGsVPihjv2VK+YpK7xzH5AWc
 qe2IRS5CBK5xT39LssrG/1fiB698sK5Q5qIYz2gr4ATakR1gDZgps5IcLyxOHbTj9c73
 i/G6ITQbsPv3KgcQA6iFgt3HmLN+I1MEflVNXhG73uh5V8o7KN1HSJR33WwKOHIe4oWN
 i6JCdinD49LWkxFIezZzFMBhwdvcBA6qQukR1gDsnJLCMGlw8iLILQcflQguLpIkF+zI
 Q8AtdlsE78q4L4OneOEAHGRDzq4L8ENqOo7FH6boAWpO4WnGfJ1DplxGGeM8eR98BYL5
 Vs1Q==
X-Gm-Message-State: AOAM531S68igSgpzN+Qvf2Q5SRn5iCz1fh1jzjvofmV6RyBC8pBlnQRk
 5iOuxFhoncIz8FBXRyz61n8=
X-Google-Smtp-Source: ABdhPJwcvz1+dydUk1MLSZdM0GRFX+5VYzAwczyiV5Bjy/ejIA99Y1McMmtVppFyxy0/6zC76WkpTA==
X-Received: by 2002:a17:90a:c087:: with SMTP id
 o7mr3132095pjs.38.1615633028309; 
 Sat, 13 Mar 2021 02:57:08 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id iq6sm4929497pjb.31.2021.03.13.02.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 02:57:07 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhang Yunkai <zhang.yunkai@zte.com.cn>
Subject: [PATCH] mtd:rawnand: remove duplicate include in rawnand.h
Date: Sat, 13 Mar 2021 02:57:02 -0800
Message-Id: <20210313105702.365878-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210313_105713_120823_723F35C8 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'linux/mtd/nand.h' included in 'rawnand.h' is duplicated.
It is also included in the 17th line.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 include/linux/mtd/rawnand.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..93e8f72beba6 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -18,7 +18,6 @@
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/bbm.h>
 #include <linux/mtd/jedec.h>
-#include <linux/mtd/nand.h>
 #include <linux/mtd/onfi.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
