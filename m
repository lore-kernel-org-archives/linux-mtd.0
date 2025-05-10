Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897B2C3ABC9
	for <linux-mtd@archiver.kernel.org>; Sat, 10 May 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N7F2UwSRKfXpBxExHOkMXMA8uCUT2To9KyizzH5ESvk=; b=GrGQzXQJiUlGyU
	lMHPIUUIfKih4W6dfkO5WEHDEb4VvqcsIXxmHtGW59HfbGB6uQPxLGevraoM5Rnww6vO9DTZAL7vC
	Tcfjs4G7wiUMyolV4RI55AtSCQXM81rmLxT46oVH3qTT06+4ztvXpNXKdsFU2v8oACSoKkiuxx7BR
	y6h6krmdCE65skg/UnP3EaD36u0bs3p9PcrBXg8HP9f93OeYrxYk8XNqnyBK9OCRDXfHAtUN9amq5
	sKaw5jJ0s5/QUJkZ3GD7ibjkfXOvbeau6PJXYislx73BxQs7suxYvn4TTp8NQKAxp3PFCJdjRk3ep
	g6bJy7gOakbJ0CXk9qWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDq82-00000006JYE-0dxy;
	Sat, 10 May 2025 19:44:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDq5q-00000006JAR-3X4a;
	Sat, 10 May 2025 19:42:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso723833b3a.2;
        Sat, 10 May 2025 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746906161; x=1747510961; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoUcwGY/R3cNZfS/qBHsbioe5Np0VUp+LEp6Z3RV7R8=;
        b=F4FQjK85EuBcbUqYHNXPYM/7JfGL+1Di/S7fZp5bIy1LAJOhxXsGiA2n1I++bpZB3T
         jQRYtVhAuCUIMbFAxIuezipUqte+2exX2CjD2S89ZyrAp28zYF/37ZuMpAMMtgwq0Tcy
         HCTy/jO07s2JNN5GHwgYQNSAXk9XgpCMp8tdErLNYC7raNfG/ZOZpGm0rlRUOeCnq4mh
         I4cnhNJNjskMpmakpsC0GJZlVhHprxtRPssk6rqseTknU57+aL8oNXW+5IPCEpkzF4qW
         uJiuT/X0lxZUTQPeNIwpmbzifQX6NxAcxMq3hXoJwDJxVrDZMhRfrGXEYOxsS12NN4dw
         JfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746906161; x=1747510961;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoUcwGY/R3cNZfS/qBHsbioe5Np0VUp+LEp6Z3RV7R8=;
        b=Ohx4U7u2eJbYZzNIXlO6xJImT0WahS5O9BAu+3VkYW+nvL9+qxIv/+5Z1pyGr6XQ5R
         mGEWViThPks6lRYGyW4Nva+h0CufWkuFkGwhjNlFzA11XvwVR+9N6e6oUC/Tvw788dRV
         JTxQUwyr68vo31wpllzBvN+aYha/HGnwyH0Csy+E1JbIcPdeTz81r8Jc0NCX01TJDybg
         ep2ZZs7dMW0WL4EcuyljbWKvMexub6Gm27nwoQsy9kBJysbwMecIZ1bH4JEgepjnYO5P
         6bHRwLN6nFwMavaXPjoq7u1aMx4tEtIhX+t81+rX/lk/s7xixZa1GN9SUkbUkpvGPI84
         aVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd/+AhS2FMwR1q/4oR+jKupPcVIu0PBuVY0BBjEIFUxzdD+/pe/Lo/dSoSougDsZYLeb1ttAYSlZbr@lists.infradead.org, AJvYcCW2e9AgOXABhRTp46wA2sUq/Wok9VPwq6yDZdLp8hLyaRMvbcz7yGtdpw4bRpWXh3i5SXyRMrxi5P9qa1ADKv4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtAjyWI1U4292aL4bEZVpiwkLGInV3vFLqyGKzfnP3oi1Xt94
	JIPvk34R8L0x2EQy9/iq3ggDm0BaipI+KqWRSgOdOGxD7UmX7J/9
