Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D4FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1yqByjhFS12NSTF+YrNrh76SeV1xqMtfaD863xK/65k=; b=DfcrKQ4BUdIpP0
	ekuAuSpZ62RITjk/aKlNlYrnyRauBEpWjXcZnNW/zR93DONVLv+DoRGQtsr/khtCRcsW8KJL/QlGf
	DNDW7WzzYg/BAJxzzrrZlBdGlKNhmDPt7CkMrnDzy/QyTN6DSzQMZA8kSSmhWfwp+wV7SMjV81+1W
	15eRRbX+qhGjEi8lHFnT4UONczkaNu5x9ir2jUyhX1nkxbLSW8a7vKjYmZAjr+KF9W+iY0CEQ7TF4
	/pSWHpm1+KgVG/8aRqJxx8DO9TsIf0Qo9l6mac8mTuqrEeyswFTZSZl2aKDn+LRGnT5SONoRsnzZF
	C/U8rFCsM/z+i4Em2Xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNFvY-001GX5-U0; Thu, 24 Feb 2022 15:21:09 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFvW-001GUI-LP
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 15:21:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id r13so5104024ejd.5
 for <linux-mtd@lists.infradead.org>; Thu, 24 Feb 2022 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDzxu9MW9GN24hu7QhGn/9ENmvqmJvE90rNpUC/IGqQ=;
 b=bWWYO56F/YxJD6tFUzcbwEeRTUFYyqTUDIbxPJO4lr3luSN1Cne8aYy0Xx0UW6tpIR
 yfMYwMBkG6FAUZfqzJkHQWf22s4ZnleKvyz061lLL66lNMjJTby8zn+6hZfF4LTYCDsV
 sNaWQ69fKfCy/JhnKGFWRcyQyYX3bjPuDgSzNOMTX0847BGcCSz5wpK4UDe63/8LIKgv
 620nro2b+yuRs+K203y1qole6Bni4830elQZ0NvO5x2ke4tdWIeuIhiI5DoriIXtxUyz
 n2RTvIP4PHKHit5jEKKxx5Q72qdzNu+Qbp8Zm+Qnh+KSrRw4Kgmd/rbeWncAnoXUf26A
 dH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDzxu9MW9GN24hu7QhGn/9ENmvqmJvE90rNpUC/IGqQ=;
 b=Dft2QnZDIbL4gjOhpIR6YA8fLQSjlzvWn5zY2d8XTPSKUfP0Jm/LE72AeZ9XFCfL/x
 uN5DEjTtb53j/KQwc5Tm4kIQdEUONh3CgEpoSqZwgz0v61AkAmd/czwGOoHC94VMUfin
 6FdMHo1ou+XylOFdP/xQQieIVQM13oDpHQ0WxwYLivR6JS3rP/VsUlRaV1hK5BNHba1L
 Fpaydp6CJk6oZV7koltFziy8EyjXdt2HWdpMUl96wcS65wWpBMdYgrn/aCdHoypYf3Bh
 60WKZNJaTQ8tnp3Ef2VKKKzqkaBwX5VYpaSzM+J8aD2KaUssJucfQ1zf8LwP0IghYr/D
 CMsw==
X-Gm-Message-State: AOAM531Hrm4evYQx87NGJv2lhpZUsVxWJJaaZ+obDE/vJAJvaf6xWYbM
 bGHgktnjVjkE7vn21dYSS0A=
X-Google-Smtp-Source: ABdhPJzP10VTxduFkk4DgmEETaIvYLFpyRV0di6RWo1xpAOTL+1JJ7XKY2ja82kfIWDpYIYkl1C+oA==
X-Received: by 2002:a17:906:1e94:b0:6cc:4382:f12e with SMTP id
 e20-20020a1709061e9400b006cc4382f12emr2663115ejj.482.1645716063617; 
 Thu, 24 Feb 2022 07:21:03 -0800 (PST)
Received: from Ansuel-xps.localdomain ([5.170.108.128])
 by smtp.googlemail.com with ESMTPSA id x12sm1501980edv.57.2022.02.24.07.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:21:03 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC RFT PATCH v3 0/2] Add nvmem support for dynamic partitions
Date: Thu, 24 Feb 2022 16:20:41 +0100
Message-Id: <20220224152043.27777-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072106_726603_19716DE9 
X-CRM114-Status: GOOD (  21.33  )
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

This very small series comes to fix the very annyoing problem of
partitions declared by parser at runtime NOT supporting nvmem cells
definition.

The current implementation is very generic. The idea is to provide an of
node if defined for everyone and not strictly limit this to nvmem stuff.
But still the actual change is done only for nvmem-cells mtd. (just to
make sure) This can totally change by removing the compatible check.

The idea here is that a user can still use these dynamic parsers
instead of declaring a fixed-partition and also declare how nvmem-cells
are defined for the partition.
This live with the assumption that dynamic partition have always the
same name and they are known. (this is the case for smem-part partition
that would require a bootloader reflash to change and for parsers like
cmdlinepart where the name is always the same.)
With this assumption, it's easy to fix this problem. Just introduce a
new partition node that will declare just these special partition.
Mtdcore then will check if these special declaration are present and
connect the dynamic partition with the OF node present in the dts. Nvmem
will automagically fin the OF node and cells will be works based on the
data provided by the parser.

The initial idea was to create a special nvmem driver with a special
compatible where a user would declare the mtd partition name and this
driver would search it and register the nvmem cells but that became
difficult really fast, mtd notifier system is problematic for this kind
of stuff. So here is the better implementation. A variant of this is
already tested on openwrt where we have devices that use cmdlinepart.
(that current variant have defined in the dts the exact copy of
cmdlinepart in the fixed-partition scheme and we patched the cmdlinepart
parser to scan this fixed-partition node (that is ignored as cmdlinepart
have priority) and connect the dynamic partition with the dts node)

I provided an example of this in the documentation commit.
In short it's needed to add to the partitions where the compatible parser
is declared, a partition with just the label declared (instead of the reg).
Then declare some nvmem-cells and it will all work at runtime.
Mtdcore will check if a node with the same label is present and assign an
OF node to the MTD.

I currently tested this on my device that have smem-part and the
gmac driver use nvmem to get the mac-address. This works correctly and
the same address is provided.

v3:
- Fix warning from bot (function not declared as static)
- Updated code to support also node name
- Made partition label optional
v2:
- Simplify this. Drop dynamic-partition
- Fix problem with parser with ko
- Do not pollude mtd_get_of_node
- Fix problem with Documentation

Ansuel Smith (2):
  dt-bindings: mtd: partitions: Document new partition-dynamic nodes
  mtd: core: introduce of support for dynamic partitions

 .../mtd/partitions/partition-dynamic.yaml     | 56 +++++++++++++++++++
 .../mtd/partitions/qcom,smem-part.yaml        |  4 ++
 drivers/mtd/mtdcore.c                         | 56 +++++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
