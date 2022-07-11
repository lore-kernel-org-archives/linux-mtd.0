Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D8AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTcRT+I29hHBliPvI0evh4axaaOd29R45xTjqVyfgbY=; b=Mi11KtxWl1TsGd
	xbDHTpkRbNOdz1ZP64DA15tAqi7OBTeE27bV5ejkNXX1bOzGEDbUwPpOcZDMWLwG7bUJ7vmMUUPNv
	ZZAxZzd1K2/uHzb1x2XUATpxDHHeQXmQL2vyJJ8GQLkhEZM54l2z2EDQ5J4i+S/O7bZsrto60KXGf
	9jGtXfuw4v4tmeFtWrHv/kDnhFpG3IRDM4Dq/eaFATgEXO6SNJIrUisDteFd+5D5sx0kgHbTqnNCy
	aE4wXtGUmSkUXS6pQIK9GpJAuGIxdsTECk14n+O98dtiykRK5gZ+6NTO+/JNuTh8FoScnUFuqSjc2
	VyJXkYPVkMhnjzFb9P4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAvN8-002sRt-N7; Mon, 11 Jul 2022 15:30:54 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAvN5-002sPI-FG
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 15:30:52 +0000
Received: by mail-ej1-x634.google.com with SMTP id ez10so9403353ejc.13
        for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2022 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O6aF44242Cbhj9tJR/zWLAwI/ThWjZFM50mDO0hgdDw=;
        b=TibOBdGSO+jHYEmqxPBPE1v1o5zW0g08biNvyyHtM881mmqbCne/CjOxui4UEFwRWR
         A2Q0c+jZHCx+iZ85vHjuwX5V7LaLcCqPHBzSxIYTnssGOM+yUfdvUpKOdr7sJNyDnPgm
         GwDDF8EX99oAPiVMlI8IIKuhgLJgi85qmKWdbtZXLnFZem5YwG4ig3H3rXxC3QYLZ0/z
         UjMWEYkBAmbcKoz62i/wIqxOEfvmXasyFer2ubzqmixLwSf+6W6qVpAumtf37KP+HWBw
         yG8JNTz/NwkjmUT/pU9ogR9ggTQsyTNbhPSqdKcKXCs8yutTTi/qQEZKtHGS+4L6dbXk
         fJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O6aF44242Cbhj9tJR/zWLAwI/ThWjZFM50mDO0hgdDw=;
        b=HkMpTQQiwJqpol1d7OxzbQr9575EVFJVr5vd/BY2q5xBrkEN1HBdUKM6BiOD92BpLL
         LhxLX6aVbWc8YFRxouJXX08sYNlDi7TcWPpTVQlTQbUQXjWY9NLq01QBMKTSAKocPB6G
         pWDAE6qJkXOAFwWfCQOFVpRG1ZL9kcCOS8BlLYkMX312AfkRIhlZA6I7hdCwFrDziY8Z
         cezE3LGLk9PSIDUPYDUf+hpSqHcQgDVfUiWbkrY+NZevPkFS6jVrDT5NXlz0M2Y65J3q
         ocCPtSfMLM/jheynVpT9jvQiuMc3kHeMnyO+9radMAA7uTA4EcUTihd7Rr2qwKupZfff
         mUAg==
X-Gm-Message-State: AJIora/tudJ6h5b9d5V6hasAkRkPvkGaLyhaY+JUitZ248GJcHKhaF8E
	iz/fhk8MHlokj1pb2gIZEIA=
X-Google-Smtp-Source: AGRyM1sYTryv3yld+nlU+GdWG1yQan42JMaJm5Jywwitmg3LUbNCUrIISFIjjUn7j1QFZGdlrtc5dg==
X-Received: by 2002:a17:907:1dc4:b0:72b:4d85:c7c4 with SMTP id og4-20020a1709071dc400b0072b4d85c7c4mr7409903ejc.258.1657553447551;
        Mon, 11 Jul 2022 08:30:47 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id n23-20020a170906725700b00722e603c39asm2773917ejk.31.2022.07.11.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:30:47 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: mtd: partitions: add binding for U-Boot bootloader
