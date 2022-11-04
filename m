Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8332C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2erqX3UjvBYElEeg/io/Q0wPvLdQ0vc4K/dfpfGT6E=; b=lJiYClA/Q/Rume
	8bp5bCaTzubSleCbIosxWqDt81E2LX74WjNz69QxYijqtOYuajXMJniSYprn8sAUreYAc1elInnkv
	9xf2b0F/2shvNK3+H2KWh8hyiF1FdwR2uLCvsGzVooCHV0b39/CkaR8vQRzPCfhUmkqevVNejmovA
	6Tr08n4i19mT6OKdUOHQ3jaHA4z/mxocDHFiJaLgyEQPM21xVPofXHiCQhOnoGAuLZAHx7uk77qyB
	c2cPpZCW43sBHQsmso0yUfyLkKAVfYEZhs3UVDtLnnvvMQK5f+Ss+pvDIni9EAMMZdDXNIjzdtiHd
	lsBfXQIUhK/f1A9MEHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzsu-004XQc-HF; Fri, 04 Nov 2022 16:49:36 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzr1-004Vz7-FS
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 054A640010;
	Fri,  4 Nov 2022 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+yDyoG2qKYEY8YhhZqOq33UNeQMIcC6DN9z91vnmHU=;
	b=UmO901a52ytowHIFKqWsssrz0q2L1duxwvZJhYgieKG9bUocsqFTtvElJWVaGB8ddioOWN
	ZuabgYv/+9tp0CoJl3yt+Xzm0XI+MaJsUkakpt6gbP6Gs0b+i2/J9WuKi3xoal9jXY+w41
	QsPcXaLoeXxHSCdtGVTBdG21tToL+LZlJUnetwXh5/wHIZeeKPTv09kx5fo4XclY/Sz9Y+
	0ynrzEsuVga93VrFPYrDYCmmWHKN7C19v1qSp3WWw8vtN5LeYWvZpvA7RupK6TavdWm3Mu
	LylqSslmYbU40+Xv932L+ucAk8cBfSSeV3flgDLV2iGvYvUOKJXRRZyFCSqIuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 16/17] dt-bindings: mtd: Drop object types when referencing other files
Date: Fri,  4 Nov 2022 17:47:17 +0100
Message-Id: <20221104164718.1290859-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094739_703862_4F3C4429 
X-CRM114-Status: UNSURE (   8.01  )
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

Setting an object type is redundant when a reference is made, so drop
these useless lines.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 9ee285b7d162..78da129e9985 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -43,7 +43,6 @@ patternProperties:
     deprecated: true
 
   "^otp(-[0-9]+)?$":
-    type: object
     $ref: ../nvmem/nvmem.yaml#
 
     description: |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
