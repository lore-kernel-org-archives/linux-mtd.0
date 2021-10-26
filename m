Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1883C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 08:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A86A86103C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 08:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A86A86103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eqUD6kfr4ljVAn1r0eMFAm9EaQ/w4e33o3yNMsbNi6o=; b=vkVBlRWCrMmQXP
	fDkViYqwWkiPSm8Au5wRDi+5RqjqUY6MnR6DJ9bIILYogcD63YAD7mJZyrtl6sbCicIGxa2EYUUh2
	44cELrdhA0FG9N6P99Cwh82Oz0ufI5aeGCB8wN8WnM0JjHVxxQPqjp266jtmyp8oTuwydpjVucnXd
	FfBGLlQ4UIXxV9L7lDJF+XumP6O3UJ2+SZcpAdUSVtq4F4eaEs2r6wZMD1+ZyXBsv3nqOBJX2+wOy
	BOgqkfxuE6ah9RO1Rpwv60zFVMfZsezIwmDgWZxp5G6JKRIg8WlnXdUgXgt5dRhZf960gjGWgwa9D
	so+VJdj5nnlK2fi9YakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfI6C-0016p0-BV; Tue, 26 Oct 2021 08:46:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfI69-0016oB-0Q
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 08:46:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id r12so11131758edt.6
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 01:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOcpDB2bEq/LBIP5Nmj3ZGIJaD4nDPvU30poT+IIEsQ=;
 b=A0710KYREyF6Yy6YF5gJ7j4HIzjKGGzCoumAmJ+JDr/kQl8eIlFFhEzPsmoqNI4Bbg
 rhYoh3qsewi4Vxqz8Df43kLPtWsCl0IIWliWWxutH3U9H5BsHkkPHcEUyiKeHTX+Xov+
 RUHSovJHkY7R8gxSC8DKi/odx7YV8oF8oUFAuYBKAzvO+90M7zDBitWwhyQ9YUXlA3PX
 8w1uEj1TXHYDUUWpKb19YEkVPYRPsjvCRBmLccZi+tV2Fy7wSCl7Rf9LhIoZvyMNqdGh
 rtLsDwafb75zHmksQKJD4BGRJP4ZbmqXFBolDo9o23rPTFuCvMgxhcGV8LZwTFYGvXrt
 JzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOcpDB2bEq/LBIP5Nmj3ZGIJaD4nDPvU30poT+IIEsQ=;
 b=auo1QKNu9unTQvFP9JyvoIzdFlg8xZjJL8Kfzzzig4bxtFzZSq3ulPj0qK8DFnt2aM
 ndujl1T4DQy8h/eFrQs71wVEka7EQY2DiqBIyjwdoOCmCC1N55sukVsC8Cq86F8uyzev
 UQB0KseKCvdcncOEt2IC7zmEjJlP4/dtzVrIjowD9k95DVHwpbB3U3K/QShtQyVYAbcL
 v2liVIIyyE42bjSf2OYU5+PBRuTP4KNsPPKmQPshIztbOB7yT/s8TbIh3Luc2F2J4Ttd
 pXgQxptkQMDG3Lbu5zQKkJDI1RfoMBj7hOW/D0lZuayQ2cmLBVJCPtpQGnVro84BX51Q
 I3nw==
X-Gm-Message-State: AOAM531IW4cvTUVVcl26EiuU5yV22chBETlLB2eAWKKJUe3Bftxn+45z
 U40B0I7g03f9/LaacTqx3Vg=
X-Google-Smtp-Source: ABdhPJzDVlKz0SfOSoBJ3/crgkD3XyTHKUP29X1MLkwNOy0zQ++E3JJC28GqgOOxV74MNwWIld6qFg==
X-Received: by 2002:a17:907:a408:: with SMTP id
 sg8mr23906923ejc.106.1635237979038; 
 Tue, 26 Oct 2021 01:46:19 -0700 (PDT)
Received: from md2k7s8c.ad001.siemens.net ([165.225.27.144])
 by smtp.gmail.com with ESMTPSA id r18sm5320226ejs.78.2021.10.26.01.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 01:46:18 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
X-Google-Original-From: Andreas Oetken <andreas.oetken@siemens-energy.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andreas Oetken <andreas.oetken@siemens-energy.com>
Subject: [PATCH] drivers: mtd: Fixed breaking list in __mtd_del_partition.
Date: Tue, 26 Oct 2021 10:46:07 +0200
Message-Id: <20211026084607.3473482-1-andreas.oetken@siemens-energy.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_014621_071971_3F4C5D28 
X-CRM114-Status: GOOD (  13.40  )
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
