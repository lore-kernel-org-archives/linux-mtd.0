Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEFAC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Feb 2022 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mPk/4bMOzzaUfp7z8F7OWoy5vBL1gcBYrtC9yTpJjdI=; b=cD6eTQj7c0oNbD
	zqf/iBJVd6oMcF+Z1sumT82+/gOvnkjlCWHOeNw6TqVVvUgRG3KLB0EId3GWQOp8v8pRznZ6PR6BN
	ElCrld6pEu5151kMlhweyopiLM0uJGBhPkXhWD+c/juxEx+bH25LNOFFjbQODkCO7gKZXJEQQyyTT
	OxWSUUJTARH0zVZHK0aI8gxtFaAx1uTdXwqtxbhUwfBpxhO7yy9/4vid/nVjzK1UWDCiKnUL0fu8T
	vlR52U5vJLS7JodMs9YKXnbTdC2zPNeSPaCFeH1Z62RTVPogOXn7HKqEXo/BjWGnrI9SedMVEigCB
	cQiIeAO8d+s43oyVsVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLqBg-001zyT-Eg; Sun, 20 Feb 2022 17:39:56 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLqBS-001zt5-5J
 for linux-mtd@lists.infradead.org; Sun, 20 Feb 2022 17:39:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id p9so27358114ejd.6
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 09:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPH3FD4ePxH+PTr049+CngqXpJgQNQebbqg3r/4ZGH4=;
 b=FUKpDsiXx/uq7vGjNWd8gYCoMWWuhg/1Lhk0bOT/1SN8JBm9AiQCzKZYAah0onvFOc
 965b/llGxgPteDOTmdbPVwdGIh6lx0XqZkSzTOa7+3z9itE25CO/P87JilBqfAgnpbvU
 jDKlUfoSUnIaWuaaZ6Dxgn0uaJVqzoLLib0TGZ5pkUaxFF9F+OyMVRSpac4JL0iWPr95
 O/DkDM7q3V1RsGj3pee7QFQkm+HYmRC+2qdBSOUhZvadSL03MmIWW9hklNEdYt3myiGF
 ATNQCIxIFjHUZlcBZ9TKLkVAJ38S7GquPAonl1n7nWOFNb2GBiJfzyKCECEEoBKS2Ctf
 2oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TPH3FD4ePxH+PTr049+CngqXpJgQNQebbqg3r/4ZGH4=;
 b=INK/l/TmpVf/3GFDXKaPFY6zzzaLpM5qvW8g5f+YQ6Jcs035Eh3gVvNxJOZnJV652M
 mrmbtWuIL0lWVFP0r2qT8m1k7CkPfhcCAQ1n0P5jF7EPL8gi7IfLQwOYYPIwVIEViPnE
 Ik2IeJ14APjp+W4bcO019jDYPdNsGzNmGqAGLSrHAehE/IlR3TTz+uOhar/hRWN9VleP
 z2ZEZnAhY1l4si5Z89V2IzoWVXRw8vAwV8zlmAZC/Dg4Rq5SB8Jvp92GEMjbifeVjE+c
 HJFhVduqWKmO0d/4LMrBb0FMYhg8HkPz5RVpkp6G11gQPY5muv7R6o5Tp2930qkVX9oj
 ubcg==
X-Gm-Message-State: AOAM531yDpvIz4dxD5MKA0XgINaeeLabPg5FQSMajzfKRVpkk+ek8bBJ
 /FppKgpHSBSqbenbe1mGHlw=
X-Google-Smtp-Source: ABdhPJwByoxP5Jigs1/wk6k5yda/H0Lk4B08+KX3sL1E7wL8WAVtaFlPOto610G7lthB48q7YKNqpQ==
X-Received: by 2002:a17:907:7845:b0:6cd:f2f4:cf00 with SMTP id
 lb5-20020a170907784500b006cdf2f4cf00mr13059766ejc.388.1645378779238; 
 Sun, 20 Feb 2022 09:39:39 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id i5sm4416721ejo.188.2022.02.20.09.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 09:39:38 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC RFT PATCH v2 0/2] Add nvmem support for dynamic partitions
Date: Sun, 20 Feb 2022 18:39:03 +0100
Message-Id: <20220220173905.14165-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_093942_242341_7429E2D1 
X-CRM114-Status: GOOD (  22.51  )
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

I hope we find a solutio to this problem as currently we are trying to
transition to nvmem and we found this limitation. This seems to be a
good solution that doesn't looks to be too much of an hack.n

v2:
- Simplify this. Drop dynamic-partition
- Fix problem with parser with ko
- Do not pollude mtd_get_of_node
- Fix problem with Documentation

Ansuel Smith (2):
  dt-bindings: mtd: partitions: Document new partition-dynamic nodes
  mtd: core: introduce of support for dynamic partitions

 .../mtd/partitions/partition-dynamic.yaml     | 54 +++++++++++++++++++
 drivers/mtd/mtdcore.c                         | 45 ++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
