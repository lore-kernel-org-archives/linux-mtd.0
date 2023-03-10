Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FEC6FA99
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l7PoglGfTYf746ZacIeKcRMKXUyyEs736711SLVYBt4=; b=gYCGlgtn5QFff9
	mZi7SRqlWpF/1yFJJAebRz/xUP9O9/FfeE/DXIijlL5pmol/FaEXdBgv5sxb3JoFSoK5KLZJb5HFE
	fSbV4U/zV/2uqABvpFnFGOpUPp/gpLfjgAZawWRPtZUwqci8vliOEyOGTqGOpXA7Hw7vEOriWwD0o
	aLPcQuzCPpvWKXDW9ZrMW3f9MxAdnKevegZhqjvjzixcKe9fo9PZ8ytvTRvAS1S+Up6CQtNvo0zY6
	jc0dzWYjBPrsntRp5Ol/vXesSHmwGinYErnhZrNNopGydlafyWUc71csGUO5NZUx0/zkXzXy5cu19
	FJCd6htWLh1FFYC6+KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaNb-00EG6o-9i; Fri, 10 Mar 2023 10:53:43 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaNY-00EG66-9U
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 10:53:41 +0000
Received: by mail-lf1-x12c.google.com with SMTP id n2so6033148lfb.12
        for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2023 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678445615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAQLdEeSrfZYQHVCxX67ELAHVT8Gl44hvbILMrM52aY=;
        b=ICetKMmwCbwiDaE3yxZqjn1i8MDyjkxLfzPryIFYluhAX4cs+hkaiU7gRkMyRf1Pz3
         KJZ1Kuqp6KFJctWPSUefng+c9ORzp0dsPVLkm1eE6R7s0A1Nb/gnZvl9bik8p2fpe6Ng
         6AuNYO08jRgLr1ICaUBJaP4Zg6/syX8m/5QwjbY4XAIprHZyKCRl7iBrsKCdUSQwipYh
         gdNbDKIqgQsPeK/CYyC8nBrlWfiIUZ+ILKPupulpnIf0/fkaenb9bCmGT2lDVCWM0yx6
         ZzMynhGA1lmX9cHFtwT1YJwUkI5yMebzfM0sUDCNZjrScq7Q56KYo83m9o8yHGgufQ4J
         z/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678445615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAQLdEeSrfZYQHVCxX67ELAHVT8Gl44hvbILMrM52aY=;
        b=KWIqCfvanECxHUB71usTK3y2Tpng0B8P/RWT12sFewcBzMc0P2MGWFhUC5Z4Mv4P2j
         Uv1R0auUzNyD/BOUmIxKRxXZeQ1wVkcSIGn1O1ZRO5PuoJZFUAVJRFqx9+GYo4hS1Vak
         SzYDxkPqZ3NkRmVMvaS/jZ3i39MoeccN/IQadrXIFFpZPpDDOJpzwnkee5imRAW1PEsH
         MQYrRCIbuGTKJN4PcYh9k0vUHnSPSZoo7dLEsiAtQsK1ghB/ppbdHzDOe0kfTFJoUTqI
         0XPZHvnC8Sw6M/KaelY6I9YSGv9WLUQeP+iFtLI5uxsqkTVMQkkLKdTVLm0x0Yy3OI4P
         gzfw==
X-Gm-Message-State: AO0yUKWxEBgMbPq3l+QAWI9ZOhlYdYcY06mI5nWaCjSagxclIeB4AJmS
	L1/Ad/p1CvitEdiXaSVOxf4=
X-Google-Smtp-Source: AK7set9Pu1hCa4aONY/APd64XeHEzqooYZVnWsx7KB+q0u6a5dWjYGHYDwgMHXNkRCFxPDkErwii4Q==
X-Received: by 2002:ac2:4432:0:b0:4d8:7f17:d0e9 with SMTP id w18-20020ac24432000000b004d87f17d0e9mr5963165lfl.14.1678445615544;
        Fri, 10 Mar 2023 02:53:35 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id q5-20020a2eb4a5000000b0029335c12997sm194532ljm.58.2023.03.10.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:53:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <michael@walle.cc>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: nvmem: allow MTD to be explicitly an NVMEM provider
