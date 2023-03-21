Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FDAC74A5B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h7urDU6ZY8qKDH0g0Q9tOag0Nn1u+NEwjJZHDV6Dvdc=; b=wFDyxwZY67ogLW
	tKT3nTA7GlwH/alVplrcM6qFbV4mteGeFHj3QwtnedTdBQ7SjMQegZB3hHbIrcEI9TVlnybG6dU4N
	6PLUp3PupQGcOCQ65hpt9uyO/BSo4epWJdTGOJY1Lav3117vbx3yDQ61GM0B/Gkpzi0o3feXVXdYp
	p9fK7Okg+CWxnAoD/aNIx93v5YgvlzHrp+yGqCZEE7brEayieP39f798QCk5GB4OIh/ZEnK3FnabF
	gRdPSOmXX4kOvTmwvQJkz/Xqq4JWXRasQAMWyBJur9qAXSMf5rqTIuXOAWxF+fDpeFOD6a6j8nYyI
	7eJfDBZPb+7Q8pHlPThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peaS2-00CEjN-1Z;
	Tue, 21 Mar 2023 11:46:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peaRy-00CEiN-0M
	for linux-mtd@lists.infradead.org;
	Tue, 21 Mar 2023 11:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679399203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ymNZ6VwYV2ATvUKNgNsMq/UfCBI6C3UP9i+FWnYVIDA=;
	b=EKXbX6hx6A8mhMr//o9tQWZzhPsrkk3fnB0vmT1+Ofz4mAr6CIODTDJ5pvBWHMD+RWZJsO
	5vVWPNPr6G/1iXU4XQ4fMJdNvtyJrXjTU9mxokcWPt+cd38GzoXJujrZTXGB0G/KnV1uFu
	uQnfoSC4E3BVBXU+9Hok5R3ogwfEA+U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-Uj9MT00YPNCUB9miA5IKNA-1; Tue, 21 Mar 2023 07:46:42 -0400
X-MC-Unique: Uj9MT00YPNCUB9miA5IKNA-1
Received: by mail-qk1-f198.google.com with SMTP id dw26-20020a05620a601a00b0074300c772c0so6826169qkb.11
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 04:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679399202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymNZ6VwYV2ATvUKNgNsMq/UfCBI6C3UP9i+FWnYVIDA=;
        b=RreTa034wpLcGrL4wi02f0Fp22gfe9UhAKmw5Y87kC01eRqL/HJ8ltjEjwZvrOgBh/
         ukx0fChpRnZVSirsDOAQGFNe83Q49WYbbBKgYOjypY4khTnRddM30fIeh6uJ/JZdxtMp
         5XhIBzFrBbMWppKNoWrgaa7yDGlw4OwR9vmYToHVp3iSAXHCsT3h0mJDhDfStudnFlIA
         3p4VjUc/U4YdPNWp9oso2hAkJ4ZVbV5WFpu9pa51Y/Hhtcy8TlhzDnePFXx+yFCzKHgX
         K/u2RqNtQsjY0cm9mXdiQafX6WoSPplRZZLcfw8b3q1KXiwISZFjVPYlMpMYXztWMias
         nTqQ==
X-Gm-Message-State: AO0yUKVn849PehBpZNJ4KNzMIJwSDk1PuLu89s7FrwveeUOkv7SI8UuC
	VT8llRxY6HAEuj68SfapGj1ftwQeek0IRUvtLFmfTbTkKUmnqkES63ivAF2g0qr3MiLz0BDLJWO
	jBmCMr1N881rnkdadpO22WHrjIkyd1aWZrQ==
X-Received: by 2002:a05:6214:404:b0:56b:377e:88a7 with SMTP id z4-20020a056214040400b0056b377e88a7mr3463926qvx.21.1679399201776;
        Tue, 21 Mar 2023 04:46:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/fiAb6HEprEWi8AUt3xnbJCW2fUvHyYpabsY5bMNHiKBf3tCo9LT9+NAcbKM/NkXH6hE4cgg==
X-Received: by 2002:a05:6214:404:b0:56b:377e:88a7 with SMTP id z4-20020a056214040400b0056b377e88a7mr3463904qvx.21.1679399201529;
        Tue, 21 Mar 2023 04:46:41 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 2-20020a05620a040200b007468733cd1fsm3864969qkp.58.2023.03.21.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 04:46:41 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mtd: rawnand: remove unused is_imx51_nfc and imx53_nfc functions
Date: Tue, 21 Mar 2023 07:46:38 -0400
Message-Id: <20230321114638.1782086-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_044646_230403_F2441514 
X-CRM114-Status: UNSURE (   8.70  )
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

clang with W=1 reports
drivers/mtd/nand/raw/mxc_nand.c:1602:19: error: unused function
  'is_imx51_nfc' [-Werror,-Wunused-function]
static inline int is_imx51_nfc(struct mxc_nand_host *host)
                  ^
drivers/mtd/nand/raw/mxc_nand.c:1607:19: error: unused function
  'is_imx53_nfc' [-Werror,-Wunused-function]
static inline int is_imx53_nfc(struct mxc_nand_host *host)
                  ^
These functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f6c96341b896..f61ffcbe57c8 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1599,16 +1599,6 @@ static inline int is_imx25_nfc(struct mxc_nand_host *host)
 	return host->devtype_data == &imx25_nand_devtype_data;
 }
 
-static inline int is_imx51_nfc(struct mxc_nand_host *host)
-{
-	return host->devtype_data == &imx51_nand_devtype_data;
-}
-
-static inline int is_imx53_nfc(struct mxc_nand_host *host)
-{
-	return host->devtype_data == &imx53_nand_devtype_data;
-}
-
 static const struct of_device_id mxcnd_dt_ids[] = {
 	{ .compatible = "fsl,imx21-nand", .data = &imx21_nand_devtype_data, },
 	{ .compatible = "fsl,imx27-nand", .data = &imx27_nand_devtype_data, },
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
