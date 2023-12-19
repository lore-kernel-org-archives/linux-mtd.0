Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E8C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grsKtFi6c9rLhIVk/zRWYOBWnGaQcB3LX/Ht/50qWNI=; b=rNBSqP1YddAfTV
	U7JsNEabDXRvXVd4wrq5icfRxy126jnxZhlIV2nPyeJNmYO7PpvU2c58TUHMM5DhxWNGhCvWAjJg+
	aKqaBFXHH8Z8fa1k04/7S4hUuDJiadXdORWqVRMiSJAL2mnsiq+/PTa/KUJ/XFf391xNthK6vqYKJ
	xbB1QntRDQXhTKugP6D/EY89EcSjYlF+JH7//FCFHHa6Smsm3W0YJlCNVBBe/x/55SJyAaVGjjIFq
	+x6L4P/CXONxXhgH9HxTNZb/VFIBdUrv6X0922J0UemT/ZveyvUf7Oq4Lx70nO7BFGfB/L4xltbGG
	1Jeu7f6i+/xEm7oT0/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5D-00EyoJ-0b;
	Tue, 19 Dec 2023 17:40:43 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFe5A-00Eymo-1V;
	Tue, 19 Dec 2023 17:40:42 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so597531566b.1;
        Tue, 19 Dec 2023 09:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703007638; x=1703612438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUAvVSVhxfpG8xQnwKnlglz0LVM7Vn2JPxTl2XGCxyQ=;
        b=I216Z++XMHfhMfpGtFH9kbl9H5sT0FhrmV6YH5rv+ow4P99BEChoKztz7gsNGR4L37
         UyC1DDdPQbTXPT6MHWjq+BAy8MbR/fjYJGPN3uM9L1wktxa1B2nHBMh9DouSPSSto941
         qxVIBCS/EJRdDMoSkQeBmUuy8kdwitED4ZMe2FTL+BG8JZocj4L9tuhrtnkQIgnnm74e
         Cv0zDHBa6Lmk8abwNKNBc584p7eDQOQ1mutD2xERQX2ejVnSmNkohxwhZcQzE224sGTQ
         Apy40zR2/RPWPVuNWONv1kRYyvTkqX8xjDuI0kY8bnvwJis/NCdz0uMofEoW/mlA2nvs
         kKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007638; x=1703612438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUAvVSVhxfpG8xQnwKnlglz0LVM7Vn2JPxTl2XGCxyQ=;
        b=PsCK79wiU6FRxXQjR+qrcSDrJt+PNQeDEdKwp2xtPElFcks9TszJLRHIo9Nc9eLclJ
         w0Ig13dDvoVjum1p2Zru6FgAJnkF2I5NTkG+ET2k2fKIesCy5hkQ0yfrike740xyshJs
         Re6hJKtvOINDFaMgf+zL2cc1nlKJRJM57qaguSm014QRPa4LbHkDVTxToIsy00qxGvoc
         LNdGXcUT9ChqQc0/T25LWRrRWIBOg1L4wleG6CWeSafK3ONEEWIquwKRfuw06mX31u3j
         3il1Bi1OtXn3sWOZFI9wdLkm7UpQ6qgHyt3mRA1b3+4QokVatyjXPgCNlzT6/BUm0nQ7
         2QNg==
X-Gm-Message-State: AOJu0Yz6D4Zku//63tP+8XspNIEZImIwF7EiCXV4vVDp06bJtt/SrJkL
	llu9c0iTH9th8smiBmhtrDS3AglzX8Y=
X-Google-Smtp-Source: AGHT+IGj03k4tKfPpLbPbo44mQ331d1Cth9MTNhfOJCUqRXauznoIRp+BrTJhH+JppWzVsGZ3iN7Rw==
X-Received: by 2002:a17:907:764c:b0:a26:8ab0:43b8 with SMTP id kj12-20020a170907764c00b00a268ab043b8mr48795ejc.41.1703007638248;
        Tue, 19 Dec 2023 09:40:38 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id tx27-20020a1709078e9b00b00a1c85124b08sm15834840ejc.94.2023.12.19.09.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:40:37 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/5] dt-bindings: nvmem: layouts: add U-Boot environment variables layout
