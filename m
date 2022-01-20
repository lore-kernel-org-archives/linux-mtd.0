Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2359C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=atFOplvRyxtwvuK2niTMqM81Il/SnMBmcXKQVEyG6QQ=; b=pZLoxBg0yhf3G8
	tLhlIGR3o3HZpbA45bg1z+oN1Ka0A3sbeDylA0G7T7BVVfXOLkDpTDfMVco5cRXJSlVDn3yQrmmKL
	AjApe9JTFlHXa92SyyRh6UZJ4NG2zdyWhiqEmCZ5odf3cfNTJAWKQI0f86hE/bLmC6x2MVnf28AhA
	uXkT7wmvzcr3RlE7dRMbHyRv9a5dW+FPZeN+33SXuJjGGo7xuXv8hL0d6qJ4k1KScCqllp/73MtNq
	EEk1a3Wd1yhX4OmowsG/c02wWjv1bkgVztx39nLytRaCI6qwAYKuQEgdNaIKeAAEY3K/YcuyJGKma
	ZZo4IKRbSazT4SXeUviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAe0o-00D7Jt-QM; Thu, 20 Jan 2022 20:26:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAe0j-00D7Ik-Qa
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 20:26:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c66so14368414wma.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jan 2022 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKMBCT6uefz4F0EnrrHNFruysGqn813NuCy3BVSBJy8=;
 b=oaOboOEzXdyt7184bP/qpyy5y4XslPheUaKT+HdPPw+XpnXpLTS4W4ncK/9lxDjfTv
 frFmqn0lZuSZSWVzSt4Mp5hXMyifFx6QGr9unt5RYGDWD/kkojjaRudZNDo5jzMRIlsw
 NGLmldivINsJ/+Z23sLOouNIQDSgVs7gsLpEcSKRxJL05VqSfeYj415ZDt1iIoV6xS0/
 q4GI2KCWWJrr95vqD36eaL/M73jZ0N6pfjvUjhczepa52AZ99PfP+WmESbJnSSu2zDfr
 NJ27qlMOuF5n9TS1zEz0Fi8TWNEmgcryPsbBuOQFSAH62jj/tZsCQ5VoYwc2FeQPXDPR
 QHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKMBCT6uefz4F0EnrrHNFruysGqn813NuCy3BVSBJy8=;
 b=nsDiaUppZZ6RcIWkaO8gQOeJFgy2rXF8L7zGX64AivBReUwlm0li0szdReNcNpAJCi
 gxkGcyiGpWQcJPgu7BaolUG2DgUFw4dpLyxP1PKpuMtT2IgTtYA8gmqAn8YobpbBf49o
 ujPoZkmqshEPkfp72efb0lpr3kaVuB0+kBWDNLd6+ucX1nluQhNR6vejFgoa1ltcd0Dv
 t2973KNGpKB6CYV71Wiygi7uLYHzwhVDGUUSduWpPhVPnU9SPbxpe1YtslKBbJ4+wfjk
 ozDwscjO5e3BWF2rXXrCOK57ILi7Lj9LQpChI94ysqLGER6Qp/eBfqdu1pe7GPmQicg+
 rEpg==
X-Gm-Message-State: AOAM530Mwe55UbVA7Gq+sb9CM36xC3pVAQI85aLlFjw4dCBvsK5lCkef
 lz93ruS8B8Th3nUfIsdUtgA=
X-Google-Smtp-Source: ABdhPJx6xaxLeSbnTVAitX4F6ySfZBpR8G8aEO0rVX1YbrMZhqMfm0gVQp8Vl3IN9rTgYlL2V9MMTQ==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr688260wri.483.1642710379720; 
 Thu, 20 Jan 2022 12:26:19 -0800 (PST)
Received: from localhost.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id n11sm862919wms.3.2022.01.20.12.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:26:19 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] Add nvmem support for dynamic partitions
Date: Thu, 20 Jan 2022 21:26:13 +0100
Message-Id: <20220120202615.28076-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_122621_888881_AF018795 
X-CRM114-Status: GOOD (  25.48  )
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
make sure) This can totally change and be limited to restore the old
mtd_get_of_node and add a function just to fix the problem with nvmem.

The idea here is that a user can still use these dynamic parsers
instead of declaring a fixed-partition and also declare how nvmem-cells
are defined for the partition.
This live with the assumption that dynamic partition have always the
same name and they are known. (this is the case for smem partition that
would require a bootloader reflash to change and for parsers like
cmdlinepart where the name is always the same.)
With this assumption, it's easy to fix this problem. Just introduce a
new partition node that will declare just these special partition.
Mtdcore then will check if these special declaration are present and
connect the dynamic partition with the of node present in the dts. Nvmem
will automagically fin the ofnode and cells will be works based on the
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
In short the dynamic-partitions node is defined at the same level of the
partitions node. The partition in the "dynamic-partitions" node require
to have the same label of the dynamic-partition that will be created at
runtime and then a user can use the usual nvmem-cells way to declare
nvmem cells. Only the needed partition has to be declared, all the other
dynamic-partitions can be ignored.

I currently tested this on my device that have smem and the
gmac driver use nvmem to get the mac-address. This works correctly and
the same address is provided.

I hope we find a solution to this problem as currently we are trying to
transition to nvmem and we found this limitation. This seems to be a
good solution that doesn't looks to be too much of an hack.

Ansuel Smith (2):
  dt-bindings: mtd: partitions: Document new dynamic-partitions node
  mtd: core: introduce of support for dynamic partitions

 .../mtd/partitions/dynamic-partitions.yaml    | 59 +++++++++++++++++++
 drivers/mtd/mtdcore.c                         | 45 ++++++++++++++
 include/linux/mtd/mtd.h                       |  6 +-
 3 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/dynamic-partitions.yaml

-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
