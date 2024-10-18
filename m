Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A31D3C53F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 02:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2lMbpUg5ByDVYqcnbZ9ot2konBJqmjwEIzWbzMzne0E=; b=YkCBYRHab3laNg
	57Jh7W2Gyo33EqzyaZ6dP4JlPsiSn1t3JtPJk4hcvWM9hyhO7xzfaRUy89CC7Bab7GILNaZlb90YN
	lYqX+AOGHbyzg+eN+Bgr5ISo0LJ/Sff7Cs2cDB8bjaR9b7IjgavJepToS+fbjOWJfP1MAnU+jTKoh
	XjhX6auk79nabaxlN/cuq4j3QiNdwAmjrVL8oguQkJ/at2VqxI6WNjjXDu8gvQn10fY6MbUa0VFIK
	SQP7Yd5+p+NliQ9tidPMsC40AFaXalT++jwjiZAexD3MVeZXLy1To/AHdMj4KqFOXRMxXIUQt49uM
	5ipkquLJTF5JB208eeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1chg-0000000Gfu3-3bBv;
	Fri, 18 Oct 2024 02:27:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1cgB-0000000GfVy-2RDb;
	Fri, 18 Oct 2024 02:25:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso2005232b3a.0;
        Thu, 17 Oct 2024 19:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729218325; x=1729823125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNblylQP7D+aqyHspg/cSjG3VPPyHXAL3CdZxZWFSSo=;
        b=dufHLX1L4T1P4mqAKsMMWWcSjHt1LC/M1OzfdtBeKXlcwA2kQ+d8HN7kFvsTnTT55B
         If+WXfL2a9w7leX02c4JPv0uEtfBFt1P4fL/4/NQAyk6OnYgmy6pydA0TAPL0hXj5yWS
         mxaY+hR7UEpISsjrTFPXlkmacAhcrruBXFRzsfhsEGiV77aP+1Po9tOupcwFopoAEBwZ
         umYrjZbddl6eoVaYs0RHIfisNjSyIPr/wzVxFHFfCjEWHQvY3QkZ8o475npbMi4tho8H
         CX4QIOf6lNtp4yOr8fdq694JNe0LYUQ72DCVo3Cfu2+UlxxInKansJgKukRCtYdPjz2u
         Zxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729218325; x=1729823125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNblylQP7D+aqyHspg/cSjG3VPPyHXAL3CdZxZWFSSo=;
        b=OEPkGJ5qbHxFXnei8LpkYIXVxtUOT1KhB8PcIyWPM9x/YjabYg0gvxlY04tjTKRgnl
         SP6Sr9B/KwWRIhIKIMDlh8UyHbLXEmSukqXwUC1u65NFhz1G0I1Q0X+ECP/qwKdNJXcN
         gskjZpNSdZguRUqU/jIuXF7to58DqbgqNTSpjUkRjuDoZxPUka0ExYM820bfZ4qubNx0
         EADMeOhUV/fvHoba5guB3fDwI59vxB2U55kEVLqllFpHiWKkxCWOPqPiGvhZp4CzfiIo
         h6EWa6zqdaKZBLEx/ri3beoF108iUDzyE8dGEUtGpZ3xTzq4eMVs3s8nxR0KCxOi01qe
         mQzA==
X-Forwarded-Encrypted: i=1; AJvYcCW6lca0X+4o10SEGmDP4v06AsjjNGTScVDU8fgkVDLm9NwUuGgLksEh8Ob4DChmO8/9iV96jBcMQuk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8osq6fE7XyS5Lljv3OxUYFJic6FqR2FlMQePbRS3WMlB460R9
	97Mz4+bvvZuJQI47dRy2oJhM0WqI8IuHa33p2yZ9khHlnx+YuI0B
X-Google-Smtp-Source: AGHT+IEvQGzO6HN+yhyDUkA6o0/8ovLGioAEj+x/bDhJg51Dnqtq6vMhGDJpCo0s0E4SM2crpz9vaQ==
X-Received: by 2002:a05:6a21:1349:b0:1d8:f97e:b402 with SMTP id adf61e73a8af0-1d92ca59dc0mr1256422637.13.1729218324426;
        Thu, 17 Oct 2024 19:25:24 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea34ac42bsm361736b3a.197.2024.10.17.19.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:25:24 -0700 (PDT)
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
Subject: [PATCH v7 0/2] Add support for nuvoton ma35 nand controller
Date: Fri, 18 Oct 2024 02:25:17 +0000
Message-Id: <20241018022519.721914-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_192527_641151_7989F719 
X-CRM114-Status: GOOD (  12.87  )
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

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |  95 ++
 drivers/mtd/nand/raw/Kconfig                  |   8 +
 drivers/mtd/nand/raw/Makefile                 |   1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 919 ++++++++++++++++++
 4 files changed, 1023 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
