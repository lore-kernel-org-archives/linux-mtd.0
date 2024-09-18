Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA4CCD191
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2024 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CZFxKRl0ufMwRcBmJtErIasMgPZ5W+XftDA+N1xgBfo=; b=qpgL95AKVXv+DH
	jU+FQ4rxDtRTMtJvaCNrdV0q6GRSM94Nfde2qSDkVbt3DbI/4jn9fJ3eg+QTpD0MXgthjiVE6kQHb
	wtt5zrpMPLaaM4tWSavUHiDOEZZqzpAiNSJkIbwt+AjK8suTl6PsyCBML9SUE9xHustLn6GTctnlg
	mLMJL6cRTxHP7fFCEMMZNSDzkyRtuJkWXDGlkKQzXBGavyoAXekSJXqnMaQLEAVO0Vh1O3fF4o5h5
	wJOOvBkZ67SSWHZHjHQvJZ0+iaB78NKIHLP/loEUB8ULZixvMxdmuvlW6kBZF8ot1Y0ry/RiSZtG9
	Q8BiQboG5t2QJ9bkNogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqbp-00000007t6V-11zm;
	Wed, 18 Sep 2024 09:04:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqah-00000007sqi-2s1R;
	Wed, 18 Sep 2024 09:03:16 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2057835395aso76085585ad.3;
        Wed, 18 Sep 2024 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726650194; x=1727254994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtpllJHNUz1+PFWJNLO9JzEhzmqZygXKijwiaiZ1tHY=;
        b=LOVUpcChwflJHa1z9LuK4G9Uprqr+xrHoHRp4uoGMKGGyxw4b+JWhuJirssvO4Yh27
         OgQb+/GVbT0YN1VBTh133bU7PB8Mh0s6pjen+u48Ez++kM5S7hlXQCVxDrcj8lohyasX
         hqsDWwZGiXIUF6zL1e3XROvQANww/1QGqzBa8cwKPVaKDnxmZHBAZiH4mlSiOVn7D+aH
         NbTeed0zaqxP/lYCay2frLzBbbmkhiCZGU2dY8ebz9tIqnnXPBuSHy6pKoW1nWUmrghk
         RXAhHGScbgm/TeNfNSU0e/0Xnu73J4yFpPJaaoZ9SEPQou/9Z6bpzpbKgKmuDwD0zpj1
         +wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726650194; x=1727254994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtpllJHNUz1+PFWJNLO9JzEhzmqZygXKijwiaiZ1tHY=;
        b=bFCNHAiyLZDxzlrJj5ts+fxFM2bIIRN/a8wnlRAwJimYa+BYhn7o1nyIOyseiaRHtH
         CBDUPnxqM4c6U+YluzDEDhcAXvnF9wBC6Zo0obj3XP3QcNk9Q13ochwHVNiP7AWYkSO6
         cvHhtq/e4OW0Im2dqV/SEImsk4hw1MkAN5XTbQhQRGUoKbrVitCQ3flm25WV8QeC4PUy
         S38THjEVM3TkjoWy+ZMBniUs1A+hwYGO0O48ZwKYeyu7Oqbe+RMuca3w9Qj5RJI9GhXo
         4Mi1QH2pzRRM7D3YjiYffl7cOAfvWJsxI1T0yjCuEmnFS0VCNP1y8cS0JuMPopyld/vK
         z15w==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ne3AUwFIO220gettuk8vYp+yTlBcZroh7iTfSQzhBYKUXmB6L5AbwGGhpxRUMJUvL8cWEmOR8Pc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4l2K8dsEJ2oIipI84QovVDTSSQdSOnJhafHlIECiXgKspxgzD
	Vk+SUJNmjQGRnxTNiNq53CWTVG9u4NOpnI7jV+wJH71fh5bb14a4
X-Google-Smtp-Source: AGHT+IEgKeGF0I2bdpp/cgx+mruhYWLhI+QOokE5lajRXPVK3arbWkJ4oOi07uUO/2JQxL6qVPiYpQ==
X-Received: by 2002:a17:902:e812:b0:206:c75a:29d9 with SMTP id d9443c01a7336-2076e3eb0cbmr345072275ad.42.1726650193788;
        Wed, 18 Sep 2024 02:03:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946010f9sm61021875ad.84.2024.09.18.02.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 02:03:13 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add support for nuvoton ma35 nand controller
Date: Wed, 18 Sep 2024 09:03:06 +0000
Message-Id: <20240918090308.292617-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_020315_744221_5B65BFC6 
X-CRM114-Status: GOOD (  11.86  )
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
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 935 ++++++++++++++++++
 4 files changed, 1037 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
