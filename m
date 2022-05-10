Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5468C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OgR2eNzWKKNrAujU6YNcAJIZCKm7jbEgNFxczHAGAc4=; b=ltMp0+/uUd6Nhp
	zbPRY/cNI6qwqhTSk25HeBlHyoV8EDWh9IoAJidOWRjb+CLYnrbJA7cYSH9Ke6m16gy3N6x8aHBVI
	5n4pTSJ3EBW8F08jbHk25pKRq99JIDB3ytPe/u4AMDYRoErx2ghqy1hyakGWxrS9u6l0/QQDHdXVg
	nB6kKWP4OmzFMgAfZ9+1VRIEJfC23XY7M7/to4gpNF+N8JVjtwong4ZlOJ+8/6SKsJdV4AO+8lkLB
	qFCUGzlo/hVpyOf4wqgaTWN1VkXenTDb657Z0SQZS/olZ3YbVjmRuw78spVm8eF6m+yLAilwzKo2n
	fYgHgkTMprjueIH8A4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSZz-0030vz-Ce; Tue, 10 May 2022 16:19:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSXh-002zen-QE
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 16:16:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d5so24531096wrb.6
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 09:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jr74PyVWD1/63U5wp0lr9an8U2SlYbja1K4X3Dr9fys=;
 b=IgcA7J7Jc9zsBzAOhysXl1fXR61GQn8h7+YdC9OPT2G9+lE/W7ZBjdq1k4tXjMOzg9
 a8Bes1nCJs+0aPsq3i5m0iPc8rhlaIDKbdObNi3oOeg0HcL60MLEgCN6fQnq4P6YHDrJ
 kLWWGzAh0AGqfDbREsb3dRZf/4UpucvW6AHvZcV8zI/G0BEQPBkd3icGz2/N0dpFb7cF
 odl/uuqP9Kl2ggkmemp6PJSje+gMxX/GiDjs3H9BNxUwrwL0C6+GwQWiE2AZR0ovMq8x
 NL/eKUzc9Nrjld8KkJZ5ZdLs0CqbNeRTvUa1nhG9yrZsKRulMo2yLSOwguf1myPnzBtP
 A47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jr74PyVWD1/63U5wp0lr9an8U2SlYbja1K4X3Dr9fys=;
 b=lSOAxyR1ybMwj5b+dLNyTMya59rqZ/xsZ4rqHfaC4jPnPFNOpdcNeXKHSER4SRaeah
 0UaRtE33HBxU7Eqn91Lh09NGVcgvvMX6IE8sFyjzxgqkMooj2pjYEUeY3T7UuGuurXKO
 B4YJXtneICMOgRypiIDSYQIw62GYSjf4wIJIhDLEZDzPoVdqcXPG+8IF1BuJilABq1X6
 lFpsLG3ylZMgbWCVHRw7fm7WPC3mJxQNlwPvt73B6GZAGOu6poSTuZOoFNP67SRp5Jo1
 yNh+Bcamhh6zVOWMfP4/zAFk09odwCe+8IudZFiXzi8iiTduRUesqKDgYkng/Sa+GmYU
 jUPg==
X-Gm-Message-State: AOAM530xQmcJbpZXMvS+E7dAsfuyttFTi5oXPpPr4uED9IdeOLzKC168
 CCYi9ucwER9iU7a6ldiBhOw=
X-Google-Smtp-Source: ABdhPJwbe9yD9HIi2JdlrOrApRC25IDTLiNLpBXgkqAdLbkF28y22Aa6nOfVTo/1FE8z4RnPa0BAYg==
X-Received: by 2002:adf:f0cb:0:b0:20a:ef39:d42b with SMTP id
 x11-20020adff0cb000000b0020aef39d42bmr19894165wro.8.1652199413461; 
 Tue, 10 May 2022 09:16:53 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a5d4309000000b0020c5253d8f0sm14634833wrq.60.2022.05.10.09.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 09:16:53 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH v4 0/3] Add support for Sercomm partitions
Date: Tue, 10 May 2022 16:16:41 +0000
Message-Id: <20220510161641.20655-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_091657_908483_5FDACA53 
X-CRM114-Status: GOOD (  13.75  )
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

This patch series add support for Sercomm mtd partition table parser. It's
used in some Beeline, Netgear and Sercomm routers. The Sercomm partition
map table contains real partition offsets, which may differ from device to
device depending on the number and location of bad blocks on NAND.

Changes since:
v3:
 - Fix commit message of the first patch
 - Add Reviewed-by to the second patch

v2:
 - Fix mistakes in dt-binding
 - Add patch for new vendor prefix
 - Add vendor prefix to scpart-id property

v1:
 - Add dt-binding in a separate patch
 - Remove redundant braces and logical NOT operator
 - Define pr_fmt
 - Replace kcalloc by kzalloc
 - Use of_get_child_count() and alloc big enough array before the
   for_each_child_of_node()

Mikhail Zhilkin (3):
  dt-bindings: Add Sercomm (Suzhou) Corporation vendor prefix
  dt-bindings: mtd: partitions: Extend fixed-partitions binding
  mtd: parsers: add support for Sercomm partitions

 .../mtd/partitions/fixed-partitions.yaml      |  55 +++-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/mtd/parsers/Kconfig                   |   9 +
 drivers/mtd/parsers/Makefile                  |   1 +
 drivers/mtd/parsers/scpart.c                  | 240 ++++++++++++++++++
 5 files changed, 305 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mtd/parsers/scpart.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
