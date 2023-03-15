Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DE8C6FD1D
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Mar 2023 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iuKJNwh7L3R2dnwBHsypyOWxvwTCWOVvk5CYp2J9938=; b=KQELsrm0qBvADM
	lrNDv4SxKq5MFalerJBb9zrzQfb3uW32WV3q+zQoL/WBQlpn+7QHpCIU2TXnPK8FSo5Ya55bckUca
	12ZSYPU428kB1m9MnstX84J4grL8WvJOy2cmXd3L1nU5ePx+cgB5j6j+Ib6/CviaFvnIS9qGJ13m1
	6vT6iMWqF2oeudp8A17dkxDxZJjtiUu7iPb3O3DvtPfYXaAHcHwrqX+rJTzTr5aUWfJrdUaRGafyY
	QLhEDFVzf4zfTljUr0ABAe8pbMo0ON5ZvGnolsvrjKvM4BTH/jNxFf91g25Z8Oj0ViJKUun7kLdEK
	SNEEdr15KL+1AHXW8uXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKjB-00CXjl-1X;
	Wed, 15 Mar 2023 06:35:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKj7-00CXiT-30
	for linux-mtd@lists.infradead.org;
	Wed, 15 Mar 2023 06:35:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id k2so11122094pll.8
        for <linux-mtd@lists.infradead.org>; Tue, 14 Mar 2023 23:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678862109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmOODTc6/7lFVkljsQorTosaMctgEfM6gFeqnDoQOFE=;
        b=F2Kb2W/FWyRaWmAN3I429qqQaqHdIuzJnjYNUrRsuDAKhzcOulBpljbmqcosOJ0J10
         XHi8mVsSVX99Ra7fLYFS+xHueuuFQwwSu8f9iBEs3owsK77BGNNmJO/2DSiox9gamyv6
         MkAzzqAGw/nCxZuysSnEy6Dj6EHjYfDz9BPxyrPS89Rzmp2jZCHc30QYPVmdjpLTKX1d
         Mp7kvz03I7Oo+Xs9276F+eXjUMzbCSWqaEnOLsTEtTYqHUmH9PjtMxUDOD+chm0uekds
         Fu1JctpCnoRl7OQDaXb6R/hLKbiUqrBPj05R5QlCzTUtX6VueMjqaBr0Hvb8VlDCbfeg
         8JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmOODTc6/7lFVkljsQorTosaMctgEfM6gFeqnDoQOFE=;
        b=pFVZFnbgMj1ht/j7imH7Cps6m6FjXiYPiOPOLHQbJoc1vggM9WE/4HWp9ZMDJ/+J2O
         byyanaxbmEYJDLHJzPmtrIz8n/+Qoot5fuvccpTP7NNyB/dA5sDn9ELc8f55QFMYI3nO
         GkoMJVu5eyLkjAwLPadEQk9pEAUj6GsAqgPgwjo3OYg9urLDcKCpGcLx5jFpY64Qk44u
         2LyNyXsVdPPJfUNNOqIdzMd0lQDiH94c7W4UUIrFi+mx4+qpYbivNL6BEAhjSUuPCGxC
         9jUO6wTT4edol+01DOfY02PWAQnpUxyLjJMu2kRNVTKG9ipgadK0U3jLSf+c9zfOvSS7
         dsHw==
X-Gm-Message-State: AO0yUKWVdfy2moeJ8EgWLHBTphfPqdeJr8tEPAYwJT6Yvr8MqhK7LJsz
	DUVg3BKGpuIVERJrluFqjlffiSKbdqH4Cw==
X-Google-Smtp-Source: AK7set+Y6tkpzUq9Hvy00D0o+hGnpqWrOK0mo/sKHTRkh7l9PbYyOCOfeijA+MXI6y3uJuFdmeZp5Q==
X-Received: by 2002:a17:902:ecd0:b0:19f:3e9b:7527 with SMTP id a16-20020a170902ecd000b0019f3e9b7527mr1770389plh.61.1678862109517;
        Tue, 14 Mar 2023 23:35:09 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b00199536fbc6fsm61114plb.280.2023.03.14.23.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:35:09 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 1/2] mtd: spi-nor: core: Allow manufacturer fixups to set nor->mtd.flags
Date: Wed, 15 Mar 2023 15:34:56 +0900
Message-Id: <ad48c4d0a94a413f06900ee435df2fa50c530dd6.1678858206.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
References: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_233509_990885_DF45E4AA 
X-CRM114-Status: GOOD (  12.24  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon SEMPER Flash family has on-die ECC and multiple programming on
the same 16-byte ECC data unit is not allowed to preserve ECC.

In JFFS2, ECC'd NOR Flash is supported when CONFIG_JFFS2_FS_WRITEBUFFER
is set and MTD_BIT_WRITEABLE is not set in mtd.flag.

In spi-nor/core, the mtd.flags is set to MTD_CAP_NORFLASH that defined as
(MTD_WRITEABLE | MTD_BIT_WRITEABLE).

The mtd.flags should be set to MTD_CAP_NORFLASH in spi-nor/core when it
is not yet set, to allow manufacturer fixups set it.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0a78045ca1d9..5be9392b65c1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2976,7 +2976,8 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
 	mtd->type = MTD_NORFLASH;
-	mtd->flags = MTD_CAP_NORFLASH;
+	if (!mtd->flags)
+		mtd->flags = MTD_CAP_NORFLASH;
 	if (nor->info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 	else
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