Date: Tue, 19 Dec 2023 18:40:21 +0100
Message-Id: <20231219174025.15228-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094040_500974_4A0321AE 
X-CRM114-Status: GOOD (  17.44  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVS1Cb290IGVudiBkYXRh
IGlzIGEgd2F5IG9mIHN0b3JpbmcgZmlybXdhcmUgdmFyaWFibGVzLiBJdCdzIGEgZm9ybWF0CnRo
YXQgY2FuIGJlIHVzZWQgb2YgdG9wIG9mIHZhcmlvdXMgc3RvcmFnZSBkZXZpY2VzLiBJdHMgYmlu
ZGluZyBzaG91bGQKYmUgYW4gTlZNRU0gbGF5b3V0IGluc3RlYWQgb2YgYSBzdGFuZGFsb25lIGRl
dmljZS4KClRoaXMgcGF0Y2ggYWRkcyBsYXlvdXQgYmluZGluZyB3aGljaCBhbGxvd3MgdXNpbmcg
aXQgb24gdG9wIG9mIE1URCBOVk1FTQpkZXZpY2UgYXMgd2VsbCBhcyBhbnkgb3RoZXIuIEF0IHRo
ZSBzYW1lIHRpbWUgaXQgZGVwcmVjYXRlcyB0aGUgb2xkCmNvbWJpbmVkIGJpbmRpbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQpWMjogQWRk
ICItbGF5b3V0IiBzdWZmaXggdG8gY29tcGF0aWJsZXMgdG8gYXZvaWQgY29uZmxpY3QKCiAuLi4v
bnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LWxheW91dC55YW1sICAgICAgfCA1NSArKysrKysrKysr
KysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwg
fCAgNiArKwogMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvdS1i
b290LGVudi1sYXlvdXQueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYtbGF5b3V0LnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LWxheW91
dC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uM2I0ZDhmMmE0
NGUxCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L252bWVtL2xheW91dHMvdS1ib290LGVudi1sYXlvdXQueWFtbApAQCAtMCwwICsxLDU1IEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZQorJVlBTUwg
MS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5b3V0
cy91LWJvb3QsZW52LWxheW91dC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBOVk1FTSBsYXlvdXQgb2YgVS1Cb290
IGVudmlyb25tZW50IHZhcmlhYmxlcworCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+CisKK2Rlc2NyaXB0aW9uOgorICBVLUJvb3QgdXNlcyBlbnZp
cm9ubWVudCB2YXJpYWJsZXMgdG8gc3RvcmUgZGV2aWNlIHBhcmFtZXRlcnMgYW5kCisgIGNvbmZp
Z3VyYXRpb24uIFRoZXkgbWF5IGJlIHVzZWQgZm9yIGJvb3RpbmcgcHJvY2Vzcywgc2V0dXAgb3Ig
a2VlcGluZyBlbmQgdXNlcgorICBpbmZvLgorCisgIERhdGEgaXMgc3RvcmVkIHVzaW5nIFUtQm9v
dCBzcGVjaWZpYyBmb3JtYXRzICh2YXJpYW50IHNwZWNpZmljIGhlYWRlciBhbmQgTlVMCisgIHNl
cGFyYXRlZCBrZXktdmFsdWUgcGFpcnMpLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgor
ICAgIG9uZU9mOgorICAgICAgLSBkZXNjcmlwdGlvbjogQSBzdGFuZGFsb25lIGVudiBkYXRhIGJs
b2NrCisgICAgICAgIGNvbnN0OiB1LWJvb3QsZW52LWxheW91dAorICAgICAgLSBkZXNjcmlwdGlv
bjogVHdvIHJlZHVuZGFudCBibG9ja3Mgd2l0aCBhY3RpdmUgb25lIGZsYWdnZWQKKyAgICAgICAg
Y29uc3Q6IHUtYm9vdCxlbnYtcmVkdW5kYW50LWJvb2wtbGF5b3V0CisgICAgICAtIGRlc2NyaXB0
aW9uOiBUd28gcmVkdW5kYW50IGJsb2NrcyB3aXRoIGFjdGl2ZSBoYXZpbmcgaGlnaGVyIGNvdW50
ZXIKKyAgICAgICAgY29uc3Q6IHUtYm9vdCxlbnYtcmVkdW5kYW50LWNvdW50LWxheW91dAorICAg
ICAgLSBkZXNjcmlwdGlvbjogQnJvYWRjb20ncyB2YXJpYW50IHdpdGggY3VzdG9tIGhlYWRlcgor
ICAgICAgICBjb25zdDogYnJjbSxlbnYtbGF5b3V0CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgcGFydGl0aW9ucyB7CisgICAgICAgIGNvbXBh
dGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKKworICAgICAgICBwYXJ0aXRpb25AMCB7Cisg
ICAgICAgICAgICByZWcgPSA8MHgwIDB4NDAwMDA+OworICAgICAgICAgICAgbGFiZWwgPSAidS1i
b290IjsKKyAgICAgICAgICAgIHJlYWQtb25seTsKKyAgICAgICAgfTsKKworICAgICAgICBwYXJ0
aXRpb25ANDAwMDAgeworICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAwMD47CisgICAg
ICAgICAgICBsYWJlbCA9ICJ1LWJvb3QtZW52IjsKKworICAgICAgICAgICAgbnZtZW0tbGF5b3V0
IHsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxlbnYtbGF5b3V0IjsKKyAg
ICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCmluZGV4IDljMzZh
ZmM3MDg0Yi4uNmMyYTNjYTVmMDUxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKQEAgLTI2LDkgKzI2LDE1IEBA
IGRlc2NyaXB0aW9uOiB8CiAKICAgVmFyaWFibGVzIGNhbiBiZSBkZWZpbmVkIGFzIE5WTUVNIGRl
dmljZSBzdWJub2Rlcy4KIAorICBJbnRyb2R1Y3Rpb24gb2YgTlZNRU0gbGF5b3V0cyBleHBvc2Vk
IGEgbGltaXRhdGlvbiBvZiB0aGlzIGJpbmRpbmcgZGVzaWduLgorICBEZXNjcmlwdGlvbiBvZiBO
Vk1FTSBkYXRhIGNvbnRlbnQgc2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIE5WTUVNIGRldmljZXMu
CisgIFNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgVS1Cb290IGVudiBkYXRhIGxheW91dCB0aGlz
IGJpbmRpbmcgaXMgZGVwcmVjYXRlZC4KKwogbWFpbnRhaW5lcnM6CiAgIC0gUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgogCitkZXByZWNhdGVkOiB0cnVlCisKIHByb3BlcnRpZXM6
CiAgIGNvbXBhdGlibGU6CiAgICAgb25lT2Y6Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
