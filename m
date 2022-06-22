Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4035C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jun 2022 01:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8W9eXb+5qRtnNuMMcVR/5RcWJEzMFSZ4lNAATDc4yg=; b=WuWK9NfgZ6SZoE
	/IGCXQjBFgA3xXzwd01nFnRPBWUSWUY+lWPsY2K1PSZBk7BApAeLotzxpEXnk9YEtoEAIlXcwEO2+
	coJ9w8qiaeYF58ftSqTF1VAf1pZL25PqlTvBsr3dw5ZzTmJUjRcpkLfVwnOBq2N9EmXCaycZtGsce
	WHDzFbNUnZiHOdw5UfWF0Mjrhzhwo74q41pPKtBzJuefkVarFN5M8Y1SwVKv642pd6uOtMpGM5jmc
	jGm7uAu8KcGjXU8r5C0uvrJyrAY7OSUkVPV44cpDOLX7JJvDEL+pPrLksgutCJkq54L0ohOMFiYV9
	4T0GkpgDFFOTevI0g1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ote-007wtm-0f; Wed, 22 Jun 2022 01:11:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3otb-007wsd-Bl
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2022 01:11:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id m16-20020a7bca50000000b0039c8a224c95so8104149wml.2
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jun 2022 18:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uugx3RS7oxGS2ZFarjyKn4uAaMCIluxrPYwER0fWx5o=;
        b=oPQXlZOy+TuQD3tx2ScCNgB2s8o+82kcA9dOz7cdnIIeyPvsZfR0tQWEwCtYxs0jH/
         gszJ6osfTkHDh5QSPvT4sbxI99sTGTxlhbAkuUO/iDnHpLTQ6/FmXnAN1PgboTi6NQjE
         Xi/UtwXIBMS6TyptJLqjNzXKPDR94rhY+FjXw1qyRCuco0WrBy6IHx29XqdJLnzA8e45
         oftYmXCB+W5pqlCGSwZFy0QvWWBnunSp8tk91szpTFHN4H+3+Ptn7Rgao0CSPPqKxthF
         yw0gMHUG+K4/3IWd+iyh8s8Qutq7b4/Sq2BIPIYQaVmWs1P7wvr2Wl5Ab5JH0kbQJIZR
         rtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uugx3RS7oxGS2ZFarjyKn4uAaMCIluxrPYwER0fWx5o=;
        b=CCVBnhdYu8VMzl6mmW2p7vR0sIDkTn/cgAzJccf1ok9sND6ThOdUhl7ceIkYFvrZNj
         VZWkuaz2aq6t3pWeQ9dJ2O3vDyFu1dfqSJhYo58OKv+jmleLaSblltCVlw0bG8EN1rvo
         xIFHL2dFmEKllnPv0Xb1CXd4v1GweUceN/DnGShWfU63lfnbnCY+L5ACRdEdrBDAlnIW
         UjxxrwXLjx0ZKZOSs+BrMYDHrT6TeUMI/W6W6EdJh2dWVhJjvKpvQCLv89JKpgfswsxo
         gE4kEDFGrTmeoDmtEMuy5Fs5ceppTtfAC+N0odqR9pa9JdTLw+mpojq6HEaIyWdTqy0f
         W9Tw==
X-Gm-Message-State: AJIora/p38+wZrGYpBmkNL2t4eWUZAT+gNu3T01C/CfEd8SQ7t6M7/Hc
	CawFnxwDOy+np3n6AXTgq74=
X-Google-Smtp-Source: AGRyM1trL93S5hxPBvcmQwe6wXBXySM33gUM2C7+uBdjW4tLcfv1R2G0sZJFnhghWaWR2AVO0GmpoQ==
X-Received: by 2002:a05:600c:190b:b0:39c:7704:74a4 with SMTP id j11-20020a05600c190b00b0039c770474a4mr900241wmq.92.1655860259728;
        Tue, 21 Jun 2022 18:10:59 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id x13-20020adfdd8d000000b0021b81855c1csm16560086wrl.27.2022.06.21.18.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 18:10:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add nvmem support for dynamic partitions
Date: Wed, 22 Jun 2022 03:06:25 +0200
Message-Id: <20220622010628.30414-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_181103_442965_5BDC74C6 
X-CRM114-Status: GOOD (  23.30  )
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
will automagically find the OF node and cells will be works based on the
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

v6:
- Fix Sob tag
- Add review tag by Rob
- Reintroduce name support for partition
- Make the "partition-" prefix mandatory
v5:
- Simplify Documentation and move it generic partition.yaml
- Split commit and move smem example to dedicated commit.
v4:
- Make it simple. No suffix. Make label mandatory again.
- Update Documentation with new implementation.
- Rename files to a better and correct name
v3:
- Fix warning from bot (function not declared as static)
- Updated code to support also node name
- Made partition label optional
v2:
- Simplify this. Drop dynamic-partition
- Fix problem with parser with ko
- Do not pollude mtd_get_of_node
- Fix problem with Documentation

Christian Marangi (3):
  dt-bindings: mtd: partitions: support label/name only partition
  dt-bindings: mtd: partitions: add additional example for
    qcom,smem-part
  mtd: core: introduce of support for dynamic partitions

 .../bindings/mtd/partitions/partition.yaml    | 20 +++++-
 .../mtd/partitions/qcom,smem-part.yaml        | 27 ++++++++
 drivers/mtd/mtdcore.c                         | 61 +++++++++++++++++++
 3 files changed, 106 insertions(+), 2 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
