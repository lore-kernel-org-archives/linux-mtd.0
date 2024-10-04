Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4C3CF34D7
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ip0+9JqT2v0kA8JWM6fM0irmBJ8B/2sGJwhHEq1DT78=; b=KFS37xDyLRCWT/
	esqThm39KHJ+R+tLWQy7GOzh9KSPrKYtOmZAP4cJy3RPISFwzOxaOqeUpcmHWH6hCYJuVO38sYy36
	0TRAjI0zg+HpcUMH8fNhPU3pp77IJ/TvkUeM5OhTo6nQ04/ciP5Ot6CDioIdgREqgGvS+OZ2tArRi
	hiptNHCuRIFI7D0ABFBWezysbxnJcCmxcJvf8F+gseSrt47h8Ob8zy/wZBmkOFamzX5U1jHhADGo4
	nn41rseeXxXbd9f/GocesKohoiJzi7I/Bdb1jaBWztB03EYUHu7af474FQIswTDDfJY1lOI1k0hwc
	21AhiUileKbXejt7Fjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVmb-0000000AhAq-22k6;
	Fri, 04 Oct 2024 00:02:57 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVk9-0000000AgSL-3rEw;
	Fri, 04 Oct 2024 00:00:27 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7163489149eso1249097a12.1;
        Thu, 03 Oct 2024 17:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000025; x=1728604825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=TeuJNHK+Y1yBrCSqKjPM7Y02vw8Jxo4yaMhVjeI2mD2VfkSKganPd+5wuCcuUWiv1G
         I8bXLOuEPL0KN7Zykrl4VJ1gMDGct6HkKeLYjw7hTIPG4uILoub+zDfIOs2lRJU1T9Xl
         QpK3hoRcsMVdUCmfIjyoNQcEsExHZCYRXRTRpify9Rn78A0j9AweApqarqjj27VI4Mfe
         eboAFtw37MFBxteAkTXMTLwLKYz3Vc9Cf0ANF59rTRTnvu5lOP/t2OjiFD1NjiL8aQ0s
         qcxfgdSJf2/VJ+SCMbjqPhOU6dgGKpDCqBJnDOBJ0gBsGCZr9w2qXndtBHl+Xooi823r
         J9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000025; x=1728604825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=VaSfIKh/+A6RnlhxJ5fePbxyyf17RgsDRWzh8ftCKZfltoI+h3Ofy7MMtoNm6pY0rR
         yLLsL+R9XRWD+w7mcHNFOoHcDDTRYioSErfF9/U4e+JlLy2BnUMM8emPISuPoTiyUFCD
         IUSn4TmmNeYr6fDkYZ5r8VgkkNKKAE5iNvgRH+Mm6gaiQ2T11khxqTN/Nmpr15DoZBB3
         FL3mhmSJV+5sIQimxW9PtV/70eN+t5bfDvrnQNTBHtNvEHVpSOxugbBZ2QYCTOeRM6Wn
         X7rJeIQ1sQXvHtyMO57GVtGohzKTp/K23DKXTh+sJkLcDd6SfBWQkwdf83LDaZ3U/Pgh
         bO2g==
X-Forwarded-Encrypted: i=1; AJvYcCUqEc8fYnYzHbWhnyaK2PRbxrd3eD8FF0YPHQ1ZqhpveBh/bi2OooMBptSxTdRfomBTcIz6oYNhs91EgHq8lvg=@lists.infradead.org, AJvYcCVBXF9OS1SGq9Sn1XrLQEPnD87Wjs7sMX7p1uapjBMLwXKdu4nWUGtUApuBmjeUm8E9UHaOR61No2oH@lists.infradead.org, AJvYcCWeKYMoFkjLGmmk3wZ3/KzCq3Ddn1JgSJPa8I1VWEDM/ofBwRRzEQh17qCxuOYpMYXRFnZcwRSstJa732mgj2ii@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCENpH+DvhGozdFo/cq6MSGprPN7Mreew/A9qEmI8LCNs9M+T
	tIJJ8rDMluFy7c/bWYt1hql+PmjPU/M9yPAlEcIa+Jfd21cVKJuD
X-Google-Smtp-Source: AGHT+IHbZK38QJEukAZze8yEUquD9ve9JqDKgnu6Dg13ZkyRXwdNWpeQg7DPqKeFH5zR6BU/2QG0kw==
X-Received: by 2002:a05:6a21:10b:b0:1d3:292a:2f7c with SMTP id adf61e73a8af0-1d6dfae2978mr1585071637.49.1728000024877;
        Thu, 03 Oct 2024 17:00:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:24 -0700 (PDT)
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
Subject: [PATCHv2 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Date: Thu,  3 Oct 2024 17:00:12 -0700
Message-ID: <20241004000015.544297-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_170025_964690_257C8C64 
X-CRM114-Status: UNSURE (   9.80  )
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

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
index 999d93730240..df47fc75fa3a 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts
@@ -144,16 +144,18 @@ partitions {
 		#size-cells = <1>;
 
 		partition@0 {
-			compatible = "nvmem-cells";
 			label = "cferom";
 			reg = <0x0 0x100000>;
-
-			#address-cells = <1>;
-			#size-cells = <1>;
 			ranges = <0 0x0 0x100000>;
 
-			base_mac_addr: mac@106a0 {
-				reg = <0x106a0 0x6>;
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				base_mac_addr: mac@106a0 {
+					reg = <0x106a0 0x6>;
+				};
 			};
 		};
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
