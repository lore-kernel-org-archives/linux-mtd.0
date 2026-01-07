Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC036CFD62A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZhTKUFnjZnnPzFS7+Y0wBs1B/uG+bNTMwO60fEnleA=; b=xerH1amXqEy8p0
	Y/5vuZ6AHSnlS/R+dunDI1SYmTvbvLo64bmWJvc/AY7S2jBDLcW242rVxOTMFlKldtNk8VHTkxdLY
	0NX7YJvh9AisU359IJ3l/hhKHxNUFdR9Tl3g5/Oh/IP733EYVOeLkBvng2YkAFiGXq0rHcrXpD1Em
	dvh1Hz8ktZQnjsC0/Q5zvCpHWH3SC9Kw5SunuFtxHsxqpX/jai4FSl+D+W4VkB1G4eRh6i8vg0LRu
	I8e/Eimu1sOj0PeBSLhkASMQhVWq9/2sU20vz8jRXJ94kPFr284To/IU6EBnK0IsaBVhfePa/lL4w
	fxutS7Ti0rkbsR6Uj27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE9-0000000Ex6G-3fKb;
	Wed, 07 Jan 2026 13:05:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE4-0000000Ex14-2Usx
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jan 2026 13:05:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E9D1C1EC90;
	Wed,  7 Jan 2026 13:04:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E1E9606F8;
	Wed,  7 Jan 2026 13:05:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B697C103C872C;
	Wed,  7 Jan 2026 14:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=28/kVheK1lvYqLZuz6cxLCTZassa/8QL++w4LyvFy3Q=;
	b=0ivL6Xobw/RkGwwLITYh6UfvAOWLChYOicSsB1GAPA7BgL4XvR3hFeZucfosgi42g7iQzI
	c6HbaFj+SUfm0P8qi5lzLqWntM+3yAi48Tnf82GD1iNuqSkDFWuOaN1saaSFTvALAMoFSO
	27T2ubyCtpFxA8zG3M0X/tW0AqvLBW1+FJs1FW7QY6/2iAI4AYlIsdrshFAI081/7LLAx5
	9waryOXNoT4ssZOoi4zIzQqLCIKRe0sWlaD7BZ/cwLU9M4qnjJcObELdDzvW8Bk0jvoIZz
	+qKOFd5i+8NCHP8KroYRt+0ur0/xt/3Ti0EsyQEv0Pb0BZO+BHceHr5VR7gU+Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 07 Jan 2026 14:04:52 +0100
Subject: [PATCH v3 1/4] of: reserved_mem: Fix placement of __free()
 annotation
MIME-Version: 1.0
Message-Id: <20260107-mtd-memregion-v3-1-f9fc9107b992@bootlin.com>
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
In-Reply-To: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_050524_770550_351A0022 
X-CRM114-Status: GOOD (  10.86  )
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

The __free() annotation was incorrectly placed before the variable
name instead of after it, which resulted in the following checkpatch
errors:

ERROR: need consistent spacing around '*' (ctx:WxV)
+       struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
                                               ^
WARNING: function definition argument 'idx' should also have an identifier name
+       struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);

As part of this cleanup, also remove the useless return statement
flagged by checkpatch.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/of/of_reserved_mem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 5619ec9178587..1ab8f4153600b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -127,7 +127,6 @@ static void __init fdt_reserved_mem_save_node(unsigned long node, const char *un
 	fdt_init_reserved_mem_node(rmem);
 
 	reserved_mem_count++;
-	return;
 }
 
 static int __init early_init_dt_reserve_memory(phys_addr_t base,
@@ -747,7 +746,7 @@ int of_reserved_mem_region_to_resource(const struct device_node *np,
 	if (!np)
 		return -EINVAL;
 
-	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
+	struct device_node *target __free(device_node) = of_parse_phandle(np, "memory-region", idx);
 	if (!target || !of_device_is_available(target))
 		return -ENODEV;
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
