Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04345CF34CA
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAMFZAMtDZIsrPTQrR1zI86lvz+AveMAhS6htI2CWrs=; b=KI9maCgCZU/9Sb
	zyMhK3aT6C4TDnvliTRIgJ339asv515kzoLGHxLtmSzml47aTiwz4M3YCQaUGAE8voTRKB0IFGZTR
	Sl+SCpeA7CA95BrgAm4mQ31ILFq/mRiGcQWc7fWqzRGjSBBdhzb23p7SS1JkTpUTjQHRpWZtSPLUN
	1AvcEr6Ijw02DtX9NSBbsxoBKZWie67C4SHr19HsG/ymslGezs39L8jX4jXKU1TpJR0Ro4F45vICQ
	Sw4UsNWX8gyvsAq5YgBP1E5i54LzQ3k7lwuP8+Me2Wa/R70YnXTM10cTEnNzeIsAAlDaki9MTQfT7
	5AUXxgFw5wpAmgzEyopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTtK-0000000ASfX-1PMq;
	Thu, 03 Oct 2024 22:01:46 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpg-0000000ARmT-35ro;
	Thu, 03 Oct 2024 21:58:03 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71c702b2d50so1166889b3a.1;
        Thu, 03 Oct 2024 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992679; x=1728597479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=Ge8fH3W+ovmqAEWvrde9F6a+rs61jyIxEQgblkvycbBatC2VLugbbcUt/kpK8v0cXi
         jJHKsEdLBBjOMzzMNPw/3d+lZNO694GIlOnz2l+kVmyhTNdtEmiLJS+GSl9/wMt3+uNA
         4fZCCkeUYEGwSkWEzxVlH4JVQmOcDMc9gr4gknGHUOtG+yO5mNEQsIQZA6Cd1LQ5MUnj
         SqFA4Hvuj03U8OUnxXVSze3Qmpg1XpLUsXYESqgPCoNiYtFN1bvgwG6yd44iXZWe8fTF
         zfBSVDmQCw400i3udXZsZD2b8VZPEDvsXHpWGWe+PDIDG+kKmbOLl0hteQnYteMMiBPy
         3Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992679; x=1728597479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsYC/7Jtn0r0x1yjqgQrRZfLX27SForPWBD0tqCYg8o=;
        b=s0C8YcL2x96HfI81wQR42whBGuwQw3dhbI5pgJN+pMBberFeSEn8K74+tGTQuZDc6E
         twwoQRpE5iQqAwep2VNOIOIQJH2qyoLp87KiKkou7XbK6do1rrjsJxF+vO0JHOXbxzUU
         vJHGTPy1g40xKg9mDbAyJogVqio2bl98P3rj1fnWmm5+oiOt+EgRuMPk6p55ItXnClzb
         k4cjGIDV+pUK1ngooiLNXxdxcf0u3NwqVcrfLtN4IXspsW+L7ORl9MMAHT99bJppF9Ff
         sOhuiCD6RTO7oqPpYmSIw6q1HLN9DwVpOx9bFLmN7XJn5kiKj6B2H5KbndPcplr7xlBv
         48vw==
X-Forwarded-Encrypted: i=1; AJvYcCU7TjobMuuyz+1ZddHIFvX4R/cPpPIgt1et02J/wLm+n7yL3SxpKJtHu4b0z0hMhDDpmc4+ow9gSOv8jd8XhRmq@lists.infradead.org, AJvYcCVht4s73TuSCfP7NMFGygrFvpxojoOqqERClQbrha/wceX5LqGPSSh3gXCb5dssS8V1eUndH4c/wO6gnPBXb50=@lists.infradead.org, AJvYcCX3e3y1rxQM5JKYfapfUJl5eQjAMl9hKnf1pt81tHp2KoLgSBcHp2YC+6yvzhC+iRhvjl4Ti4upqh1t@lists.infradead.org
X-Gm-Message-State: AOJu0YwUe8QmpRq9C/HLVVllaj20JvDlevrlUJGiMllmrJYxe3iF4mSD
	VyoRPyezmc9lq/GSEBYm4vWRtw4k1FQWZLLWe6HXXC9tXSaOcjTn
X-Google-Smtp-Source: AGHT+IGNMbuIWrbIujwDABmLxc7Xkn9bDyXrwfmLiE2AMdFP+FxMPt8AB6DnXDiuWAiw72FyjSuYTg==
X-Received: by 2002:a05:6a00:138e:b0:719:20b0:d041 with SMTP id d2e1a72fcca58-71de23b6c4fmr898223b3a.10.1727992679452;
        Thu, 03 Oct 2024 14:57:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 3/5] arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
Date: Thu,  3 Oct 2024 14:57:44 -0700
Message-ID: <20241003215746.275349-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_145800_805613_86504502 
X-CRM114-Status: GOOD (  10.03  )
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

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 56930f2ce481..7b801b60862d 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -98,10 +98,24 @@ partition@f0000 {
 				reg = <0xf0000 0x8000>;
 			};
 
-			factory: partition@f8000 {
+			partition@f8000 {
 				label = "factory";
 				reg = <0xf8000 0x8000>;
 				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					macaddr_factory_0: macaddr@0 {
+						reg = <0x0 0x6>;
+					};
+
+					macaddr_factory_6: macaddr@6 {
+						reg = <0x6 0x6>;
+					};
+				};
 			};
 
 			partition@100000 {
@@ -221,17 +235,3 @@ fixed-link {
 		full-duplex;
 	};
 };
-
-&factory {
-	compatible = "nvmem-cells";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	macaddr_factory_0: macaddr@0 {
-		reg = <0x0 0x6>;
-	};
-
-	macaddr_factory_6: macaddr@6 {
-		reg = <0x6 0x6>;
-	};
-};
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