X-Gm-Gg: ASbGnctOppKLXpys+Lu7fIaTFaXnoAxRAn5ZuNPGYPYk0Sc6FUJUiqEiu0RKi3pq38a
	L/o+1Mhf1mpTIWfHUNJ2l0szl8IJNPSjJy/VuM+SU9/g+6Vhed6DZlY6bdOERe19OyPv2avLCEb
	P4DDOAD6KVJkf6AuSdpSV0T49G6jiA16Y4+iJ0D7sa0wmDq8MGU0gkvM4SaI4VEh7eqUgEjs09h
	sc9rnzMM7luekx7HOoiExg+IqPluDoeOPkpdS4ozfG11H2bk6lS/Yd6+LGxdzk5Ti1mg7ZX5sjB
	3OO4KBlrSP13K9JtEJNBbLMbgUk736RBYxVwe9VZjjE881e6B3oWYVgh17+RFMQ=
X-Google-Smtp-Source: AGHT+IHyaOCg6nmdx1tpmmDVVi4RGIofai7lhOL76Jh1bNi0mXY+p+TyZU8dD2IPM4g1icTcfEtCkw==
X-Received: by 2002:a05:6a20:d490:b0:1f5:884a:7549 with SMTP id adf61e73a8af0-215abcf3a0bmr12342972637.41.1746906161432;
        Sat, 10 May 2025 12:42:41 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2523e67d53sm2223670a12.19.2025.05.10.12.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 12:42:40 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] mtd: spi-nor: Add VIA/WonderMedia serial flash
 controller driver
Date: Sat, 10 May 2025 23:42:20 +0400
Message-Id: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABysH2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MD3fLcEt3itJzE4gzdJIOkRGPTNMNE48RUJaCGgqLUtMwKsGHRsbW
 1AO8IJ1xcAAAA
X-Change-ID: 20250510-wmt-sflash-b0ba35f1a3ae
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746906149; l=2148;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=/yGugloBJjOPYsW7G1LloM/bgQysm4Goabb2TS0uuR4=;
 b=qKl34F1ulpROgbhFtip/Ntb7igCmTfhWuTyH8JITUi/hXyBS3ZnQ3a4trQoLk0edNiFYMW1sI
 OdnJDEsF3tECR0psehALNSioy48Rb4R8KLLibVLCS21GuvBLfWuNryn
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_124242_898719_6550DEA2 
X-CRM114-Status: GOOD (  11.26  )
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

Add a driver for the self-contained SPI NOR flash controller found on
VIA/WonderMedia SoCs, along with the respective DT binding and DTS.

The driver is a clean reimplementation based on the Linux SPI NOR
framework, although only chip probing routines are SPI NOR specific.
The rest of the controller operation is abstracted away behind a small
set of MMIO registers and a physical memory mapping for chip contents.
In fact, the vendor's implementation open-coded all driver operations
on top of the MTD framework directly, but had to rely on a static table
of supported flash chips indexed by ID due to the lack of auto-probing.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (3):
      dt-bindings: spi: Add VIA/WonderMedia serial flash controller
      mtd: spi-nor: Add a driver for the VIA/WonderMedia serial flash controller
      ARM: dts: vt8500: Add serial flash controller and its clock

 .../devicetree/bindings/spi/via,vt8500-sflash.yaml | 122 +++++
 MAINTAINERS                                        |   2 +
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  37 ++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |  34 ++
 arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  37 ++
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |  21 +
 arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  37 ++
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |  21 +
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  37 ++
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |  21 +
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  37 ++
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |  21 +
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       |  37 ++
 drivers/mtd/spi-nor/controllers/Kconfig            |  14 +
 drivers/mtd/spi-nor/controllers/Makefile           |   1 +
 drivers/mtd/spi-nor/controllers/wmt-sflash.c       | 525 +++++++++++++++++++++
 16 files changed, 1004 insertions(+)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250510-wmt-sflash-b0ba35f1a3ae

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
