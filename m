Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ACEC433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Oct 2022 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0y5Q/dUF/QqOXzEMGuP8Rya87FiiDDl/M6zK4CUjkI=; b=c9Qb6QqhB3eG9d
	zIGrMbWAZXKSy4R5+buhRBmplWiu9WoIq5PfABa53QhmWBK3ouYrolvCT27sf7GgeRe5c+MnUAUsy
	05FjX+d///B7DUuwPVNiI10MhCTdGx72/DjKUgc8XBM0Owu29gm8gpAdfSW4HKHWx/K/M9ROyhs8y
	yUtH+CV+Eoks1StDuqQsD/x2TyCRVzPDqPWuhtbv3m8SDcMSe6z4w/+BxR7JehRMr9Q2B5jFnEVLE
	6gUlBEf2t37+xCd3tm5qnxQlvkdEIuqUwmcCSFWAWK0kUtPVXLxdwz+6vAfNPbv8wwMj0TBK0It2W
	Ijqa+r/N1vz4BS0848ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh4lr-00CPKe-Ra; Sat, 08 Oct 2022 08:01:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh4lp-00CPKG-DP
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2022 08:01:18 +0000
Received: by mail-pj1-x1036.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso1321052pja.5
        for <linux-mtd@lists.infradead.org>; Sat, 08 Oct 2022 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lM67uZd3PuvNYw+i0pkmt+skR8bo67DWOjK10ubuDi0=;
        b=i/vZG9IwQfgubVK61C5ZBjaNerM9s+TdYrT9705+jLOwF0qEYMKPU7uvxDPzB+Bw4U
         JPomSl18WijtChLeItlyPrKqsMsF0ipnmN8Gzpb+mDJNwcZRiz2EbpZq/hLqg4jm9CQr
         9PX3Ml+ulrdV1h+eXictYoMwiatrM7Xcrm7u175v+kHsOQLoUJWxE+OhHCuEaUPp/q0W
         aXDzNs9zYp5+yNd4u8YZyA/1fLqj695vdlnHAfN3L+stxC/OIzYEOyXCpQUfiY12eQcv
         Gg054a18unUcnxhOlb4sue0u8soK+/W6/htfGuXgXWFRW+ywbhchpKI4aGClqtU8pm2A
         E95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM67uZd3PuvNYw+i0pkmt+skR8bo67DWOjK10ubuDi0=;
        b=fZ7ccdgMPf+UQtx7kOy8wVUoalPTp8fupLDgB5ZbMwZCCfL+416Rb5NNIDvJTeCivw
         ibp3OMf6VfzcXAHbHrT5ftKSknxEZe/uOK0z+siEH+a1K4aF1+FuO0FmkpKT3/GJ4V7y
         9sJpXD064iZhGturFLSky4tcbn+xzpSp2QnNIjtkVQS84kEa4ACBQNud1dC8dcBuvg4n
         Bp7VHmYKiQC3vuV5ygR6nKCnDdakcHIHhgG0eo72Sv2GcRNiPE/7RZa4qdhveZ91Q4XR
         CO55K0fjXqPPjUG7jS5AxYRCzrGm71/wRx6lKdl5uwpYMFjQbojPXcrIU+S7YiTbkF8b
         TbGA==
X-Gm-Message-State: ACrzQf2TS4BaF8Q269bwxO8drrF455HAax0gSSONemfLM7dYmhHHXaUM
	uFEH4Sg1+hKmUkEUWrkZRbY=
X-Google-Smtp-Source: AMsMyM4NK2EYMf7YWkPBn6FtXf8t3kLvuIcMBHchjYO5FoZVhQgmKN9aJqM/dOBESI/E+YW/dS7t+g==
X-Received: by 2002:a17:90b:350b:b0:205:dfc1:63a7 with SMTP id ls11-20020a17090b350b00b00205dfc163a7mr9454255pjb.41.1665216076243;
        Sat, 08 Oct 2022 01:01:16 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id p13-20020a170902780d00b0017d0e793932sm1337409pll.215.2022.10.08.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 01:01:15 -0700 (PDT)
From: yexingchen116@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	wsa+renesas@sang-engineering.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: [PATCH linux-next] PNP: replace !strcmp with sysfs_streq
Date: Sat,  8 Oct 2022 08:01:10 +0000
Message-Id: <20221008080110.309089-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_010117_494790_A839304F 
X-CRM114-Status: GOOD (  11.27  )
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_streq().

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/pnp/pnpacpi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pnp/pnpacpi/core.c b/drivers/pnp/pnpacpi/core.c
index 38928ff7472b..d5748a21a7e1 100644
--- a/drivers/pnp/pnpacpi/core.c
+++ b/drivers/pnp/pnpacpi/core.c
@@ -317,7 +317,7 @@ static int __init pnpacpi_setup(char *str)
 {
 	if (str == NULL)
 		return 1;
-	if (!strncmp(str, "off", 3))
+	if (sysfs_streq(str, "off"))
 		pnpacpi_disabled = 1;
 	return 1;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
