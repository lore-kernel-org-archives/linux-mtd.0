Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6258C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 12:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1yqByjhFS12NSTF+YrNrh76SeV1xqMtfaD863xK/65k=; b=qSHhgT7+l//X0y
	/fVN/y8O6kCzCDSYth0hYOcCBNfcSJK0dEMFwf01s4XYoYQkK6PcgX7k/YSMZXX3TKFMeNOBn7xcV
	2FVOmutmb1YZ9R3mqusvOICGZbAj+hpAqMeHWQWODvg8hWFHHgyerfg11ZlEfCVlH7HDA1ZRE5XOm
	iqdn4FwYf0ECP+8aj7AVPvmBL6D2mPW7/0+NFTrJ05Q58EtRl3dmviv19bYYq7jJLcO6r4/nAsxPb
	22MIz73DuJKBS2usHwU1sAOfhUTBFhIl0jfUSwPinQTz/aZlvRBsh1ld71S8o6C323dViCzOlyg0O
	XjXXibl33ziM9iPSMJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQ5d-00BFbH-CG; Fri, 29 Apr 2022 12:51:17 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQ5T-00BFSm-F2
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 12:51:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id kq17so15262123ejb.4
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDzxu9MW9GN24hu7QhGn/9ENmvqmJvE90rNpUC/IGqQ=;
 b=AHk9xNI2GrdZ+pjC2XWPm9pf9PeG3cO+US4+NvK09Z0Mymct2lnm7lYFdCTJ5pIzGf
 bOKbRk9rkzPKYQPeA8Mj52SWaVEKwyqNLYpfYVJKTAjPN91ISLakjoNqMopYtv06N1bz
 fGHT+9S4otZtcVxBalgYU4ohFChLt0FEvMeADyRqkhwZsduABGMwCzmnXDfbVRU1ZR3U
 TQODJXQxdb9CF19dSELha6IdD6EBm4f15/Th5FXudHtqXslEAnwI4RpoJ0OaPJVekWs0
 8tGU3y+hgc1EbGnotEV9yev2xV6g9kIsXrLlYakNsVR+NA7HT0mIizbNjTI3AKtzo6Di
 +ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDzxu9MW9GN24hu7QhGn/9ENmvqmJvE90rNpUC/IGqQ=;
 b=V43lghCzMA22OZurorUcGojyYDfJL2dJQF7BfGbkIBhlLGKrqF7u4claOwLuh/Gwsf
 bxOenmoThm+cn80H7kADqK60ys9XrqI6p7tMyge1ouu1Af3UTxhvzrShHq6ME9GJI+cs
 y2yLLN6MjR1Qa5GFJJHEtUMUcPXiC98WwLMk8gr2LYoPvxp16TqvxYJU5/D8geZ7Qs+h
 938ZQXow2zbqrSxTnyn0Z7jZPY9nmM6jR3onCOn+sh+UAhEW+Nd5fqmzUjTYVr7nM3UV
 3S+lQ0+Y0W7SZb+dVA+jUgFcipOEjnrKJBWE9vl38H0G4k91JQjy+AaIVGxstWuXujTW
 zU/Q==
X-Gm-Message-State: AOAM530nP81vmd6+ZIpCUgaa/LtMJcUDPnNaGh9QggftaXp8HoklDtHj
 A8Yc64wwq6amXyOhTWEMUZ0=
X-Google-Smtp-Source: ABdhPJw8abQdctpop9AbAHRH+V0cqVAgRfZ2umYQQQl43FRc1mTpnZEldM/qz76veB92TvRxDzeurA==
X-Received: by 2002:a17:906:5641:b0:6da:8691:3fcc with SMTP id
 v1-20020a170906564100b006da86913fccmr34926623ejr.50.1651236663092; 
 Fri, 29 Apr 2022 05:51:03 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006f3ef214e33sm615347ejc.153.2022.04.29.05.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 05:51:02 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3 0/2] Add nvmem support for dynamic partitions
Date: Fri, 29 Apr 2022 14:48:23 +0200
Message-Id: <20220429124825.21477-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_055107_526096_5011949A 
X-CRM114-Status: GOOD (  22.01  )
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
