Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C201FCEE350
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oVauWaMNhQhztji/Mlxr/AuEs25Tu37qYu/uBcaTSKA=; b=b+7ou1xc1BCr8k
	FF1lDDk6nHQJn6mADuLxTyUE+j8TA/m8ZjuBr/qIriRCAnHUojGO6LgfLuVu2K+efFsHVASruO3uX
	n1JrF9WOjNQStJpJdDd5bKBdN4I9Gnt2mwo2wOOCobUYn0HR98+lO94up854A3F2xNaUD1QQKaPly
	8I5K2AaAfBknaqqo5g2k1DLmqJqWbS4uK+eL+hIzT7ll4IZpfirg1l/Io4GhrkzD6hjYLxWKHHYKo
	v/lDlR0Cfoyi9Wq5O9Lkoc4nDE7X0ZcwyEbhXl68oWzRdY7BET6QkDhtrgjZxhvWlqcMFtb1KGQ2y
	OfN3RWyKYYGC/99ME7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syeYC-0000000Aps5-3h9z;
	Wed, 09 Oct 2024 21:48:56 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeY9-0000000Apr5-1paL;
	Wed, 09 Oct 2024 21:48:54 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ea07610762so182301a12.0;
        Wed, 09 Oct 2024 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510532; x=1729115332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsc77yU6h/SVtewHZMt0EkR4DYJQPGGP/A/3IbaxlQk=;
        b=O8MSRoMmsctKs4eIHToCWME+oku6kYfyMEyWh2V9YDeVpADV3PpsYuEzPVXLEUsWpQ
         SHTv+SK3kiHh0GUk16vyepNihxoHpb9ri4rrR1+g3jwV+XXBjaKd6zQuO6miyK5ThHJE
         TI162LosY/FRvQ6c/lvJdJMkyRXwW0StF7XQp+NKwzQqrnjc0HERhppsLMcMs0I9xwUH
         Ce4BDgeSsA8ROMAuNgHykoXwE9G1Bmw/RThpHb17Wl+ozIDI1utnbjvaLLP25122qjHu
         kdhWWR0X3qgVEdPUnK7hdZn31wCuVLfe65MuvuZUK8213ppLSOxGyaohI8+iba6q/uDe
         hrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510532; x=1729115332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsc77yU6h/SVtewHZMt0EkR4DYJQPGGP/A/3IbaxlQk=;
        b=YBkXVcvtUkF7vv5zGz3nYgskg/MocRb1oNOjqzxoXk7m+orMvK9SeabMRpuKxzR+a/
         5rdW6rSveJMYw8vGH1fYOiXUhFLJb4E2SuI9t9uuJ/ZpfzSpP5czY346RiA+4qcj5byk
         0xxndmu94K/7o49TszkedeQY89nzK4Sppo6jAiNihmPYIADeCcenfknPWR/CaCxggyUa
         wJKiuQ+zo8TrbjO2rI9MVPid7jww6/I7+rlIsxwZ6U7SojHkdd7XOzRpZpDcEHBCVFQr
         88S0n5WlWCphwRGY8iRiH1QsMtzIovS0lyzVHVj6TJ2DhRe0LFwQlfXjsL+0OyMJvLr0
         Fv+A==
X-Forwarded-Encrypted: i=1; AJvYcCUbD1oFAAVN9t4jUK3bi7R+u9Ws4vKLddeRDMHza6PM/Vmisfr+CP3/vMIo2B7R+61t1qL0M0RBjQzp@lists.infradead.org, AJvYcCX8EJRGN8HpWyIRrhxMX5NLVOgXRXBiKkFyCse+gL+a/2AIm8XVppoYUmuCA7talbH30jMnM1Ml3UAJ0n71T80=@lists.infradead.org, AJvYcCXrs+hywBaz5GHADzVJXsHQjSYhSq7yRbcmkHJ8lGy/xCBvU9aArk6tXAhmZi+tm4L+XNN0WRCzgP4LSIbYR9Qn@lists.infradead.org
X-Gm-Message-State: AOJu0YzQT/fGNRgoKCe1ezaXuaxkGb3b8MPui7So8skA3ZLyuowyVa50
	wDMFia5LUKur/QtURovMmnKSmHqqxPkdMlIOj5e259/Y0BSr/p1Z
X-Google-Smtp-Source: AGHT+IGK1cHwSJTccAt7TwIsiYLVGOpAlwpobbrYlDvDsMvnOLZ/6QlmNj4axQiJgt0RD+BBRZnBSA==
X-Received: by 2002:a17:90a:558b:b0:2e2:991c:d796 with SMTP id 98e67ed59e1d1-2e2a2328a96mr4632221a91.9.1728510531781;
        Wed, 09 Oct 2024 14:48:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:48:51 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 0/5] devicetree: move nvmem-cells users to nvmem-layout
Date: Wed,  9 Oct 2024 14:48:42 -0700
Message-ID: <20241009214847.67188-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_144853_495591_61822067 
X-CRM114-Status: UNSURE (   7.48  )
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

The former has been soft deprecated by the latter. Move all users to the
latter to avoid having nvmem-cells as an example.

v3: add back address/size cells to fix warnings on r8000p.
v2: add missing semicolon to fix dt_binding_check

Rosen Penev (5):
  ARM: dts: qcom: ipq4019: use nvmem-layout
  arm64: dts: bcm4908: nvmem-layout conversion
  arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
  arm64: dts: mediatek: 7886cax: use nvmem-layout
  documentation: use nvmem-layout in examples

 .../mtd/partitions/qcom,smem-part.yaml        | 21 +++++++------
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
 .../bcmbca/bcm4906-netgear-r8000p.dts         | 12 +++++---
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
 6 files changed, 54 insertions(+), 42 deletions(-)

-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
