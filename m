Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A80C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JjB2OXxdGPaGwo5JEvNL374KUqrq9hOKhu0ARQwOTac=; b=hwQUOVjhaOmTEZ
	5hCcvwx4sbn7/JA1JVkIlvNdXavrIxU/7CYNp4EPzch7kKnxiacd98kzy5erMMeUw3aOsP/n0+lmp
	MzC+E79C5K8iu4PHGzCrnj7KBkVENOE/maERe0olWlxFOEQGWnqWWCukqQVG8wraWpzFoNBjW/tfD
	PitBwbPQwr0gjAHrh8OMk4fo/FAUpWOiHkkiAf4qDNVMbu9ehyV8jJQGvxruDFsLI5yRykyz/aPZz
	rEGNQQW822vEZPwtEVj7tMa91bxH4Tu8FhYJkHXNAKpoleVqgLr+8tOkf76yABJEgfbiq8CmKdd3I
	MpNZKFC6dq3PO2AYmNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDuQ-00AuIF-2W;
	Mon, 18 Dec 2023 13:43:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDuL-00AuHP-2l;
	Mon, 18 Dec 2023 13:43:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso36282705e9.0;
        Mon, 18 Dec 2023 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702907022; x=1703511822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74hbRXhVdXgSDAgGqkd3Z2N/WmcE11nXVnluNKZBVyg=;
        b=MymsCwcGaAGzU5RItC4vqDy6LEsANBpUbnMYzjdR4RHp0M44EbjxdI7ABdFhG4Btmz
         9d04K0pqLwPyh2nfvpcpkYRaRxpSfTpV+rconqnYYuVr9kIAb/ljp6YwomRgPCVKOtS0
         KC/m1JermDUV0aZ56jOxP5YA67ilzG1x8/cl8ODv5i5oRdePtV5TzRJ+hZrukk5Z0YMB
         InyAs+1u3kdLTqMUz3HD4ovNqKTZDYLEYlhH9d5/RlrLsJCu+nDLM1KEAWgSQ/sJYxkF
         zQVSwPwUxxPVsOCg+3qqeYblghjAa2TOn4KIqLEQc8ncqTDUkbnx04V9XWp3AjVGHn7R
         sOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907023; x=1703511823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74hbRXhVdXgSDAgGqkd3Z2N/WmcE11nXVnluNKZBVyg=;
        b=WiENoPnqyZPkcrh8+XSfLg6SRTOtX48Z7j8eBBguOOPmZeTeY6JGxOBiPryojNHWPT
         JAPhYW5G3OZiCMF0j8ny2xl5R6hC+7iCT6JW+v9Cp52M9aB8uRD1ToAPoCW63LYyV4kJ
         SFdb8SmfrMAcu/Q2nDKySvZilwbP/B1g0V9fV9v5pXcd/wcWWQjGdNtwNRU5WgxwrB3L
         g46nhLyRPmqwibDEUolhirOOebtsnIw5TMgioeA5XlSpRXm/ufNFesvaSYMi0c4PBbal
         5wEqwhXqEvM4NL5rtzJe1D1BA6M7blTxCGoiWLZzXkRk1Xaa44YKEkauy1EoZ+v1cfGZ
         AlIg==
X-Gm-Message-State: AOJu0YzB58L4+gviD845QcNXVaaVswnVdSZFqa9leA4che540F+aXBrr
	xtULMZrviC9+/MOmIRhdKzFHQu1OpUU=
X-Google-Smtp-Source: AGHT+IHT+hNGJimAnfQ6BtcEMsMSLNWd6wLudFTGCwXIlKzIipmCiwiwJao7CLfyL16Ml1MTDiLl1w==
X-Received: by 2002:a05:600c:3556:b0:40b:5e1e:cf9 with SMTP id i22-20020a05600c355600b0040b5e1e0cf9mr7839833wmq.52.1702906659774;
        Mon, 18 Dec 2023 05:37:39 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id f20-20020a1709067f9400b00a234907311asm1891537ejr.55.2023.12.18.05.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 05:37:39 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: nvmem: layouts: add U-Boot environment variables layout
