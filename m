Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106F7CCA473
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qNLFq1/2ejwX9HDOz6jmrW4prVsHm7DjUXcWtNboDkw=; b=AmUwMWnk4LSxbz
	LaFoFOgnJCA4eqEKemicPXrGhn2Q27HO1kWHOh0IVBTHmZp+zVGBSjOmKs0uFgvu+3dbKrUifIpvI
	HRo6eI5+Z41QwaLqpboFyUzsZ3VNmKd/56wd7r9vh0TA8p4gpN+VD+tt51t/mPznTyTL65MdlLjxS
	QTn5Sm5YK0ijle7aOHsHnh1b2yMzGHVa9qVEo8o14pJaT/0eADcuMXuKIybQ0+Auz3C3Ug+WEEjK+
	Lj82XDOczjEFJAcLYV3ahVJnPzoxaWj/jgG8W7ATveLoTdOATNv9rCYOhvt93Ug5+A0xmweB29fFF
	0GrxFAofwh0c5AgR7thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERO-001jfX-NM; Mon, 06 Jun 2022 15:14:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyERH-001jc1-De
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 15:14:45 +0000
Received: by mail-ej1-x634.google.com with SMTP id h23so18499386ejj.12
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9WxVflAaLaQGVLZDTYjr1bfsD9KjPcYDpao0PwOqVUc=;
        b=NX12efPEOw77FAgI0EpL6qcSUxPue8/LVvXK9QbgUpJVaK3qv88l6h2tQZVbnbB2yu
         GkUeXNMCDyVgA20UpT/iVnJJh2DbilU2A4w0kZ/5TbMWW0dHYHtOE/+hf/TIyZtvkQvT
         ZrNjULLfeEcahHtbhykUyy3jAshh3eZ5fvFT7Q5Zo6YvZtT2e+sYo6064RPK035zjsTP
         fgggUgPCL2iVeSboRaM7hx1BUvODAzevS127njr+aQ38c/S5umEU7holMW9+LOuB2/o3
         sFacaOC2y8MBEVOZKS/QDowghmgaZfRvZdvaS+F2dsJyzjwB4AmGiy3fGKC1atVySPLA
         KTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9WxVflAaLaQGVLZDTYjr1bfsD9KjPcYDpao0PwOqVUc=;
        b=45ozxfC/G41eMYOVfEklI3MKeF3x30lhxkLs44h9MHt/KZMd/cAmG2m1hQWZ8MC6xO
         3NXTfqx0m+KNq8WwxXlZwEvWmhoMRv11+ZyIzJ92ZwAObWdxM6QsFg7xPkVV6C7MSaHH
         cTs+1rVfePYqgKMEsdWTv7rzonth1fGsPEs4/JRNpIZz3o7JOZV+j2+TAcMDNRrUXDi/
         zLBYFjB9lOQWmtF2hJMI50/+nAw3Vt9k7pMt6sUIdSnYn54BCU7R+g0X5xb6Huhbdf7C
         xEjp4stXKfZs2PlJ3FsilWhbtF4/pzSdynmHluPzVHhwxb1j27qOM9rhq6sbhasi9piN
         vn5g==
X-Gm-Message-State: AOAM533Or8FhStPPK8zRCiMiAbBUGNfyiqolsh012+OhVzvofmlKHQc4
	UimzMhkmrS7jkPzz/g1YMIk=
X-Google-Smtp-Source: ABdhPJzC2ZhN+QbDcpWKYpFgwCGWZ7LbwPJodBLMvxR8aDpwq5PrY9LNFc4iVQOSLjC5nm14Djgxuw==
X-Received: by 2002:a17:907:608f:b0:6f6:1155:99ab with SMTP id ht15-20020a170907608f00b006f6115599abmr21289023ejc.306.1654528479498;
        Mon, 06 Jun 2022 08:14:39 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id be5-20020a0564021a2500b0042e09f44f81sm7494001edb.38.2022.06.06.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:14:38 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Ansuel Smith <ansuelsmth@gmail.com>,
	=?UTF-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add nvmem support for dynamic partitions
Date: Mon,  6 Jun 2022 17:14:14 +0200
Message-Id: <20220606151417.19227-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_081443_532400_041D66D4 
X-CRM114-Status: GOOD (  22.82  )
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

Ansuel Smith (3):
  dt-bindings: mtd: partitions: Support label only partition
  dt-bindings: mtd: partitions: add additional example for
    qcom,smem-part
  mtd: core: introduce of support for dynamic partitions

 .../bindings/mtd/partitions/partition.yaml    | 16 +++++-
 .../mtd/partitions/qcom,smem-part.yaml        | 27 ++++++++++
 drivers/mtd/mtdcore.c                         | 49 +++++++++++++++++++
 3 files changed, 90 insertions(+), 2 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
