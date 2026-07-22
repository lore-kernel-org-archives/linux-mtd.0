Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E5C4452B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxKZ+Qlk8u9Vru2ZQuTWYCqadjTzLy+PkpCGS5DnEvg=; b=mm++KIhp5T3ve2
	t+kJMIiO4XaHNdX2SxRCC6Y91eFT+hC4mjhRkrQKvFwbpz6g6TJFxT9IclK0BY3VjcEHaDxT6rUfa
	rKeD/UtjStajHA/iWsuzWldW5D4ECBKuev2Wad52Fwo0Lnn3dylOgHEdbFnkqtOx8tNXr72r/jTZb
	gnRG1fYcHDCfL0+dHdHnHFpsPayAafd1NrWKAgldLidOnW25YzX/0nDheUr7k/CqXJgemeBbmbD5c
	NvZEMVnqlbUEB/fZv6LJL4dICZQdT2HH2CuezsHXwDoEFtfmIXZ2lKmqm9m87oD4gdlNONmA5tDGI
	XmHDNUYLxLjxXtJMRstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKXM-0000000Acyb-1uPS;
	Wed, 22 Jul 2026 00:10:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKXJ-0000000Acy8-3y1K
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 00:10:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4955484387cso21533105e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784679007; x=1785283807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OE5ny11O7o3qW7Wg+mBQmJxEbRaECYhAOdrTOApgu08=;
        b=L10YFovIl3u4dzCMhyApRGdzDwfu/U16G0MhFRNJLenRXUdrRa7MXfEGkY4mJ9ifNs
         9dXWH19ykhXivJN6+I1pi5TcTU+og7MjtFWqerEqQSKUEgJR7xCroWRF9v3xDW9fGsHO
         EPf06T8oWpvMAMTFaNyoyk9/0rjKPlNDNJqRsJR8o2XJsCLZuygmfC0sLIChEmffs5Xk
         fcExIUOEy5Ymyb+iL01f3hJ7qGPauAokQWvjDjM2OFm+BZyjA+aibBeT9x+nQmyD4YBk
         gjrA9HcQ/LsJld6gifQ7S/tNGUbTjRu43DMHqoH651KvIDl64s/Imws9amws+f2YDFO3
         Pkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784679007; x=1785283807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE5ny11O7o3qW7Wg+mBQmJxEbRaECYhAOdrTOApgu08=;
        b=Urtux4kJk8uCQygpkMnE+auufoXOVf0lPyL09rSxK+iy2nuTb9l7fE4POq8cZFF97+
         QMLJzmrSkfLAtIZtBtoJU1T+nVJAJs8Qe8094k0u4/ks0ctt28/3dsq8NoEDjDhtgmWL
         qHssgyIc51xazGgIhOnwGfCOnJ0yfXfkNnEAnBMmuk9NX2pYNbpXLln/UyVl5WxWl8IH
         s2xO78xD5d69c8wLkVr7K7ItpvG+1v3J/ihtVRgksz17Zds15U6Zx5uTOgSDQRHCRHZV
         Q4csQDbcwFNOVI21gcEXhFKqKUpkXEz4nJD3DstJkq1q5caGXxLe9HzuYu6be57rqtXx
         NU1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2NckTDdy+2oU5fNd49o2e8Lfg8yPvVmrt2Jq022wCVM9WsdbapjwkhQX/UprL1OuwGGEXQJOIMWU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwisYKKuD+pbpZr84n/ef5vQ/CQSvomxSn98fEXz/F/+tzulVvw
	wJ1Ogt1GGK0A8R+5LifFZPpYcOxp0y3JNSuLfBdeqcwmWTb18ZNeuRhVPnj0PbRF
X-Gm-Gg: AfdE7clQBu4vNGsg7zEG+Rl3l0wSGKIOF+eSwGbrEvLoevr1TdYnJtmOB1tAHieSAFy
	zZoo0i8tZ3KzNOXaKeJL1ObeZBDnGpolEzKkYZZYT8S0DievPBdBWyrz8qqhhRhjiJvbPnzM6KM
	dzWB0Q0AZvRLAndFzWCiW/hVkSxjNHRxaQshVQcRGOtiIZI/ezO5HRBH42s24NmpGuTzCvRnM7N
	yv2iZUsE5MAkZPhhm9L4OTyyGq45XWM0H87n085IfzDCYnb88/fjMhZ+CTnEuMaTAVvxQUtWYCJ
	VouFS4roOiLVadFVQLS5DO7n5D+ViMLeCDEDx7cPXyvs7mULz4Ig0wexopjzMjQmbSlBYePqg4r
	CgmAAXbZqrg4z83LuDaihRkNhjeMlHY9uLs5uhtXstTzA7E1rHuF/bvvUVNhrTSiAFt4uyLLgqk
	jI9VGKR82nlzeNta+3xQO9S4DeVYv3k9uFwBTnxrfO
X-Received: by 2002:a05:600c:c04c:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-495648fb143mr52732655e9.7.1784679007320;
        Tue, 21 Jul 2026 17:10:07 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:7caf:2ed9:b84c:3a8e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b72fac1sm9106495e9.1.2026.07.21.17.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:10:06 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: arnd@arndb.de,
	sean@mess.org,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] mtd: maps: fix dead select of MTD_CFI_BE_BYTE_SWAP
Date: Wed, 22 Jul 2026 01:10:03 +0100
Message-ID: <20260722001003.36598-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_171010_027555_EE2053FB 
X-CRM114-Status: GOOD (  15.47  )
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

'select' does not work on config options in a 'choice', so currently it is
possible to enable MTD_PHYSMAP_IXP4XX without MTD_CFI_BE_BYTE_SWAP.

Let's replace the select with 'depends on'.

Note that, if we remove the select / dependency, the kernel will compile
with MTD_PHYSMAP_IXP4XX=y and MTD_CFI_BE_BYTE_SWAP=n so if it would be
better to remove the select, please advise as I do not have the hardware
to runtime test this.

This dead select was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/mtd/maps/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index f447902d707e..f300953cf9fa 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -100,8 +100,8 @@ config MTD_PHYSMAP_IXP4XX
 	bool "Intel IXP4xx OF-based physical memory map handling"
 	depends on MTD_PHYSMAP_OF
 	depends on ARM
+	depends on MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
 	select MTD_COMPLEX_MAPPINGS
-	select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
 	default ARCH_IXP4XX
 	help
 	  This provides some extra DT physmap parsing for the Intel IXP4xx
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
