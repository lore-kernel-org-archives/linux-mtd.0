Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBBC52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ByLd045WP3nlwsbGf5kFYVbRQg3sZ2S3jcdVS+JeWk8=; b=VzeZmbbbUnzxd1
	B4MSv2SuX8p1zSSZdxBsDqkMVKilQqoH4OCnRaLn9b1xwzjO9fj8DoNlFHKvMQmdGRTAZPFzwkuHs
	nK08Gl79VhIH5sxf+e2Kiv94xID28vLm9+UtvN99wzKuy+cbssLqLmtz4lNejPM8KJ0oncB7GLupb
	hn7zeJ1RpqFJwrPLuQ90KOy5VV855p+xnDF02MMtEgQh0p1SCd2BYE9vEgjRDzjrs/g1ISJANMUEW
	t9BXPsmXTqagg+XbcrxySH31bkXsFLvEli9CbOGARiVmt9W6PfLQf0uzdiAqWOlG+CC++ZtRzGSUg
	u4HWR42Amcrc6NhLFUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfWi-00000007qeS-38j7;
	Wed, 21 Aug 2024 07:13:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgfVN-00000007qCC-0UU8;
	Wed, 21 Aug 2024 07:11:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-714262f1bb4so239393b3a.3;
        Wed, 21 Aug 2024 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724224299; x=1724829099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XHLEEVfKEFZbe4gHXKNE7btizZL5TxAufqI7CmlNpY=;
        b=SfJ9VSQbmTFuXgD0R1DcGCw7TSaIliuGlwWLeXHFs+ijKmsA5UqolrKA/pDR1uxgM4
         AFXWdV+1RMn35wsu9IriFI1nk1mwspx0PAMl9TLmGShCkGKQb4bgiM/r9PrinoQB9TFk
         cf5zJOXhgPYs3ol6jqF+gv5lqyoizYrXUmoZChCveejv4eP+ZfQ0TdM/OEt7CWppbxNs
         SGskToOfsV+XrgAd/VvSKsz4cB47ryw1eD1ssGuYH8oo3OFnXxiPEQuL8t8B5YyjU7kk
         mXC1HAsau6IXmtuiXU+JGa06Ak9KPjx5WhSrcyVqaSUK+u5AdLXY4CLb1Ym4XKRnqZYE
         qIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224299; x=1724829099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XHLEEVfKEFZbe4gHXKNE7btizZL5TxAufqI7CmlNpY=;
        b=B1J4MDTq7+XrU+mJj9KVR8EXV/9P0QVaeueJJVwdgoBgcwaep0WjNvmsGG4bX7qJVZ
         PB99xL8fThaY0NiplxHPuDtKwHoP6eexSPABZLb6R0gNmtlqxmts8nImx544xqp7OIad
         i4qpG+Gf429dxOu2NrPU6HRw1TB4zg2Vlk6TaC4pFJu60HdpucPgyXQnhuMIQNzfayXz
         FbAdNhp7s9SCA8H+Jjb01tptHPje93pjJ1Tm1pnPh6bx5bvdnGIOHIEJ/5yY7t0QikiI
         1U4NrZxXSmlV36xggKXdjp9Kq66KgHW+pQFzRpfxCGttegI1quzCVW1VzDWibGzrztJZ
         iC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8usWcMrkrLXGMYK59NFL0Br7kDGHaIwYLo1vBkEWR6qOvJCwOhDVFo3nSk2Onn6d26xSmkcO3zIw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb286AXOT4LlD6488qRMEKflhRMWeKh9ijTbq/0nMXS+3Cdy0M
	L39GQ8nZMXxfHAJLxfvXhsGCm6dCVzApnGvO6hek59xwbMFz4NEU
X-Google-Smtp-Source: AGHT+IEWYZZmObSXmhFGqh/x0J/CjMh4owQPA8Y+I+83N4QUD5z+ARl4awvtakKaj7C1gklfFrVd5w==
X-Received: by 2002:a05:6a00:915b:b0:70d:281d:ee78 with SMTP id d2e1a72fcca58-71423462324mr1665273b3a.10.1724224299489;
        Wed, 21 Aug 2024 00:11:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd8b631303sm526667a12.9.2024.08.21.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:11:39 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v3 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 21 Aug 2024 07:11:30 +0000
Message-Id: <20240821071132.281018-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_001141_176391_DC9205D4 
X-CRM114-Status: GOOD (  11.24  )
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

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   93 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1068 +++++++++++++++++
 4 files changed, 1170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
