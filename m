Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6A5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 17:28:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF91161050
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 17:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF91161050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7wisWBjQ+hIZfJDmkVyIDEne5X0vaXAe9InpC5cAYk=; b=asmLD2fxlgV7so
	xywZHaWZpjtcTG+7MiNW5l7XLeDi+0JLdmrSjRcxsJ4D2kJhg1sXDxNEC9SOVRDLEtW1QxlRKR6qa
	IQ8Kyzihd/fTOVB3Qla4fvY2Aun/eS9vhD/C89odT23V4MDeMKuE6lLoXdjpIouHAiGkxghf/utVL
	jS6qUwl/7OQPnA+ayfwH9pjOa7PZwXmfBWHoWzcl5dhOJ/58CA04tVu9t68SohuBhdlBSZzYr3Ezo
	uXOGCe0G//G0gOQUyNm1F835yvF4yiRgWZKqS300KcrJaYHfDAVrsqSh4YTcTRi9TBVKjCmMU2v6W
	HlcHMMIflcwMyWixvOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhxZ8-002UsE-V7; Tue, 02 Nov 2021 17:27:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhxZ6-002Urf-W1
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 17:27:18 +0000
Received: by mail-ed1-x52f.google.com with SMTP id o8so264271edc.3
 for <linux-mtd@lists.infradead.org>; Tue, 02 Nov 2021 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OdaxtB4LssE4g+n1VNEzexPIrO9OAMoPZzNOdCXvKY=;
 b=mdU0U8go0ySDUlWCxLU1AzstBNRGwhKDX900iZOIN6UnsNA0AA/oAbCX71K7X0NfuM
 oPPhYZwjM+8WzEqudWqL6w/uibOHtKJKzGOdod/KLm6/RajNfrxw+arQVDguduOGFIHH
 kxYLILQOrQcCimkzUiBUlv7pYINRGLtyc4vzp+rHohqW0R6styn1Mr3uTfQjRYX1TeH7
 XgTi5fKJCjxHhETF4DF09C8CeW3GEGaRNmF2j6LxPHr44ioS7C9STeDPKJcmvNRBsp5o
 NbUHHTU6hxAxJqk4DC7Vkxg/JcUxxHEurtWThcNXd2J1PQvo+GzkjtteiYqZsB9NW/mc
 xXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OdaxtB4LssE4g+n1VNEzexPIrO9OAMoPZzNOdCXvKY=;
 b=BV9vb9QD6oY4Lg0oOXYRT+ZdGlVjHLPemcg9iyfxn5R/qnfJsY6pvTUyG6b9pJuSM0
 ylycC7oxG5bhzApfeEfIbFAdYT0RCrxvCtJl/+pT7UhhvALcB0vmwDZtC1OaL/Q0/ash
 c5vr0xKBROj3hHNe+TRZIwoMvUotIJIEPeip8eXI4ohMXH6hjEN24xAuWHuVvWUcEOBd
 c88ClwakZbUqm8ikOQAKVJw8z8vsC3W9u3eavkl+a8i4G9re210EXw9T6Dy5J2t8Ln2i
 GVztEslAAuX4c9sx9Ey3u4o7U0p/OAeQ8jOFUOY5b1ug9o/guhwrhx1wQGxvPW/FcJID
 k0Ng==
X-Gm-Message-State: AOAM533GI1EUz1K9eOtB0CJIJeCKJxwkBAcAo/ndwooFfu8S92aqyaSv
 hS5Hy4Jbrr1UrUxaGkqUEQE=
X-Google-Smtp-Source: ABdhPJwAVmlP9bDQGX4Sjh/CtxgelisUtOodlrNzHt6mtFxJZuuUYoIBjfqq982xFydqLrvjAXTAYA==
X-Received: by 2002:a50:cbc2:: with SMTP id l2mr24754089edi.89.1635874034854; 
 Tue, 02 Nov 2021 10:27:14 -0700 (PDT)
Received: from md2k7s8c.fritz.box ([2a02:810d:9040:4c1f:e0b6:d0e7:64d2:f3a0])
 by smtp.gmail.com with ESMTPSA id
 nd36sm8580753ejc.17.2021.11.02.10.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:27:14 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
X-Google-Original-From: Andreas Oetken <andreas.oetken@siemens-energy.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andreas Oetken <ennoerlangen@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andreas Oetken <andreas.oetken@siemens-energy.com>, stable@vger.kernel.org
Subject: [PATCH v2] drivers: mtd: Fixed breaking list in __mtd_del_partition.
Date: Tue,  2 Nov 2021 18:27:10 +0100
Message-Id: <20211102172710.2933885-1-andreas.oetken@siemens-energy.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_102717_043751_64C305FB 
X-CRM114-Status: GOOD (  13.66  )
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

Not the child partition should be removed from the partition list
but the partition itself. Otherwise the partition list gets broken
and any subsequent remove operations leads to a kernel panic.

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 95d47422bbf20..5725818fa199f 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -313,7 +313,7 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 	if (err)
 		return err;
 
-	list_del(&child->part.node);
+	list_del(&mtd->part.node);
 	free_partition(mtd);
 
 	return 0;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
