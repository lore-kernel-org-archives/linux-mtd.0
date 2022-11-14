Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A47C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2erqX3UjvBYElEeg/io/Q0wPvLdQ0vc4K/dfpfGT6E=; b=b9QUlYZ3kq0kTI
	eyn8Ga9dDcKD23K9tbd3YggYOg0rvEMeK5OAYgegSspJNijSgHckNlq/1TGXhZLJ0JW81bwp995vP
	ftavDuuJXK3tvqyaR5/OlZbV1QR0opHngNYoIi88Ne51B6+zdJT9HrSIl4Xjs5IPMH2RGKemZ0gvU
	SaciAkUTvARMN5FVhy4shRTJuYIzpJET1r9DGDX1H4sipU8MkUQ4116Zsxo7TVXOO2N8AGGhH1GoT
	K+Ei7+kBbu3OxryxVO6JYTxfOyLwXvZpW4hXzjKQmzmRAsHul6YOedHPKW3dcyNnXt73FX2Vk/+3X
	See2e4tlbQyq8usPzkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVRm-00H51X-MA; Mon, 14 Nov 2022 09:08:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNo-00H29S-Nm
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:04:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3ABAFF815;
	Mon, 14 Nov 2022 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+yDyoG2qKYEY8YhhZqOq33UNeQMIcC6DN9z91vnmHU=;
	b=LQh96YYntByQyxcKe0JCkWkS0OBc9b4DSahCT3qaQVd4HHXBCF5JEigiffOB1NdU7CKNQE
	B2KsJZGfIfN64kE6pRicJdFc80adinWRe8rA9qOvcgb5BIN5zpmzCln1CPOPwlHTfx8ftN
	lhpTbjbNfTD/FbbIzjM5I7IFnFfEyfKpcpFhqeB6acxVAoZVpkKnUV8hvWchYdk/XPrTzV
	+Lz1vNcZN64sRFDknCQwl6u/L465ERep2a4NU4RHTffkMh7JSb6bPX9tf4rDy9gm9Uqm9L
	YdAlmnMpSSS8PINpLmw31Kuv22Pi7+4qVpHsfVdiK/m0MUDRkoMwPvefKiY9QA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 16/17] dt-bindings: mtd: Drop object types when referencing other files
Date: Mon, 14 Nov 2022 10:03:14 +0100
Message-Id: <20221114090315.848208-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010400_969179_40E61216 
X-CRM114-Status: UNSURE (   8.00  )
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
