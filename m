Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FF9FD3770
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhnIzujfIEkKkISL5BGIcYDbVrTkTzORFUdlY/QTlY0=; b=fDniZ8HSjiACrh
	DCbyQx6Meh8fsblsb8rzwCENY1dI2HDk1KovbT9WtJX9N0iycIGFwrH8+3Gu0K89Zo7Ji6UHtR0Tq
	EesaTXv1duu1r6eRCH2n6i/t2jf6gOADQYHKlTNnJCAyT9n6+DhnlNyNmBWpyNZMFiPM6mhcvSPtl
	wat5WBX++Sv3IADam6N+n/gGpHMgfo5NGGRfveEz/cuCHMI+2gqU18OEPv1BYXXh6DMdnCoYlEGRB
	/QB52q15iLdmMa+hW1nTSxeAmMn0RYODtrEp5WzGY2yC4N024NdziNQTTfkN9M36o/yY0GiOrakaK
	Yu6zROPrdCg/tyPgtn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHhK-00000004Vqk-0Pva;
	Wed, 25 Feb 2026 16:25:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHhI-00000004Vpu-37OW
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Feb 2026 16:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=eQ8UHxDkI3UzRPr+6CL4LqTpXWdJVkOOzFQ/VNf2cFg=; b=gPmFNKZOQBxXl35qwq5pSYFKUe
	8UIFduGoHKpUTMLCGvxdN2/S2Xp/bWeT0s7p5FbEqbmFtKHcvNuTf3f4hd46ODaFD5I3kcvbm5vKx
	Y58yh18nW+HlKydWNMU8k6a/0kBkigNs+8r8qa6qBW+ZucnZxozJrisQBaYbvbfEHyD3MPmuc2aVh
	zgVubl76tiTR3mrXFsc038Erpk3e6H1w3Jw0U2ywRhxv41+Ct1SWYjaZA0ZeHL0Dh85I3eQhKXO4X
	fvyU6gA7AGwo8TDw6BksLrY+nwWUnwItfYxDXSziNNJ6bQpYCSL2PRm27ocnbuvAUURZIotQsySHl
	WLDHvfiw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHhF-00000001KHL-34BK
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:25:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F8BE4E41124;
	Wed, 25 Feb 2026 16:24:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42A185FDE6;
	Wed, 25 Feb 2026 16:24:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E356C103692E8;
	Wed, 25 Feb 2026 17:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772036692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eQ8UHxDkI3UzRPr+6CL4LqTpXWdJVkOOzFQ/VNf2cFg=;
	b=yfKs07TiAEsEFNQ9WArQR5nlm9tHj7UmvkaPFYUx4kVvwcAq3b0Je1Eyhg46/rPFPVQkrF
	OHvF+5hNTI8ZxYS6+zcZ1N34S0VMLk7t7zA+J7fQZKkDK7As4d+b+yu5wbQoZAdshaxrcL
	qH8107DVnk5eBLNlcosfNsCsb7+5r3lG3l99lrHoaZ9UnAUeONZzXT1XRpwCanWCCdp6Mm
	fwnySuVTXfGC5Oq421N2SUc2BFCa4xXuG8aLLZENxHsXUNY8yCYctFZHI90SMBCTYWBWcd
	c/dEUTZLKiRssQrKhxXlUrCN/wjplwGujTFf910ZUJzngzao20Wz72cDSq6EsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Feb 2026 17:24:44 +0100
Subject: [PATCH 2/3] dt-bindings: mtd: st,spear600-smi: #address/size-cells
 is mandatory
MIME-Version: 1.0
Message-Id: <20260225-perso-fix-spear600-smi-yaml-v1-2-8ef3d205ab3a@bootlin.com>
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhila YS <akhilayalmati@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_162509_809439_C4F0FCBD 
X-CRM114-Status: UNSURE (   8.57  )
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

These properties must be set because they overwrite the default values,
especially #size-cells which is 0 for most controllers and is 'const: 1'
here.

Fixes: 68cd8ef48452 ("dt-bindings: mtd: st,spear600-smi: convert to DT schema")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
index d065df269657..62d4359908f2 100644
--- a/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml
@@ -60,6 +60,8 @@ required:
   - compatible
   - reg
   - clock-rate
+  - "#address-cells"
+  - "#size-cells"
 
 unevaluatedProperties: false
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
