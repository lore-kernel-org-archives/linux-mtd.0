Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CE0CFB424
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Oct 2024 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKTKSFy7D7Dp4ALW/rz56+rVUtKSHAHyrNg59yl2pi8=; b=16axAyq6SGsd6E
	Oz/iqvGgtEhregAm/KW6R5ONpGvj0Rw+emG4Y8acLD/BglKPkj+Bay43s7aVs+5ch3ikduUjbMact
	zC1SljM8KQ601c+Q6wXdL3wzIY8sxTlHhglNBg/VCF9bewMi0hIbUzTKkQEJpI1XRx4+Schu0w/qc
	NzWjyE3OhJpw/0xwX32U9nxqZdCOiAlI47yVTz0vk/wg/vN1CrBJcQ0E7sw/c7XVEFMxU6xTHkwJk
	n0kkA2x8T7+Tahqx5Sw0MWVz1rM29UJWw6EmtIfnp8qUQ+LgScfRwvib5BnsBJX03ch9AZnOJHmIr
	D9p40ZYwOOnPD0NtX8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQxg-000000003qj-1ix5;
	Sun, 06 Oct 2024 13:06:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxQxc-000000003pt-3udO
	for linux-mtd@lists.infradead.org;
	Sun, 06 Oct 2024 13:06:10 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5399651d21aso3175113e87.3
        for <linux-mtd@lists.infradead.org>; Sun, 06 Oct 2024 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728219966; x=1728824766; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCcZz9kdtfMEP9gzd1Dde8CK441Z4S44KrNH914zWQA=;
        b=jWoStaUSDGXgw2wdbrcDWNrJAfFaEx8Aoy8Tut8n9Pun3HDUrT/KMpS6Kvs/5MjbxC
         NuHwxFtsPSPN8vmc3bDR3BCincH/v3wlfNQfIjJFNPFPUHluBZ0gIup6QHepds0TZ1F6
         lhnU0P+GUvKWDkeX0buUMV2TyDSeg3c7VrzC/mv27PYNhkutTaU12DoGOs0t4YSQdFHe
         fHygtKBS/VR6hBWVzi2XA398BUGfYzrrHiVHm7h3YRGiCSpXt0ykgG36qj7PoMFPMUQ5
         u90lgYJ4KbeAfKqjTeUx7Fg+km9mbiYn7LoQhVAwEriKTQWSRt2xZTKaEYFRID3Lj5LZ
         Fz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728219966; x=1728824766;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCcZz9kdtfMEP9gzd1Dde8CK441Z4S44KrNH914zWQA=;
        b=Fw2+kaVOlPvEJMpPRgg2xjAMDLH6FENH+P5xSj4N2PsU9fYe6Eb6vjpAAB3kCjnncW
         eeX6XnvXPtHpcmRS/oOp9YIbQtNzuDh0RhJ1bp7ZkdDtaxsDqv5vTzF6DdKhBLC08Q7D
         z2whGgt7JRLUjdLESAB9+RZ3h1c2OeOgfN61xCPBrL/0rzUj7/8TJkYx7/7pKGE6nYQM
         WPOVaqH9nNn0V1fKazSAQmQtN7asorAXmE7S7ZxUVCKicD40ebqIBDw/dcAGYmmYI06q
         9dNFG1ZJoklKPx+vA75tV+049TdeOf6nZHC/1JEJ30tzQGM0O+qUWaMULzOQiWnisg+y
         FXew==
X-Gm-Message-State: AOJu0YxKCMaChJB4IfSEDLnYUvKz4lXzq5h3OZcFuArMmKIvJAV8WDmX
	N6DmwXTzUrynDvOsFIaMqMituq2HEvLy+tRrMSs05aNJ71GA4uLo
X-Google-Smtp-Source: AGHT+IE7ir8o4cWTVBT0eg+WMbzZaxX6cQc8ByXueTcuHKSKXe/X63JB/yfxgYkQ0h+8EibvR3ZeDQ==
X-Received: by 2002:a05:6512:b11:b0:533:482f:afb7 with SMTP id 2adb3069b0e04-539ab9dd601mr3908904e87.39.1728219966177;
        Sun, 06 Oct 2024 06:06:06 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff2904csm512749e87.304.2024.10.06.06.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 06:06:04 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 0/2] Add support for "on-die" ECC on Davinci.
Date: Sun, 06 Oct 2024 15:05:45 +0200
Message-Id: <20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACmLAmcC/13M0QqDIBTG8VcJr+fQozbb1d5j7MLpqYSVQ4dsR
 O8+C4Lo8juc338iCaPHRK7VRCJmn3wYy5CnitjejB1S78omwEByxjgNo/NIDUNnW9CtljUpv++
 Irf+unfuj7N6nT4i/NZv5cj0WMqeMGuGMQa6sbtytG4x/nW0YyFLIsFewKShKcM1V7bS9POVRi
 b1SmxJFSdW4xgoAUHav5nn+A5wxjpQGAQAA
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ghsLtM0pTCsjVShmbZaKihMZoOQLife8+lrCa1ftocM=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnAosqO1hp6WkL2wUfK/sEBFv40JZaYb3nufEcC
 dYzCtnQXoOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZwKLKgAKCRCIgE5vWV1S
 MmWhD/0VPUd1y9HkiwZx6DH1BspK+8svEoOP1SgHpOn9YL2ibIrZVxZjAow2ErycSLDAOXdl2JN
 lJoSXzgIanN/eGkI6CqaeIdCB2iijSR6nVbt/F2TQkyNoZAuDF5xAPoFC7uQ3TQjZ5u3yl3E+rv
 sfgYhv2ixsI6oIegsjtUluuJognI9Nw9YE/ySASl3nCDuBROL/49rrAYZ/dTzsdo3VauitekGUN
 MF3ZMbpt/JqGLemE5Fb4rLSaibH7hTm4apfGbvUFCmedg2Fd2v9N08xze2lyHeFsD2d+FrftaE1
 t/uf4604gt8Bihu620WpH4Ihlcdx2/gOzeeVUIlXptwRk5ifb1X5VGolr4ZNLgcFp19L/QiDSsf
 oRcjJW0siTTcRQwhx4iNFko9Qg3N9KZY9FJVtg3K7Apb6gdzyoO6uskK0FUDsWEMZYup2gNrA1A
 Uj+fyNQPViWKAUGm0lIKj9gx30+rJRp+TmvZ24lkcHqaIHvVwvARHb2pRjf3nbfl36+g2nRMofy
 UbV5lsdtcV/e9t1w3rd4KDaN6XB67IEztOzxFDDqwz0VFp4rBMUcFhx8Sb9DqwbG6qlSfMRBN3V
 NAk/Pe2rppQolPlu4xv7i4fVGDvXrNLW7LMEtEOf+cj2yog4ifYiUa4sdrKSwZWhsMQ2YSRtkrO
 EszNyQ3ZeUfP7/w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_060609_007675_810BED48 
X-CRM114-Status: UNSURE (   9.38  )
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
Changes in v4:
- Silent errors in `make  dt_binding_check  DT_SCHEMA_FILES=ti,davinci-nand.yaml`
- Link to v3: https://lore.kernel.org/r/20241005-ondie-v3-0-459d9c32225c@gmail.com

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

 .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -----------------
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 115 +++++++++++++++++++++
 drivers/mtd/nand/raw/davinci_nand.c                |   5 +-
 3 files changed, 119 insertions(+), 95 deletions(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