Date: Mon, 18 Dec 2023 14:37:19 +0100
Message-Id: <20231218133722.16150-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_054345_899053_0DA1209D 
X-CRM114-Status: GOOD (  17.04  )
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
ZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQogLi4uL2Jp
bmRpbmdzL252bWVtL2xheW91dHMvdS1ib290LGVudi55YW1sICAgIHwgNTUgKysrKysrKysrKysr
KysrKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sIHwg
IDYgKysKIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9v
dCxlbnYueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjNhN2VjMDJiMzUzNQotLS0gL2Rldi9udWxsCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxl
bnYueWFtbApAQCAtMCwwICsxLDU1IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wIE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LnlhbWwjCiskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE5W
TUVNIGxheW91dCBvZiBVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFibGVzCisKK21haW50YWluZXJz
OgorICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KKworZGVzY3JpcHRpb246
CisgIFUtQm9vdCB1c2VzIGVudmlyb25tZW50IHZhcmlhYmxlcyB0byBzdG9yZSBkZXZpY2UgcGFy
YW1ldGVycyBhbmQKKyAgY29uZmlndXJhdGlvbi4gVGhleSBtYXkgYmUgdXNlZCBmb3IgYm9vdGlu
ZyBwcm9jZXNzLCBzZXR1cCBvciBrZWVwaW5nIGVuZCB1c2VyCisgIGluZm8uCisKKyAgRGF0YSBp
cyBzdG9yZWQgdXNpbmcgVS1Cb290IHNwZWNpZmljIGZvcm1hdHMgKHZhcmlhbnQgc3BlY2lmaWMg
aGVhZGVyIGFuZCBOVUwKKyAgc2VwYXJhdGVkIGtleS12YWx1ZSBwYWlycykuCisKK3Byb3BlcnRp
ZXM6CisgIGNvbXBhdGlibGU6CisgICAgb25lT2Y6CisgICAgICAtIGRlc2NyaXB0aW9uOiBBIHN0
YW5kYWxvbmUgZW52IGRhdGEgYmxvY2sKKyAgICAgICAgY29uc3Q6IHUtYm9vdCxlbnYKKyAgICAg
IC0gZGVzY3JpcHRpb246IFR3byByZWR1bmRhbnQgYmxvY2tzIHdpdGggYWN0aXZlIG9uZSBmbGFn
Z2VkCisgICAgICAgIGNvbnN0OiB1LWJvb3QsZW52LXJlZHVuZGFudC1ib29sCisgICAgICAtIGRl
c2NyaXB0aW9uOiBUd28gcmVkdW5kYW50IGJsb2NrcyB3aXRoIGFjdGl2ZSBoYXZpbmcgaGlnaGVy
IGNvdW50ZXIKKyAgICAgICAgY29uc3Q6IHUtYm9vdCxlbnYtcmVkdW5kYW50LWNvdW50CisgICAg
ICAtIGRlc2NyaXB0aW9uOiBCcm9hZGNvbSdzIHZhcmlhbnQgd2l0aCBjdXN0b20gaGVhZGVyCisg
ICAgICAgIGNvbnN0OiBicmNtLGVudgorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKwor
ZXhhbXBsZXM6CisgIC0gfAorICAgIHBhcnRpdGlvbnMgeworICAgICAgICBjb21wYXRpYmxlID0g
ImZpeGVkLXBhcnRpdGlvbnMiOworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MT47CisKKyAgICAgICAgcGFydGl0aW9uQDAgeworICAgICAgICAg
ICAgcmVnID0gPDB4MCAweDQwMDAwPjsKKyAgICAgICAgICAgIGxhYmVsID0gInUtYm9vdCI7Cisg
ICAgICAgICAgICByZWFkLW9ubHk7CisgICAgICAgIH07CisKKyAgICAgICAgcGFydGl0aW9uQDQw
MDAwIHsKKyAgICAgICAgICAgIHJlZyA9IDwweDQwMDAwIDB4MTAwMDA+OworICAgICAgICAgICAg
bGFiZWwgPSAidS1ib290LWVudiI7CisKKyAgICAgICAgICAgIG52bWVtLWxheW91dCB7CisgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1LWJvb3QsZW52IjsKKyAgICAgICAgICAgIH07Cisg
ICAgICAgIH07CisgICAgfTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCmluZGV4IDY4MjE0Yjk2ZjVjOS4uZmQ5NWU2
MTEzMjJkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZt
ZW0vdS1ib290LGVudi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9udm1lbS91LWJvb3QsZW52LnlhbWwKQEAgLTI2LDkgKzI2LDE1IEBAIGRlc2NyaXB0aW9uOiB8
CiAKICAgVmFyaWFibGVzIGNhbiBiZSBkZWZpbmVkIGFzIE5WTUVNIGRldmljZSBzdWJub2Rlcy4K
IAorICBJbnRyb2R1Y3Rpb24gb2YgTlZNRU0gbGF5b3V0cyBleHBvc2VkIGEgbGltaXRhdGlvbiBv
ZiB0aGlzIGJpbmRpbmcgZGVzaWduLgorICBEZXNjcmlwdGlvbiBvZiBOVk1FTSBkYXRhIGNvbnRl
bnQgc2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIE5WTUVNIGRldmljZXMuCisgIFNpbmNlIHRoZSBp
bnRyb2R1Y3Rpb24gb2YgVS1Cb290IGVudiBkYXRhIGxheW91dCB0aGlzIGJpbmRpbmcgaXMgZGVw
cmVjYXRlZC4KKwogbWFpbnRhaW5lcnM6CiAgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgogCitkZXByZWNhdGVkOiB0cnVlCisKIHByb3BlcnRpZXM6CiAgIGNvbXBhdGlibGU6
CiAgICAgb25lT2Y6Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
