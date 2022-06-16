Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374D8C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 00:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1K6EtZ/hgcuHglraCM/xaQ9o/Q6NWJZBLGMf0GWe1Z8=; b=cfZBhGwaDURndg
	qWGVqxo5lbkKmByjC+XgbLIxY8sNRfzzPmwowQNo/Do3hfGNv7ljspwwHnwx/3okMGuQ/HQFVuFtB
	Ee1KMAO5cXWKE645tCXdlLt3EUnJ9Yjp7rHcYhTxumBIxLKgiZXACAiFFkvZOOohSdfN/bTUxGg3+
	ndZvgpK1ot+ZxwHOmSl+XtaSgSl38EdCJ37FgQywNXE1bd7WV/Uy4glLAueq4rRmWr8sR4Iiskn8p
	qQmlmmoKqm+B3JSVu0aHMby9S9EDO66BatU54HFMVuM8Ir+y3XBkBQ1xVkTM4IgMVeG8xtcIZaZJy
	eDEon6NZLA49lIoQrV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dDs-00H6TR-KQ; Thu, 16 Jun 2022 00:18:57 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1dDn-00H6Ls-6L
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 00:18:53 +0000
Received: by mail-ed1-x529.google.com with SMTP id c2so18428802edf.5
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2022 17:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YuQWYPbc/OKysWG+8KVbbbEGN0Ppij1GHgjiSvnpV3A=;
        b=TCZ+sWTQQYpyTC6odYkDQAf+GiOHnMVl42mduUd0mEhre7BLS8XAum+K/I0rVZAuUD
         N74nIA/78HROu33aNo8D+X5EgMjcBGLbB6SqS/G84zLB0bbBogEYSGnIrKdr9BwABPv3
         tkCi5TTQOb7D1v6SGxWtLfn4SL0+3gYBs0V7my5O6qhoeKz1uIi7qSXZo9jxinEL6Q/u
         icaUfcM/QTuSxcvNZ692w8jh3pReZ6PKhY7zcMQLJLfrjV8dw98v9C/l/gAuGDNi9GEx
         YvX5vwkU51eq/bFqGQQ6k+hE7wj/Xy0iDCQHWKQiMYmaomrJ0PMdjmSfqONXmG0F8joB
         QUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YuQWYPbc/OKysWG+8KVbbbEGN0Ppij1GHgjiSvnpV3A=;
        b=UTuDTabNa+qZPtvFABfD2T/Y62YT3XwXrf3H0iGtK6ITNdp5mOwUiHWyDpLz9Dl/G0
         1LEHufQIJ7G4o5V/oaf10EsRrEGZb44J4Rq1homKKzls9/IekpU1sOwaiVppToEPmAXJ
         iFMo6dYP0B4j+pMVY6yW7+ilOZd5ZrdSOCSb3HSMfEjg4zGbiP0exRbdGNgNTUWWAeOV
         ArU9I2T7+Pk001cjmsgwnAPtUfe6qMTSg9ifm3nP8T0qlY6yybzS8ZoCIX8chk3ZUxR8
         dceeDflq1Gt3uI9P6XPPRcObEfOSxkBdRTStNO44oU7hf61RegU1DxF0LMDORT5+syRe
         +I3w==
X-Gm-Message-State: AJIora8tt3H9bSnQx7MbtKTNMX+837WtENBQ5mcUfG+Yq41Vde0UXZb4
	tVNZ8oljLA3ICO5CWcFwNeg=
X-Google-Smtp-Source: AGRyM1sv4BnG3H7y2/HU0FIZfqqfIe0vHANefvBQmQp5YxAoP+7NKwli1Wu65a5aLIJupLmGGL06bw==
X-Received: by 2002:a05:6402:1d4a:b0:42e:9ec8:320b with SMTP id dz10-20020a0564021d4a00b0042e9ec8320bmr3010322edb.119.1655338722204;
        Wed, 15 Jun 2022 17:18:42 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id y11-20020a056402270b00b0042e1cbc4471sm542546edd.3.2022.06.15.17.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:18:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 0/3] Add support for unprotected spare data page
Date: Thu, 16 Jun 2022 02:18:32 +0200
Message-Id: <20220616001835.24393-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_171851_285199_C0052BE4 
X-CRM114-Status: GOOD (  20.99  )
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

Some background about this.
On original qsdk ipq8064 based firmware there was a big separation from
boot partition and user partition. With boot partition we refer to
partition used to init the router (bootloader, spm firmware and other
internal stuff) With user partition we refer to linux partition and data
partition not used to init the router.
When someone had to write to these boot partition a special mode was
needed, to switch the nand driver to this special configuration.

Upstream version of the nandc driver totally dropped this and the result
is that if someone try to read data from these partition a CRC warning
is printed and if someone try to write that (if for example someone
wants to replace the bootloader) result is a broken system as the data
is badly written.

This series comes to fix this.

A user can declare offset and size of these special partition using the
qcom,boot-pages binding.

An initial implementation of this assumed that the boot-pages started
from the start of the nand but we discover that some device have backup
of these special partition and we can have situation where we have this
partition scheme
- APPSBL (require special mode)
- APPSBLENV (doesn't require special mode)
- ART
- APPSBLBK (back of APPSBL require special mode)
- APPSBLENVBK (back of APPSBLENV doesn't require special mode)
With this configuration we need to declare sparse boot page and we can't
assume boot-pages always starts from the start of the nand.

A user can use this form to declare sparse boot pages
qcom,boot-partitions = <0x0 0x0c80000 0x0c80000 0x0500000>;

The driver internally will parse this array, convert it to nand pages
and check internally on every read/write if this special configuration
should used for that page or the normal one.

The reason for all of this is that qcom FOR SOME REASON, disable ECC for
spare data only for these boot partition and we need to reflect this
special configuration to mute these warning and to permit actually
writing to these pages.

v8:
- Removed all review tag (sob changed)
- Change sob from Ansuel Smith to Christian Marangi
- Address small fixup suggested by Manivannan
v7:
- Add missing nand_cleanup
- Fix wrong error return
- Actually implement suggested boot_partition check
- Remove unnecessary comments previously added
- Add missing new line in dev_err
- Reorder structs with suggested order
v6:
- Add additional comments on boot partition check
- First reorder struct then make change
- Add additional changes request from Manivannan
- Add review tag for dt commit
v5:
- Rename boot-pages to boot-partitions
- Add additional check to parsing function
- Rename unprotect_spare_data to codeword_fixup
- Add additional info from Manivannan
- Add patch to remove holes in qcom_nand_host struct
v4:
- Fix wrong compatible set for boot-pages (ipq8074 instead of ipq806x)
v3:
- Fix typo in Docmunetation commit desription
- Add items description for uint32-matrix
v2:
- Add fixes from Krzysztof in Documentation

Christian Marangi (3):
  mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  27 ++
 drivers/mtd/nand/raw/qcom_nandc.c             | 306 +++++++++++++++---
 2 files changed, 283 insertions(+), 50 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
