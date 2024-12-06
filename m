Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC18E7716E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rK6qj0UD8CyYIRcYGuyajVBYmTYq2Xd5Hce/NvhQF/c=; b=dp/pM35suu+Gpi
	EsyPcASxhjQGH6DsimVXk+lF3OCYBQGy+/819m6v/qJuUgug5IBkwsRT0QUJhI7ZA0J0r9KtkGUhr
	tlh8bIIwExMkmKH7MD2awGM3lDzgB9CVSvvnWkyPI43DfrVvz6Ap5OAyi1BQOxA+HX6N2TLhbxs1x
	C60d3aHKrVi+vkSSpEUV5bhHLmgG5x1TYt8GHWLx72/pwo1bjKdYwH00SYyjIDKI5eDGLDAvnQbbI
	lvmwXpdeP3qGW55IehXZNB9ICj9IoPBalSOPB5Uo9jXrMJbj+Ji16A4Ap6MVzXreK5eR7WiP2wOk1
	LqYunXX40W/UTGI/qjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOnU-00000000Ozv-4BFw;
	Fri, 06 Dec 2024 03:14:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOmT-00000000Omp-0YqH;
	Fri, 06 Dec 2024 03:13:26 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725c049fbd7so31763b3a.3;
        Thu, 05 Dec 2024 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733454804; x=1734059604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt0SCTkvn+YR9UJenhf6zDr8e0FUj6bUNlIsy8Vy6XY=;
        b=aak1vfiQfNZl+yk4M4z8t4xnU6YyAvCerZ4qRX0hsqlU9p6oowRXEZ2j6h/LZs5ubh
         HT/JYpSGXiHX6wdlslKe8w3EoBsupYcoBK0AicjyV0yKqi105bLQV/YlXOxBMzp695Lw
         dfX+Ne/Xk+xGjt5Jod351oHXLXFgkNKnxqz244DYMxpjAuUgnHfVNcn9Tzztfa8zTKr0
         Az5fj61IDCwHrpAlOfyU+yrSAEKWqDC54ymh97HdQUYz5K/RXjrtA3eJP8IeQtKpeIE0
         bd6HYtxga8Om98Blo8/hrTfOHMrNfdoJhJSDs10N26qPnXon6TP8xrGcAOwmQgMK7ZUH
         L0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733454804; x=1734059604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xt0SCTkvn+YR9UJenhf6zDr8e0FUj6bUNlIsy8Vy6XY=;
        b=RYpup983aGzz2rADLNbcrkHwVcCIZf72mIv943hdqwanumfL4QHAIUg+lSZODBCv1x
         9536D7UbVNadx2vIzPC46Eh9BKsviQX4f5HcVdbNjq/m0didikg+9JvsMfc0ZMvBQCjp
         1cQ/qbBIYKtsNBSGqQBIuxs0cvs+yeQ/ybGlS3FA6cSHUEGMS7WQ89QXTe1bpsb1R/qi
         4To04vl4bE2W8mKq+BRfUjYVTz6ZMyGQ9Nn7xHuRCyhxLykvJb8RysjENHbWspe+Q/R8
         xdWo6S9NQUGfcGKUYxWZ337ASdy2kZG6rWtOy+pAq/iF6g2lvDwaMQgY896z3QeFPPS2
         bNOA==
X-Forwarded-Encrypted: i=1; AJvYcCXS/AELVUAlRUANZNy9GvC9al2AIIVdh4o0lRqhAYA2c8HCehDyuwVFe4VdXbg7lK+973+YG3EwdeQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyycqMiLFWRhzwTkn7nnfOHPvzbAT2GPLJyR1qyNc3xbyNmYJgf
	obUAvAPKMh8p8Lkt9Ru2D6LY0Rra+0RfpCjaBW3D6e76hqaOXDxt
X-Gm-Gg: ASbGncuYxqNbs3B2YYmLQThtpDiSSaFNZeFFMbmqybMqCnKv/IEqseJEqnhmM/FqAGR
	fMgnCc23AEDZEIjmbFgfIa8VVIBw3ZSPqJwosKDrzj6bf/dDr4xoxF35YxyHvLO3YA5d0LmH3wc
	c12qJ5TU1D5/ktk5C4brAUEcr7VibIzNYtGHBxOkb7+S1yQlwACJSdfPtSG2s2CFCmWvhAPWWDh
	z5cD+YFLy3UuA/njIEdyyAGdxEOHCPhWHs+CdrSd9EbQ3fEK0gX9mKnsx60uHpQUMXbo739AG5l
	tnOIdoDM6dc+CShNlHAnmSv8nAzRM/40/Tw=
X-Google-Smtp-Source: AGHT+IF7SIhnyAIa2s6klAC+ixAZnJb7XNMJ0xYjIoh2x56kOXx7Y1GiufB+JlFrmxcvjwEpoM/fmg==
X-Received: by 2002:a05:6a00:14d2:b0:71e:a3:935b with SMTP id d2e1a72fcca58-725b820eac5mr2862137b3a.25.1733454804100;
        Thu, 05 Dec 2024 19:13:24 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e9003sm1966791b3a.44.2024.12.05.19.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 19:13:23 -0800 (PST)
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
Subject: [PATCH v11 0/2] Add support for nuvoton ma35 nand controller
Date: Fri,  6 Dec 2024 03:13:16 +0000
Message-Id: <20241206031318.156152-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_191325_202717_576EBAC5 
X-CRM114-Status: GOOD (  13.46  )
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

v11:
  - Update ma35d1 mtd nand driver
    - Fix warnings and checks use --strict.

v10:
  - Update ma35d1 mtd nand driver
    - Add unsupported write page handling.

v9:
  - Update ma35d1 mtd nand driver
    - Remove NAND_NO_SUBPAGE_WRITE flag.
    - Remove of_get_property().
    - Add ecc.write_subpage and ecc.read_subpage.

v8:
  - Update ma35d1 mtd nand driver
    - Rename to nuvoton-ma35d1-nand-controller.c.
    - Use switch case instead of if else.
    - Move some parameters to be set during initialization.
    - Fix the ecc.read_page return value issue.
    - Add enable/disable ECC engine before and after reading/writing the page.
    - Return IRQ_NONE if (isr & INT_DMA) == 0.
    - Move the HW ECC related settings to ON_HOST.
    - Move hw_init() to probe.

v7:
  - Update nuvoton,ma35d1-nand.yaml
    - Remove required 'nand-ecc-step-size' and 'nand-ecc-strength'.
    - Add 'reg' for chip select.
  - Update ma35d1 mtd nand driver
    - Update space and comments style.
    - Add chip select setting from DT.
    - Add switch case which supports various ECC configurations.
    - Set reset before NAND controller enable.

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

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   95 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 .../nand/raw/nuvoton-ma35d1-nand-controller.c | 1029 +++++++++++++++++
 4 files changed, 1133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
