Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201CBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 00:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gh5pvEJDVgJKfFyjjG672BXUEvO1S286ucvzUkhl7Tk=; b=QLAnHytLu/7WHl
	i48vozgTY4ayn58ZNqKjbpOxuQrZaBAMfrE7pdya6cvs33LZhOivZBV2nHeBEObEig0jl5EcSgLOP
	e5AOgBOdC2lkILeoh/EHPEPX18FoMgzZmGRK4ssP0WjokSuAH0xNk5pTo3ZYDA/1fzCT1Yzm+K3Rf
	e5oe0gPB8nu5IkiwrdHf7dLR51jcxZ70Pcp9iP4Jul4DvUG7biaTggWl0aeIzyth21ZDVNZEFO+gS
	LSZlf/uPzt4EccZD+BVLYHZj1GrxX1O+l5dYtfxOsQ5beVKtziI5vIcX8KOdGEwOVmb643Z1R4zjN
	cnkTzj/DNLcyNeGAwydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIQ-00A4UU-ES; Wed, 08 Jun 2022 00:11:38 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIN-00A4Sc-Dt
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 00:11:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id fu3so36790837ejc.7
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ar1MDgtA0wB8Ds/6E+9yGeeWGB8hd9IIOZtnBP3qtQ=;
        b=IM1XkXyqw7gnD/Ee2HrDRknwqvnksbwocKVipuKtHHy7V9A7QvPfIZ0SdUBxhAsjiA
         2BXgxrF+ABiZacrrEk7rf5Jmn6J56FT0/j2EH3nvI+LTdS5KOCGUAz+t5KinebT+0bBz
         wjF2JVvw1/fEjKL9G1z7s58dQZzhGIBq7uKK6v8uic/rNEmvW+vLPK6QfjJaxjLPhNh/
         7XSQzjJFcXkUepwkB0wQ0LJITyMSYPE8yNV6S2LPIK6U1Xs37gkKQe/mJfbL3vx5tafE
         LLoCPYhAw2FuN9cXol7v380sGD2OdKGqAE78H7J5dSxF6i0HzseJC77uHcDnuw/QkHv/
         TnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ar1MDgtA0wB8Ds/6E+9yGeeWGB8hd9IIOZtnBP3qtQ=;
        b=OBdvv+S4FyuZ6C03dPEvDERJcDECLH6jX7r4FLtEPiKKfXLHrb3ENp2UgQBk2epwje
         f3W8pzBc3M60P6tjWdY1K/OwAmm1ThjnVyHuh6VXW1Sul648VrrF09N3e+pGC57NWusS
         rcxYb+mV9QAwhk4vbdYHoLYjq1h9sPjSLryIL0rWuq1Grn+4bOE1mgQGS9RL9jooNJRn
         4BuRal1QOYuWlrDgQcs9mqZZ7tanwHb74Msw+b5NjgXgp93EwQhiWd2gvnxWPXCX6AyT
         mmDIDWG0DQYHgHupxLN7SUB2BBWq46rVOlRnmC+Fi1FLHZGDb9qkNmUmR7wWNt7rGRJC
         fJCw==
X-Gm-Message-State: AOAM530RnSx0wAFPReViXYOrAgYvxr2QTl0/c4XatInlZXPlyrwQI+fw
	yy4s8W6rh0lSPru2aM4OIOw=
X-Google-Smtp-Source: ABdhPJx0X5+zVB5NX0PKmpIScjirJeMXRAiXjVqt/5EDlTUmwRA+OrHGmIWDdCPgNj58WTScuMxtfw==
X-Received: by 2002:a17:906:449:b0:711:c975:cfb8 with SMTP id e9-20020a170906044900b00711c975cfb8mr14330370eja.58.1654647091688;
        Tue, 07 Jun 2022 17:11:31 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm8434947ejg.202.2022.06.07.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:11:31 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v5 0/3] Add support for unprotected spare data page
Date: Wed,  8 Jun 2022 02:10:27 +0200
Message-Id: <20220608001030.18813-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_171135_504543_FA0E0CD8 
X-CRM114-Status: GOOD (  20.74  )
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
qcom,boot-pages = <0x0 0x0c80000 0x0c80000 0x0500000>;

The driver internally will parse this array, convert it to nand pages
and check internally on every read/write if this special configuration
should used for that page or the normal one.

The reason for all of this is that qcom FOR SOME REASON, disable ECC for
spare data only for these boot partition and we need to reflect this
special configuration to mute these warning and to permit actually
writing to these pages.

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

Ansuel Smith (3):
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding
  mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  26 +++
 drivers/mtd/nand/raw/qcom_nandc.c             | 179 +++++++++++++++++-
 2 files changed, 198 insertions(+), 7 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
