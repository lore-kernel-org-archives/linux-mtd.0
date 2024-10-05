Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09509CF8875
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2024 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FF2qI4rXaFwEkaQrX8GbXuDGPux47fR1/xsquZ7uhFc=; b=MYn4KQjzUwn5wg
	iph0M+DjwKqjI4FUopOpBKDfhhEoZMoCAVa2o+RMxXi4Kj/t4Z/vP54uzacDxPRS/IIoxPiel9VT9
	HLwM78HCSkWqf8eFTpv5z6FrenZ3rnUoUWXZQTLsGgrCA7eVBx7DWOojpsGc6tknHU+jeTJF4oTsC
	sDSoT5jHdSim8vIiZPCAAot/04+73cGLyixvdrIOw+wizA85lWg+sVj4GP+icMricU+a16FHuy2AG
	TGfOzUfjU5hIK8XADtQl8pcwvGer9cK8iRftn7f1jFORLwi6Q5QbWJ2J3ccgbvHUGEuvRvz6C2YwM
	aSQgKijtJ5CHlHvGd8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx07k-0000000F1i0-16o5;
	Sat, 05 Oct 2024 08:26:48 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx07h-0000000F1gy-1nJk
	for linux-mtd@lists.infradead.org;
	Sat, 05 Oct 2024 08:26:46 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so28150041fa.3
        for <linux-mtd@lists.infradead.org>; Sat, 05 Oct 2024 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728116802; x=1728721602; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O21fpPaGduNtCtZbd4f6GBxz8N/84MWfeCB1WFj1ObA=;
        b=Dji46RuE5mcGH1nfbZB9Sy7iOq5Zybza05z5DPMa3oPIRDCfUmJm1WyCjou6V/9vwX
         ETOHnHRtMl6g8kKB+HG+5Sl4M5siOgOclTACzbMofVvx67YXBJ6eUBPUiKvSE1S03vtw
         WUPP7NMvcJwpBq0PJlslsR//pGTr03A01HK7S59J7bfVqOSOPZ/8HVc5fQ4xFHH8aWlm
         3iURPdAz5IQZOV0O9S/ozXVJjxE7nc2I/8X6VrH515VbeYvSxcTVVRfZIWBs1SdOrWCO
         VhxA/U5Kl/SIJwOMIZj39CQvoAaz3Fee9W0t5Or1E4fsAbqid2q3LjTrAK7Xz/sBa4D0
         MW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728116802; x=1728721602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O21fpPaGduNtCtZbd4f6GBxz8N/84MWfeCB1WFj1ObA=;
        b=EIlloqTE7GuYcfEn/gFAfLKnYBJGakQaHntb/H8d7HhaX/wocymasHd1mqUxWgS1ld
         fz0UJ+owxuIy7DvtR9fvunnwBs9LbT9K4CqJeYrvpk03j5p2BLfQkqZGhqW4yug+7qcI
         6+ePZiPJDsJWyCIVg8edwM1RrXR96C6dO7gij+Yyrw5sdnGsMgnlotfkLLQA7Yafb9W4
         C+0YB68j9e62+lERK5fYfuCNhGB8rrFGzgPHuVZvlyoiDTn6rTOhfoHta5cyipU7qagQ
         wJFFFtlvuIMqps+RICLlfPmLAZJPfm5lCrBs2P4SHhOlAGSs3yHD+lUYUNETFu8cFzWa
         MaIg==
X-Gm-Message-State: AOJu0Yyr27OaeAkZYdPdY/gT17kyWKkXkxXQDrp7q5e+q2VBJ7Yt8sEj
	bH4Ow4fklV5eRum3l96QMc45jjlihW9eBFJdR5hE11iPoGu3Bt7jV0BSrjQ5
