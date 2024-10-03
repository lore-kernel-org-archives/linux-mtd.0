Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA2CF34CC
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 22:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ip0+9JqT2v0kA8JWM6fM0irmBJ8B/2sGJwhHEq1DT78=; b=1JXz0SMvEh9uwe
	w4Ypt+dULMdzTa9HUroIRLLLAX8YGO2+jVwq1tDAmYi7oNuLzF2u7Ud5MZzbz83QOyACshBxdg/Bv
	XHM0Nc/G4uOb7vqVk4iTUlEfv6q1iOReMg+ZKF7Pnje6VoAE6bxmn5z1gKepbI7UddAl/scxSet8a
	UeITsarO2bzcIpCUbEb3xtxJLktCPAwgY7cLewc2GfwMbDYS0slg4DsDz/i5nJdYRTD46fJglE3pe
	mzkALuxEvT4jPw1H8RsUoZoxj8B0zqva7FTqwINgEAKU0wC+Uc8qiGMMAUZ3G7VAmk3D2LTex9gqK
	+1E2hyQHLwRBeYIwPJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTs6-0000000ASSj-3xwQ;
	Thu, 03 Oct 2024 22:00:30 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpd-0000000ARl6-3eXQ;
	Thu, 03 Oct 2024 21:57:59 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-718e2855479so1234460b3a.1;
        Thu, 03 Oct 2024 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992677; x=1728597477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=UbrVq1uCOkSDvwdbvpnFArVMxEdpZKD/TQqaUKyVYukCxPt8GiurKUiAI41tQmX+hr
         py4XWWgZtoJHVQ6+ijoeLlNQrfWLXwsqnU9xQ7DodlBxsuA3qUCw6EXMV7HTP8gDeaqg
         f+2TBjBpff2WZjzDvbmA60kb1o3dOVINTPok9M/ChMzbmS/u1qDTx9XKNUuBGnEw56Iy
         SVHq/9TA1sCcIzWEV+OY6zARUh9HA1iICEsYbhJecf9YYf1iIrstPJbzeBjT/80c9rCB
         qA+x4ubUZkWcVNjliAFbXtDw6KPNsGVPU2yQ9XDq+sV3RjhBcLARAcaJp/80PRujheF+
         pCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992677; x=1728597477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhcJclvvKlTVpqudlmq/F4CEOdWcM7OU7+3pakydX7w=;
        b=vQcH3Gw/z1oItvvIEVme/hZL6vkzzun69WQcW1/FoJdVpdqloHs/Yhqs/gEIhVJIOI
         QJEfFnaN7yfeZ7rodZQ9+ao6/Fnxyi8dZQejGikHCL4py9SiMdpYRHXJlMCeLfUEOxPq
         DEY16CfQihW457dvYL9R0bGvvh5i6WduSsviMOCWZ/EhQuyvwK0MrkuPkpCzL3rBtmfW
         ptAYs9I/WW3BqyyO3m6vpM6eYYmU0ZbfrffWRiSS1Ywy4hq+h1iVp3szIepRobD8odeF
         aoa5Rv5akDqwxNFbv+eaPmCYIoa1O9GetErvCtFJmHqoLoMf+JcueNn6+Ioc3onjf3bp
         1XvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK3YftQ4PdyGvJv5kX+nBTjXPBwuM7xNP74Jb+j1frtumCZ/crk53sxTdS7YAKRxrZ4IgXLxOTDHCdawPIEca9@lists.infradead.org, AJvYcCVIpwEZ62tS71wQOG7i2WrbaZJlNidavyT1pzyqAw95gPdUxpHAbMVdA6LZOnxhhjxfEPUjQke7GQpw/Rxr728=@lists.infradead.org, AJvYcCXfe5BTOF92eRnyXotcKvwSslPINjfRwiyMz6xkN7RZ9Ev5hmtA+KLAxeXatps5iYFgn6+fvIg04/oL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+cp+nBgB6WrIQyUYtJwnhESwMkM5moVcIxOdVdbh1zhbAclid
	wXoWrLrb3JuUkp72xghOCncVo44FPkHbbK7d6bJ8BZI16iI/kuzo
X-Google-Smtp-Source: AGHT+IF2A+OiaIcWGLxGd8MeHk5wY3Ar7PK8Rihzo/zaHvJamB//ytcahyJROu787wdayCYZ6ZY2mQ==
X-Received: by 2002:a05:6a00:181a:b0:719:7475:f07e with SMTP id d2e1a72fcca58-71de23a7b55mr858114b3a.4.1727992676621;
        Thu, 03 Oct 2024 14:57:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:56 -0700 (PDT)
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
Subject: [PATCH 2/5] arm64: dts: bcm4908: nvmem-layout conversion
Date: Thu,  3 Oct 2024 14:57:43 -0700
Message-ID: <20241003215746.275349-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003215746.275349-1-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_145757_931985_3A5E0510 
X-CRM114-Status: UNSURE (   9.89  )
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
