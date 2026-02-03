Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3691CE83043
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+bY64qcv0P3N/5ClxTLXVwq4c/eSKxR8v7Ud5dgnt2M=; b=dvi8ybtDnA2U6w
	ICA1tGmCSrmyJnGJ5Y2Rdfrc4m3ACsLzU+ubWbn90P9LAaWEPS9YQZCzSj3Eu81s3j+8RsFm9IJ2N
	p2ADq3Uue+A5RHZ+dVf9xMQG/j2jmioLhCEunD1E9WIrAqlaHwFXKEaS45VjhlDTyS/LhliwW5TZ1
	1cVybKBRoKa5BBQ4KcuAdD7PH/ywx+cvAfD1BVmDGsQYlcDo4u8IWobk0sVYDC2GHYYzusXKCl39s
	IA1wLT7jYVN+gGK1IFR3EF9LDHRv1g5Efb0JSdhkzWP+Y5lAIQgbvHshaKmOR4TeG2cUC5wToFCUL
	PuD86Y4vx8ETZPnjOJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5wk-00000005uJK-1iHr;
	Tue, 03 Feb 2026 02:15:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5wh-00000005uIF-2fNF
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 02:15:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a9296b3926so22075ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2026 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770084914; x=1770689714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M49pLF03j47dYGZC1fpEi4V6Ci2ukrF0IVYHzJNJOlA=;
        b=kZfVct2ocILnRrLGckltLjF35XE41vSSxGfHn5CoQG9Agjatjx1DidB2KgKpe9kceo
         C6LLnZPIhFIygIP96XenAFCcwHlAa/L2pwqNts3NwWNpzpZ7V2dVBXLIa5n1TzFd4uPu
         wVL6puttlGRpBu9QiZlXQutSTioCiFL/To9gdL8TP1v/W41R7XueC/YSgL1HO1CpzOtq
         Qu69hUYR1YFPaeHVTZs7SNwRpEUdcTNwaIbmtJIvFj+bjMXy0DuNEUSx9+O0nY8razsB
         84AWAKxPhntMj33JSmDEUlb4XtE/80am7xjdUN0LawmsQcEf69QmXCUfBLT1Z/58s523
         PYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770084914; x=1770689714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M49pLF03j47dYGZC1fpEi4V6Ci2ukrF0IVYHzJNJOlA=;
        b=IrSYTiHC3hINasdZAiu5S6rJF2d3pXTkAjMu0dB2xgGu/ETLDufHyke4st2dsxzeX/
         iK8AM4ICeZN2rDTwhq3PRqqI95xmBkhSf0kz6q96aNNX+A3PjsJlcIbIgOsX/pi2ref0
         beMflcNc6fJg21O1/y1K+ZIMRIvmxDr0xlavvsZ5rbSVElYeY5AnzkLm1/LLDA8c3qbc
         S757GD+PLPZ3URhvw1rK0rtLUP5kaUZzdR+rHDIEB+sfOebT2KuvKObyjbXLv3ty91OT
         J8CmaE33hXtdCjTdr87PJZ76BR70bgUV2x3qlqSuUam0m4Jk1wn8LpVnZxH6E6UlukRA
         DndQ==
X-Forwarded-Encrypted: i=1; AJvYcCXywDwyigGJV4yhUogWWJFSJE8BBTR0aABykDwMwIIK/obSlVvBCu0dVQzOsg/ezKiqjPtM/+nb/c4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4174u7keSc3JK7U0wLElK4KIgj/rZrwgJx3Pmks97XF7xffYN
	9oq1lJpwaKqVtu/Djk9AZXqtPwdiCG2GnSAgwcilAx2jrJqKwMeqrDXf
X-Gm-Gg: AZuq6aIzNgG/Az/yvfgpyYQGhW27F4gplReg6H4NUjkbieojxUuYIjCiWg7mYf2tR9i
	pKvXh0AS2udLXQfOTS4QlK54fYVTQgc+WUHFcITw9+Ll/LZoS0jbYWvB9AglMVDq6S31jZsdX2z
	7Izwm/uo7ds/bySHZFI9h4jSObickMFQDLteaFehagkBKHBQ2sjJ1a/CopjZXW1qvY2Hd5AGRer
	AZ6akoR1EPBGh/iFlanKCCwi7mx9avzWkVwVBw6DGgI8PZhEQIDIwD5Q7z3IBmxfSajmbmNiD5d
	x0W4HQO1xbgL9M9oRx4V0LPTPf2Q6jFhSfAQF+TCWFX4vbuIkUrYLg5lU2aGvfRTpvdA0qYW7xr
	isTar5mIUwIfuT3tWS8UZCs0e6CYa3YZpjeUsJUdZnJUMesZjEn6Hbiq0rD8Hd7Hfu0mq5D/GPh
	6Yx3MjjEVAPFtK14rZSYhZMvkkuXVwXXPoWjW7iSRhEgI0
X-Received: by 2002:a17:902:db09:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a8d818b2bemr157393575ad.47.1770084914165;
        Mon, 02 Feb 2026 18:15:14 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f6c7csm163933135ad.98.2026.02.02.18.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 18:15:13 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 2B3B54136071;
	Tue,  3 Feb 2026 10:15:12 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 0/2] mtd: spi-nand: Add support for randomizer feature
Date: Tue,  3 Feb 2026 10:13:56 +0800
Message-Id: <20260203021358.693291-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_181515_717963_7723E910 
X-CRM114-Status: GOOD (  10.89  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch series introduces randomizer support for SPI NAND devices.

Patch 1 adds the hook and initialization logic to the core framework.
Patch 2 implements the randomizer setting specifically for Macronix
chips (MX35LF/UF series) and allows control via device tree.

v4:
* Fix a build error in spinand_randomizer_init() where a value was
  returned from a void function. (Reported by kernel test robot)
* Update the return type to int.

v3:
* Revert the device tree property to the vendor-specific
  "mxic,randomizer-enable" to strictly follow vendor-specific bindings.

* Update the 'set_randomizer' callback signature to accept a boolean
  'enable' argument, allowing the feature to be explicitly enabled or
  disabled.

* Switch the implementation to use the standard SET_FEATURE command
  to modify the Configuration Register (0x10), replacing the previous
  special program command method.

v2:
* Create a global NAND DT property

Cheng Ming Lin (2):
  mtd: spi-nand: Add support for randomizer
  mtd: spi-nand: macronix: Enable randomizer support

 drivers/mtd/nand/spi/core.c     | 23 ++++++++++++++++
 drivers/mtd/nand/spi/macronix.c | 47 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     |  9 +++++++
 3 files changed, 69 insertions(+), 10 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
