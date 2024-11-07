Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F9D4335D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JqbEIhWMgWLX2mytVBWHFBW7dbkuuioFLnLbOUBR3dA=; b=DSUXFPgRLM/yMe
	FUfD/2DFM7caJ9zNkhuAaGK9n4GSmTLTpJ/92j0OoaYFRULKeySyMsVrzcvxGVQQtYLQ0ZyklpKJb
	bObAHxF8kjmsmhlwFzqGcH/Wl/Cp+hB5uqRYaNWFVQlGuQ0CJgKXN3rVBooJA78dKEq0YKUJgVBHm
	4Z6+KTGktN2b5IYLIFelirmMkHTsN9dY7KsNOyBJpJUicOama0iu4NxuoKzPiYcHKkJVj8EFe/81H
	BaWjuK8DuAqIwhnCsdlYDDmNC7ThZCWCR870W6AYo2Bwg6znMYVfO9BOzJinqLm1rSHVcfpBNXmPs
	Cv/KaznzNJSAoG5vR7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t92rJ-00000007AQX-2vp4;
	Thu, 07 Nov 2024 13:47:37 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92rG-00000007AO3-0r2y
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 13:47:36 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso14254951fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730987252; x=1731592052; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vV/uqLIwRRvbtNIiu4DCWvHhI+US/wd1+j/rWmR1oUI=;
        b=Hk2nPqxRxFcyqrxk1O3I2WwskQS5AdF/+YkPfal3NSNk8brtUCYci65smP0ktFY5PD
         xh2FNOF2EgOOcJY/+CxxvjFHnEuYbdhSFlHFwHk2p4kBoApAL7ih5xtBfxDjDhaVXrHk
         G+kwkK7QQSELRCY0uj6g7Xy1Gx8PZjIIogtXF4yvouCLb+7eHSvkDsc+V4+cc5sSv4SG
         a/CtJUQg6cs5/DHzpiGpltpBlIZaK0q1340GLQX6RAl2y+UBK0Lg08NVVOdIn1I4m4Pd
         CtGkGB/M525+PFITo5P5CGcoGhoMClKIGbe7DFO0/3T8K3KtxdP9BfSVhTKNtWCDWC4e
         pD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987252; x=1731592052;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vV/uqLIwRRvbtNIiu4DCWvHhI+US/wd1+j/rWmR1oUI=;
        b=ozTh21BYSPZPUnaDOK0p4kEKKzhMmq0BbbH2qn2MuScHGQZ6GRzOvTTTTfHq8dLzcY
         p61gREPoQlmvdk1j05PmqZTLdSaaCM2gaZczlO13OZ0TX17InhD00tIzC1npxCVCwuwX
         WShvKfNqs0Bu0RkLgtzB+k7PwaXFCw8gBIMrwJEG8AkdMl3FrBD/QA8zL7v7+46IysiL
         CdUF6vmZmSLW7OqVbIAc4L0nlCf2xT84SY5FeGrXVCUaUaGeq0OTRP7rkMCHkRYB2/eu
         Xap//AM7AEkLUZ+gOlqMOXhbdzrLgywBJ1OPMRhWz14WEL0SczWOwsUmAxrdflkHmTOe
         9cjg==
X-Gm-Message-State: AOJu0YxJefIe6fkb0V7NHsqMZAdalvnWmxo7pXw7DhXpuyfUxHNOxulB
	f6wa0Q9XZi9e+yLyMNXlcjQvauQ34zi4LZ88xC/EVrLewpJsKbUDJuMxjD3k
X-Google-Smtp-Source: AGHT+IEhC6iR33eZ4lfH/xse0Rl2l82Dcz6hdxKltt3wqF0Dap5B4TG2pXRT6K+E3wxcui88TP6z+Q==
X-Received: by 2002:a05:651c:985:b0:2f3:eca4:7c32 with SMTP id 38308e7fff4ca-2fedb82fd05mr190609691fa.38.1730987251737;
        Thu, 07 Nov 2024 05:47:31 -0800 (PST)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d80f5sm2276591fa.105.2024.11.07.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:47:31 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v7 0/2] Add support for "on-die" ECC on Davinci.
