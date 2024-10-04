Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8FDCF34D5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3rsogE0wpR9j/bQPejoiO4PSp2VU4t9p7l073XxJdI=; b=zU30ybQlKcc6+5
	7ArdjS6HchdL4d0Ee83lGuqn5vLwn140U97pbiF580wzgd2p91A+p4WP0yaoISE8mmpbPHnltUG1h
	fNGsgmogojO+4zSpmB5Ap03mKodw7y22LFlnHxXmxaCbp+JB00jn+FYTl4EFIdWckCUxs3BGtFufl
	T1h7mnIzyAx1pgU9CO7o2uDovadX6tz/uV6tW78vRgHG/+oFEY95A3mcHF/tSfmlHK/Klm8hkJbMO
	SEDM+/4ScTQDDmYoBu/3VJGYkYL3l8F5MuvgnMqBBL/Xsu6ENFq3MWcd9jJCEN0a7oca0kJaPkBBm
	RmOgbfGpGQWy5FqR9/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVlM-0000000AgmU-1wzR;
	Fri, 04 Oct 2024 00:01:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVk7-0000000AgRh-0nNb;
	Fri, 04 Oct 2024 00:00:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71dba8b05cbso1557595b3a.3;
        Thu, 03 Oct 2024 17:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000022; x=1728604822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=MwO6U/xBNc/vGI8+MBt+ygR4imCyJ9WP+HQf3pajGO0+ceizysnd0ypMqsti7kP+JY
         /eij7rbrt7PjXYUObHEGg2gBoRx4u+iCI2i9a+akZXlm3wwaKYFwipG9vaxV55TPb81x
         kagDoCriLFdFAyWRpNPYQTY9QQlKvIS/K4biAXxxJ4zVih0o00jgzWMrRcOIqNkrd3jl
         H4IQzcuZxi7hI7F2CumRqkyjWBQY4DQrHFlRBl5YVGb+pOZBSfTSQBXZejCCRTshCKK+
         iK1Z6LJgS1Ts7WSXWb2HYWaMLV856rkiZCr6Aoqf3gEpBgx7AwBfYIt17b/01YwHd0hG
         s0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000022; x=1728604822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DckmO3GetrEG9p87L1DNtWdqDrBGlrP6K5aSd93K3po=;
        b=LbGnqvLJUsG8J8lJyApIx5xuwtWy+E7DAz8dVhAjxHh0SxsnGT+UBzSsd9dQyfm3q3
         1czRKRn6YXAIm0PU1M1JYRv/ZSM4pT4EEaqhcpQ3BHgZZt/rl2T0cuuCirfiOA7oSCcv
         VHWGqWrS0V51cM/sJFlTgJH5MvaUXanjMlFnTJeV3OqkHVGj9qPFNF1GGHNqV3nDg1gZ
         P26jwsuYWK46bXvK+2LjhL6/RasAU4/AR3XPQLZHOhSd9DCz2R1gZa9cDJwfJUEhvmIM
         XPWZbaQcVXdVGaPlnmIusPY3NNPkYQW96KSMj7biKGn5Qe2jV5gvlOKBAEod+DlFywma
         lLiw==
X-Forwarded-Encrypted: i=1; AJvYcCUhjhQa2Y7piGFRGzrL6vniB8Z3m9q0hSsYz/jnDogLvKkb5ooyJKy1A7YXy4m61zTo4sL5Ew5g71eMQl4x9aZe@lists.infradead.org, AJvYcCVN9hfOp2TW+x2yce6fDZwOG0Pb5HwOWUyfKcYJozlGINQddMNpc8kFl9RiBm95fFvtqAoHh5gq7WYU@lists.infradead.org, AJvYcCWoHUCdr81lndNtOVbM2HMuU7UTf56fQbCtGGUUC+Rfh/36xR9nDo4N/XL+pm1agjf178DcNYfm90EwfHcqESc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzufd56dnZj5/DcdIIABZuHup4nfEqqzbn7ZwkEn2VzICNw1RpR
	zqNbvfsLdtE8eKG4r5fGedwAqqMTf4cWGDWIxLE3BSIWUWnmajth
X-Google-Smtp-Source: AGHT+IHm2GUKSAgOZ/HpAD61qlTLptSCf6b1ehUZaaZSY4WZ55Ktmo+s9wq0ZVPPshsAPAeA01XKkw==
X-Received: by 2002:a05:6a21:1583:b0:1d3:2923:e37 with SMTP id adf61e73a8af0-1d6dfa42fc5mr1511911637.30.1728000022072;
        Thu, 03 Oct 2024 17:00:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:21 -0700 (PDT)
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
Subject: [PATCHv2 1/5] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Thu,  3 Oct 2024 17:00:11 -0700
Message-ID: <20241004000015.544297-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_170023_243707_F936E384 
X-CRM114-Status: UNSURE (   9.95  )
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
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index 0d23c03fae33..a6d4390efa7c 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -166,16 +166,19 @@ partition@170000 {
 				label = "ART";
 				reg = <0x00170000 0x00010000>;
 				read-only;
-				compatible = "nvmem-cells";
-				#address-cells = <1>;
-				#size-cells = <1>;
 
-				precal_art_1000: precal@1000 {
-					reg = <0x1000 0x2f20>;
-				};
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					precal_art_1000: precal@1000 {
+						reg = <0x1000 0x2f20>;
+					};
 
-				precal_art_5000: precal@5000 {
-					reg = <0x5000 0x2f20>;
+					precal_art_5000: precal@5000 {
+						reg = <0x5000 0x2f20>;
+					};
 				};
 			};
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
