Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4336CF34CA
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zqk8YpSYFxQXw4OxAlJVnb04LNFR6VJcfYsf4ZWTnkk=; b=E4ZbxxMZty2YT1
	QRT2H1q7qLZdp5r6DukeJwxZfx968iHn/C2CW70rgmquhLmXtSmhjGxEg9jhnqWQl6WW4BvQydmNO
	4Co7LFk8fjQmMY0L16ly3gK7Nopg3xi6gSe9Z9enFKzGGkPOlWriSCcA8RaoVi4dNWFLLFv16bFua
	tybfHRBuH8Sl/QuMVWdJa7u18hnudxLPXlPdQBtRDIUr2rcq2dpv0crUlCufxw/FDHJT0bbVJp9w4
	i92DWRft+ctwtb9owcaUKSEPAE9BkFnsRceXFP1iFHQnVedTMCqCFkR6JeuztfzA0KJSNLSGajUoy
	cxJJYWmF+OHnvd41BumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpZ-0000000ARkH-3qgj;
	Thu, 03 Oct 2024 21:57:53 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTpX-0000000ARjr-0IOl;
	Thu, 03 Oct 2024 21:57:52 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7db233cef22so1095280a12.0;
        Thu, 03 Oct 2024 14:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992670; x=1728597470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rldSH3goLboiuzIyKQvXMFAVAAa6He8Aw308I+Evpbo=;
        b=hLH9mkTB7GO4vJdxzqtU46dx/KyJGNQksmL8g7iMzd1dHoA50IFaQP4qI86wmXthmA
         6VHBpveEtLoKEwMAUQ8F+Ha1d+SFZYhuu+k1Z3Vfhbp4TQs4wU3XEVb9EywLaudrZE7E
         yHAwkCxMTOeiY7yg2AHokVkHPS48xzBVdxvzUB8TcQijy7WpPcUNTBdRITTQCe9JeXio
         Y0IkhGq2OJF8XWFzeljM4t4wKtX4Fv84HBDk6+K1R1jcktxWL//YtKKAfx3yvO+vErfM
         L18LEGH/wySUnjy7LgWBO3/l2zwNdPsgtUJcrYobcO35l/CHAmRMTJHy+4Wt/81u84aU
         mxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992670; x=1728597470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rldSH3goLboiuzIyKQvXMFAVAAa6He8Aw308I+Evpbo=;
        b=oDmpRIVC5nJx+0C3jCtbzLAScqKu0U9CFozwDOCVh0n+IqWoj5Z3TpzuQCeM6TrzAe
         q2pMbB/GZ4eH202B9RTSWworNeOST+4q8Do+yKKznbdw9F0E4M/VJM1NaZobBI52gwhC
         j4hP5YjMJ54nqGX47StTPGBcnwhOAVx3m7QMF9QXaivwJUBo7HAGTIB6DUm5Gxw6Qoa+
         q7QqQII9t77oL/zHWBNsN/9Xde0aScCy3NyH5CGAPSWuYORdFbo19uWShRsg9H9oZBCW
         KkJ4gNINUrSp5yMu094aWVZDGCfUJ4mmWzddvAHCGG7KDmeWJZMDjn6r0sSgMaXwAKrL
         hG9g==
X-Forwarded-Encrypted: i=1; AJvYcCVI/O5nDuwrBvuGerJJ/ff5aSUkmKGEKF1nU32P4g3mWiaRai1z/DYAjJjMXCzpvWYELolKKbAA/TxEMJjMoxk=@lists.infradead.org, AJvYcCVr+QVldv5AANtqANIH7HC+F3UtmqFxTWU+38R4RtjFAXtbeuXCdcWBOlEd19VDmYgcw3U4T9CB6/Mj@lists.infradead.org, AJvYcCWxKsZNSrJblvUzLDhoUmkCmWLSVlYAvkULP/stwwtga75Bw3qDBggKNVlxB1vb/HlrUgxr/zggvNjEVL5N6+QQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyTfAvauJN9xT/yKinNs5zcqzW87dTGwHp1p1iuz1R/oj0qOqxZ
	JxVBHB5k7PCxBqMYZd+mIhrtqQjrqVeWQ0wq4XqHgT4oPTDxb0E8
X-Google-Smtp-Source: AGHT+IEncAQI4RNQQ2Bpq4bHf2MbPfAukQ7rT7lAlsdy6iH6bURuh500IT5CNC1KoOgRJ0IXotqWeg==
X-Received: by 2002:a05:6a21:9204:b0:1d4:fcac:f0fe with SMTP id adf61e73a8af0-1d6dfa238d5mr1289692637.5.1727992670350;
        Thu, 03 Oct 2024 14:57:50 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e67esm1863026b3a.39.2024.10.03.14.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 14:57:49 -0700 (PDT)
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
Subject: [PATCH 0/5] devicetree: move nvmem-cells users to nvmem-layout
Date: Thu,  3 Oct 2024 14:57:41 -0700
Message-ID: <20241003215746.275349-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_145751_158376_1B9B677F 
X-CRM114-Status: UNSURE (   6.57  )
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

Rosen Penev (5):
  ARM: dts: qcom: ipq4019: use nvmem-layout
  arm64: dts: bcm4908: nvmem-layout conversion
  arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
  arm64: dts: mediatek: 7886cax: use nvmem-layout
  documentation: use nvmem-layout in examples

 .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++-----
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
 .../bcmbca/bcm4906-netgear-r8000p.dts         | 14 +++++----
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
 6 files changed, 53 insertions(+), 43 deletions(-)

-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
