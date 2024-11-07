Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8ACD5AE79
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QLpFLaqE2A7A6esxfKNus/A/ku/ZI8UZ8B1C2fmFA4M=; b=Ywq00azGcbb2q3
	2BbKbXwmDpI2MB/oKb19c/rXGhZQHGwdsMavn3BVRdbUCZIehLkxawRTRas4vdqoc/Elqj985Bkfl
	WziTkVKA5KdS8GRSZfE3Pg9qZ6R1pLjFVyiV6W3giHYDu0DTFx6DER0U6myT8BFhyfqxNMbZ+PdFN
	rk0vqMyBHScFMoC2+KA8Hs/tFhXRP7XjtnfZrWOJ11RTkkY+CtqPrRUsvpCqxcqsIP6TVXQrovPF5
	wKgc6Dt5pqYfIMdR4A8kNwt0FfVOZpBzNmp3Iqr1iyCWdBWN/5xPZfvd/lspAXFbg5SM/AC2kKTO5
	52DkulzAFv+r31/QqwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yge-00000006H3Q-2Nit;
	Thu, 07 Nov 2024 09:20:20 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ygb-00000006H2L-2Ofj
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 09:20:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53a007743e7so664996e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 01:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730971215; x=1731576015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3651cek48NeZz9A/pb2JfiUOC/sc5HtWdmGHZb/MRSQ=;
        b=GxeaM6uq11+/DWMYZ3kRSVkZBFLZmdu4k5odBbbmKdq7hTQTLwDsgM4YAAZ3e5mfLg
         +Cxs5T4ssTIMaHC8ix7IH0TjZ0fkTnU09qRZROyFsZJ3YhCafYHlw4SyEpXXPrLa0dcx
         xhq8aWZ1oMcR+4y5+JbI6e5r9l0zIIoniEw2nOPZEOQ0LhXqg+cAnPIO78ynjk2A7aSd
         oco0eaKVIaDBjHo12PnE4VEh8yodoWFuYby+PxSwlgRJH4CKulgOxcikoOZOomwOMAjG
         ht8zWEWmmpXB4pd0zDx0TOs4ovqJ/vMB4UcAVCM+a1MFb/PG58nExqBJ/RuDfNuPP4+j
         PCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730971215; x=1731576015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3651cek48NeZz9A/pb2JfiUOC/sc5HtWdmGHZb/MRSQ=;
        b=AgCGgjsEey3x9cEjn0KyztKV1BC11atERFMBkXk+qIvglG466w/ryS+aGXN3rvnWto
         u89xLwNtO3v5DDUjXoxqg8OOTwbLJxC1rCw+7y4mxXJCJ0M/MCaVd5dWiossFqxCxo91
         BMQstlAU0on+pMS0L5Z8UPaNsnSA2zgqDcRm3CDYWbP3E/LHUQM+GKhAP/4b0jYud7MC
         Pfto4D030N5MvYxoVZcJNaMGfoTwZHKd8I86FK+3ngHjrP30/218XkpMWCOC1+q/dfzS
         3Uox2n7JzbO3yM9I7p1R55QnmYeISoE2KDlQNt0gYCLETPyyQLrxOScBRs1I32/m/5Xh
         oy1A==
X-Gm-Message-State: AOJu0YwvDw43wTQ1cGeQYm4gWY6rxSG1QbHsv+lWbqod4DgtFo2Rwgn8
	LVF27n+GrnNnJySu7MyH43jEdHHfYvA6pu7txmpnIG06SWAFtVIO
X-Google-Smtp-Source: AGHT+IGMz/+uze56D22bk4S6NEoAUjQkOYYD4ynOIKx/3GTeCzY4+lzBKIqEvvNJaSoYLinRiOM5VQ==
X-Received: by 2002:a05:6512:3988:b0:536:9f72:c427 with SMTP id 2adb3069b0e04-53d84085e5dmr189216e87.28.1730971214867;
        Thu, 07 Nov 2024 01:20:14 -0800 (PST)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b50sm139509e87.182.2024.11.07.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 01:20:13 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 0/2] Add support for "on-die" ECC on Davinci.
Date: Thu, 07 Nov 2024 10:19:52 +0100
Message-Id: <20241107-ondie-v6-0-f70905dc12bf@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADiGLGcC/2XOwQoCIRDG8VcJzxnOqJt26j2ig41jCbUbu7EUs
 e+eBQuyHb/B3x/fYuA+8yB2q7foecxD7toymvVK0CW0Z5Y5li1QoQGlQHZtzCyD4kgJXXKmEeX
 tveeUn7/O4Vj2JQ+Prn/9siN8r8vCCFLJoGMIDJacj/vzLeTrhrqb+BZGrBXOCovS4MA20dH2Z
 JZK18rOShdlrI+eNCJaWipTq2ZWpqiU/Mmn6IODvx/aWrlZ2aKUAQqGiCxzraZp+gDQ/oUJcgE
 AAA==
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=5jlkJyomE6DfZDoE1w6hrt0hHvrFRjvdP6lxVp7uq8k=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnLIY6G6Nlk3NfPIe9Hidmf95exOo1gFpPgkgjm
 wfk4xGjA4mJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZyyGOgAKCRCIgE5vWV1S
 MgntEADZC8TWSRg567xCulsZBgj0w6oebflUeUlV6l96cFLfiIHaaavU5YqyuUAo8im1ntHu6cZ
 UyK2XSlUeOgYKa2Muj3snCI38SNswIthKxQaH9uYACSY5cQ1DbCznONSp0lFiYpKgWVz0sGXbIw
 I+g4ojK56WzdOg0GKkct8ARwOa8Ji6Vzts6VrU54OQOchXT9zTEaMshiTXgUx3mRqcU4SOXUkZu
 Ya2gzETCwdUAbmnS9CCSAexlCKRbMGA430RrWiYUGpKrmSqmDEvi7E8hieBcYZpngOeXn1e5Xf1
 Lsie7Qv+6ae/E1CD05onUOrjY/NlKTeM9d88BzQU8AOPeCG5OeJlgm6wIovu6Vmt2oM6llxItKO
 5tTV1/BR2QQPKcCrzMKOv6ugOWuDfs+K2tQ1Ung/7F7pC32lzKZAK+4/GPpkSR1z1K29NoRNYwA
 JAB+USBaHIbxSA5w7V2esDFvFFkP4PURM9oWdYV4YuSnBh3lbzpSyRLpwFMT0UVd20G+ckYo+HA
 MRE7qvW2DwVG7YJyDyPyzkFQx6jkgnOiMXCDqsLW52eFmF1w5tnnCpM8E42ms4whrckpoqifems
 2Xq7OxjaYhpr/cPTK3BhfSfXLvJhcAQNHqdo+iRRxuoDxM64vW7sDbyvpCQ48qUyUrYOU38LSzn
 uHfuH/ssgw+dNIQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_012017_645818_290B3D24 
X-CRM114-Status: GOOD (  10.17  )
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

 .../devicetree/bindings/mtd/davinci-nand.txt       |  94 ---------------
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 134 +++++++++++++++++++++
 drivers/mtd/nand/raw/davinci_nand.c                |   5 +-
 3 files changed, 138 insertions(+), 95 deletions(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
