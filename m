Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393D4EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EBlrzVewIcDNv9dzZhP5qn9XMS+mpr754WxuF+FeaZs=; b=xve3FuvGwU70KN
	n1kXrDQjUN89/MTRKWRIDpnasU6f9WtviSKsQUFVnEcOM20X6pQH0KiurAEi7UnggAb2vW//QhQQU
	b1nenbv3HnTnAF5/luW9ciqkTiDX+o5mB5/de9PTsJdU6fRAVypmK+3UIGj7jwyTFRjqDEVfQ9P/S
	aa+SvwLSc3jObnQ4X+PoGiu0ge6U1TSGn24+zNZwKbebdH6zcZ1htSRwN9O7MqYFUNGYBkAy21zLA
	fTnnV1gp/8ARATW4h1SNWJX5I+tMYGci4ywszzgi2HTF+A9CuhWbhpXwRJ6rzwtEwrgxDTodUQ7KF
	mIo/WCZb5KafIt9SU2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJi8d-001Ng6-1k;
	Wed, 12 Jul 2023 22:16:47 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJi8a-001NeK-0n
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 22:16:45 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6ff1a637bso122517511fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 15:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689200202; x=1691792202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4LdmsOnFTqS1Cie5iiFkXBonoGBgUOcV5X4qo5inNSI=;
        b=CoJkBcDv6qjh66tX8On+ZG9yy/znVU3orvRevnsiqBzLKhhW51dADllqNXcF59L7/m
         Ggl+MJ8RJ62VQhpBLucODKkGchAerPNL+j4FDxvGdPORaHdCnAO+7ae0pCX6zn+Cekw9
         s6cUEATgylR0xi5980ecookYizWP7E8oaDpDOiLZenh13rA3LdvCP7OsttleF84yuhEd
         YEl9YKpC3eu7ZgRL37D6GKNDaXo4A07RC9QmTYvuxUbZa6W40ovt0Q/FH0kCLyE4N2ks
         UH78zrhTY9QVMx1m74azikM2+ofGMkwZ4EV5B2rYTDDuVQGx7Acv0DeMKscv874AFhuP
         Ns9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689200202; x=1691792202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LdmsOnFTqS1Cie5iiFkXBonoGBgUOcV5X4qo5inNSI=;
        b=Yw9DQDpWUtPx98v4ztmjN2G8dlpJeCYY/W8xT+n4zsfDRyq/vZgtiYnollsO7c3NHt
         SHCh8gvnudd+RdGchShNWhY1TuCmOcnFOe2UuTZb70c/zeTJQHZWqXRswkGb5XUCkTdb
         WjZfquo1q1NS96weChGbq8YVPhzQ5/RHrhWo2UDqE/P1IfEDlcLWuzX2KstlKvOb6osd
         Y0pHyx8nY9fPyTC/fbdV/QKoFywAdUgRgXw2iBbfjACgwWFCD+Ovh0Gf6FrjkdnFDq8L
         KiBVqU1t/VoVqU8kglLiTSTnmgj3dudrxkb6Xcssf3OjmUvu3sxsr6JPZL70GbSSeUy7
         wKRA==
X-Gm-Message-State: ABy/qLboD1E3xFGYp32KA1iWHtlLqB+axreD1e8WPNKu6kvtHnwBu04Y
	m5cg9NW4O4c0fcXxcjOl9mx3QdLXDvk9DpQnfYw=
X-Google-Smtp-Source: APBJJlGPiDIpavgNBQktJlQgrh6mHSCi/gmzFVU6mnV5+zb2pOmDldtlWtvKO66E1xXuAb0aFKgFnQ==
X-Received: by 2002:a2e:9904:0:b0:2b7:7e:e95e with SMTP id v4-20020a2e9904000000b002b7007ee95emr17196988lji.45.1689200201796;
        Wed, 12 Jul 2023 15:16:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id b19-20020a2e8953000000b002b6e00a3e19sm1177774ljk.132.2023.07.12.15.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:16:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 0/2] (no cover subject)
Date: Thu, 13 Jul 2023 00:16:40 +0200
Message-Id: <20230713-seama-partitions-v4-0-69e577453d40@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEgmr2QC/33NSw6CMBQF0K2Yjq3ph7bUkfswDl6hQBOlpCVEQ
 9i7LRM0Eof3fc6dUbTB2YjOhxkFO7nofJ9CcTygqoO+tdjVKSNGGCeCSBwtPAAPEEY3ptuIjWS
 EUmW0LgVKbwaixSZAX3X5cbvPyyHYxj3Xvust5c7F0YfXWj/RPP3TNFFMsCiJhIbaAip1ubseg
 j/50KKsTWwTFBE7AkuCrnmhG1ILML8C/xTUjsCTIAE019QU0pgvYVmWN8mtWDJSAQAA
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_151644_290837_376EC021 
X-CRM114-Status: GOOD (  10.22  )
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

This type of firmware partition appear in some devices in
NAND flash, so we need to be able to tag the partitions
with the appropriate type.

The origin of the "SEAttle iMAge" is unknown.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v4:
- Drop the false tagging of #address-cells etc
- Link to v3: https://lore.kernel.org/r/20230707-seama-partitions-v3-0-6aa9391b46bb@linaro.org

Changes in v3:
- Drop reference from partitions.yaml again
- Drop select: false
- Use unevaluatedProperties
- Link to v2: https://lore.kernel.org/r/20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org

Changes in v2:
- Make the binding clearly childless
- Link to v1: https://lore.kernel.org/r/20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org

---
Linus Walleij (2):
      dt-bindings: mtd: Add SEAMA partition bindings
      ARM: dts: bcm5301x: Add SEAMA compatibles

 .../devicetree/bindings/mtd/partitions/seama.yaml  | 44 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  1 +
 arch/arm/boot/dts/bcm47094-dlink-dir-890l.dts      |  1 +
 3 files changed, 46 insertions(+)
---
base-commit: 035cd1416934ef7ae5374272d3c9e378c3d7049c
change-id: 20230506-seama-partitions-b620117b9985

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