Date: Mon, 11 Jul 2022 17:30:40 +0200
Message-Id: <20220711153041.6036-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_083051_529440_6DF7EBC6 
X-CRM114-Status: GOOD (  14.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKUmlnaHQgbm93IHRoZXJl
IGlzIG5vIChrbm93bikgcmVhbCByZWFzb24gZm9yIGEgY3VzdG9tIGJpbmRpbmcgZm9yCnN0YW5k
YXJkIFUtQm9vdCBwYXJ0aXRpb25zLiBCcm9hZGNvbSdzIFUtQm9vdCBob3dldmVyIHJlcXVpcmVz
IGV4dHJhCmhhbmRsaW5nIC0gbG9va2luZyBmb3IgZW52aXJvbm1lbnQgdmFyaWFibGVzIHN1YmJs
b2Nrcy4gVGhpcyBjb21taXQgYWRkcwpCcm9hZGNvbSBzcGVjaWZpYyBiaW5kaW5nLgoKU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIC4uLi9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFtbCAgICAgICB8IDQ5ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3UtYm9v
dC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL3UtYm9vdC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL3UtYm9vdC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uOGE4OGU3ZDE2NTI0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3UtYm9vdC55YW1sCkBAIC0w
LDAgKzEsNDkgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL210ZC9wYXJ0aXRpb25zL3UtYm9vdC55YW1sIworJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBVLUJvb3QgYm9vdGxv
YWRlciBwYXJ0aXRpb24KKworZGVzY3JpcHRpb246IHwKKyAgVS1Cb290IGlzIGEgYm9vdGxvZGFl
ciBjb21tb25seSB1c2VkIGluIGVtYmVkZGVkIGRldmljZXMuIEl0J3MgYWxtb3N0IGFsd2F5cwor
ICBsb2NhdGVkIG9uIHNvbWUga2luZCBvZiBmbGFzaCBkZXZpY2UuCisKKyAgRGV2aWNlIGNvbmZp
Z3VyYXRpb24gaXMgc3RvcmVkIGFzIGEgc2V0IG9mIGVudmlyb25tZW50IHZhcmlhYmxlcyB0aGF0
IGFyZQorICBsb2NhdGVkIGluIGEgKHVzdWFsbHkgc3RhbmRhbG9uZSkgYmxvY2sgb2YgZGF0YS4K
KworbWFpbnRhaW5lcnM6CisgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgor
CithbGxPZjoKKyAgLSAkcmVmOiBwYXJ0aXRpb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29t
cGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gY29uc3Q6IGJyY20sdS1ib290CisgICAgICAg
IGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgQnJvYWRjb20gc3RvcmVzIGVudmlyb25tZW50IHZh
cmlhYmxlcyBpbnNpZGUgYSBVLUJvb3QgcGFydGl0aW9uLiBUaGV5CisgICAgICAgICAgY2FuIGJl
IGlkZW50aWZpZWQgYnkgYSBjdXN0b20gaGVhZGVyIHdpdGggbWFnaWMgdmFsdWUuCisKK3VuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIHBhcnRpdGlv
bnMgeworICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOworICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAg
ICAgcGFydGl0aW9uQDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLHUtYm9vdCI7
CisgICAgICAgICAgICByZWcgPSA8MHgwIDB4MTAwMDAwPjsKKyAgICAgICAgICAgIGxhYmVsID0g
InUtYm9vdCI7CisgICAgICAgIH07CisKKyAgICAgICAgcGFydGl0aW9uQDEwMDAwMCB7CisgICAg
ICAgICAgICByZWcgPSA8MHgxMDAwMDAgMHgxZmYwMDAwMD47CisgICAgICAgICAgICBsYWJlbCA9
ICJmaXJtd2FyZSI7CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
