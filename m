Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04B0C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 03:45:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774016515E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 03:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774016515E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i6VZcInjpI1+qsi/fC+1uEUOmqP9Eud/5jTu5ZYnyjs=; b=Wyv2FwJ3/okIBByn9ThQs34jkT
	pzCC9Hxsf/FaQHNcqFr4gt+OxLf54ZzsM9mDJIITQU28jeMdVwF7eLi+FFxiZirZn/deI0YEnJO4Y
	CwcT9lumA0d1zTGtGCm++5aetkqf5mbI/LsHTYipH9c3uM/qkzT5vnYG6Gm8DPOCw4XUywyEy1mqj
	JupFAUSnNmaOscJD4MlmnbBb4L7P6oMwyHFDhTCIiD2uQL9SrLavqVD7fdbjrlicr4N9gdqr9+XX2
	tcSzlU/z120V4pb4lCbrOKFlmIJCwd+BfArv5Krem4BV9RNXsx/O3++AdIXU6DWfOjdrZKBDY5RjO
	B6FA3nNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6pP-00EvtH-Tj; Mon, 08 Mar 2021 03:45:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6pC-00EvqY-ON
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 03:44:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id g4so5566981pgj.0
 for <linux-mtd@lists.infradead.org>; Sun, 07 Mar 2021 19:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YX0/RvzShai54+m5e8gpa/XV7NCeU+beFMIjwOYIdPk=;
 b=AmnygrS9u5m2MqHnyc1e1uqPPp2ggexPHVnMPApIVY/c72+aex6WWtTenZV/DIlK/u
 J/FHl8Vpgq2RRvA4w/WjfkZg8tVhmCAhna09IP7GzngaSlkpV3htsth2QrkRV+Daug4z
 VjE+yVLA7+EeXy51jqjwgFfth/3e9TGM3CcR2+Z72Ap7cibEWkIWVtV0SFBbL4A3ZQ66
 /0OOiGMBVPa9CpVkwCQHKPBWX61EvQcYaQId1+WdMD0EQQJghLEFOpN2E9DHkqdBx0PF
 Z6/TJMBzwlBWC3iyJe3C8NT/GtqCURo7J8ax/8qmgCvtI43/BnQ+xdkpi9LlO6cAvBX+
 I3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YX0/RvzShai54+m5e8gpa/XV7NCeU+beFMIjwOYIdPk=;
 b=V8dM5XfKQh5U+0pLlx86gHotxCWtymTpEZXgYcnLfd/xZAphfZk8NhW5/DmgaSUIFg
 eegy91uD7Szfx2eYgNjD0jBNduzuC2WOnCXGFcVX+x2MiG+J8d4afys5LhuE9fOVQwHu
 2FijAz5pNjCxCLEEINy0Zoqj1ZOob49cdqNWjYxSDbqX/5InWxKAuiKrymZR4lbZFkqH
 2m3ZSLQ9vp4XuFOBXbMtG212Wj/DZeAPbS+9+cQxZ2LmZPx2COxcxZ4MobfcuzEbnUjz
 6+lxbDOpnHs7ibj0j6H5FoklkKC3OxYY+UGO+2zD4nZpzRJ7vwi3whENJbk2anQO8KGh
 MvJw==
X-Gm-Message-State: AOAM531LbYh+cgUq3bS+naPzBGSVlPqqSEZxEi4S5Dh09t1TK0S5q7wH
 aLV84vajSleSF3OrIXU4qTI=
X-Google-Smtp-Source: ABdhPJwVD4Bjl8EINQJF4uJSsLs+sl1XRJxE604ZyR8rAVnWTYhd079SSnJgXdIHw/fuDKs354RDkQ==
X-Received: by 2002:aa7:96ab:0:b029:1f6:2d3:3c91 with SMTP id
 g11-20020aa796ab0000b02901f602d33c91mr3669962pfk.10.1615175093269; 
 Sun, 07 Mar 2021 19:44:53 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.99])
 by smtp.gmail.com with ESMTPSA id i22sm9077748pjz.56.2021.03.07.19.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 19:44:52 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 chris.packham@alliedtelesis.co.nz, Sergey.Semin@baikalelectronics.ru
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] mtd: maps: fix error return code of physmap_flash_remove()
Date: Sun,  7 Mar 2021 19:44:46 -0800
Message-Id: <20210308034446.3052-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_034456_330252_6CFAA262 
X-CRM114-Status: GOOD (  12.14  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When platform_get_drvdata() returns NULL to info, no error return code
of physmap_flash_remove() is assigned.
To fix this bug, err is assigned with -EINVAL in this case

Fixes: 73566edf9b91 ("[MTD] Convert physmap to platform driver")
Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/mtd/maps/physmap-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 001ed5deb622..4f63b8430c71 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -69,8 +69,10 @@ static int physmap_flash_remove(struct platform_device *dev)
 	int i, err = 0;
 
 	info = platform_get_drvdata(dev);
-	if (!info)
+	if (!info) {
+		err = -EINVAL;
 		goto out;
+	}
 
 	if (info->cmtd) {
 		err = mtd_device_unregister(info->cmtd);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
