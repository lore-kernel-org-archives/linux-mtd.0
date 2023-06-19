Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E7FEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yD3Kid42OjveZkpJrP3B/Q7+Zy/DAf0w0+T0FMgO/A=; b=q/Y8znMmLUghmx
	oFNI6NKq7JMCbFZVF8uL6lluPGtR0B6fq51TYbMH1RwlWQ2jdGkngdRYgPxbdcHckd8M1EFyr1IKl
	r3On+7NH03CaQj+S3nlBMEj0U2o0Zg6cB93fWsMYgdKZyu30RkUdj59hT3QOvUOmq5TWm5ebpvQgk
	DbGM8ipcbCDuyV5UHAbKPL8IZ1fsFuEz/RTO68Bwed5x9tOgekPf5IJoeyaEC+bCnfnpGIuQ8j8ly
	Fhpu4kBvDZreRB21i2PO1xuZ81kz39rAje4mA/jJGqB6TxlbNWsob3CLAjcxNxNsj97RxbU4eRWvn
	HhBz9+3IgPkHk8xBOZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCy-0080vY-1A;
	Mon, 19 Jun 2023 09:30:00 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCs-0080q8-1h
	for linux-mtd@bombadil.infradead.org;
	Mon, 19 Jun 2023 09:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CSvDfU4mIUD6bC0UtkNHyN1VSKAOfl/jaJrLVsjL+hI=; b=UY2xm3MyXR5mCpope8aMddKQtx
	hr31i/eUgTHci/lN+kCDQshgaXVh30j5P7W0zVmWw0WWUzf8q7TAb1YrnOyrf+Zv/sfRF1tDOSsX/
	3w3mt+ifnrD5paR3zT+hP1CMfTSm0hDTc/dYSj47YLVzhoTer8yqiWDltJ3LWcTn+Rqh7MhiIdarA
	ddFcMqpqc0t7OrTEspkxWJJFpTxOehE6Y9of+8SofYWlRvAh516tdC9G6rc6GVh1ud4CrcBr1hDF/
	eKD0l7DLjOZRtrVTluvsTAt2NrXLeNp+jkvMws8LZMgkJNL6JNQJu96uCMA2hayEaI2/9Y5lvIQph
	9Kl1Ucaw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCo-00Eg4h-17
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:52 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSvDfU4mIUD6bC0UtkNHyN1VSKAOfl/jaJrLVsjL+hI=;
	b=XU+QHTpjXC20tnQ6L/HGIMQ66govMHq0RpLtOYOwbF2xtcMN0Yb6nQJdQqZXvmbDT4yhlJ
	sqPmEdPxNspa4FtW0E5+QIKZj6l49zzA9Ha8OKbrNQenk6/3ewgLUDnBy2A4VpPe+uNRPv
	lWTpBuNipZ055vuLLmL5UdLH49dZSmY18w8q9h315Gp/i9yf71eRZZ+mmgV9vX7Cd3WfYQ
	kphN+qoGbWbDyohmlkO8mOx7yQSc5ukSaP1n3ciulk4v/zo0IQfFZAAfpwBTJUgqduOQrV
	JkJSft9ZLvDbJcHmJpd+Msd1/PkT7sGAYWs/PPPpKxLo31T3/s1EttJNxQmWXA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68AD31BF219;
	Mon, 19 Jun 2023 09:29:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 16/17] dt-bindings: mtd: mediatek: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:15 +0200
Message-Id: <20230619092916.3028470-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_102950_795814_79065DD8 
X-CRM114-Status: UNSURE (   9.95  )
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

nand-on-flash-bbt is a generic property which may apply to any raw NAND
chip, it does not need to be listed in each controller
description. The raw NAND chip description file which contains the
property is already referenced, so no need to mention the property here
again.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
index ab10b90077b6..ab503a33a269 100644
--- a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
+++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
@@ -45,7 +45,6 @@ patternProperties:
     properties:
       reg:
         maximum: 1
-      nand-on-flash-bbt: true
       nand-ecc-mode:
         const: hw
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