X-Google-Smtp-Source: AGHT+IHvW+WAEMQNdEI8mLtII7nfsPXedcpq9Mrv+72ZhOqHO8uUwUfrKdn6zf1EXLVjN5UzVdLU1Q==
X-Received: by 2002:a05:651c:544:b0:2fa:e658:27a1 with SMTP id 38308e7fff4ca-2faf3c141aamr29513671fa.5.1728116801700;
        Sat, 05 Oct 2024 01:26:41 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b3a88esm1857711fa.125.2024.10.05.01.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 01:26:39 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/2] Add support for "on-die" ECC on Davinci.
Date: Sat, 05 Oct 2024 10:26:10 +0200
Message-Id: <20241005-ondie-v3-0-459d9c32225c@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACL4AGcC/12MywrCMBBFf6XM2kgmfRhd+R/iIibTdsA2JZGgl
 P67aUEoLs/lnjNDpMAU4VLMEChxZD9mKA8F2N6MHQl2mUFJVaGUKPzomISR5GyrdKurBvJ3CtT
 ye+vc7pl7ji8fPls24br+FxIKKUzpjCGsrT67azcYfh6tH2AtJLW31M9S2SpRY904bU+Pam8ty
 /IFZWSS9tAAAAA=
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CqvSXv+kw1lJsFncORG3aC/DUAq+Il/gSaDXXsnfGPA=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnAPgrYTsA2BzoXfd9pp+nFvsQj3hIfmLSbixzL
 UoLQ2LrPnSJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZwD4KwAKCRCIgE5vWV1S
 MgHGD/4ofv/+FKJBL196TJCiSAGhfnr77Xe5Xh8MuZKlF+dfgWD9Qk0L0cC6USpIPpiTUKK07zj
 RlILRt9k6KcPKmhu3ySFS+7C06xoOamLyScM+8Mp/GK7oDHmvlfHBntsk4dD9QIZxmZ6tu70NTR
 Y/IRwUBdbth11PZnyNa7rxzAK7BGKjMT6BnSpuwYK04UicJCeXV+cot0GyRL85r9lf5MN6nHWGm
 F4Grf1rXq1/qGhzFnf5a1K5a/bJnKn2YUhqq5M1NaUF4vyvUDM+gEG9zhE8WRXlVnADurS4Rhlj
 Lpa4AwyJSFDubowUUrTnk8LZrTCbsxCmdZ2HD28FjVg4c0s3oalZgwXFVMefrLkucto/NDRubyn
 kL3qcuNKUnaQSNjZOIs/gjCF28dntBycvH85I5jHkOYD1B2EWYhB8nnPTuOvUDqYTdc7mjFkRn6
 KTgFTvSt2b7rk00eeqNluPYKfel2V3M0VqMlA4CoAlUGh0r8Crcn77af1ZSWadP+oSEvZih8y0d
 JnFQOhamTlFuS+4LD1/v8OHZpKV+0r/M8OZVO51ynhh7V3Qv1MrFEKd68MLGst+hvkD6ANP3jOU
 c2Y4jsX1APQwZMWwFa6Hk63rMVe1P83IQDyuxO0XCwXrPiUv/FLj10JJi7ZfjIqEoqyiZmVCLE6
 /pww3acaGW4dDaQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_012645_504968_F9755E6A 
X-CRM114-Status: UNSURE (   9.29  )
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

Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
Add "on-die" as ECC engine type in order to be compatible with those.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Fix formatting issues in yaml file
- Link to v2: https://lore.kernel.org/r/20241002-ondie-v2-0-318156d8c7b4@gmail.com

Changes in v2:
- Convert dt-bindings file to yaml
- Link to v1: https://lore.kernel.org/r/20241001-ondie-v1-0-a3daae15c89d@gmail.com

---
Marcus Folkesson (2):
      mtd: nand: davinci: add support for on-die ECC engine type
      dt-bindings: mtd: davinci: convert to yaml

 .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -------------------
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 102 +++++++++++++++++++++
 drivers/mtd/nand/raw/davinci_nand.c                |   5 +-
 3 files changed, 106 insertions(+), 95 deletions(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
