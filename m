Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63BCEBF69
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 02:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mxK7kbkru89z4oKaKVmDqCXRjuZIP4xV01TfkIYrC6s=; b=X7tLxSjLBtKRko
	X6eYaDForQvQonowRf/G8FheO+CiJcYpOOXmiOypCzRUDmHJ7yrYU/Hs6TseyH+YDmxGjIIfM4NTG
	1lrUVK8gpIoUitUU/VEsiqN9k22N0OqaXY/Y+6sWxAcbmwtjDOkVa1XglqrJFDz0mVKGuvrU2v09D
	t2FovyYoJKdDFa0F+IlxsiNMKmVHPr7+JCuA2ctT5T2aenqm85rYWOPz1zN/WmkKSRQs2CjyYgbGi
	IwC/NorCxfoQugHgcPwlsGrDVT+uZpACmYd9js1QZRCSRJ7Ykzeu0YxBixewNPV4pKJP/8mk6TFnv
	sZ7Y9dFBk9SflHwS+mtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su0Pu-00000009nF2-0TKr;
	Fri, 27 Sep 2024 02:09:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su0Oh-00000009n1Z-3LJx;
	Fri, 27 Sep 2024 02:07:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2055a3f80a4so10620285ad.2;
        Thu, 26 Sep 2024 19:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402874; x=1728007674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5bbGVPh6/6c2QiEue2t4qR20oS5dvI/1sc1D2hHOCY=;
        b=TBvtjRN1mv7u9ie/PCK6RaojbeXdXyWF/n61MotjN7N9CYDD9i04ijhPnUaS/Q35Kk
         PYWpvpdqqEcAiNU4Ghezw5NpX7YgBj/G3aq+XwaPTAcmLmQqoM5Zq0oa5RB+RGy2ZBOs
         +Q8j6Fk4hwmSeiGhxQEQdy4W/UqOxJVFRlRS1QvLyzFF59ne4yETC63y4VGpF3cjFg1e
         RT5oluotAlKDXCqZ2/aifGc26oNNQEgLb6ATb7mC7UakK1LvVU/KxIDLr1HyLOXkQetj
         ArUmUKUA4IEyh1NSZpZ7vBjWoWq8NxGkr2mPQcy+XGiy9L7PUjHTd4gwSYcYDXJiVH9c
         g88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402874; x=1728007674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5bbGVPh6/6c2QiEue2t4qR20oS5dvI/1sc1D2hHOCY=;
        b=RtI+F6G3f4G11qVN5Tf/aykgZ0A75EnozBH2a9fPHA9eyw/Yvtci7bjTRH0qM3Vq3l
         L5fQcK/lUE8R3uE9XovGXF5NjtMUeR1lSW0VcPtJnXt8UVDGYIB5y3MKpe7hVyQkW4nF
         qy8N5uWkRZ/QhlUy9pP57H9yZvOHmrnLlT13fQvfQGHJu82neWS+/kSHFFw3gxvRaUPm
         PIujtYXMnKml9cqeDSbjjQi04cuvc1X7rbyl++NPKT6eb4UXiuRjuTFsaLtWowHxW2BC
         zHMOA1SRtIxzKPrBJOIEP88Lg4z5Orm2GYifXDmk90g1eQOQPbmR6F9QmnbfCba/aIvs
         p9bw==
X-Forwarded-Encrypted: i=1; AJvYcCXm3Fz+heKNB8j5NYU66wm2g1pyFKU2SR039lRmd6qUus9aDD7JBHBm4KIZj0OyOiN2sFGg6owIPHI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb5CZKxyI4ItDlk75chjD1USAv5KfcyZcGQ7wSTTFd2Mr0BGVf
	05TGGL8NHJI9aCY/6583i6msDgEq1JyFbV9TrglJXDPRls6XvDM3
X-Google-Smtp-Source: AGHT+IFLx9maQwPxVGEd7pa7DuoT1tNIhrd8T1DIxF8JHJzGqlpTKvr5gywO1ZB2ijS0NWtgYCWT4w==
X-Received: by 2002:a17:902:e850:b0:1fd:67c2:f97f with SMTP id d9443c01a7336-20b36ec8c9emr20448605ad.28.1727402874441;
        Thu, 26 Sep 2024 19:07:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2c66e1sm561022a12.47.2024.09.26.19.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 19:07:54 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v6 0/2] Add support for nuvoton ma35 nand controller
Date: Fri, 27 Sep 2024 02:07:47 +0000
Message-Id: <20240927020749.46791-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_190755_859001_B35DDD20 
X-CRM114-Status: GOOD (  11.99  )
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v6:
  - Update ma35d1 mtd nand driver
    - Remove extra blank lines and add comments.

v5:
  - Update ma35d1 mtd nand driver
    - Remove unnecessary definitions and comments.
    - Modified DMA API call sequence.
    - Move the ECC check out of the interrupt handler.
      Check it after reading a page.

v4:
  - Update nuvoton,ma35d1-nand.yaml
    - rename 'nuvoton,ma35d1-nand' to 'nuvoton,ma35d1-nand-controller'.
  - Update ma35d1 mtd nand driver
    - Rewrite the NAND driver using the exec_op API.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.



Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |  93 ++
 drivers/mtd/nand/raw/Kconfig                  |   8 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 862 ++++++++++++++++++
 4 files changed, 964 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
