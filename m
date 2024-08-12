Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B258C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 04:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pZheC3DmRo2fQtAyHS4FHbFDlgIh+xKe0LsWiILBgRg=; b=g4as1t6iDYwYqd
	Xo0AguX+Dtqtgizju/12RB0oRbmWq/MR84Qw06xNs7oXAh/6JAl8RLwE+sWUTPu/LmlwjMMq5sJHK
	JOF+vwISQBH0M84Tcf9sG1jS8wBoZsIuZlx99iX07UcF4VOjaF/zDfSJMWPdqHXMBSEE/aqQEcF/J
	rUt+BFYh12ZCiSqi2vI4ADRoYpyF84B+jS+m4Ddv7PhGYOcvO+HxEvfe/E1OlsIH37nHTzMUldJR+
	pGvAeIXd3RHfpq/UhqxwAsH0o7nAsaG3Ox7dYhyt92qxogRif1wpZ/PQngSgfh1vhXTZDzphxHL+4
	yzb4hmw0p0uoFcVqfhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdMSm-0000000Gpp4-1D1k;
	Mon, 12 Aug 2024 04:15:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdLIh-0000000GlDF-3mu3;
	Mon, 12 Aug 2024 03:00:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fd66cddd4dso38009625ad.2;
        Sun, 11 Aug 2024 20:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723431650; x=1724036450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvNI9UxKH6qoTzl3xKSTSvJHZCm2/riYJHczBzxBPJo=;
        b=LOqGJkjYgoHY8OF6xeTwX5UtVC9Q0rbMjX4qV3fppaQfqRnIIewPaD2mC0MOyDL6ru
         U10JvhQj2UJEUYDn6/wzxuzYkfU+o8sm8UyGTmf8jfQdTWvo9j3MdLBJ8ONC01pKPOe+
         KTwQqik0yHFCSeac6bO7ajAmQ7eh6ozdDCLb4rwi6GrDWUqW+FqDXf61U81Xa7H885BX
         kTHOqfHiQ5398ianAZSHCVklXKdoslO0P15htLBUcACGu+EHmNn6rWiY+WaVKGxd9RsO
         12M8aHlmxmeCZDB3syDh1qyBj5cPrKI6SHRDA2RVaScPF1+ph2zWqPSn5jPm5VzdPETw
         YBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723431650; x=1724036450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvNI9UxKH6qoTzl3xKSTSvJHZCm2/riYJHczBzxBPJo=;
        b=k/+hXpFCsw4U7BsXctxj/En85fsX73OKoWqi5isrS6wwCJgkH8VXjLvP+S64z8Y5HE
         Doll9+1JqQyi7qTkIKWKsHUXNZN7291QhOKL3X9f6z/1uU+1Y8qQJYSqvi6BnK7QwQL3
         YNzMlyfolF80ttMIbtoP5aUQ8+XbKMt7Jo8zfqFOBdBX0SbYDkBm/tG3BaE7vKTnZ99e
         HFIQMWRu/SM8hVKrN42hm2E5oSle+teCqtDtahfEDHI1jHBL2R3/uKWCoAWFo8l8xt8p
         9iHqMWyjfhrgVgD93I8465ETpkUbEvbxIJNnSjg2tuE4gbKFrdHGrk0dCfb6AS2X1xDE
         SSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQOR8aKbp89PIM+QAdj5qYUryxefGcV65DhQRO6Zdq2/PrW7Ar9BOOotRZcWzvByapLtQFPmyqHDQJaViv58IzHtKqabpHXpJZZUUnA==
X-Gm-Message-State: AOJu0Ywj7pXMywY7RH9IwZyoPqg7W/eipKsErb4w6vskXwgm6KqiTN6m
	o01sFXDsgZIwQB53dCa6L5AfNsFSeuaK8927yJQkFoIBy8b5SIoz
X-Google-Smtp-Source: AGHT+IEJ8WTy8J8fye8zaROoWmQq6+cN0Kjc/PExZ7qxH8LD7+eVyHDYBQi9qAS7vBp9rMYvHruCaA==
X-Received: by 2002:a17:902:ea08:b0:1fd:9420:1044 with SMTP id d9443c01a7336-200ae4fa836mr117585105ad.16.1723431650367;
        Sun, 11 Aug 2024 20:00:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba00f73sm28047105ad.201.2024.08.11.20.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:00:49 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 12 Aug 2024 03:00:43 +0000
Message-Id: <20240812030045.20831-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_200051_984518_4FAE38CA 
X-CRM114-Status: GOOD (  10.23  )
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


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   97 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1109 +++++++++++++++++
 4 files changed, 1215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
