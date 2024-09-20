Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32453CF58D4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+42W8DrS1y6NOomCLgETFi3U6XeSbgjFX7cgMHO1wpA=; b=UAMPjjiBPhoLMF
	UKCkQIVWwQ8l99eRYOMQIhy+HHhRDrO4V7bw58BBoZLfZuTiWdrRj/pTGdp9KNm+/S0TwEUWrZbud
	jbMVMFkmvKoDF3MVV/kpFzBJrQT10LuvIzwhkmhA1d59Q81mZ2pCInWc5+oQXDtySHucxH+k0eHt6
	AHiYgd+/2HOg9bQIfWaqsPYTCuZLC4bD9ZzVeSvwEnjEJDHbUCK+gRbj5hlLk8zGCKibAbeFqKZ1U
	T5ip1Ir52klecA4dOytNrzs58X+fGjVf20kVWUdoJHfD0oR5ewW8vyrldyEbzVMjT/5399usXgxRH
	6KB5fUVsDF6zauJaE/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srXIK-0000000BYE3-2aaW;
	Fri, 20 Sep 2024 06:39:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srXH9-0000000BY0Q-3N4M;
	Fri, 20 Sep 2024 06:37:57 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20688fbaeafso18832975ad.0;
        Thu, 19 Sep 2024 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726814274; x=1727419074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPEFOYIvo3FjR008iP8F+SdxzrmnQtEYwMT9hZJggmg=;
        b=m5qdApIq5eRJ5GV930T8meKQdMGGjRtjVo91vHu8RxJ6hx9guATO3MpxgBLmyIwKhJ
         8KTJWQnj6L94Lgyo0fUbWlzKvzCDsK5Rv2/jasGYe7jme0N5WjF3JcDlJQz2XpHkYssK
         XlqIlA892LOiq/8kumQZ3MXJukhGB7Xpm55+xFADjTnrotX5x+srf7deCtkzZe5DBhYy
         tw0x8CDrFH2GfD3WH5smCkOgX7xUSp2Let0W5uwybS9H4H7d47Cg0B1s95/VZUcl1w7q
         i3oAYjrv+alqcYwH9yiv4JQPbwVJeYui3sH5ddlSOYm37Kq22vXiH8F8w0UGMroKT6+G
         8ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726814274; x=1727419074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPEFOYIvo3FjR008iP8F+SdxzrmnQtEYwMT9hZJggmg=;
        b=EtCDHpbuTTKeHCPaTGVxqrlYa89Gy6NWLpi2PBzz+4lbpTMB28U8iXEsr21OKpc2wF
         /tMdShnIJYWpVuXdlTjnXzs9NXgRvxIDgPss+eq8EH8m3vfbMBhweJqRvMviRVx2YAN4
         hoQEL1CkbJieDLDPAlr7srUxcnvfKJRgvsXYa0ryplgStBxsOpK+Ed1tTXv1qQXmVJLd
         cPeVwC8Oe970mh2kzlYOz0oed/sdN+jh+3B8t60Ds942+2i1r7d0J3lYLWPgF7/r3SbP
         /Td/PcchE5JZ7zE9yQ8dxO7aUxuxIgIo45F5RSasPkb5HAtx7EdE4vJQHEHMniL89frE
         w6PA==
X-Forwarded-Encrypted: i=1; AJvYcCWolFdA9PRZ5TdHuc+Ov46DEpOTbKludIedFzkdy9HCxnWp5ohVHe1Dcc7Pmg/Y42Wy03VD7+SLYMA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBmYcOLX4u6zHPNRmhE+wsH98GJfYDBHdbgnOm/oHLTsapFlEe
	Y2ZsxTa8DcQ/SV0KW32eJwQDQtbA4JJ5HnB/K2IIN1wZ3CufPpcw
X-Google-Smtp-Source: AGHT+IH2pNyRmZlCTiO5AdEsu4duxTuz+8tetbm/Mof2B7a4gOt92o/iYRHwA2XbP1ZjGmsjde220w==
X-Received: by 2002:a17:903:40c7:b0:205:56e8:4a3f with SMTP id d9443c01a7336-208d843dc46mr20946725ad.61.1726814274316;
        Thu, 19 Sep 2024 23:37:54 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d64dfsm89106425ad.134.2024.09.19.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 23:37:53 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v5 0/2] Add support for nuvoton ma35 nand controller
Date: Fri, 20 Sep 2024 06:37:47 +0000
Message-Id: <20240920063749.475604-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_233755_862950_B3D115EA 
X-CRM114-Status: GOOD (  12.00  )
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
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 886 ++++++++++++++++++
 4 files changed, 988 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
