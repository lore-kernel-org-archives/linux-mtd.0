Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826EBC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 19:37:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5092A20828
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 19:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ooyMzrYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5092A20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioUj+MmcK+EgIeWqBrAwpFgFr6VSlpkVg+QkfqjSetk=; b=ooyMzrYfLEgPI/
	R7z6Mie9MxXQJpbhLgWkmb05+qP9CpmixaQf1HlkXhWomZP8vaegVbBCilokPPYB8uRIOllC8xB69
	KD2SRz/A87tbtK7z025OmcaEgPXP/XVy9enrUZFdHVZE1AZErW/zLYdgGz47z4x72Z2RkGBXPFAXR
	EevlDL3mAUo1go+eEeB/qCjRI8BjlZZ72AoP2r47LmmlGk+yu8mZDArawZLoSyWTf9TisNYOX9xgl
	lz758ujwTijRIvLomhTt4JVvcs3WrMKjrEdZKmIrC/tHlJcBoa24jsg2ynC4AIxIg2C/+5AWi6j1Q
	rqqr0Cd/JQqXFVbuKFiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgwgf-0002Yj-9d; Fri, 28 Jun 2019 19:37:33 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgwgb-0002Xo-Li; Fri, 28 Jun 2019 19:37:32 +0000
Received: by mail-io1-f65.google.com with SMTP id k20so14867800ios.10;
 Fri, 28 Jun 2019 12:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rOnt24OKyg8IYLadN6LWQaA2kEEaOS+arIfbwjhJNR4=;
 b=UXHNBhBTVmfnCvIKOwgsSf4VmJMoaLKjS9AJ5eHTHFcOwSZ91ytD0ciGtxHAITlB46
 RtrgMr52FzM4PviChHo4qw+bj8ccr4RABS1bqo8tVQrrVR5fHsgEXrY7iyENVwCCFcCI
 7o8aJKgWIQnD7S1o0cFIfKCI+7m59qJh3GnJ7QYgaklgD0N847HFwYWDsjOOUV93zK07
 rxtUB81SUf67vndi6jKp3StLbYvXhStNJrRfb3KKnYjyCY5qmBmAr0rWREeeyNH6bDVG
 HXfNORdx/XF+thjJFUt3wyCmidnJURYoyCsl0priJFcXuU7n4Ksrj84zJkcLUokR/OLv
 sHsg==
X-Gm-Message-State: APjAAAV6buAalTychQCnNcACwXIe3XqeBJ9zcMZh3fvtxNuBzzbhzSzG
 W3vhYohuIJuRFtDMDGWUjg==
X-Google-Smtp-Source: APXvYqxtxWXQqs4yhNzHBeBOuvHhYb9tx5z9qryUXj1LZrI9tRYnL6j8xUuN4/7v7qTG4as0xfM0hw==
X-Received: by 2002:a02:cd83:: with SMTP id l3mr10927291jap.66.1561750647827; 
 Fri, 28 Jun 2019 12:37:27 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.243])
 by smtp.googlemail.com with ESMTPSA id q15sm3160061ioi.15.2019.06.28.12.37.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 12:37:27 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: sunxi-nand: Drop 'maxItems' from child
 'reg' property
Date: Fri, 28 Jun 2019 13:35:25 -0600
Message-Id: <20190628193525.7785-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_123729_709353_3D97D87A 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Mixing 'maxItems' and scalar properties doesn't make much sense, so drop
'maxItems' as a single item is implied.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I'll take this in the DT tree if that's okay.

Rob

 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index fbd4da3684fc..e5a411518be1 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -57,7 +57,6 @@ patternProperties:
   "^nand@[a-f0-9]+$":
     properties:
       reg:
-        maxItems: 1
         minimum: 0
         maximum: 7
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
