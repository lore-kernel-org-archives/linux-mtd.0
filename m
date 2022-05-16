Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85143C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L605F7BFK2/mfHxFnKlnwAonzE63eQi5WD2XBQFqAPw=; b=2JmVQLVbHgqnLQ
	VUN6OvJAs7ClweTWOHldwZm+cK1hgArNsQuvZenuVLLXLxzwxYq2NyQhQSzqTj63BKy3VSYYkNYRo
	3pF+rDpEcMFXjDHhgrsHotjRMO7KZN9AybtnS6W1WpFEBSPsjFvUOiC4SWW7GQVgrkMQdTJmJQM5Z
	hb00/V1ffVYB3gIUmSqXUgIohnZUm876Or9sGbx1Iw5zRx945YPrcm+BlodU2FP4OJrix3r+VUWAN
	0fDweabNkImB/6VuyOyfy4gwxnqcVedOnAFZH0ej7/GAgW1Tr00Ngp+MiSqmYSLTx4M+TV3XAOCxm
	M3Gv4JrKysRXxXY3BPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqcOw-008ZNf-JZ; Mon, 16 May 2022 15:12:50 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqcOj-008ZGR-3j
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 15:12:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w4so20936541wrg.12
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1FJwil/7+XIwiXsq5I+6Eb/YvE5VJgEZyQaNqTaaDc=;
 b=I31xUdj8VH0Q+b9sUcm9wcgk9wZYanoUdZTbi6PvI39lfkD62Dv4vFTs2lST2Dl0Or
 3DivGVQ5+AlKvo8YS84BZB6bPxiSdnZ0exa1aAELLQNL0D7kWNQigKEirWEyABRAaXBi
 4GEZ7APvHtcmd2OKh6lQw8vWaEU+q9Feg0I3iY9dp0hG4IrlZCVGh4oc9Pl39bU0bx5j
 eMsvvzdN1eu/Tcq0lRCdy+f0mxSZXoOpvoVNsyooPX2IMZO8T61ccFZF4V9NmerNyLHK
 xNqJxaHKI//jch/jR7OZx8rFFweG5kWW9lG2AzRIfvqBbh6ZriMK27D1PEHJeR1lEq/x
 gzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1FJwil/7+XIwiXsq5I+6Eb/YvE5VJgEZyQaNqTaaDc=;
 b=MANYyhgRUW90qIj++nMBHvz0KKOKdvXWVj8TwEQH+tigftIRQzA8h3eK0zpfOupgMK
 LkuVzCqg29sLVg5gXcD1O3Ja+yhQtjjIw7q7T03r2/yXIeBzrSGfmUC4A3gbHV4UTqOQ
 Q1x3yN3GnJgikDsMn3Kx/awwT0fHUxsQJQiWtSTZnumfX9npLMpgHwbqmxABcAIuETPZ
 d6O/lqQ04OPBH5atKCJVT0Md5aI/Ba4SCrgTBViVd4ncwG3DUJzMi8M1trUla/ImkqB1
 ZRS4g32her8Qh8IBbyokNqM9Qy5lVPRh8uXQJM4gI2uC5knRSt6wmWKShszUuP2XkUBy
 pg7w==
X-Gm-Message-State: AOAM530nhpwF3n7yDIr3MjwUb87by7xs8j5RVhqdvsgq2M3ElQSPYdGo
 uw3P1anrJ229fXIoSf6bb8MbJlHXENIHz9+1
X-Google-Smtp-Source: ABdhPJxuqO1uXReP9VrJqtOoLvpX21uGjiDIi805z04XmYH3Q+a6sHOZfKCJaag+PCEz7vqDj4bhUg==
X-Received: by 2002:adf:e195:0:b0:20d:110c:b890 with SMTP id
 az21-20020adfe195000000b0020d110cb890mr1657865wrb.232.1652713952708; 
 Mon, 16 May 2022 08:12:32 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
 by smtp.googlemail.com with ESMTPSA id
 bg33-20020a05600c3ca100b003942a244f57sm8962540wmb.48.2022.05.16.08.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:12:32 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH v5 0/3] Add support for Sercomm partitions
Date: Mon, 16 May 2022 15:12:28 +0000
Message-Id: <20220516151228.885222-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_081237_187577_66C6F190 
X-CRM114-Status: GOOD (  13.19  )
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
v4:
 - Add Acked-by to the first patch

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
