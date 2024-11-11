Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5861D2E9DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tk4kkpel+zqJQGJcuMCUG9Ic+8inQD+bc6BchNx1mDY=; b=CroNMiF5Y5+5RC
	sZPu0uV/EzkjCSMiR04s/wPLkam/MjhmF2CdtMQERe89/EXK1iYAi8PTIPjBmK1b9lLzi5TCY7lpN
	WcF+XT08hjgb/VtqPPUb86U7dYAwHe6B7z4NnYBknNPQdb+Ys6KrzM5DeJbtT1FRZnMxlRw+ADMru
	48qh/nxTPmZ7ZEVv6KMf2rPDLGHWUpu7pnEGIYfiVDfqa7YjHK8h1ybIp/T6j2WO36XRh/BhiCL00
	sMblSFiSud3PkENrN5Qr3HW84uLG657sFEq6DEvVINZhQa7v/txmNs1URW4v8O9kPNfwhG1ctwhfd
	p/UYVyFRG6iPInUXJUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSc-0000000HQHg-2Rh7;
	Mon, 11 Nov 2024 11:19:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSY-0000000HQDF-1x6U
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 11:19:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9a4031f69fso740641466b.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 03:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323991; x=1731928791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=;
        b=o40q3x+PsdlDXgslhadxOygjZ+FPR53JM1ImUEuHbfaUQ5VSJ6aamDOLADtlx6DSy0
         1ywdaAQa8Pp0u4KuIfF67+B1XYkIvAFboD9eRiDj8SWBd1QcjhsCqHwbdXTPF4e8dpiR
         QUbkSB8weFav3tcxESq7GBXPXQyH72DJxpjhKEMmdBEplqmmsz3tpMNymbUynfYGowIv
         kxx2uXLjCgbyJ0qwTDLmJmbRuhX1jIEZGTXrOixKuB4FAl/iB4QGLNaSoI4+1kDvy0es
         ONMumGygos3LWq/2Ey8h39sWonNpmewSoeQgntf1HkEsMmN8SBCGkQLI2pp+NTe26XdQ
         L+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323991; x=1731928791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMrSmta7fHOUctB/5AJidvIZnIncGO2UNey3bSwk2a4=;
        b=K2tMnxlsk6rvY5Dy8N5NHTOWpu8fwW8SSmCzqlYCyYO+l2kcRZiw6z2onPu2P/qIEr
         GgfTbJbaQsV9ZjXJhlt5CJFvQcf2zwOAw3Qjtc1xxar3rCFQDhu+7fFbpXiGeu+JmehM
         DZgJyIVg/JVvrODEW+gUWjH+64pwrio2D9CDdOpaVFgGTyj2AcCQsegB1OS5Q4QWtQFX
         IL6S7KC7GETR7xFGgF4WT2dHR2X053KQs+UJdBshlHGFVW3XOVY6J9ubwit6zybtVTU1
         MxW7lnDHOGezAIrmPTx8+xrgIazJYWTG36iCt90oCthwL5ji7Nf5A0YoNgpjdUo56ZHO
         b6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9nK49C8OjwW2R6e0B4TnBOjvJrOE2fm4sqjzl+heHXWoP4BVvildKtNszpKeQPznCF/b0Qh3t0o=@lists.infradead.org
X-Gm-Message-State: AOJu0YySAtA8s5NLs+7Z6C8nu5oczQbiQNJ2w/ve6k5+Vv6jhzLjKnWy
	ljINGu6osH0Jr5d9WAOFYAbp6BcmooMyeUjNJN8hGiCcsYXiWoWKot+kiPqudI8=
X-Google-Smtp-Source: AGHT+IHOXkjlkrDrtvlnPceOnN5si90LVUaiVILWy4AO1guCrPxVvXLDLxRd0s7RMfvfwDzqJwxOIw==
X-Received: by 2002:a17:907:3f13:b0:a9a:b9d:bd93 with SMTP id a640c23a62f3a-a9eefebd119mr1154918666b.4.1731323991120;
        Mon, 11 Nov 2024 03:19:51 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply
Date: Mon, 11 Nov 2024 13:19:44 +0200
Message-Id: <20241111111946.9048-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=tudor.ambarus@linaro.org; h=from:subject; bh=/+Hab6B4EJ5Dh9SCHmRGYARDt8d1ozFiUUdntiL5/lk=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehSLAOWEq2QisQo/KwTNHCKeQe1lOWHd82ps 5T1iSUMhUKJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6RatCAC4xwOyECtAGIseOOgysDe7h7v7SgsjEr0sfn28ZspNaS/95AIqQMCfPSy2qy0reu67pKZ pCg8oRQQfb3u2HfTFOANgCtFAvUU7byNiliCO09Xw/vU9C9LdcuY8F6L/FvGyghiMvel2oXw9Ht jm506UJHfuIDMw1XINeUG68aULrEnhlGPJQfJIVn2XMCxiAq3u8l/3KN7r+bNbltYTHoiXnHXSA hKoSjlCj2GvfWO1ADnETrU7j9ckN4gikrHQvgxc2MSXGg6MDrI5p5PZJcsKjq+PjslQVcnEro6j sz+KTxRqSUMXxVLeIuVuiSw6EVHibHzUNsjqTuJGpAfOBm7O
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_031954_962294_638DE16F 
X-CRM114-Status: UNSURE (   8.30  )
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

From: Peng Fan <peng.fan@nxp.com>

Introduce optional vcc-supply property, SPI NOR flashes needs power supply
to work properly. The power supply maybe software controlable per board
design.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4, v5: no changes

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..335f8204aa1e 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -96,6 +96,10 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  vcc-supply:
+    description:
+      Supply for the SPI NOR power.
+
   spi-cpol: true
   spi-cpha: true
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
