Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BC4E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8nMe7L3O9bePQ2Cr9wgyCFgnXdfEPE8Es5MzRb8hMK4=; b=By6wOfl/d3vMvn
	ZBFwaf9tMsuxS9BoIC43dQQKFlMCOAtNQMf/rtlWlS71KWYypmHHmIwWys2kI1BETnoN1Syzrsfm2
	HqfNRFCcJ3sKRxivSRT/B2SpTQsW5QabpbkBq6oeL5pAwrZkFpQ2L2xLJrkRnRoHluci4q+oSEkwS
	bS9L7BD2lmrngokEygHbl+UU7sKowf4BrqorrZSJPKPPu36v3/c3xd3JHmu7x1LtM4RESQ77GHSJM
	uMdeQtgB6Z2QaCNNTpTy2MBHxueCQrquaRml1FedMmGVUt9MrDEfQryLCVnEMdf8Q0jrB9e70mswx
	QVEs8Fd6nUK7EWu85wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOChg-00000001O5k-0MbZ;
	Thu, 19 Dec 2024 09:20:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOChX-00000001O1N-1TSG
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 09:20:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43618283dedso5234825e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 01:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734600009; x=1735204809; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFyJH0Yc8JVZMax97u3uq/YfTUBmXm0NRUlfRtRQNq8=;
        b=U1kOddwHprGZFWfacaO3YnI4WY50k3gNnxUF74D1lWc/auap83Wnt4cwD+pLyEORvy
         lssS7EXbFODJvBNMYgUN5zy7ErsbQjKbs/UwbeQYQEAMGYm0iuWuus6DOCQjmUKx/+WB
         tujHxcYBtDu0AIT9bd8yYaguAtnGIGhIOfsW84hk2ysaJ+ax6phe64OGewhCRouDx0bn
         j7uMZG2JOQUd8ElETXzcazr1ojMBQUWqjxDhXqwPo1Qk2zFZcShU35sYntM+N7Zt1maD
         7muZVlD2n404NVZAewSempWcCxm/FKEmIm4VbwFriBkWiHwoFWDfQqZpTNAw9RRoXsXY
         /xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734600009; x=1735204809;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFyJH0Yc8JVZMax97u3uq/YfTUBmXm0NRUlfRtRQNq8=;
        b=QBA7xyzCDNfaeZz62iOkpFaUCc0zFHytp5yv4OOHJjDz/ShGu3csSJzviXTFH06Uvf
         ar5e6381PAY4RSjl2IX7b17QLBB/nhE1Hpf35gSjkrXl2KoZoJBjL9l2LfHsoLzbLyrS
         xl9goOAj0Wg5mHKBZY6Ik1fcX8XokaotY5bxEoWL1Owh5B/b6KP4ae7LPRsNr6CP0wKZ
         FBl9ict3BBWCcqs8A8xNFqmU6bFP3hVEbJ/adRacw/wYOOWPmopZGoanRrNP2XAd6s5W
         qK+TtoC14Zzd/pO0dXASQal3qkkp291m/F3dQwsZWcWDAsjJ//uXcup77ZdHY9KWnlpj
         Ul2Q==
X-Gm-Message-State: AOJu0YzXVZCOKndTHve9LjIO626Vci41/P68B8J4EWIyw0UqJn7luv5J
	UrUL99BJjL4lZRftXEW+aS61pC5YH6TEwByeIHLQLO8PCpRrbl2v9/0jC7cSSig=
X-Gm-Gg: ASbGncuwtFB/PkR1+xEQSnn1Jsx4ZgEmaq6qciBLAjWdC0Z/PTQCKwnzkFHpDZcBCSJ
	fUoFrmbRfbbvp06d7sWMoNUFhsG5ak2Pphsv4+ItNWq9UqUNv03Yd8/WLB0sTAmaBmQ4UVowUn5
	RMpZR/EOTvyTHwBy+Esh/ghQer18rtmTVyTqk7NzX7w2mdDNWCR3/IhRDU5jy5onSjlqjwSYmok
	mInlgr9ZJBagRCBysymiTwmPOdIcdbgVJwokU4F2Nf4sABUj2dAnI6K2zCqR9Bi+B430BgRiJcG
	KlYxRg4xGJnTe/+tMSRyqejYG6TeycPT+u9o
X-Google-Smtp-Source: AGHT+IGJ4zLrYvzarwvJgukTsCLtYzM7PyANl1YefcunJqYe37avUW0KzjlaPF8ZSTQw2Sst8cB8UA==
X-Received: by 2002:a05:600c:1910:b0:435:1a2:2633 with SMTP id 5b1f17b1804b1-43655368155mr64500415e9.15.1734600009132;
        Thu, 19 Dec 2024 01:20:09 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm12222295e9.32.2024.12.19.01.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 01:20:08 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 19 Dec 2024 09:20:04 +0000
Subject: [PATCH] mtd: spi-nor: extend description of size member of struct
 flash_info
MIME-Version: 1.0
Message-Id: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEPlY2cC/x3MQQqAIBAAwK/InltIK6K+Eh1E11oIFRciiv6ed
 JzLPCBUmARm9UChk4VTrNCNArfbuBGyrwbTml4bPaFkxpgKhsPKjhxDQuGb0JM4NN51ehhpmDo
 LtciFAl9/v6zv+wFji1LEbgAAAA==
To: Renjun Wang <renjunw0@foxmail.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734600008; l=1787;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hnY/8vn+b1KlPlvdNquO8fmNX5DWSQremtaRCjmMhDs=;
 b=uYARATeYVOEhCLNa4zL2C84/SxxQv84Wvdx/9r9cwS8NNtqoKrK+V37qrvYDF7Xp9IEs8dsxR
 z4HEUGAxeNVBkxoq8E/4i0rykJ+f7z2JnYTHiCElfpRam0zhTHMNEaP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_012011_438222_BEDB9B6C 
X-CRM114-Status: GOOD (  13.00  )
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

We use the size as an indicator whether to parse SFDP or not. We don't
introduce a dedicated member for SFDP parsing because we'd like to keep
the struct size at a minimum, as it's used for every flash declaration.
Ideally we won't have flash entries at all, but there are still flash
parameters that aren't defined by SFDP, thus we need to statically
specify them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Describe member to avoid confusion.
---
 drivers/mtd/spi-nor/core.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5c33740ed7f5..ceff412f7d65 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -448,7 +448,11 @@ struct spi_nor_id {
  * @id:   pointer to struct spi_nor_id or NULL, which means "no ID" (mostly
  *        older chips).
  * @name: (obsolete) the name of the flash. Do not set it for new additions.
- * @size:           the size of the flash in bytes.
+ * @size:           the size of the flash in bytes. The flash size is one
+ *                  property parsed by the SFDP. We use it as an indicator
+ *                  whether we need SFDP parsing for a particular flash.
+ *                  I.e. non-legacy flash entries in flash_info will have
+ *                  a size of zero iff SFDP should be used.
  * @sector_size:    (optional) the size listed here is what works with
  *                  SPINOR_OP_SE, which isn't necessarily called a "sector" by
  *                  the vendor. Defaults to 64k.

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241219-spi-nor-flash-info-size-desc-2dc3157e593a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
