Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DFECA0FE7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 12:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2QrG7jedLBgH3bN6vlDFJalz1mMg/05e9Cgqj3Nya8k=; b=OW6lGI2TYOzNoy
	0ng0B7RBg4EKrtAAsZN8WvBGwjp46uHnP7ZqEWfTzdngu5vN0O/YiGfpbcSzO+SC7RAjE5E/8GTKc
	y0nl9a4u443N6OJR+opByWxa35fEb7qO4tEzZLUrM85AEDM2bQl+jvD8Xflwk1krS0RahpWp2SyZb
	gx5OZ9Tmtc8by6O6pA/3vDnS6HWDMsBnh1u2yd9tMLe5P35CwNiz0krRqa+d1zVvF01dVirJwIk1H
	MYOLoHg9em76L8aa7Snm5YEWs1ubXJHz3g+o+SI6Oww7hkFWbmcAZq22bHOpihP5U8W/KM3i6doos
	u5d41PlVLjzLPw63tjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0jS-00000006DSc-2wUW;
	Fri, 30 Aug 2024 12:28:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0jQ-00000006DRR-1KDe
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 12:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B658A4470E;
	Fri, 30 Aug 2024 12:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFC0C4CEC2;
	Fri, 30 Aug 2024 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020879;
	bh=Qv3PljZ0K9tSka2ZTwGzebPtb9WGtHhBrtQHmVgyQb0=;
	h=From:Date:Subject:To:Cc:From;
	b=k27QnlmluJrrumul7FRNB5J5I0g845ic8Xn2z126p8zup49FwMYqwe9vc9PRJhQoO
	 QkTUe9ZZYQns96OZpXt6YYt/v/sP2iy0Sz40EejBqmFC7LSAFZU7lOhOOi0cuXTIN6
	 K/BaKQgJLFUxc6fLqRZEaYXw1h9caqUeNhnZtPs5yW5txvG1oR0TfM3SOWbpFlkSwc
	 Uo/ryL7bU90DNgtYrQ9PhVOJ6iB4uQj4tF0xw10EWqVBcmaAZBk8DvTezikW8PQpdT
	 ZZd9dxH2OGp2tziIz6z9OJ2JwjXAKMSQc4RkiSG/LIDLtVnMy3U66hITeVXXeZxBEZ
	 53vh8RC0Paz+A==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 30 Aug 2024 15:27:53 +0300
Subject: [PATCH] dt-bindings: mtd: ti, gpmc-nand: support partitions node
MIME-Version: 1.0
Message-Id: <20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMi60WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC2MD3fSC3GTdlJIk3ZRUo+RUI4vE5LQkMyWg8oKi1LTMCrBR0bG1tQD
 fn2VaWgAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Nishanth Menon <nm@ti.com>
Cc: srk@ti.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=Qv3PljZ0K9tSka2ZTwGzebPtb9WGtHhBrtQHmVgyQb0=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBm0brMkt5XayPMdgB1M2Au8oX6WERcC3svX6+Ui
 1xN8sYJgRiJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZtG6zAAKCRDSWmvTvnYw
 k1rcD/42JmCN4RRQBkVab/Oeo/gA5UdqT+rN6fmdU451xq2gkLQg+IuAxSSdS5Rr2d1Rb//WpYO
 60haGbAyyrSCq54JeK95wADI3JftE1NlHRzqYHy636GrY9laQw2BH2Y5cqlJZ7jqvmcWxJYvjSx
 rJ3ormDDq/vLPyuKy+LdQ0wBrq4QmscXZFBtw6ai5h1/vhn/dSAHdP1jwAxkVlqeAtOF2iTYGYW
 25QGi5XBsSuvhm1Hz8yTCYdkdrSJKtMRY9FXDvBF0B3DSOlF6beDcie1nD5p3XNuYwhEVuBjYd5
 qkkLRl96aChrUNX0AL41fwH05nKJzAF1U7nmJD4HCcokiOeZJmLH6nCowiXE3RSmnenQxvG5M9F
 JZMF6VRLohpwZ+G8zrTUzmPxoT/3Q9W5S2E2wcywCozjspbMDlY5Ex5yJoilQ+e+o7d8RBQ6tnV
 1Z2v2oM8zEjsweayV9iRjcdxYW7bc27ABNai8vQfD4MOWk4Z6jUQvFZ/LoLdtWZYOqe+gKY9ld2
 Oj9IA83EcEJYsVd5bZlCAFxQLrwFhYT+WCZ4uH8dXaMmw1yI0eum1kC1dRhdKVRyqKRirPti5Ic
 u5UEAJeDbldc7+n8aa8unHcWR21z3PdUf2FnNk654+Xo5JgooCeqLcCofj6cE29taXEG4riQF1J
 5cp9IOWDfaDXPbQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_052800_460135_154EE5EC 
X-CRM114-Status: UNSURE (   7.92  )
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

Allow fixed-partitions to be specified through a partitions
node.

Fixes the below dtbs_check warning:

arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
index 115682fa81b7..c2143f943e7f 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
@@ -61,6 +61,11 @@ properties:
       GPIO connection to R/B signal from NAND chip
     maxItems: 1
 
+  partitions:
+    type: object
+    description:
+      Node containing description of fixed partitions.
+
 patternProperties:
   "@[0-9a-f]+$":
     $ref: /schemas/mtd/partitions/partition.yaml

---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
change-id: 20240830-gpmc-dtb-de2ce28acfb6

Best regards,
-- 
Roger Quadros <rogerq@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
