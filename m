Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764BECF34CA
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDCoECyHKv9SOyqtbw5fneL4wMrpxykl0zkchVhuQTQ=; b=xMMtvR8zekh5AR
	lHDgojCo7Nck6q7b2BAXncNB/0ZoSkGpfCQ1Q/blMYxSaUovLsnebaV9GoNaleGeRultbvneWHfe5
	Bhovj9xwKn3XYb1hzAoqwATkzasjapsCzjI+ZO9oQKFrdBZDwNk5Y4h/8ZYsM0YCRq0iNZSSuMwiY
	Si3BpG5Law3PDtWDqiDBPxJPA+C85aAPgTGwdGQzi2ph7AuZZkQssR3OoF9mkcbLYxCxFI5ItS42v
	m+Z9rYnNmWDYFNraznbK2QOKbE4G1pQtd3act4ZNBMcxoz4TCKnnazeSslRZD6mruzgA0BF3kuGWG
	t9AG6t3A9as25tk7BZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTuX-0000000ASpM-0uG3;
	Thu, 03 Oct 2024 22:03:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpj-0000000ARns-3Eaw;
	Thu, 03 Oct 2024 21:58:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71dd92e3718so1105503b3a.3;
        Thu, 03 Oct 2024 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992682; x=1728597482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=A9sG1fhm/NJPGdfxr4G18K6Ih+RSY9r2nmoVNu4wNq+t5T1+9SkNJn8DIoyFRio1bI
         QWXqA3eSMk1+d4ivwqvOz3nCiBVGhXXcCJYx+Y+okxO25PfpGzDznifMmcRS/3717PqE
         ihLmeQN+9CSMxH9jv0rlljDn1pzQ97KgZu9tJkpr/8MWPgeUfmBAZtjdk3Ufa67MsY55
         BsT89xRa6SmpGeL+L2rrmwjkhGv/6NOQnXEWM2Fow6FL0R1/tCJBMG45xIHf/Ks6zOwb
         kZurjo3mumSPUqzucDGl8tjDp7tArX4ai4WEZ4TmoZ+7rczzJlpHh9h9OPsmAhTog2X+
         7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992682; x=1728597482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=ZWigYtEp2dVucU79E3zfguFynBiCWPPwTPIiW91PBjUypbej14/xg1oKJrb12Le3+x
         0VwYd1uZguDM/yjLQgK59JNUIZTmifoD11n/I+rf4IuKzNPydgqmXWDKBi4jzfkho+4e
         qgnTGGfcxzGscOpXycdXpwbIhBMdFbbTvHR0UhWGCr2mAq05naZSbLwb2nIeiMZQz3G4
         +yIiv6vWX7D1NT6iS/C5yq4zmBTYM9Yyr1cyXMcfoLbyiXt/h6CFXWPJWEr9BNpU/Yqh
         J+qbQdfTx/y7oLM8mZpR+fCjf5+MEsgIxwvhLDEI9ExeIM+pwkRa7ldkxtLeCv0b/NeC
         oQKg==
X-Forwarded-Encrypted: i=1; AJvYcCUXVYG2oa4S+N26kOas8JFeWssXMkjh3L2t4q/N8lGHLDnwQNqcEPucSaWU83nG84yjYf03bxzJ4JIAnsUkYS4=@lists.infradead.org, AJvYcCVJRL4PCOVMSDDXhpMR281Rku7UlvfJpEhdQ2bnlhtdVbgSbYZ4hHmVeoe2KhlJuxsko4SylydM2kFup3hj95oJ@lists.infradead.org, AJvYcCVq9Z6QBvvIF55xl4zVLLImeOom6MC7/Jj0kJMV4C8WOXuqvgQe/LnU0W0QkjpjI1o4MZvQ4u2X/3R0@lists.infradead.org
X-Gm-Message-State: AOJu0YxLV5/fVdnlF7+d0s3LAnElP/HQB05KPwCIbjgnuYDLWNXuJX8m
	KD+SXUZdrPybU14EMoeCdRR8Vq4OGY9wJyzaA22Cx3tH3LMebGPt
X-Google-Smtp-Source: AGHT+IHJqyapFBKOON3QyW/aCDKnHFR5P5nYewm7xCRhQXhZ3/cPAH/NbBXMeDfGtFQLIxdmZOQT6Q==
X-Received: by 2002:a05:6a00:4fd3:b0:714:3de8:a616 with SMTP id d2e1a72fcca58-71de2449f43mr796517b3a.19.1727992682109;
        Thu, 03 Oct 2024 14:58:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:58:01 -0700 (PDT)
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
Subject: [PATCH 4/5] arm64: dts: mediatek: 7886cax: use nvmem-layout
Date: Thu,  3 Oct 2024 14:57:45 -0700
Message-ID: <20241003215746.275349-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_145803_834440_F69C9070 
X-CRM114-Status: UNSURE (   9.76  )
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
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
index 08b3b0827436..9a6625d8660f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
@@ -121,7 +121,6 @@ partition@100000 {
 			};
 
 			partition@180000 {
-				compatible = "nvmem-cells";
 				reg = <0x180000 0x200000>;
 				label = "factory";
 				read-only;
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
