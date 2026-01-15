Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78078D44C43
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50onETr7SzVksl5XIN4djKSULDaHfRrNnT8fcmSlPcc=; b=EohIkSuIo4AcIl
	mX88L5WXPMyolgaQtJpggp/RaaMZDsJoYczzCIsUUw/wzMp0ccYDHO2qB90GlBKsbYXoqO/YMfOH1
	in7xFc22AgxGvISBBAEEvzgRa5dIi69iK/mwiHAdo/eQFfKIRQBDA2HocYbGVQdbhIQoilOgh6QjQ
	S3HBxt4J0F8w6V/mYf4eH0O0N4GGoyvUEJpSF+ID/G8syJ8gUbG+lRHK/Kwy4M/hdjPtNzA0MtbOq
	zsKpfSxf+M3ozfU4ch7S8/1IiHjQoJhkuCOH904H/+tjXRRcBaIOTF9fUGDLLW4soIT2wMwnBwc3D
	rKh4dfHWq6ULnljhVn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuG-0000000CMUJ-2NTG;
	Thu, 15 Jan 2026 12:56:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuA-0000000CMQS-3rlI;
	Thu, 15 Jan 2026 12:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481808;
	bh=7B+xKo0mpKeN6a69BBeF6xLjGA21Jku6TgKwUt5s5vM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NjuA6UjTaxtjEZyZleGy2pYld0mX3nAVYJKipbI9C8eFK9QaBICff4C7U0iup6/LY
	 NGu75uyWAGXttPXOSI00qm0PSS/RkKgR9I+19ETmT8bvOf17ThI3AIU+ViTUpilW9i
	 hy/az0plG3VYy+2R6hurcslIPIvntGbQbUor9Xo3EECYoNDMsjjR4/7xJ2tZW5R6Ew
	 bSDSGLxw5HiN04dP6lmlcYZeyfK16PFw9Nh5rXmyGNxocJ61CTUfp4TLXY1WxNXUj/
	 sD/Ld8aDIjMmS+YnYtW3D9Opfpo0+ySjCBTbPiqz6bMvlf2LJ6BwQ2VtlusxQXtZlp
	 C1h1ikWroYwOw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C3BC17E1274;
	Thu, 15 Jan 2026 13:56:47 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	julien.massot@collabora.com,
	eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
Date: Thu, 15 Jan 2026 13:56:21 +0100
Message-ID: <20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_045651_132497_97D55AFC 
X-CRM114-Status: UNSURE (   8.59  )
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

Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
allowed compatible strings pattern.

This also resolves a dtbs_check warning happening on all of the
MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 587af4968255..2db446c9ca9b 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -29,7 +29,7 @@ properties:
               (sst,)?sst26wf016b|\
               (sst,)?sst25wf(040b|080)|\
               winbond,w25x(80|32)|\
-              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
+              (winbond,)?w25q(16|32(w|dw)?|64(dw|jwm)?|80bl|128(fw|jwm)?|256(jwm)?))$"
           - const: jedec,spi-nor
       - items:
           - enum:
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
