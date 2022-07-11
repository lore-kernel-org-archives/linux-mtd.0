Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D598C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1bbI/9ghGV8UIWS1TTPio3JdJVCY276oEr1/FFBPVo=; b=ASCNG+EV32Ssay
	z3qOXhLT8Ac5AI9CRu+HZ/FfRKq42/0vUsZO9LgNKDtbddbon0kyCnpcRNpnsyrj8y9t4W+ebHgdR
	lUTG6K2viriJXphN0OQ4R9jwHKu2xwjGNK/w43z33mfPqsRe51865blIluUvmL/ZuKFKvbfZzm6Vl
	8hE/vcLN1TQtGxLzbQIpAtlEfEHQ8IMnbf6In3cQdA0TmNgb/BArn7dtrUl8DQyTSwupB1HAA6zeW
	1t3QNHK122ZAqi1bqNkj6zI7FOsG87wQ/eOKovvhXHgLFHaARWg5x+D9d8e/g7s6RxxivusoBktol
	dD7BzCuYtziWF6SoSEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAvNB-002sUG-4W; Mon, 11 Jul 2022 15:30:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAvN6-002sPv-Rf
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 15:30:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id b11so9428300eju.10
        for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2022 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NbtZW5iYffYk9vJVjFHUiX8xjAYGNvMtQ0Q/nx4lmE=;
        b=RXgXOcZj6YH+t3Aq/vb7Vvy1y3qynU35QEgQvsk2xM8MzwSpdHV1CeVrk9yu89X1mQ
         DCN7Umzu+MkC8OTHHi6gwQIPu1mgzzz4M8RQ5RnPMEGLP35ZSYvIQJdOnSrIX5cOyJqL
         J5n9qN15WTysFcf65IkJ3fDCIfublrwG/IE/LxE+WWq0h4V0APn5fAk8XfaOlyVcQ6aW
         Hw4B248mr7TH4zDKONitE6y9eoXGuKbkjYHSMrqScvKmVOLwQ5Z3YY1Dye4zMw7lxqy5
         1hqr1zFnDfBr61akis4PnNsELCJPfeObv9f8tDhcTrU4g9pkHBj0moknGcFSt1a27Eys
         EtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NbtZW5iYffYk9vJVjFHUiX8xjAYGNvMtQ0Q/nx4lmE=;
        b=oncV/Figpm2w9LUbYMlTZ/I4yuSjI/VPMGqvtudGEULJAhx6ak+cga/A3o/RU4zAUx
         6umhTei6QexbU5E9Ltc3kIaN/oB3ZkDiUddr8UhLOgzx7KvfBDQq6zIFq4AYSwKa6HwJ
         wORG1ykahLUkz8j+5zCNryQ331LplyeC39DuF/7yvtFgKsdn6YMpoumc0eOGEkSpmj9f
         82WE2IhEmh9xEkCFR2etrtW8XA5yKM2+maZnwPbkB1eCdkWgQwn4spXaytBd4XQ8TocJ
         soX2UbFGrSOLec+dvAXw17VR10jS+Hg1Bt0Pp0SMPNQ/FThZbDFimOXX4xETg8SPxlOC
         9Syw==
X-Gm-Message-State: AJIora/9CRkQybcfWSSf1/4LiVAuYSqXHMRwDJ9bV/EVcaDcuKfCwNR9
	mHLEwp8qKLHS3ILAM9mMQrY=
X-Google-Smtp-Source: AGRyM1vePmwXs3CspYk34kycX3cgB1muGtC9YvDxmfao/cwBZGMXY5COqHZKiUeyv+CRgpv66yd7vg==
X-Received: by 2002:a17:907:7e85:b0:726:9fc5:cc2d with SMTP id qb5-20020a1709077e8500b007269fc5cc2dmr18462100ejc.376.1657553449101;
        Mon, 11 Jul 2022 08:30:49 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id n23-20020a170906725700b00722e603c39asm2773917ejk.31.2022.07.11.08.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:30:48 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: parsers: add Broadcom's U-Boot parser
