Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B72CCA485
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 01:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F5/sfMXa1MzD12sCY2bBfO77BZcikOVApjWQ3BPdEPA=; b=aLkFywZV8dgMOt
	43KPaMINRabXOYtKWSIHaOlPAidV7Y63HBefwheM/ThrhQk0+WtQgO81SXzZKxPOaoutVPuPPNHMw
	UDiGPC9OANooi/Q4+ZzY+PRnMLykh9/upHTtibSdewxIkseXjWjKWBflyCApf7MoY0WDjgzvEL1aU
	P2ZvKK9f+5Xj5Ikc7b9NZA20mJ2/e0COIerBP/GTD8I6B2bB+xQXjUBwrHX4N1ttkBzB59jSwgoEV
	ZUEB1b99rdfPLLC/RBUA7xTEH36++KtRYusDOZRKzpF0mvc/vxMl+RTOSxbbNrAvOrtEmpgfbqovn
	RduxT5r122dDYqY/4oIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOJ-00ByNw-Ja; Wed, 15 Jun 2022 01:00:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOG-00ByLR-Go
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 01:00:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id m39-20020a05600c3b2700b0039c511ebbacso274344wms.3
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2022 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IPvBp9veaI5j0wgP4lRzxiv/jhtEdPHh86ZsvlYvvWk=;
        b=O7y6uYU90jqfbSNsTlB0repg3747h+1OGzpcLS4p+taxXQ5mOoROD0ZrA3BKx03zIh
         x6ic9bG67oR+Hn4CGjgDcNqHiOC1tB3JyY29deWjKNBDHi0Lny+1JVxdDL86Q3Z1rXiG
         sPYC7Ll4cn5tP5lROYF4yzgUHRrcQyeG3Gdg1dk2MNnKQnQ0Msk06mz3FXXlvWZ1J4GY
         prQZyIxlRvgnx7sJ3KxZoUp0BuehOivPlpd8KKjIo1otZ+NNY3lK2Qx/6Dzi6BMoCMtp
         JXHJ0hcQ9NB+b+WLrURFuEOXMHU0p9m05lhAWwrf609ux7FjMyOE37F2yV1z+lGaEJoy
         qNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IPvBp9veaI5j0wgP4lRzxiv/jhtEdPHh86ZsvlYvvWk=;
        b=sX7b99u0WX08MeG2U8pkFzgE93zXT6NskdD3N4CubG+rXdOfIdHIW4pV3rXOPdd877
         j3ZqrwBmk+sfVDxp+jl1RbDAwWGesiv8m0l/70xs9Js8JrV6ryivxc8vGBWKiF2fIrhR
         9dhRepZvXg3EuPUPE8LdACq7TM1M2sHQib/QREXoBwEvJF1Cidmr9gY0PrtYLY9HVF+5
         dLGp+N30qwVH+XGSNAzFl/wNMAygnjTH4JrEKKtsgYANFDh4hnmM1qTc81Jr39axAwGc
         agFpSxnIolel/v4FOCfokCmleBPD08TjW5kuWcyjMl7jheF8It8KZQdUwQwSkY2857LD
         wBiQ==
X-Gm-Message-State: AOAM530JgOfsOvASft7f0Mzju0RSUI1HziCvweHGSfuvFHk/Lwwss75Z
	lGMRLWpAZjAZAei+i1cAtHo=
X-Google-Smtp-Source: ABdhPJw3nsHmOWgcV01ICc1xywAOTPzXiduoEAOuXtfuR71IxR8yM0wuWt2OnffiABSLJTmMf3RyFQ==
X-Received: by 2002:a05:600c:a47:b0:39c:7ef8:ed74 with SMTP id c7-20020a05600c0a4700b0039c7ef8ed74mr7054487wmq.160.1655254805268;
        Tue, 14 Jun 2022 18:00:05 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d698a000000b0021020517639sm12890265wru.102.2022.06.14.18.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 18:00:02 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v7 0/3] Add support for unprotected spare data page
Date: Wed, 15 Jun 2022 02:06:09 +0200
Message-Id: <20220615000612.3119-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_180012_605606_D7EBBB9B 
X-CRM114-Status: GOOD (  21.52  )
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

Some background about this.
On original qsdk ipq8064 based firmware there was a big separation from
boot partition and user partition. With boot partition we refer to
partition used to init the router (bootloader, spm firmware and other
internal stuff) With user partition we refer to linux partition and data
partition not used to init the router.
When someone had to write to these boot partition a special mode was
needed, to switch the nand driver to this special configuration.

Upstream version of the nandc driver totally dropped this and the result
is that if someone try to read data from these partition a CRC warning
is printed and if someone try to write that (if for example someone
wants to replace the bootloader) result is a broken system as the data
is badly written.

This series comes to fix this.

A user can declare offset and size of these special partition using the
qcom,boot-pages binding.

An initial implementation of this assumed that the boot-pages started
from the start of the nand but we discover that some device have backup
of these special partition and we can have situation where we have this
partition scheme
- APPSBL (require special mode)
- APPSBLENV (doesn't require special mode)
- ART
- APPSBLBK (back of APPSBL require special mode)
- APPSBLENVBK (back of APPSBLENV doesn't require special mode)
With this configuration we need to declare sparse boot page and we can't
assume boot-pages always starts from the start of the nand.

A user can use this form to declare sparse boot pages
qcom,boot-partitions = <0x0 0x0c80000 0x0c80000 0x0500000>;

The driver internally will parse this array, convert it to nand pages
and check internally on every read/write if this special configuration
should used for that page or the normal one.

The reason for all of this is that qcom FOR SOME REASON, disable ECC for
spare data only for these boot partition and we need to reflect this
special configuration to mute these warning and to permit actually
writing to these pages.

v7:
- Add missing nand_cleanup
- Fix wrong error return
- Actually implement suggested boot_partition check
- Remove unnecessary comments previously added
- Add missing new line in dev_err
- Reorder structs with suggested order
v6:
- Add additional comments on boot partition check
- First reorder struct then make change
- Add additional changes request from Manivannan
- Add review tag for dt commit
v5:
- Rename boot-pages to boot-partitions
- Add additional check to parsing function
- Rename unprotect_spare_data to codeword_fixup
- Add additional info from Manivannan
- Add patch to remove holes in qcom_nand_host struct
v4:
- Fix wrong compatible set for boot-pages (ipq8074 instead of ipq806x)
v3:
- Fix typo in Docmunetation commit desription
- Add items description for uint32-matrix
v2:
- Add fixes from Krzysztof in Documentation

Ansuel Smith (3):
  mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  27 ++
 drivers/mtd/nand/raw/qcom_nandc.c             | 310 +++++++++++++++---
 2 files changed, 287 insertions(+), 50 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
