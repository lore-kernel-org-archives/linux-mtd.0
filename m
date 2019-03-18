Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D25C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 23:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C39206C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 23:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i1OgR9BW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="EUxQKtzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C39206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=umn.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=i3bf9dVpsQzLlsfzHhr1/jCtsL2c4hXJ5BbU5HG1T0A=; b=i1O
	gR9BWsqoXKtUebq31OgcZjJAr6ty0cI4DjFztWvLPMuQdIMjtSUtoaf7V6jj99RVsvTT3HyxzjXXJ
	fC0bcT4Uf56SKj6LuS/tbmnzDgDEevAzvERirJBkAO0Nf7vZTJE5ZVE4je+aS04UjEkrqScL1a2iY
	sDdhWWelHVddKf4ljYruD6Dmwwj1dObykoHpiuSBn4MAGKYsuNCmSV0z9cIb1tlFY3I9cxLw2Qovi
	zFbFvdRWgYZYyk9WyV4sQOLLLwbEISNZcsI1BGw9FjKt9ytd1V/IRSOH+zHKBR6iahDyTi7MXn4T2
	ahjvLxrtbpN4S9+ox0JKcsFC8y3dQ+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h61cc-0004lu-64; Mon, 18 Mar 2019 23:24:46 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h61cY-0004lY-Cf
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 23:24:45 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id BA7D8B40
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2019 23:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VjBZa3Rcock3 for <linux-mtd@lists.infradead.org>;
 Mon, 18 Mar 2019 18:24:40 -0500 (CDT)
Received: from mail-it1-f200.google.com (mail-it1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 90E05B3F
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2019 18:24:39 -0500 (CDT)
Received: by mail-it1-f200.google.com with SMTP id r136so15948045ith.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2019 16:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=sMF2XBREPoNW4R62O/UDuiSQwKK53VQtrd6/htMc0i4=;
 b=EUxQKtzJtTvMC2CcfOaaYR7VnXDGZMFcrn/FndD6w/JV5UUss1jdQA+e/idqyrawfS
 Jl1NbPGlNE/ILePFpNL0o2qBcsi323QjdNU+Py/H7HAQc0bfL2s86bdJPpX/W/K2VhDH
 LYRhzSPZcg2RMebbkP7f0MWSsuP1VNn2i0BgcIwgzLtvXIR7vxG/IZvLt1zo3yS7ionm
 DZJ/rHBSZmAfXMaM1fir3p59FOFUSsFOVnqdnm4Djqp9ERLcnUincNkIrGm+XDgzIIYG
 Ctl16dFPCJxgXDPB2iLTg04y/C5etiOzWrVp955jkdm4xuOx15Qmn/nA0egEl8Tb9K6b
 OOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sMF2XBREPoNW4R62O/UDuiSQwKK53VQtrd6/htMc0i4=;
 b=EELgfblbZf2H7a9uDsPDDf0TkXYWiKB0i/cOX9LYe4vCNOrgC/v6hUXRrgdIUcbw1h
 eiokx5lFt0USgInKgacyql/AS/4rxJF33T9qc7XePa+fsAiigZoKlsveaHDE9qgd/vGT
 PmKhw/eY438JaUuKnGsBePW3VPdNuU1fZFMxnneRabSea2M0ngTqAfKVYMLI0aopHlKE
 g0cecumP5STzD/ohhXq2YpeCnwu2/bJrUXTMLJ7f9oL/rjX8CbsGvLi3Vv/L5E2wTZZT
 NVrxWbu0UJqYjE0fUyexEM8sZ/l8it9ye/zNU39SuFpGNsq/2T23dqwHT29WpkSxL93j
 WsDw==
X-Gm-Message-State: APjAAAWwg2S61zpQHaHE8+ezqhUR205cWcDlxTixW9tOLEVKYMaqLaVh
 kZWWbPIreiDCvfUV+ISYRzcaVqvsgXE6WOJO8gEeihghvUKsQAPexfD465p3tMop341nlDAmlZx
 hR34MFmQsF0GsbXuzyNdid4oIJ1SveQ==
X-Received: by 2002:a24:1c4d:: with SMTP id c74mr883799itc.36.1552951479303;
 Mon, 18 Mar 2019 16:24:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHnWCKYIJAf8vueMaIosqP2i4VqtXIxqhy5W7HIftxVOZW4+tB88vhVlHdi2q1mU9f4Ws/wg==
X-Received: by 2002:a24:1c4d:: with SMTP id c74mr883787itc.36.1552951479104;
 Mon, 18 Mar 2019 16:24:39 -0700 (PDT)
Received: from lenovo-1.hsd1.mn.comcast.net
 (c-73-242-25-233.hsd1.mn.comcast.net. [73.242.25.233])
 by smtp.googlemail.com with ESMTPSA id a16sm432099itc.27.2019.03.18.16.24.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 16:24:38 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] mtd: rawnand: vf610: Fix to check for NULL pointer dereference
Date: Mon, 18 Mar 2019 18:24:34 -0500
Message-Id: <20190318232434.9246-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_162442_511351_B276D440 
X-CRM114-Status: GOOD (  13.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

of_match_device can return NULL if there is no matching device is found.
The patch avoids a potential NULL pointer dereference by checking for the
return value and passing the error upstream.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index a662ca1970e5..946abbb275c3 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -850,6 +850,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
+	if (!of_id)
+		return -ENODEV;
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
