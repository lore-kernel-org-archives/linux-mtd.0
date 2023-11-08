Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3D7C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnEXPvoZISyRIToFb0EBWypzBJ8wWz3bYVZun5ZFUSw=; b=lEJEZfnBW1n2Ap
	0bSmg9tZ6/wHCuwX8rTd/R45bMhILhLxGCFd2Werxy7kEFYz1ZEQgDWftX8vrcsXg2O0Yw3qLTJhM
	q4+GqZLsZjW1AZyoRKosFi1socjvxWzFdBCGAiZ626QySvSC8+jeLq3ivv9qNrHQ80st1I0mlLBul
	hljroz761ptExpvtw40FRTTPW/n3HtnHAvHlnPAMeVv3TrOne3ZRXCmpebhQ+zj1YgBhMCYkACl3B
	bnGzlIwfSXDFep8SJHFiMwekqD1nskGcMwaSh+ZMJZn9vt1bZU/LDlO/chXTYX+/XKRss2ctOv62N
	iUhEJQjXkPVnMnFXPxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0f5e-003NmT-2K;
	Wed, 08 Nov 2023 09:43:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0f5b-003Nj7-29
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 09:43:12 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5079f9675c6so9024174e87.2
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699436587; x=1700041387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTdWMQca1C4HNDwcm5hUdGGDITp+wUmav3/Udbm5/KI=;
        b=VjLfV+/E9OMGLfdvQQ4WrGAW7KVR0m6vXQHlgnQZiePx11zM1gaZjUIC9UZnOAaJYd
         7FEqlKABjs0fQtVdbzJDXG0YjJhlp6S6n28sjqQrwqu2MQmvn31EgrPpCQc5D6aKobpJ
         lSqgZmwU90msRIL3CNHAK7WTt+0TBw74PSff97BL/YFEJlkFQaoV8ZySsZtqxcKZtgy2
         wGla4PITbRiZAw/5s1Zjxs/FwEBC26GhTE+sqmAkuspiKZzsIxq3792FOe6ZgAZsZOg6
         jnal2+HBSvZJBxIgCKnMk/GiQclCNj8cbV4CWxj+qhTp+Cv9wzz67DO6Fwa3LrVYaKhe
         AvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699436587; x=1700041387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iTdWMQca1C4HNDwcm5hUdGGDITp+wUmav3/Udbm5/KI=;
        b=b/uPHy/+BOKtTq1pHGDqNvW7Xd8/AFNp4ueBc5Mde4FHG4v7r0w+UN0vMbUns3iIyu
         xJ4cvYZslsudIy303CCXbPGlp8fQPB5RVByl7zApIxPmJJmW68BwCGYT2IqToX7l+BuH
         0iDxzSZnPliUS4CXuLiypbDBI86TJHXgtsYq8WdtB3Uath9AbKMvaABc73H674MuKNpR
         DZinACYaq85xf47SC4AID/RW48y5ZZZrBKUHaT01KB0rk0QWSRQuNvWi/1V0kF1k6co7
         EqKaocf+VWCaAcZZthfagG1NYVyowlFte6nRSAraXA8zaapRiRaJeUvC44SActHaOIB5
         fQ5Q==
X-Gm-Message-State: AOJu0YxMYi2mgOkm1oH/vI13rGwQULZO6kRDijSW+6eCRRN9hJGtBXKP
	woCkUVBZYOjAUhinDBBrYJA=
X-Google-Smtp-Source: AGHT+IGN2eNKB4yscUruMipZNeY2T5Lza6kfYIJcO34HkG89KBnnQO6rwioTsWDSLIeoKAO8YxOUNQ==
X-Received: by 2002:a05:6512:6d3:b0:4f3:9136:9cd0 with SMTP id u19-20020a05651206d300b004f391369cd0mr967668lff.44.1699436586681;
        Wed, 08 Nov 2023 01:43:06 -0800 (PST)
Received: from localhost ([195.13.248.78])
        by smtp.gmail.com with ESMTPSA id x14-20020ac259ce000000b005091492ac3fsm621470lfn.175.2023.11.08.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 01:43:05 -0800 (PST)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] mtd: spi-nor: Stop reporting warning message when soft reset is not suported
Date: Wed,  8 Nov 2023 17:43:03 +0800
Message-Id: <20231108094303.46303-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108094303.46303-1-acelan.kao@canonical.com>
References: <20231108094303.46303-1-acelan.kao@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_014311_705763_BEBF04B2 
X-CRM114-Status: GOOD (  11.83  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

When the software reset command isn't supported, we now stop reporting
the warning message to avoid unnecessary warnings and potential confusion.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
v2. only lower the priority for the not supported failure
v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only
v4. move the version information below the '---' line
v5. remove dev_warn if soft reset operation is not supported
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..75bac1418045 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3252,7 +3252,8 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret != -EOPNOTSUPP)
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
