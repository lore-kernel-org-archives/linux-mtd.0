Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3074DC54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wBLcJg4KArILNOkwmqZvRraaS3ZEbd0OAz9cUnJ7Wgw=; b=cc7CaThpaZWMYu
	vVb0vNlipC8pUZSWL9LENYfI8wwd3LTRwHU4G5vqhY8SlMeE4FzzzbKV5/FRgNSuC36Teihc70OiE
	iC8OLCWJa+LR/xBwhyzYP4mACp++xOzLZbNyaThEVo/OAtlZABG6lAxA9pkUA1bwN6nuvFmQHyjTC
	ZLxtuSQrcmQDDPP2rte5ABXG72oXNUEP+5fvIg5K7B6hIIKJmYBP1Xt3DvXPeUaXuXDY0ObZlRr/a
	bF3Z9AtSoY9LtEAqXq9DKjm+Gv/SPwcScE+Baw9/0EpEccz/Iu/SeW04IvoO78xqWRYgTCJXPau9d
	ewYJ0jGvwmOQSV4pzhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmosw-0000000FZ16-1XGM;
	Wed, 20 Mar 2024 05:53:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmost-0000000FZ0C-1qWa;
	Wed, 20 Mar 2024 05:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710913987; x=1742449987;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=0LrxTVE0XKWIB1jGO9V/AOKAuidZcyOpzRVqKralvAA=;
  b=axHR/Yx6eRb7UG+GExC/SK1mcWAcNA2kwBta33j76aDlL6tVZ8P3pHha
   e1s0BhSaqUelOw00UJSBRrfu3kayeHepOgaZKzvOUKHN0OyNLyRmjBeh0
   8oZ+yGSSOwJHBili9ZtSAyHHqjR1rrgV9FIwoVss0i4/Bb4ugWyxJNa6f
   Kpz/NWSwDtPk/0N49LDajdv/9IpExODqju5p8RzKx2kBeYmMWdeCySdwr
   gck3qmif22vTHhw+cs0W4ePKpfexXm0YmwXbbYxpx4WLyT/5w2VB/AKm/
   4s6wsARh/zhe5rkqVrjPYM3jIskC1yvpdfR980ynBOOKGeT9jXDAoKOk0
   g==;
X-CSE-ConnectionGUID: JdC9FX/zRcy0DPyWmaJLzA==
X-CSE-MsgGUID: 9PlCotqfSxuslw082RtqUA==
X-IronPort-AV: E=Sophos;i="6.07,139,1708412400"; 
   d="scan'208";a="17851042"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2024 22:53:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 22:52:49 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 22:52:42 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 0/3] dt-bindings: mtd: atmel-nand: convert txt to yaml
Date: Wed, 20 Mar 2024 11:22:06 +0530
Message-ID: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAId5+mUC/x3MwQ5FMBBA0V+RWZukrQbxK2JRDCZhSPueVMS/a
 yzP4t4bAnmmAE12g6eTA++SoPMMhsXJTMhjMhhlrCqMwpXlH1Eo/lCcjHi5bcW+Lis7kNWkC0j
 p4Wni+G3b7nlejAGuTWYAAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_225307_838605_12429467 
X-CRM114-Status: UNSURE (   8.22  )
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

Convert the text bindings to yaml.

Note:

This patch is done on top of the commit I sent recently.
https://lore.kernel.org/all/20240320025258.6854-1-balamanikandan.gunasundar@microchip.com/
Please let me know if I should resend the above commit in this series.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
Balamanikandan Gunasundar (3):
      dt-bindings: mtd: atmel-nand: convert txt to yaml
      dt-bindings: mtd: atmel-nand: add atmel pmecc
      dt-bindings: mtd: atmel-nand: add deprecated bindings

 .../bindings/mtd/atmel-nand-deprecated.yaml        | 156 ++++++++++++++
 .../devicetree/bindings/mtd/atmel-nand.txt         | 236 ---------------------
 .../devicetree/bindings/mtd/atmel-nand.yaml        | 166 +++++++++++++++
 .../devicetree/bindings/mtd/atmel-pmecc.yaml       |  58 +++++
 MAINTAINERS                                        |   2 +-
 5 files changed, 381 insertions(+), 237 deletions(-)
---
base-commit: 66e1bf9c75595f96cefe0c32a7a719ba71c11bef
change-id: 20240320-linux-next-nand-yaml-b8674ce41e13

Best regards,
-- 
Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