Date: Fri, 10 Mar 2023 11:53:30 +0100
Message-Id: <20230310105330.14181-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_025340_352150_D6B1988E 
X-CRM114-Status: GOOD (  14.84  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhlcmUgYXJlIGEgbG90
IG9mIGRldmljZXMgd2l0aCBOVk1FTSBjb250ZW50IHN0b3JlZCBpbiBNVEQgZGV2aWNlcyBpbgpy
ZWxldmFudCBwYXJ0aXRpb25zLiBBZGQgYSBEVCBiaW5kaW5nIGZvciBtYXJraW5nIHN1Y2ggcGFy
dGl0aW9ucy4KCk5vdGU6IExpbnV4IGFscmVhZHkgdHJlYXRzIGV2ZXJ5IE1URCBwYXJ0aXRpb24g
YXMgTlZNRU0gcHJvdmlkZXIgc28gaW4KZ2VuZXJhbCBpdCBkb2Vzbid0IG5lZWQgdG8gY2FyZSBh
Ym91dCB0aGlzIGJpbmRpbmcuIEl0J3MgbWVhbnQganVzdCB0bwptYWtlIERUIGNsZWFyZXIgaW4g
ZGVzY3JpYmluZyBoYXJkd2FyZS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFm
YWxAbWlsZWNraS5wbD4KLS0tCkFzIGV4cGxhaW5lZCBpbiBjb21taXQgYm9keSB0aGlzIGlzbid0
IHJlYWxseSBuZWVkZWQgZm9yIExpbnV4LiBJCnRob3VnaHQgaXQnZCBiZSBhIHNtYWxsIG5pY2Ug
YWRkaXRpb24gZm9yIHdyaXRpbmcgY2xlYXIgRFRTIGZpbGVzLgotLS0KIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL252bWVtL210ZC55YW1sICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL210ZC55YW1sCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL210ZC55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL210ZC55YW1sCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNzQzNWIyODAzY2Y5Ci0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL210ZC55YW1sCkBA
IC0wLDAgKzEsNTIgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbnZtZW0vbXRkLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE1URCBhY2Nlc3MgYmFzZWQgTlZN
RU0KKworZGVzY3JpcHRpb246IHwKKyAgTVREIHBhcnRpdGlvbnMgY2FuIGJlIE5WTUVNIHByb3Zp
ZGVycy4gVGhpcyBiaW5kaW5nIGFsbG93cyBleHBsaWNpdGx5IG1hcmtpbmcKKyAgc3VjaCBwYXJ0
aXRpb25zLgorCisgIFRoZSBleGFjdCB3YXkgb2YgaGFuZGxpbmcgTVREIHBhcnRpdGlvbiBjb250
ZW50IChOVk1FTSBjZWxscykgc2hvdWxkIGJlCisgIGRlc2NyaWJlZCB1c2luZyBhIHByb3BlciBO
Vk1FTSBsYXlvdXQuCisKK21haW50YWluZXJzOgorICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4KKworYWxsT2Y6CisgIC0gJHJlZjogbnZtZW0ueWFtbCMKKyAgLSAkcmVmOiAv
c2NoZW1hcy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCMKKworcHJvcGVydGllczoKKyAg
Y29tcGF0aWJsZToKKyAgICBjb25zdDogbXRkLW52bWVtCisKKyAgcmVnOgorICAgIG1heEl0ZW1z
OiAxCisKK3JlcXVpcmVkOgorICAtIHJlZworCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNl
CisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cisg
ICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHBhcnRpdGlvbkAwIHsKKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAibXRkLW52bWVtIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDAg
MHg0MDAwMD47CisgICAgICAgICAgICBsYWJlbCA9ICJkZXZpY2UtZGF0YSI7CisKKyAgICAgICAg
ICAgIG52bWVtLWxheW91dCB7CisgICAgICAgICAgICAgICAgLyogSnVzdCBhIGR1bW15IGV4YW1w
bGU6IEtvbnRyb24gY2FuIGJlIGZvdW5kIG9uIE9UUCBhY3R1YWxseSAqLworICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAia29udHJvbixzbDI4LXZwZCI7CisgICAgICAgICAgICB9OworICAg
ICAgICB9OworICAgIH07Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
