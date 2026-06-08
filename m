Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343DBCD8CAB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZjmQZCUUZWUynZcm2mkpi6u+AjS+RKTOxPYjUEEXROo=; b=1y9qjFIw7PF7NN
	YdWK2GsX+fSt/0psRgYNIAT9fX0iLuFDEX9DIXg4EA0hAt5DIk6nmf+qWs2nRO4pQptqC2rfMILTw
	cuuzNMQjWnNxOf+RZpUHokvcIkDHmGPitFmUgi1CIICI+te2ZNJ4PSGc50rqQYjuKdYcjcW89r40J
	MZ1gNVxb8gDaBRKXmwov6zGRGBFeqV8s0OinUemnMs7gzulkfAtsjtxJt1jM8CPTE9R48vrfUIYHA
	XriSjzPqIri3gfakTqI6Z/Os38LTsriR8Dopy0oSa2gRSX0OkOQ70W++MWbrBlA+AOtA0gzczTeqH
	OumyMfuXL20+so+J092g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuO-00000003bUF-2TYG;
	Mon, 08 Jun 2026 13:20:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuM-00000003bSq-0Jsn
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 13:20:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eee266c6cso3548006f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924847; x=1781529647; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGBoIgiiVhI5Ez5UlK2TcQscCuB1vu9ndVDcfWubiGk=;
        b=kaGe564qzxYrXonIzkCXjJjmF8eFwcAQU1HgyrFqzafuAkW0EnCmn4CMlg0GP1EW7a
         vCLoR3UUa1R6j8jc5M64GPGgUdBPHdU6yZbyZVfcQ/cKQxoZ4e0hyisSCuT43lZWYB8C
         +j3rQHajr8/pYnjr1BNJejNtt2XN/349J+sCsBf65OuxhzS7Y/ofnA6zUs0B5/OU50LW
         hpDsKiXUce3TbwibrlgNV+jdhq7+Rfsd5OCEUiax6q0YOgmg6ewFUzhEzeLE8LnSNYOF
         JBQuAGh0W4KMKEEx7N9AI2INGcsKj7KyAfgg7zr4ueUvuDJZMrNp3N9jDEeGjgJ8WPOr
         67Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924847; x=1781529647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGBoIgiiVhI5Ez5UlK2TcQscCuB1vu9ndVDcfWubiGk=;
        b=fBqNcvttPvm/jzQn8md1b9j2CwrzN7/bMiNbwR4XEtHKGEZX4ndbGZNpeiYbuiAHtV
         H7f36SQlP1Nb6Wb7OfgdNqGoVfV5muBMwfs3z9Vvz9amuPC7SxcvPKE2CyvbAN5AdC99
         N4hE5rYEuHRYCwqyxXyuT4Dq45SxHzLbh7R88VbWYKj/KWnlxsOvWZdMDieL0qYPk8aX
         ffTnMIkZC0dsr1prt8lXN1sf0ZeFVFCgQdUKEFrQamr4MQ5QCkuBoIx9Tb/d9aAyoxxL
         TRCzzEc81nG3XD9R4VHAecRG481bstpP2IcQdgxKHqF+1mUMzm4gpu6Md3ldQuEGDvd4
         Sfvw==
X-Forwarded-Encrypted: i=1; AFNElJ/MuIaM0GNkOUNr4JeCwDLo7uMsIl+ZiFgLrYl6tqZ5J3HQFkHjhcW2OhH5i5vi//qbTcb0ZQqAM1Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOpEG1zqDCLanol1Lpw+u92/WcJ2H69/j25jA00pISMcJqY3fU
	pzzwbgP4MB6kOEuBk4K0qxYxkQYWiLPKtCh65soww8VMfCDzc/H6epIKLjrco5JoNoc=
X-Gm-Gg: Acq92OGSVV9uiaLK4XPR3ubDndqwTZRlJ9sj6JeyKpMyEKqlbzDbvVFC0rEJD/oetlQ
	rHVUkO9tkE8llHaS8o4MxXYIXaVH0NsX3LtvJcG7cSeOMMcyg7Px0dBAQVVoqMUBBQAetZU1Lio
	vcFFvlfk1X43g1Jd+kMb81owSRAcflLf+WfZekIFteJ5kggj8Gzp+GXV8PksDzYP8RvHiv2PlrG
	R3F1vWN/A0usDC8tCdgchBZcMx7dZewxKwbN/p6bcm3ICeW1h14PeQUrIaC6es3U1UoU2NIJq3R
	1duI0PiWnfp3a3DHALZHMqtCdNeeVS1Z51utF7wFMjbybVNt6evX/8PTKm9cA9gH3bl5zrntUyp
	Q/yd50Nk9xCIK3aIzpoXhIop/D+PuVY0x9lLbZTj2EwDj36KztdtWl5R4yT4awlnM66sZg3M3tL
	zZYMJzQ3ZgSyiwK68BTD9xvn9+FvoWSSLcIlXH+NheU4KTFJg=
X-Received: by 2002:adf:f788:0:b0:460:e00:121b with SMTP id ffacd0b85a97d-460302e8136mr18077818f8f.15.1780924847457;
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Date: Mon, 08 Jun 2026 15:20:21 +0200
Message-Id: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJbBJmoC/yXMwQ6CMAyA4VchPduk7FDBVzEeWFekJhu6ATEhv
 LtTj9/h/3comk0LXJodsm5WbE4V7akBmYZ0V7RQDY4cE1OHL5kjpiEFwRhiz3TG0bU9q3r2QlD
 DZ9bR3r/p9fZ3Wf1DZfme4Dg+rRQQuHYAAAA=
X-Change-ID: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062050_155426_F22107DF 
X-CRM114-Status: UNSURE (   8.35  )
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
Stephan Gerhold (4):
      dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND controller
      mtd: rawnand: qcom: Make "aon" clock optional
      mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
      mtd: rawnand: qcom: Add MDM9607 compatible

 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 +++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c                  | 30 ++++++++++++++++------
 include/linux/mtd/nand-qpic-common.h               |  2 ++
 3 files changed, 48 insertions(+), 8 deletions(-)
---
base-commit: 19ed11aee966d91beebdef9d32ce926474872f79
change-id: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
