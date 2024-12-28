Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3913BE77188
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Dec 2024 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DN85TlDAFv+pPylkFxZQWK4QUKWFzRb/SdLJpoth3M=; b=OqlUBMmTYN7M5w
	PRte8bmos9B3HijhTe89TRlbMI/6TbCklLEIDbNyo1loxTxWsKo773vgCkahAt6Gpe9aWWoC9wJan
	+XR5zNa36MpJNoPL52k8R+9MRGsW5C4+r0KlBwu2+fSayCQV/JsAaFQ7fXNwcr06KPidNPGKngs4q
	ppG58jsKskPWAwygvhz4eHaNITaNLVGD3EaTpFdCsPo5u/6dSOl+s2XQL2AY+shW2ZMQOLX7sAmGM
	TO7F3/Ml3xpRWGVBS4tCYAsRFxfURZGtORh/1aaMJoaBpBkX9D1jfxgXWARDR+cwysIeE63MvXxj6
	EF3NN2lMehEv5RrotjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgJw-00000002aDC-0YEk;
	Sat, 28 Dec 2024 23:34:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRgIj-00000002Zq7-001n;
	Sat, 28 Dec 2024 23:32:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43675b1155bso65612375e9.2;
        Sat, 28 Dec 2024 15:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735428775; x=1736033575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOndzP+gvkrgZs0qc02qdGu1OBtOTqc7KPMQjqAeOC0=;
        b=ZxZ3NcB9A/djata+UMCgHc67Q66v99Htbzr4z33CayeaRaf/ilqQPSuwuRe6KJ58s8
         Q6IqqMX0dCe4kJ1gSeukXfI+KidC2ZNlps4a2b8gRmdaP6wHs+A45YrexxOdVCiiLqjg
         IcnsntZAHXWAXcYh0JzERo1z7TKOKJyxuvsheWdu0m+vPf828wQvUNuWeUzLuuK5bkNS
         ya4sOaBbBNZHGJhc14H1mm/jNKrdmkg1uon+Db+8iS+Q/XimOJIEQ9YPT3YoZKErO0/w
         O19vB/7aFWKKlakLkrEWNLrn0u7hTkZ4O8eQZn13KRLgh3+ZhOjtKoK/82ddwEScw6tt
         KtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735428775; x=1736033575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOndzP+gvkrgZs0qc02qdGu1OBtOTqc7KPMQjqAeOC0=;
        b=QEoioi34uGv7mFeG8K2JnyGy+bSctiriXFvmuHjxPAQjYAu/TDee2/ucf6LJzD+P26
         o5elVp/xuHplkLZ/YMADpJmLtVEJEmVZHZ/3RJbm18nhi9WfNelARzkciPiq8uiGS7jR
         kmbfagLUROGiUl5Lqt89T+HB0JGmyE4jovyzdzasdk5geTxfo7bbg//hT96TBUN/yAc9
         rzTyGTekjtc2snRwZ5EViVGQMdyuDfShhrrJjA41uzMryyK68pXxqSSlsW/h885k90jq
         t3mfjFR6pcr7IOJt2ZAtVpaJFZDXUnvhaGWmPEoZRDXHlP+YJswZEJcc8HuwjNouZZS8
         dJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/y2/jt6/R+A1V4KE4Ezm+RUNAlbIFTAgwnsmUR9BwbIwBfmoXrFf8lRi83cLCM2Ykk1z304Whmvk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5DltjmHG9eqPEwfEqcwTlQMzO/kvg2vsLwM9EcuUFv18xEwDe
	Pc0vdgkcqdmd5hWqg/B2wpmnIxFV7rjpXpzf+qpDa7DVDW32v1nT
X-Gm-Gg: ASbGncvhEd3Cd8oYMKBX4ne2VjUvvl8JPm5P1KMrXfoQWotI1rND87ixAgPqPiSjRp7
	aumtTaU39pngXpBqb7d0WsMkjQ4CsdVcD9K3TDcL1EJYD6IpKEKVdU1AInSWrp++Zh9M4CM5mpU
	H3uS5Ovdf+5CjsRxnymeC/LPYP0GDKE+LoeVXyXAVO4Pd/VIqUbnsTQ5/YCAkduh9ahC+pfD0KE
	Gmrt2hbyfvd35XCJcCiCy1DsWpPor/4XCtESIBPD646av9VtR943xd7oQ==
