Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A083C021B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WFcwlVw1cyEsFbiPSt33B/6R9jMnGmlZkOai9MRaov4=; b=VBVL6fe+fX1aGL
	JrB1tjXwgLznAxn9FaQJv9qscCx8IzLOVEModqt+ToavI5mmm5WU3nOMLMxEnfkCwtJzof/WY1Lfl
	r3aDx+INAKPbH3IDdM4qyxV8zr9NVErqN1tOup/RzSXis7H8UsgOtZmwAdRd7QC/lpddskDiX2HJq
	Sjo3NntWEdWTHBRIl87OHf1IRwgtdHBegdDiRRnJt4SeISyLO9VY+FXRdxaiMaciP9/JGSGpN1zsF
	FOl1p3JPlivLkN+THZafAX58MHLfLP8d22R7pLhdlGoZURCLsOPf+tPyGnr1V2ZiGSSxA6MdcPRMe
	g+6tLI73Gi1mBNWMUr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6FV-00000000xNA-39OS;
	Thu, 20 Feb 2025 13:05:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl68c-00000000vLp-0cKX
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 12:58:47 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220d132f16dso13438815ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Feb 2025 04:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056325; x=1740661125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss+xLnzP86/60Uug0yXb66O9bHiQCdqH0RrPmgT0Pw8=;
        b=QiyRE52iR5T+iTHFE3JHZ4miLXidj28jOPC6EHRoFTOCHTxL+gZgqqCEmUx5G47e9U
         692RwbB3n1RF38WXCYRCbFnDO6BxeCEyGmNEfrEsnBrarvmfN74ZazrtBGPSsN7skFyc
         mLGivMl1Og3+ASkyRd/39GWjHYif2ZLEjg63cEekcmUB+s9SdZe3EfCDT8KgqZRv/y25
         wu7lhIHU0TOdnE1LFfX3pQq2fRKDq8LtufgtObdSrDlynmx6wt8h9ArBRddIFgG2/Rbm
         vj8TYfZ0yIkS4qTgA4XZpU7ZAa5Dmkneeky9EFNUw3S8CCAExd1CH+ARvt+hME6HdzpB
         AAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056325; x=1740661125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ss+xLnzP86/60Uug0yXb66O9bHiQCdqH0RrPmgT0Pw8=;
        b=ZpW719lFuwyIBLgxRlzKisErKOam67o2TK+OdmQiZ/Yi8G0OlUS5/q4egktb2vI/Cv
         QlhI57PmtFsfHjJFKmPZhAjgaCRh5YFuJXfTu+bkrgWhfxIlXTN7+JgjjvLc/pRHYRhX
         hzQmgbWSN/Uot1P+ydSUfv1TAc/o21DED7n7QB2/k7WdQYodVTqyenytOvRf062Gt9vL
         ZQ0fWq3uQfHq3392zbfAxh4lJMwEcP/+7Lyqqn1b14Bc6etBmGtcF417B3Zt8Ep+pRQR
         87xnOYp4F4Eop2fqhR1SzWt+h9zVcnKxp8uteu5fdmB6jUexAEXEwPaYmU+iulAthzhb
         mX1w==
X-Forwarded-Encrypted: i=1; AJvYcCXd84RHu2TKhLOQM8d3M1wh3YmJ1+2jGOEqGPxVOQX4iuCK0GJAv8JmhZwsWxfCC588g/79S2b0sKA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuXDt7zjnWQhmtIP+z9JzRUWofZzmU6bxtbEfEXB4wuDVLEHOD
	qNAGiVtW/NXKsu/1TyyShpcNoHwcoK98XRS792BnqqL/YJdwDtLn
X-Gm-Gg: ASbGncufPqsShMTn8w3gDqSZpXVUeElcTAAnmRirXvsUETfSubw8/V9dXONNJi2rji6
	wGmmchG91yQ5OrFKvaDpc39tV/MVqtPCHrc4TWE7040fRPZ2xBk+jHJxuo3Y6tCusAjkgljAfcK
	NrclYURHD/DYtTT8RsKELtNlDPgSS13SeIgz6z/vZVOhkCKQA9I0aqS1+kHmjajbyyaq5DoJGjl
	V4h2nTYQT7/GP3KaLfa+B784at9YQqVjpW47hWk6FFt/bKeeC5Y+b0j/M2igLeEKwoOopnRY6+M
	slFKwBwTkRYEGsgN0g/8KBNhn2owkg==
X-Google-Smtp-Source: AGHT+IF5a/8AyECCIuIozmX47pSxGZKQp+arqspxWdaMdWfsTMjbgi5bzRJOQToQurDsztyTIgq50w==
X-Received: by 2002:a17:902:ea0d:b0:220:fae9:8a4 with SMTP id d9443c01a7336-2217055dda9mr96907035ad.6.1740056325282;
        Thu, 20 Feb 2025 04:58:45 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7340b5f1bdfsm2699241b3a.120.2025.02.20.04.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:58:44 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: mtd: mxc-nand: Document fsl,imx31-nand
Date: Thu, 20 Feb 2025 09:58:12 -0300
Message-Id: <20250220125812.2370056-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_045846_182533_CDD9DB75 
X-CRM114-Status: UNSURE (   8.06  )
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

From: Fabio Estevam <festevam@denx.de>

imx31.dtsi uses the following NAND compatible:
    
compatible = "fsl,imx31-nand", "fsl,imx27-nand";
    
Document 'fsl,imx31-nand' to fix the following dt-schema warning:
    
compatible: ['fsl,imx31-nand', 'fsl,imx27-nand'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/mtd/mxc-nand.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
index cf4198e43d7f..bd8f7b683953 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
@@ -14,8 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: fsl,imx27-nand
-
+    oneOf:
+      - const: fsl,imx27-nand
+      - items:
+          - enum:
+              - fsl,imx31-nand
+          - const: fsl,imx27-nand
   reg:
     maxItems: 1
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
