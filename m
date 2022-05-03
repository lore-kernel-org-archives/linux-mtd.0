Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F54FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HXMar5kHAOC6w6UPn191Me8z3fdE8n2nMAsHNBydbKs=; b=egiCCEaopLDRY8
	s7ec3SJOiyDN33NhzSIxPiCqtjPUpatJnZgQFla8MnwUBBTNsFuBLSm/22UKHzP75twMAzvvOhlFV
	vWLDdXKvQtYfhOWqKYhFNT77LqKvGfs+CxqFKehPAkK+brGIvpWlv8nECGv9zY+kKT/EakkPJvCRH
	TVk17ljDoH+J+sULjzINkSPj1nYazS3dzL1VCNP3z2L8ri85tk/xW7tWgE9ecOn0wLP+GLHfXJc7s
	XhJtE1rG0EhKZtMkNiX83AtDWI7SO+TrqlzQGfsgryk5zOx+OJAeH/kXQ/IeVeqbcH1f51aVJMk67
	7Bi4ON3pYa1AV5Hg292Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlugY-006ZCW-Qr; Tue, 03 May 2022 15:43:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlugV-006Z8U-TF
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 15:43:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso1610706wme.5
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDRsFXOwSjFyheRf7X8Ao9DHLOFKA24q9h+KTiwDV0I=;
 b=ltwqrEm9oTa8rQE4hyHa3WE6OHpLPVxWC0GPdC+pt5u+pcdgfiXouVFdeGxLhCLcPW
 ZrNdvzIuMJA4ipYxZ78e1va4fhIDbPq7Yki00W2CpHTx8Ybs0Eu4eHu5I/SC5sZazUgM
 8Pt1NQwJf/c+spyJ52x+bpCrkTZzyA583vwVEWJWdHMMVzq73hZaBcESP+CHkj26wXf6
 uMHZv1EKVL0GoYMqFPMbPPbk6/T7gVd+AEEEBZM4cpZbXq5buc7JhjuEjfnTFuAkTOTc
 O/2IEC2C4Ih14963WwgQp5B+ed44pAc6jWbMzruU4uSuu9wowL2DFGTVCWW04E/o2RMD
 w4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDRsFXOwSjFyheRf7X8Ao9DHLOFKA24q9h+KTiwDV0I=;
 b=5351hbRpzn2ZRgpj4nfXjEl63KoaaEbuheWvqhR933eNJgAPM6RmSnLrtK95JvOzOk
 f5IxRUx8F5AJlVdzazIleoaTBCBiy8MwOfoCSyTjOFWfaiOX3a1RTO75uaH81YDt5hQg
 KRkZTYcq1NR9amPptnHCwKnZ19tWDb+73RYrnlqJTXUygnqe1x7xP8aEjKPdLhdO1bu8
 WsjVNpDrSFz1/k991NyIHssfF311dR//GZJHpOyIHEpfa2m321h/YaAU22cg5GCYZV0O
 pSqdO4RSB89M0qCYiwYEMODOHzFrClsi8uTebl2SKYfZrbyYKhfzcwX10DP8zo9TRu7M
 PHdQ==
X-Gm-Message-State: AOAM533z2DpcSWfckg+neMkxcyUXYXMmtu0IX8c32TqxYHjaGO/3eoV8
 TZSMpRMVdsBVZXFIwV5auHs=
X-Google-Smtp-Source: ABdhPJzppyR4INFUGT75DtjAs3oxm7d+Z9BwGCumSgCdVVuDEp5F34+RwxOinhQoVLSlOtY3aLLd6Q==
X-Received: by 2002:a1c:ac44:0:b0:38e:a7df:3179 with SMTP id
 v65-20020a1cac44000000b0038ea7df3179mr3994322wme.61.1651592607267; 
 Tue, 03 May 2022 08:43:27 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
 by smtp.googlemail.com with ESMTPSA id
 l20-20020a05600c1d1400b003942a244ed1sm2254912wms.22.2022.05.03.08.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 08:43:26 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH v3 0/3] mtd: parsers: add support for Sercomm partitions
Date: Tue,  3 May 2022 15:42:54 +0000
Message-Id: <20220503154254.2339744-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_084331_968336_EFA39C61 
X-CRM114-Status: GOOD (  13.35  )
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