X-Google-Smtp-Source: AGHT+IGe8Rwcmuo9VN1Lkb94sZXMSVEBxRAkdBXNxIt/1C+WWqsmcYg0Za15vXGe3lPDFNIsmfP2GQ==
X-Received: by 2002:a5d:64c8:0:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-38a223f5c0dmr23948509f8f.42.1735428775256;
        Sat, 28 Dec 2024 15:32:55 -0800 (PST)
Received: from localhost ([2a01:e0a:d9a:4c20:d6da:7147:f20e:31de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm25785410f8f.57.2024.12.28.15.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 15:32:55 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 29 Dec 2024 00:32:40 +0100
Subject: [PATCH 1/6] usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Message-Id: <20241229-update_pm_macro-v1-1-c7d4c4856336@gmail.com>
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-spi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=pITQ3SISHmNURCP92MPtMIDVu2hGeerDTBhUOZa4ipk=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBncIqk5Qr8I8UCU+eXHkVfaa5GP81eSw5Fhp3mZ
 d3XzeEUBu2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ3CKpAAKCRDnIYpo1BLC
 tSpaD/92t81iuqxEUHcsYt5/Wd4eQOM5eEy6ZSir1T7uL3om6KgK6F9iIjSVBlFj6kEbB25IJ/h
 Bt1oVYolifnCrjPORvWAOSIw3MWCn1Osds32OjHMKm3W8nWcwB8bDoCMZBFhtpioriPGVKTjdZW
 PlEXPCH2XKcSdDdqB0Tw55BruLDg+f56q2fHv88gAjRqPgt7HS/IpOc/cdp04Z2k8rv0DL7Jg2M
 kUB00pqUBL0ghgILZkXQ/ylZJZSSQhyN7CeVrK7R6YBmUDf14wnLHEFOqj8Wj6hKR2cILhfftu2
 8x1MvvwQrupvZZoPTGCvPnt/E9Pe4N6LTXHY9fq+1a3Y5jJeFgnaYmgk6vAHEVT54lTshPXJ6iK
 oFdHkO6bjUb/71rNJrug6/BCIr+7VAkCnaMeK8NB8EmKeUNmo6pgBgzpLexiQrardLh+J7kq/pL
 kpaJR6FSoq/KZWSzWtpyHQ9r838IHznXZ/gd3O3j4h56wIsNKj1xC6N3fRBGoqGr1GAiwTAb1qb
 dOzLYzkIRXA4IlPIDj1CbJ0Lvf1y1Fis6k1vwl1Cz77RCpC4wa7/1uoB9S198DgNdoXvy+a/5QI
 oMezUW+nv2ob40fcPfwzr9abnCP5iFLv/OINnqBukVW8iUUCjreXiHUuLpBflRfZD2ia/9uLqpa
 bHzvuymCdM0rkJg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_153257_063967_2BAC5831 
X-CRM114-Status: GOOD (  13.63  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Link: https://lore.kernel.org/all/20240716180010.126987-1-rgallaispou@gmail.com
Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/usb/dwc3/dwc3-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index e16c3237180e970c184dfdb147c8abd46ff429a3..ef7c43008946e15b72d88aba4941dc52bf0788d7 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -309,7 +309,6 @@ static void st_dwc3_remove(struct platform_device *pdev)
 	reset_control_assert(dwc3_data->rstc_rst);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_dwc3_suspend(struct device *dev)
 {
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
@@ -343,9 +342,8 @@ static int st_dwc3_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
 
 static const struct of_device_id st_dwc3_match[] = {
 	{ .compatible = "st,stih407-dwc3" },
@@ -360,7 +358,7 @@ static struct platform_driver st_dwc3_driver = {
 	.driver = {
 		.name = "usb-st-dwc3",
 		.of_match_table = st_dwc3_match,
-		.pm = &st_dwc3_dev_pm_ops,
+		.pm = pm_sleep_ptr(&st_dwc3_dev_pm_ops),
 	},
 };
 

-- 
2.47.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
