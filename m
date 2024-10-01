Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190DECE7D11
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 10:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rJvE0yzOWTCKQ4e4cxaJgBLPqpJyAel63HAoHJUPcX8=; b=3psx9Yum4P0+Az
	dM8ClPKkub5PUaZ+pLELccr+XLj0v7LbPT0tASo3+MasKFnC94uqOKzAyxKpHZVbEDCTO2jJYp+D3
	iSSB9N/xPA6Kiuqve6CWMRXZwGZYtL0W92sj4PP/eb9Z+Inz5GbeYI9bYrXtDt4qZ8ycDidu111pw
	fmaY6f+kSAuOuKKDrBV32Z2/QqjoSRt4jUShhIv1t1MqCpBMyjOsiB9cmF0PbFSGCmg+CzRxJDrNe
	XONYKomv5GO9OEuZNmk7fSMeWpK0ipnc6P/HTcOOqTNDN1wWVVPdYkLK48B+FA1RGBfvT6h9ipbaY
	S74n/+ltXR6J/N4C60PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaOt-00000002Ogl-3gRQ;
	Tue, 01 Oct 2024 10:46:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svaLL-00000002NbR-3p82
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 10:43:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539908f238fso2721090e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2024 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727779377; x=1728384177; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=naMF/l/IHSW+to8I1m3VaAoTJMDALGQmSCST6CPFt1A=;
        b=E/JkOAHJ1dBNdONBVLxAwU+TVH4u3YUyH0VZJkUujTWv7pIXTY5+4MtxbvPrtgMo5e
         3TBcf9n449orTAx7BmH08FVI44ay1mpxlITP+HxKZnDkgJWT13yUy6o6ZXfIgbug4tER
         BuNRK/PkjqamzREaJrsUqqa/0/EEcdyzqtpTBmz/VJOofyMW3FSqGZ+cSrklTUlVlyq0
         MMTfnPOh6eheUJj4BatfAN18uKIcI//609sCj7gwetwcsbl9XQTn4lwGX2WImKsjH7OH
         VIh0yk8orwaq/FCO2NPoGrUg64APL7nP6aHpck//WKJUjbRsEffss7SOzBMusF0nP4Tu
         IlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727779377; x=1728384177;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naMF/l/IHSW+to8I1m3VaAoTJMDALGQmSCST6CPFt1A=;
        b=YAsPqfclqc6hzxSdZdawOCRl7aK8Iy3gkF/9gtWO610V8Kec0NgU7n4YyCoc4Fn7ix
         qFBLTXuN4/KnydpR2GXXHLS84wedzSDZmtoVj5rmcWv53vU5CkEXzyPvAVLzZnZNZK6b
         v2VRVrqI2TCdFN0ZaM1Eu4OU3U3Bpq5H8DwVCX4yox85SXIvxfc/xjAUGQ6G51vAyVLN
         T8JdwWDtKIvGyJ10Vf/A36Gp1rb5lttg8KcDgCb4kFTdr244B9fma7rYH3ht1IN31Rir
         3A6LujHW/o+o9TU04jXHwkxkeyMGAUugtW5O/C6boNdEszyy8BIy5plceUmAq1hhBrBs
         TV/g==
X-Gm-Message-State: AOJu0YylIydqophlQB4zx4vm7kj9c+UV8izvSEgs7apaADKoK5FEhCRn
	H5lZddmdNc4bErv1UQLQEZZx9j743QiRK4+abI1rfsaw6EqTbtSB
X-Google-Smtp-Source: AGHT+IEJklcMNhmdyHGs+kK14TKBk2cy/xU8EIYfUzkf44jpkUKK+rCmwUXC/2cf7Ms+RFK4D8Gm5Q==
X-Received: by 2002:a05:6512:114c:b0:536:a68e:86f0 with SMTP id 2adb3069b0e04-5389fc46c8bmr7113967e87.27.1727779376484;
        Tue, 01 Oct 2024 03:42:56 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd53a02sm1549026e87.31.2024.10.01.03.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 03:42:54 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/2] Add support for "on-die" ECC on Davinci.
Date: Tue, 01 Oct 2024 12:42:25 +0200
Message-Id: <20241001-ondie-v1-0-a3daae15c89d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABHS+2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwND3fy8lMxU3USD1JTkNCOLNAsTMyWg2oKi1LTMCrA50bG1tQDlFzi
 LVwAAAA==
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=d1PQK289BSU35xE6WGSlFhMFQXuGtUy07ku8cjE5FcU=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBm+9IcNG/eVdtK/HlUY2IBtqrRx9j5f0LiUVFka
 uDp6wR/34mJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZvvSHAAKCRCIgE5vWV1S
 MqygD/9eX5rX2CUkf3yHMoYszRbKf4x0nXtEPBSLF5doPyfVY1shV6g3sq5kwwhVU6ymmnpsPCS
 2jbd8xw1fiQEZo0dSGAgjDzDaZs8lcJX3FactcBHdDFHyfccGEy/tuDLW3f+IZeN531cdfLk/MY
 9aYlxCst1rdfS92twXs1zaax4JEvK7KEgVFVoJXf/ZSbRWT5C6DAkLeJHYQEjtJFz9p9q3ra4Yw
 ReFMsp3IPkgOp2NoApAHFj7QZ47Md75tNHdd93AgM0w7zSqiFa/m4F0+kZQzBb3F95ThusrSZ1X
 wqRj3zhoNNS/RvtGUoF1LoY47PufVrhqNDC6tMOiGgKeriILxYZ8QdM2uKJMbj5LIT3gyjN+4O4
 rbzwMCgJFpQbuoRpOahuB5IQf0oN19nF8crfAA9fK2uuZfQos514PwdFVQ+OahBTmaJyswMWMTo
 VfhhAjaGgmctKeAJIcfjXhAbldwoqgGyX1m+JDnm6kfTKyk0JTrVtnjzhf3df69Ds/TQqIe9ZbX
 2LUD2PQPWlzUiLc2uUcHoQ7NW+LJKrlbFpcExDrWUDJSGuYSexXx6gMFqu6Lq+mplMm1bwC59+G
 /wXuzEtAJ6DSCqjJLO9+XKcuI+5tVMsAq+pID4mW8w5aGjsx5QDqN/ttL2PLVESRQQBOImgAGNk
 Q0XkOTcB0FA5wQQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_034300_257240_D0F51B3F 
X-CRM114-Status: GOOD (  10.05  )
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
Marcus Folkesson (2):
      mtd: nand: davinci: add support for on-die ECC engine type
      dt-bindings: mtd: davinci: add support for on-die ECC engine type

 Documentation/devicetree/bindings/mtd/davinci-nand.txt | 1 +
 drivers/mtd/nand/raw/davinci_nand.c                    | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
