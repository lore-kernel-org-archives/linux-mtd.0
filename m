Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF461C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wWAjxP9zkkAoC1Sc8ELF8d6BeaJwcC7aJyvuw+NKAx4=; b=cV02y+llG/Bce8
	yH5OUr6A76BzkJ4LWOPfguiqAPxiFrNPm/pERJEgaAgP3gk0qr3nv2WfnaDcvoYXVhqsrao8auBbQ
	ZHW3rqruLbeJ79VZDLXQNBU7XHQzW3ajer1Ap0OiTq15FVkGgjzih+6t91xESwmJDuzElx5UG6WvI
	2VKyX9md8x1jjoQ+FQsOUO37el0ZpqRZGbfFjY5MWacMmYyyPGlHP5YMmRBnzjnpzzY3in73dvlWz
	RiAJOCvFghR+wYJr0S/GwVYiEsygE2FOVLx86Tk6syRmemSS5Bw0Oirp4zY0KCVTG/Chwj+FxhO9h
	xGSOPba4AjEpUjWb9vFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muI0h-0057I0-Ln; Mon, 06 Dec 2021 17:42:43 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muI0B-00573W-L5
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 17:42:12 +0000
Received: by mail-oi1-f177.google.com with SMTP id be32so22722387oib.11
 for <linux-mtd@lists.infradead.org>; Mon, 06 Dec 2021 09:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fe3CVMpBQRRT3DNNsuf4d0VO78+TZJUoy7pg+WaNgVE=;
 b=3xrIBghx0rgDO5LOHgq8qAQl6BkJbeNd7QRc1+PgDveOJOC9CPl7D8BohEVGcG2e+d
 yimwHacxGOUpUQZtW8xUB4DbI483qRjIOn90ahMhcKiZOox/TzAcxy72TGd2rGS5cRFb
 UdkhGfla7xvlB7YNz09Fx3gbmGt1F14IL2ID+dBUXXc7fMQF7fUU9rxGoYF1K55F7MwI
 aStv5yiDgHjx0G9dQa9++7TArboe0C3X/gInYsDNntm8+w+tG6+hEklwFaBZ6M1mhoBg
 S9/mZekbN6I+vt1LkAmS1fBvd8adEPoflXBDtonCXlccVQhB/OR+Brpzot00AvuWI8BW
 1kHw==
X-Gm-Message-State: AOAM533mWXXm2dxfRANU1Jn3n2zH53SBb1nELcYqoocJN9dTBkFSwZk3
 h7IEv5cvhMGDxp9poTBkgg==
X-Google-Smtp-Source: ABdhPJzHP1QkE2s5ndqS+VwuC8jY/yr9YvhnhPWxR574frX67lEfBoHQ/rxu+rSBcZejjTobuxVKnA==
X-Received: by 2002:a05:6808:a08:: with SMTP id
 n8mr24972066oij.148.1638812531044; 
 Mon, 06 Dec 2021 09:42:11 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id q10sm2904918oiw.17.2021.12.06.09.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 09:42:10 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
Date: Mon,  6 Dec 2021 11:42:09 -0600
Message-Id: <20211206174209.2297565-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_094211_736246_3FE8B504 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

With 'unevaluatedProperties' support implemented, the TI GPMC example
has a warning:

Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml: nand@0,0: Unevaluated properties are not allowed ('rb-gpios' was unexpected)

Add the missing definition for 'rb-gpios'.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
index beb26b9bcfb2..1c280f52baa0 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
@@ -53,6 +53,11 @@ properties:
     enum: [8, 16]
     default: 8
 
+  rb-gpios:
+    description:
+      GPIO connection to R/B signal from NAND chip
+    maxItems: 1
+
 patternProperties:
   "@[0-9a-f]+$":
     $ref: "/schemas/mtd/partitions/partition.yaml"
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
