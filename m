Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3408C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 08:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48D861078
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 08:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A48D861078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7wisWBjQ+hIZfJDmkVyIDEne5X0vaXAe9InpC5cAYk=; b=g4K1NiJopRn6wL
	Grkcwueeq5QRf6xbSayozZbn+rTlE4tr/ikNtIkcZRkd5uWw54lkCr1b5YlIkseEt1EhZP8GVkjio
	LhfvoYpWtTomUgo+SQSSBOXbfOTXWP1FL2hE8R7FC8tkad5jVKv74X8iuWGAso43tVUgivwXdIe4B
	TdelsuxFXKaFPSCwiTmFusbIgoXsqe1nJXQ7vn/NesFPLhwhAkPQxL46YCsEYa1/g7kbIexXVJF7t
	5xy5rbNGkmWepKAxC6+BdK1H9PE5eCWPPYvSTpupfzylSYtosmRVBnsMDZwS+arpF32VA8TOJebyf
	niDHJo41IE9A9P2CDEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfI9K-0017GR-TM; Tue, 26 Oct 2021 08:49:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfI9J-0017Fh-2X
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 08:49:38 +0000
Received: by mail-ed1-x52f.google.com with SMTP id l13so10665057edi.8
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OdaxtB4LssE4g+n1VNEzexPIrO9OAMoPZzNOdCXvKY=;
 b=ijkv52IX5AhqwV9xhPLngnhvSsmuYcKxe3dbkxEPTMyWAkrP2TiIUUC55cvE7Y1p8S
 T5uU+YjLNXYZZD87ZniRkAt8yyVbA2T8eNp1JyrFnCEWjMYFT6+byP8bf8vIAQso0/Hn
 /43roQbeS5VRaB8BjoLn1/RQEuRg6a3n++siHyVElhyyxY5KBacIILnjaAmczzWjFZxg
 KThZtN3uJlDCm9u0UbPCWXJRcT0GjmqxlNSzvxKFb4vWpjmQ4joIVHbb3KboVvObQ4M8
 66fOaLnmLCcxDBe0BgzJpvswsRTdsY51Abge5ijWSNV00PRjfm/UJ7z+LHi6eZKtP87y
 l5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OdaxtB4LssE4g+n1VNEzexPIrO9OAMoPZzNOdCXvKY=;
 b=iKfBS9nRJ/QGwP1Idv/tqoESiWnhvKVO9pgpPQFDsuYVwUNPKPNoVowIpxv0jJBJG7
 e2GKqT+TAz8IMmcFQ2mtgBnqmxdHVa0ga91ZqHgJ7FVWYqc42KFfF8dWdOP/6Z2U69eW
 Mikb9iojVKlMFh1eNJRsCd2A6owcNgn7jWeahdJ3DC6x4DNGMQ97t2ezVWOkRE2pWKLm
 /dj0C39UhZi7biXYRI1JDYWJf3a66BfQu/rZUiccfHL0weut45ckSneby9sqFWmJ48Yy
 DDQgaORBgo5rzsXlhhAA6nS50FGe3J/VFrAV0gAizUPBsvS/Mk3nmZIUVwGD2tiSgVaH
 A7Mw==
X-Gm-Message-State: AOAM5330CCEmUqAyYeDvT18qoLcWu1TF2kSOzOgQRy4oxh5VTZK8ZejK
 GZeOrCSDYrUop+P+vRq373wPPpYoqC1w4A==
X-Google-Smtp-Source: ABdhPJxN69444mLpJ1L0DcXy5t+RCxB4J12A5h85HXz4pkiU+MeMNIMoBGa+Hb261/uraASrYZyUoA==
X-Received: by 2002:a17:906:180a:: with SMTP id
 v10mr29264292eje.112.1635238172637; 
 Tue, 26 Oct 2021 01:49:32 -0700 (PDT)
Received: from md2k7s8c.ad001.siemens.net ([165.225.27.144])
 by smtp.gmail.com with ESMTPSA id o14sm1299525edc.60.2021.10.26.01.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 01:49:32 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
X-Google-Original-From: Andreas Oetken <andreas.oetken@siemens-energy.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andreas Oetken <ennoerlangen@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andreas Oetken <andreas.oetken@siemens-energy.com>, stable@vger.kernel.org
Subject: [PATCH v3] drivers: mtd: Fixed breaking list in __mtd_del_partition.
Date: Tue, 26 Oct 2021 10:49:19 +0200
Message-Id: <20211026084919.3476294-1-andreas.oetken@siemens-energy.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_014937_137890_4CE1FBF8 
X-CRM114-Status: GOOD (  13.26  )
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
