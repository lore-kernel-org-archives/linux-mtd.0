Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F2DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 21:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F2361073
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 21:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6F2361073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eqUD6kfr4ljVAn1r0eMFAm9EaQ/w4e33o3yNMsbNi6o=; b=06ZQc0cOvUcpAK
	CKEL3RVfBM3/TBMLJzLZzaKhvuEjM05kgkMns+3mRWn2AOM6Y7W5xIboKRW8eUUEOxZkQMFsF5L7l
	pWFXLumLV6AlSH9lOKu6Xejk+xYnIQv3BU2doZwonKJ4yZym0SodUufmFK4rYylGIIrT6QTOnZzFT
	jD0WD7aboBXus3cWMz4Ml/LxeT5ZnxNiBivS56ahRDZbLwvA5qRi/JEAxk1XmvYTYkhYm454TlkiN
	M0kKJYxHM9wecT5pQG9kyYbUm8G3YgbH53xLW10JnaXg9Y73BgLnZ7wgGPNEw4zvlHsSjeSbj+Qi6
	XOfJ3lTUM2N8YLW/uswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf74Y-00026G-1U; Mon, 25 Oct 2021 20:59:58 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf72S-0001KW-Jz
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 20:57:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id y12so5127649eda.4
 for <linux-mtd@lists.infradead.org>; Mon, 25 Oct 2021 13:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOcpDB2bEq/LBIP5Nmj3ZGIJaD4nDPvU30poT+IIEsQ=;
 b=IY4fvIjHYJvLGZLrj+xFjbDdvMXERkWz43V8RwClQ/ywmTzOkDyGiNc9dvelYXfZr2
 pn20TkXmNbqgBmRD1AAhSHfMShkfifuIPoqx4IxVA4sPPMGFjnoTMcbJedkXPWBeQBI7
 qe8IJchAAhFp8uSzmj99e76yzjSjkTEpoCPUMUZVw/qyyviOpxgHaQdXeIPwEiBeEl/6
 fk/qazNBvWrxn1o4vNL3JZ0E95ii7yfc1qCNCJfWTR8et/FS3GtK/C4/W/ABbAuWVxSI
 Oqckb3S8gHWvJVtjRQ6QT1Ori7N7//ZYft8cvl/P3UdVD/mC4GPzqxZ1qWNcVt+Kzi7c
 yOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOcpDB2bEq/LBIP5Nmj3ZGIJaD4nDPvU30poT+IIEsQ=;
 b=LU/uzpPKWTFhJmWXG9FmkFM0m5S5k1tiwhhJU1kIbk4Ci8fgWBjloh9GHY/m5yr8h6
 zEIsceNFxVnKc+OSRgPN6wkaoCsZs/8uPEJHHN4Q3MDiTVyY5b5R3v8bWxEi5dMpAZHs
 AiuHF8N1vkfBB8vjmdyNb4siCj5fqf4Gu2mX9tertP0JE+f8jUuK3mZZerbsp3awq+6Q
 7G1uDFpktAshk5rpSjNapuMxuZsivUGblCcQH/9+4DZKFVMacYFbzr1LduUAKWgL8Xbj
 oM4ofZn78gUHiPXCyR3fDFT1mAIWbahKFt47IX73jQ6Zo10aNzQYGe+v8ys08XMWr/Mv
 N0rw==
X-Gm-Message-State: AOAM533NArTC1/WfEPg0xXVz7aCxwp883/f2REn5yij56WiNsafuiQnY
 rP+dyTiLZ56VJFNlEVF56nE=
X-Google-Smtp-Source: ABdhPJwPrA3toXmEGj2uIHj0F58/RSx/i9+wqLsWkZ1zSw+2RiVjV0WDE/M7DcHcwxO+jT7bPR2vng==
X-Received: by 2002:a17:906:1707:: with SMTP id
 c7mr24567045eje.377.1635195466117; 
 Mon, 25 Oct 2021 13:57:46 -0700 (PDT)
Received: from md2k7s8c.fritz.box ([2a02:810d:9040:4c1f:e0b6:d0e7:64d2:f3a0])
 by smtp.gmail.com with ESMTPSA id
 mp9sm6730317ejc.48.2021.10.25.13.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 13:57:45 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
X-Google-Original-From: Andreas Oetken <andreas.oetken@siemens-energy.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andreas Oetken <andreas.oetken@siemens-energy.com>
Subject: [PATCH] drivers: mtd: Fixed breaking list in __mtd_del_partition.
Date: Mon, 25 Oct 2021 22:57:24 +0200
Message-Id: <20211025205724.3306739-1-andreas.oetken@siemens-energy.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135748_705326_1D657D08 
X-CRM114-Status: GOOD (  12.85  )
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

Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
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
