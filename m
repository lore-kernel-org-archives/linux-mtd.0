Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCFBCF31A9
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AEreEtPme4qXE57CukovfXi4gft5kJeb3zCXY+HKmB0=; b=KKN7kSCIJA+tp1
	0PbPIGD10EcCG1QswN2HngMdTgyB0mGVEPNKSJDgROY3xuxRCOIM5PaYZIk2WPMVlaM1ucXtV3me5
	2hOqnwHeP9fR5CxfzzDr1dS4Nwe9bbTS8ybFa7r1DUu5+hM6l2IvoB3rS25mCozWOhTv7YuCWn3BO
	hr9pYfXT5l46Y+uL3oTFDmqGqf/6Z4l7TTfjgtg/m+DQNM24gDq6vkAVBtCHfDXl2Rv2PoxYWbsAt
	WbZCSA9Hom43v3Qno5Y1WEjgRDv1yr6DnrtAGAlZl2FXHEXLADhhrt3TTmZ725X7iEnQyt3ullcQk
	PrHkZqvKSqJj6OfKnmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svvFG-00000005FSy-2nOS;
	Wed, 02 Oct 2024 09:02:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svvFC-00000005FQf-38Ev
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 09:02:04 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5398f3be400so4120536e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727859721; x=1728464521; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mdt5JpVP0bgRi2OYH9kKycUQi9eynDQkDEKQZICX4Co=;
        b=iliWBCtyXzTkkHaUjp0a4qmhqINqB2GEaLOOZI9b0S7djUdRlvCVeg2y0gSo6Jby0/
         if3vf6ic0urwxAiFMMeHRSfYIniyaDI95y2IlQfNLe2+xNhrz771KUQN+ZidXVIn+Cfn
         3xsH6MCIfKcQdTIs1sU4BrflUIdAYC+80WuKHyUs4CRy1JqC/kP9GRTrQQs3vPpBryEG
         GtZ4dwIf8hplHnTXHwfOenER6rPBLsV2aWelVbIIDV8XBtu1vgH0EoTakxoNpkmwH/Zl
         HxdV+VwplHDuqjsAyKJSIWjIAI/oInTDNe+ULScTJXswK+b6xO09QkYEbZ79r2pm/iM2
         LFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727859721; x=1728464521;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mdt5JpVP0bgRi2OYH9kKycUQi9eynDQkDEKQZICX4Co=;
        b=ApaVlz2hbBsJq4iv9QPfW+3nmWoj8NBsAMeYdsJm7lzLoVHGc6lw5gqoL9kKjNLsGV
         B82SKkxQWJCZ4SZ9Qq4ITVx/8tPdWTyIeYlhokm41DyXlUXxBEZIuYfs9+QRewZFN5gW
         Tq/DpXBRQuTqqa7yfmvMH9T6quoyGAsbCy3WEmCPhlyHGRvIOsiOOCd+YIYZSDsP1j5N
         CldQ3kgpqYEeH8zib5+xZ7n9D2cJmFu8UgbuFkZduo7SVCRzvPAvHCdkg2y/0sJnMXJX
         rsxaW52WlYutMbyp4lL0AVzupNQGuRi4E7iR87eHl7NXEQ6JT19zeTihVx3ksYbX88+p
         WYpg==
X-Gm-Message-State: AOJu0YwyIPYsKAQFGSF4SDdPRDireT9dguoQ+zay5uHUt6xOhnRtZe3G
	u4OlU0/S5g2nzO7yhr3bnMdo0DbIxFm3myaHclgKuUECYkMBAchCGZTO0Ijl
X-Google-Smtp-Source: AGHT+IHfKTzoRILZlEbPbQNY2zPqg62hxRIoGve0tiIWH1a/ccCzD0zQzlfsvl94cpRVs3mhRYZlcQ==
X-Received: by 2002:a05:6512:b1e:b0:533:40dc:823e with SMTP id 2adb3069b0e04-539a079f87cmr1141569e87.48.1727859720451;
        Wed, 02 Oct 2024 02:02:00 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e35asm1846796e87.85.2024.10.02.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:01:59 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/2] Add support for "on-die" ECC on Davinci.
Date: Wed, 02 Oct 2024 11:01:29 +0200
Message-Id: <20241002-ondie-v2-0-318156d8c7b4@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOkL/WYC/13MQQ7CIBCF4as0sxYDtBp01XuYLiYwtJNYMGCIp
 uHuxS5d/i8v3waZElOGe7dBosKZY2ihTx3YBcNMgl1r0FIPSkolYnBMAiU567XxZrhC+74Sef4
 czmNqvXB+x/Q92KJ+679QlJACe4dI6mLNzY3zivw827jCVGvdAWM7kPGaAAAA
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=8meIdJc4caNICYlngTOBCzIaijDqIpYkF0ZnEQI5slE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBm/Qvztcylyg2i9IvFjGRswRfM/IX2KS02h+LNB
 cuD9qV1WnKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZv0L8wAKCRCIgE5vWV1S
 MkuJD/42ebdEUeBp2YdpxxLBblcIaVVFjvLxieaagA8+Xa+A2lY85zFkOuMU88rXYuLgBuy5Se+
 3DvMIA3t7bDuaJ4kiSiGyabi3y4QNonJTsPZ74UTo/TV9siPTmbKSyUe2TLOT2py3u+uQRv481d
 Ye8EdFmi5V9qeR/T4WSvCUNwreSz2b8bDPm+AZFEEHEiBf4U6j/exxUwlT7NdmMqBKTs9yaZ5vh
 xhjsE5YFIaI+aRWRHahH+N6Koc48c2J0xGTZMqN0JDTNu1JA1MSP1kn61X4dYKSu8vGuPTB0fkC
 FK+KT2bfCqiXDEjQZjMuRPhR7u1jdcjQ96z5Vi4/M1HOxewRE3FFwad8Qo/ROZXu8uj9g1QNIYa
 Y3I2H+iHzwtwPK+2LAYZ9fnV2z4vcdw+1K7FJj5f3kGLR18dNKk21i+UD0oUS8YLP+FPJH6PXxf
 n0mvXbXZAbMZYXKA+ONUv1yXcWQW9e654Xomj3sXmoyw3hGiqtiJ4ul8DRX555u1h94owkJANqs
 4Guh8AOWo4Dd/TtKJO/YxBciPBq2I6AciFJTfuW7bgWBMToxJKYPwLH9wpjr0LNMrvCC+ahQLsA
 Pp2K6tl61P6nuCAPrBjE/uQHr+4vKmO5/RykdhZbpYQRL0ik16O4ubRXuiEyZB3wWDf3FusnPq5
 T1wZ/bRGZJs99Yg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_020202_823505_1875C8B4 
X-CRM114-Status: GOOD (  10.10  )
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

Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
Add "on-die" as ECC engine type in order to be compatible with those.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Convert dt-bindings file to yaml
- Link to v1: https://lore.kernel.org/r/20241001-ondie-v1-0-a3daae15c89d@gmail.com

---
Marcus Folkesson (2):
      mtd: nand: davinci: add support for on-die ECC engine type
      dt-bindings: mtd: davinci: convert to yaml

 .../devicetree/bindings/mtd/davinci-nand.txt       |  94 ------------------
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 105 +++++++++++++++++++++
 drivers/mtd/nand/raw/davinci_nand.c                |   5 +-
 3 files changed, 109 insertions(+), 95 deletions(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
