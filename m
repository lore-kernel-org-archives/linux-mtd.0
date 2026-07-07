Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8ABC44500
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2026 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TEt87RnfaLLym5gr6xL5XFvQ/xahk01krYKmh0iXgrs=; b=a8AROx/gzLldDh
	zKtRihUvhQTnL0Bbg8g1dvl8mo32aVteT21q8rX4TZSppAcSenw5/gxmvyPVsry1IVsV0PthUccOF
	OwRNFkVpgItpfVvKu2YMsfX2xWxpVeoAuCJbjYXpo0n/QXJCRi5bX1NTJSoC99qD6WtXgcs7WbU1y
	iTGAz0EJH05S5sdJI5FzbTUR02rnW3sOiiIBMSL60k8Nlz/6tz6dWrZxYTg4u1G6lrd/51hAH3Tv1
	dCZ4U3M7x2O/doGcD5DKqWvXxBVVRWr9g6qWSh5kTKc7y8Gq2n1d8UhKlAjgPt5m4CHbhsXI2WPzl
	qUzog3tEbj5foKTUg3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pc-0000000Ethc-1vkD;
	Tue, 07 Jul 2026 11:56:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4PX-0000000Etf3-2q3x
	for linux-mtd@lists.infradead.org;
	Tue, 07 Jul 2026 11:56:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493d28b1930so31065665e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425382; x=1784030182; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L9RDGbpt0X65W5NYkJywTfGuzuPW4bNvD1G1EfFxluo=;
        b=YR2zokhrvZxVETnyMDqxnlSYShhGTroYmtMfPawV2xJHxFYo/lKOANWzK83Qgv11sH
         /70SfGhphn6iAn1BSAys7rE25rP/0YgbND3PbO9WDTBJIwPVCtpSLUbvf6R/dt/wOKvg
         1+8gPdV1ZyUARVprH7OgxJiekehyZcP28Nagb/p+/XqT5cWSDOP+474XUjtsyXmUmthS
         X1iv9meIW48mhmepc232on2tkc6Oji9y99WDIPlv++0rhpQQr4NxtEE6CmOrhtgFa7nD
         4vjI5oaQS50yVh3ULOyYGRntKjxHD0YeMDkFJVSTCe6G0nro/BJswIQoc6uXgdfheFwN
         5WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425382; x=1784030182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L9RDGbpt0X65W5NYkJywTfGuzuPW4bNvD1G1EfFxluo=;
        b=Xq32xoN1eKXF7Hq5au+KlCCcbSRKfgaL6ICtck7Lppm5qLfzO2tB9Ea5qZmjmoLWVX
         78wiZtO6yNfy140WyZJOISXtXJzwfNnM6IAoQssHY0xIROHjj2LNG2d9+Yr5LbIM4kPx
         uT4NymPa50fCB//Pa/YnuUR2epHcNzKpisv/aKGsaJmUw3nNkxEDXw+NfChUy5qv81ue
         eRIchlx/62kc1S3BAq5/1vNgLe3lYSMvdSfGFzdQcynGJXOOKX+bSP0vf9n0LU5caZ8S
         qlB7dt72uB2hP0ZOEGj1ePUqeUFfkKCNkk3AW3Te0BE/BIZfAhUTeYvOIz9biG/Bi52p
         4o4A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0jz2EJZOzgflnzMk4E5BB+Qz9uJFX5rPbbak2r1HM4/w/kPbgOHr45P2MbWowfqZPOZtaozvoBZw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy21IvSR/qYCEHCeqijFitD5ClAGVbIae8r8P2+KfKh1b43tesy
	f9AVbC4ADpYGqjpEDnp2TGbj78tA/SG73s5vdZTNpZymXd3NtlwvO3hxQEfFsYzZJSA=
X-Gm-Gg: AfdE7cmgRvK0kdPo03tMkS1ylXeqZmwKu4u3S4Blo4gziCV2vFqkLl07i3hFQudSk/7
	UQV5JD5fQ9ITv0nZQPEpnsN31eGzkZT0nZ5Ja5X4LJOOlcQHVaC2yNeXDnIkBofiIAre7gN4Iti
	yBzHZfwpkGo1AIASpVcroIy3eYAw98/0CMGJV7GQz588Y842a54EhjCtRQf4VPyPdZzzEYnrAJB
	R2vkwEm8kl0rzYYUHS2V0Yp2WVakTdvZmJE62Oq0Z8lqwuRPf3eLlyxlhSda/MEgU7xLs2j/jxM
	Ul67rJfslmHqVuxcO2/ZVXpO6YOWfvIuYUIVa4ClRLhnGqzdLLW8meIqJnB2o6nN1Ixqtc85uU4
	Kj44guSMXUXYAXx3CE16NqknAUJSzV//aED1SZrbC+2PcvJq2uXqTMr42oFdpWzbSpW49eovNkm
	JiZ1m4VyjsbJHzdzY6OlSMGVLmqThYVEKs3kXT
X-Received: by 2002:a05:600c:474a:b0:493:c062:a533 with SMTP id 5b1f17b1804b1-493df0673f8mr58244645e9.17.1783425381754;
        Tue, 07 Jul 2026 04:56:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] mtd: rawnand: qcom: Add MDM9607
Date: Tue, 07 Jul 2026 13:56:00 +0200
Message-Id: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFDpTGoC/32NQQ6CMBBFr0Jm7ZihkmJdeQ/DopQRxkirLRIN4
 e4C7l2+5P33J0gchROcsgkij5Ik+AXULgPXWd8ySrMwKFKaNB3x6UKP3vrGYd/0RlOJV5UbzVz
 r2hEsw0fkq7y36KX6cXrVN3bDWlqNTtIQ4md7HfPV+3sw5khY6IOxVBilyuJ8F29j2IfYQjXP8
 xdb+GEmxwAAAA==
X-Change-ID: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_045623_742193_3143BF46 
X-CRM114-Status: UNSURE (   9.96  )
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

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. There is also only
a single clock that can be controlled using the RPM firmware. Document and
add the new qcom,mdm9607-nand compatible for this setup.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Pick up review tags (Mani, Krzysztof)
- Clarify commit message/comments in PATCH 1 and 2 based on discussion.
  The OS can only control one clock on these platforms.
  (Krzysztof, Miquel, Konrad, Mani)
- Link to v1: https://patch.msgid.link/20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org

---
Stephan Gerhold (4):
      dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND controller
      mtd: rawnand: qcom: Make "aon" clock optional
      mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
      mtd: rawnand: qcom: Add MDM9607 compatible

 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 25 ++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c                  | 30 ++++++++++++++++------
 include/linux/mtd/nand-qpic-common.h               |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)
---
base-commit: adfc275b317c02cd043b0cf28b8cfb7459b041f0
change-id: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