Date: Thu, 07 Nov 2024 14:47:06 +0100
Message-Id: <20241107-ondie-v7-0-98829fc8a958@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANrELGcC/2XOwW7DIAwG4FepOI8JG0hgp71HtQMxpkVakymZo
 k5V3n2kEhrKjr/l77cfYuE58yLeTg8x85qXPI0l9C8nQdcwXljmWLJAhQaUAjmNMbMMiiMldMm
 ZTpTdr5lTvj97zh8lX/PyPc0/z9oV9umxYQWpZNAxBAZLzsf3yy3kz1eabmJvWLFVWBUWpcGB7
 aKjfjBHpVtlq9JFGeujJ42Ilo7KtKqryhSVkh98ij44+PehbZWryhalDFAwRGSZj6r7U6D6qrr
 9Vq+8spEAh9Sqbdt+AZNSmrCoAQAA
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=WJ8sjTdsEHCnUnC4snAJGRK47JStvms0dYfAUbD7xRU=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnLMTjRhoFLSc1KkTea75CbUx52FGWIca8jGOUh
 0Q/vRra0rmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZyzE4wAKCRCIgE5vWV1S
 Mh7EEACUOTW2UOgo3EXokp3j2lSn1V+dkGhtTDeUWImo2wEb1sycObdGPel8gSlhFkPDHn01bMr
 oiSMtL/aubKsmvJQUBbtlSxjVdrEnEtWb9GnSoi3weGG/QQpZ1SiwT1ze9Ut1aV4ijLqDIk3ddM
 uEcSpN/mtO5B8TUhjLLSgyhqUQIpFnZe1qbk/uf0D9ZifWjzqdOUldGR+jrunKlbJpcKx1P87P6
 pEmlKd1lcmdtjbHXKd6l2tXnL5D7ynAX5j2n7snakuvrpHbjJ5Ihu13PfcLtmOWnGukRl4I/QvO
 EfO4EPASrK6MCmPciRTvIRAys/9gvakWTWxxmAcJ/wN/C3NBx1XHUeno+qWo8LFZDs91c+yoaRZ
 vqANAQNoO8kFqkC2Y1L7SllTfHeQqjAq/9rlrki7IzghHtT+zt5sIP3JehcrFkMlcmbs9pPYccf
 WtTS0HemX4MQzC2RaWofyWkJpKwdVEoDO03ZY3MPyaXlqXJq+7uU3POkBikru68BAM0KZO6iKvO
 CyikwH9U20RJExmh+68oNHxzqynnt4wxhd5kOSzKQh2gADfZJQ/7h+MyScrqDQ4RJ9hm/kKmS0z
 R7eOqaUVLXvaMeetgEnzss6OB2jsOYjRMgg9HHR0appS+WBNeT/Wejnn0+BIT1xo38qlu9zBAPJ
 sz6qkoXmCuk7M6g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_054734_317009_4129CC6A 
X-CRM114-Status: GOOD (  10.12  )
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
Changes in v7:
- Merged description lines
- Dropped #address-cells & #size-cells
- Rearrange reg property in example
- Link to v6: https://lore.kernel.org/r/20241107-ondie-v6-0-f70905dc12bf@gmail.com

Changes in v6:
- Rework the example snippet
- Link to v5: https://lore.kernel.org/r/20241008-ondie-v5-0-041ca4ccc5ee@gmail.com

Changes in v5:
- change "additionalProperties: true" to "unevaluatedProperties: false"
- Link to v4: https://lore.kernel.org/r/20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com

Changes in v4:
- Silent errors in `make  dt_binding_check  DT_SCHEMA_FILES=ti,davinci-nand.yaml`
- Link to v3: https://lore.kernel.org/r/20241005-ondie-v3-0-459d9c32225c@gmail.com

Changes in v3:
- Fix formatting issues in yaml file
- Link to v2: https://lore.kernel.org/r/20241002-ondie-v2-0-318156d8c7b4@gmail.com

Changes in v2:
- Convert dt-bindings file to yaml
- Link to v1: https://lore.kernel.org/r/20241001-ondie-v1-0-a3daae15c89d@gmail.com

---
Marcus Folkesson (2):
      mtd: nand: davinci: add support for on-die ECC engine type
      dt-bindings: mtd: davinci: convert to yaml

 .../devicetree/bindings/mtd/davinci-nand.txt       |  94 ----------------
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 124 +++++++++++++++++++++
 drivers/mtd/nand/raw/davinci_nand.c                |   5 +-
 3 files changed, 128 insertions(+), 95 deletions(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