Date: Mon, 11 Jul 2022 17:30:41 +0200
Message-Id: <20220711153041.6036-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711153041.6036-1-zajec5@gmail.com>
References: <20220711153041.6036-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_083052_921138_3AD8D651 
X-CRM114-Status: GOOD (  21.59  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQnJvYWRjb20gc3RvcmVz
IGVudmlyb25tZW50IHZhcmlhYmxlcyBibG9ja3MgaW5zaWRlIFUtQm9vdCBwYXJ0aXRpb24KaXRz
ZWxmLiBUaGlzIGRyaXZlciBmaW5kcyAmIHJlZ2lzdGVycyB0aGVtLgoKU2lnbmVkLW9mZi1ieTog
UmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbXRkL3BhcnNl
cnMvS2NvbmZpZyAgICAgICB8IDEwICsrKysKIGRyaXZlcnMvbXRkL3BhcnNlcnMvTWFrZWZpbGUg
ICAgICB8ICAxICsKIGRyaXZlcnMvbXRkL3BhcnNlcnMvYnJjbV91LWJvb3QuYyB8IDg0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgOTUgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL3BhcnNlcnMvYnJjbV91LWJvb3Qu
YwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvS2NvbmZpZyBiL2RyaXZlcnMvbXRk
L3BhcnNlcnMvS2NvbmZpZwppbmRleCBiNDNkZjczOTI3YTAuLjgxZjJkMGE3OTVhNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9LY29uZmlnCisrKyBiL2RyaXZlcnMvbXRkL3BhcnNl
cnMvS2NvbmZpZwpAQCAtMjAsNiArMjAsMTYgQEAgY29uZmlnIE1URF9CQ002M1hYX1BBUlRTCiAJ
ICBUaGlzIHByb3ZpZGVzIHBhcnRpdGlvbiBwYXJzaW5nIGZvciBCQ002M3h4IGRldmljZXMgd2l0
aCBDRkUKIAkgIGJvb3Rsb2FkZXJzLgogCitjb25maWcgTVREX0JSQ01fVV9CT09UCisJdHJpc3Rh
dGUgIkJyb2FkY29tJ3MgVS1Cb290IHBhcnRpdGlvbiBwYXJzZXIiCisJZGVwZW5kcyBvbiBBUkNI
X0JDTTQ5MDggfHwgQ09NUElMRV9URVNUCisJaGVscAorCSAgQnJvYWRjb20gdXNlcyBhIGN1c3Rv
bSB3YXkgb2Ygc3RvcmluZyBVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFibGVzLgorCSAgVGhleSBh
cmUgcGxhY2VkIGluc2lkZSBVLUJvb3QgcGFydGl0aW9uIGl0c2VsZiBhdCB1bnNwZWNpZmllZCBv
ZmZzZXQuCisJICBJdCdzIHBvc3NpYmxlIHRvIGxvY2F0ZSB0aGVtIGJ5IGxvb2tpbmcgZm9yIGEg
Y3VzdG9tIGhlYWRlciB3aXRoIGEKKwkgIG1hZ2ljIHZhbHVlLiBUaGlzIGRyaXZlciBkb2VzIHRo
YXQgYW5kIGNyZWF0ZXMgc3VicGFydGl0aW9ucyBmb3IKKwkgIGVhY2ggZm91bmQgZW52aXJvbm1l
bnQgdmFyaWFibGVzIGJsb2NrLgorCiBjb25maWcgTVREX0NNRExJTkVfUEFSVFMKIAl0cmlzdGF0
ZSAiQ29tbWFuZCBsaW5lIHBhcnRpdGlvbiB0YWJsZSBwYXJzaW5nIgogCWRlcGVuZHMgb24gTVRE
CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL01ha2VmaWxlIGIvZHJpdmVycy9tdGQv
cGFyc2Vycy9NYWtlZmlsZQppbmRleCAyZmNmMGFiOWU3ZGEuLjIzZmE0ZGU0MDE2ZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9NYWtlZmlsZQorKysgYi9kcml2ZXJzL210ZC9wYXJz
ZXJzL01ha2VmaWxlCkBAIC0yLDYgKzIsNyBAQAogb2JqLSQoQ09ORklHX01URF9BUjdfUEFSVFMp
CQkrPSBhcjdwYXJ0Lm8KIG9iai0kKENPTkZJR19NVERfQkNNNDdYWF9QQVJUUykJCSs9IGJjbTQ3
eHhwYXJ0Lm8KIG9iai0kKENPTkZJR19NVERfQkNNNjNYWF9QQVJUUykJCSs9IGJjbTYzeHhwYXJ0
Lm8KK29iai0kKENPTkZJR19NVERfQlJDTV9VX0JPT1QpCQkrPSBicmNtX3UtYm9vdC5vCiBvYmot
JChDT05GSUdfTVREX0NNRExJTkVfUEFSVFMpCQkrPSBjbWRsaW5lcGFydC5vCiBvYmotJChDT05G
SUdfTVREX09GX1BBUlRTKQkJKz0gb2ZwYXJ0Lm8KIG9mcGFydC15CQkJCSs9IG9mcGFydF9jb3Jl
Lm8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYnJjbV91LWJvb3QuYyBiL2RyaXZl
cnMvbXRkL3BhcnNlcnMvYnJjbV91LWJvb3QuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjdjMzM4ZGM3YjhmMwotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvbXRk
L3BhcnNlcnMvYnJjbV91LWJvb3QuYwpAQCAtMCwwICsxLDg0IEBACisvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CisvKgorICogQ29weXJpZ2h0IMKpIDIwMjIgUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorICovCisKKyNpbmNsdWRlIDxsaW51eC9tb2R1
bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
CisjaW5jbHVkZSA8bGludXgvbXRkL210ZC5oPgorI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRp
b25zLmg+CisKKyNkZWZpbmUgQlJDTV9VX0JPT1RfTUFYX09GRlNFVAkJMHgyMDAwMDAKKyNkZWZp
bmUgQlJDTV9VX0JPT1RfU1RFUAkJMHgxMDAwCisKKyNkZWZpbmUgQlJDTV9VX0JPT1RfTUFYX1BB
UlRTCQkyCisKKyNkZWZpbmUgQlJDTV9VX0JPT1RfTUFHSUMJCTB4NzU0NTZlNzYJLyogdUVudiAq
LworCitzdHJ1Y3QgYnJjbV91X2Jvb3RfaGVhZGVyIHsKKwlfX2xlMzIgbWFnaWM7CisJX19sZTMy
IGxlbmd0aDsKK30gX19wYWNrZWQ7CisKK3N0YXRpYyBjb25zdCBjaGFyICpuYW1lc1tCUkNNX1Vf
Qk9PVF9NQVhfUEFSVFNdID0geworCSJ1LWJvb3QtZW52IiwKKwkidS1ib290LWVudi1iYWNrdXAi
LAorfTsKKworc3RhdGljIGludCBicmNtX3VfYm9vdF9wYXJzZShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwKKwkJCSAgICAgY29uc3Qgc3RydWN0IG10ZF9wYXJ0aXRpb24gKipwcGFydHMsCisJCQkgICAg
IHN0cnVjdCBtdGRfcGFydF9wYXJzZXJfZGF0YSAqZGF0YSkKK3sKKwlzdHJ1Y3QgYnJjbV91X2Jv
b3RfaGVhZGVyIGhlYWRlcjsKKwlzdHJ1Y3QgbXRkX3BhcnRpdGlvbiAqcGFydHM7CisJc2l6ZV90
IGJ5dGVzX3JlYWQ7CisJc2l6ZV90IG9mZnNldDsKKwlpbnQgZXJyOworCWludCBpID0gMDsKKwor
CXBhcnRzID0ga2NhbGxvYyhCUkNNX1VfQk9PVF9NQVhfUEFSVFMsIHNpemVvZigqcGFydHMpLCBH
RlBfS0VSTkVMKTsKKwlpZiAoIXBhcnRzKQorCQlyZXR1cm4gLUVOT01FTTsKKworCWZvciAob2Zm
c2V0ID0gMDsKKwkgICAgIG9mZnNldCA8IG1pbl90KHNpemVfdCwgbXRkLT5zaXplLCBCUkNNX1Vf
Qk9PVF9NQVhfT0ZGU0VUKTsKKwkgICAgIG9mZnNldCArPSBCUkNNX1VfQk9PVF9TVEVQKSB7CisJ
CWVyciA9IG10ZF9yZWFkKG10ZCwgb2Zmc2V0LCBzaXplb2YoaGVhZGVyKSwgJmJ5dGVzX3JlYWQs
ICh1aW50OF90ICopJmhlYWRlcik7CisJCWlmIChlcnIgJiYgIW10ZF9pc19iaXRmbGlwKGVycikp
IHsKKwkJCXByX2VycigiRmFpbGVkIHRvIHJlYWQgZnJvbSAlcyBhdCAweCV6eDogJWRcbiIsIG10
ZC0+bmFtZSwgb2Zmc2V0LCBlcnIpOworCQkJY29udGludWU7CisJCX0KKworCQlpZiAobGUzMl90
b19jcHUoaGVhZGVyLm1hZ2ljKSAhPSBCUkNNX1VfQk9PVF9NQUdJQykKKwkJCWNvbnRpbnVlOwor
CisJCXBhcnRzW2ldLm5hbWUgPSBuYW1lc1tpXTsKKwkJcGFydHNbaV0ub2Zmc2V0ID0gb2Zmc2V0
OworCQlwYXJ0c1tpXS5zaXplID0gc2l6ZW9mKGhlYWRlcikgKyBsZTMyX3RvX2NwdShoZWFkZXIu
bGVuZ3RoKTsKKwkJaSsrOworCQlwcl9pbmZvKCJvZmZzZXQ6MHglenggbWFnaWM6MHglMDh4IEJJ
TkdPXG4iLCBvZmZzZXQsIGhlYWRlci5tYWdpYyk7CisKKwkJaWYgKGkgPT0gQlJDTV9VX0JPT1Rf
TUFYX1BBUlRTKQorCQkJYnJlYWs7CisJfQorCisJKnBwYXJ0cyA9IHBhcnRzOworCisJcmV0dXJu
IGk7Cit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBicmNtX3VfYm9vdF9v
Zl9tYXRjaF90YWJsZVtdID0geworCXsgLmNvbXBhdGlibGUgPSAiYnJjbSx1LWJvb3QiIH0sCisJ
e30sCit9OworTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYnJjbV91X2Jvb3Rfb2ZfbWF0Y2hfdGFi
bGUpOworCitzdGF0aWMgc3RydWN0IG10ZF9wYXJ0X3BhcnNlciBicmNtX3VfYm9vdF9tdGRfcGFy
c2VyID0geworCS5wYXJzZV9mbiA9IGJyY21fdV9ib290X3BhcnNlLAorCS5uYW1lID0gImJyY21f
dS1ib290IiwKKwkub2ZfbWF0Y2hfdGFibGUgPSBicmNtX3VfYm9vdF9vZl9tYXRjaF90YWJsZSwK
K307Cittb2R1bGVfbXRkX3BhcnRfcGFyc2VyKGJyY21fdV9ib290X210ZF9wYXJzZXIpOworCitN
T0RVTEVfTElDRU5TRSgiR1BMIik7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
