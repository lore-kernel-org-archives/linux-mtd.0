Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9D8E81E16
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAw30iLU18OljhL/dI84PUp48uExJFLT0aYur36b240=; b=P9wmBVAKTpMpfL
	QIOAmlTy14ItDSNwPku8e+M9dUvwv+h+M6NqgNRJJPUfjBAUIQf0o8pxKf2TDnEpJhakSjeONhpQr
	L2yoFWq9u8ZGazcxey9slGa+M3XwYlnY7qbz2Wou5NNAYEAQI80Lgv0QznyxCxDtyPYBGP87qpl9e
	gf2fcJFMlKQfIMWEXpMdVN/i4paeO76bAcrxYcCnN1FitSlRLjIWpxNOqFuKw0C4XVnR+raPlOZhg
	AMpwPOEY7cMSivclgdlrFt0DgNgCsckKdzdcqP1fkSCuvByTm9u9/5ccXIO/MtX2vVa6WI39wcoJH
	rbV75I8IypB+xXVT7w3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyMq-00BiRG-2p;
	Mon, 09 Oct 2023 22:04:48 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpyMm-00BiOC-07
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 22:04:45 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-351365e47f6so16945915ab.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2023 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696889082; x=1697493882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzMuw4I+Nd8N8oi2Xxm8m0QPQBwYQL/tbGvCzQaub7A=;
        b=aenGLYxKQ4JsC+amNxQYssln0jsxg1hAEf6UzYtxeTHgavFHVTrQevFA2TUVMYzFMf
         +uZxFbY2aEladBbXax8rgGTg25ynCMWGHeYuv+az5+LH0bCUNXv4IYADDrIQpGVOv5ud
         Hu2l8MeZOyLXEu2hSAVhEOpFASyRtkwqThUp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696889082; x=1697493882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzMuw4I+Nd8N8oi2Xxm8m0QPQBwYQL/tbGvCzQaub7A=;
        b=qd7me+cde3njQcjcHUpCfIcf8Jr+NgBd5SDKCY+NV+cCkLISNEqQ5S5mjMudtgYHin
         K5dGwJAKbvCmt9VB+thl7+p7pB3jrrYWWUgG1oZVVn1cXgSldjMJzN+pZHJ5Fy+Ysvhx
         +lbhDvNYc7GZ9tYYgRAAxJ11N5eB57BWorWUUR4Ef2wKDr8vSivNnmskzTAH1P8M5nyg
         e7IWd4+QYthME+BX5N+MzyMVU0NEFSyEIi6SSo5CQfRghp/hQ+FrCm4DqJNKq3lv8BKN
         2Mum7Sf8xq/2XHWaSlrtMA/tXJCNRju3i/e3thKkIaD8bbIl7JKLgBzOw0k8WRITIMEg
         G4Lw==
X-Gm-Message-State: AOJu0YxczuhN3sgxn7KhnNMs2eKyDggU9WXJN81lYgtyks1LFyDwkFdZ
	Nr3WrLOgXE+BfvPjztulsVhzMA==
X-Google-Smtp-Source: AGHT+IHvK9QConjcBvixojUyIyEr2xvgdQipUvlCIBgg0tv4RZCg9G9yvZ9PkNArpEDRXj4vHK+oAw==
X-Received: by 2002:a05:6e02:1a2e:b0:351:4f0c:b95d with SMTP id g14-20020a056e021a2e00b003514f0cb95dmr20621948ile.22.1696889082165;
        Mon, 09 Oct 2023 15:04:42 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:138c:cf57:c18d:20f5])
        by smtp.gmail.com with ESMTPSA id o3-20020a92d4c3000000b0034cd2c0afe8sm3164063ilm.56.2023.10.09.15.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 15:04:41 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Rob Herring <robh@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] dt-bindings: mtd: binman-partitions: Add alignment properties
Date: Mon,  9 Oct 2023 16:04:15 -0600
Message-ID: <20231009220436.2164245-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231009220436.2164245-1-sjg@chromium.org>
References: <20231009220436.2164245-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_150444_073262_B72E9CEC 
X-CRM114-Status: GOOD (  21.46  )
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

QWRkIHRocmVlIHByb3BlcnRpZXMgZm9yIGNvbnRyb2xsaW5nIGFsaWdubWVudCBvZiBwYXJ0aXRp
b25zLCBha2EKJ2VudHJpZXMnIGluIGJpbm1hbi4KCkZvciBub3cgdGhlcmUgaXMgbm8gZXhwbGlj
aXQgbWVudGlvbiBvZiBoaWVyYXJjaHksIHNvIGEgJ3NlY3Rpb24nIGlzCmp1c3QgdGhlICdiaW5t
YW4nIG5vZGUuCgpUaGVzZSBuZXcgcHJvcGVydGllcyBhcmUgaW5wdXRzIHRvIHRoZSBwYWNrYWdp
bmcgcHJvY2VzcywgYnV0IGFyZSBhbHNvCm5lZWRlZCBpZiB0aGUgZmlybXdhcmUgaXMgcmVwYWNr
ZWQsIHRvIGVuc3VyZSB0aGF0IGFsaWdubWVudApjb25zdHJhaW50cyBhcmUgbm90IHZpb2xhdGVk
LiBUaGVyZWZvcmUgdGhleSBhcmUgcHJvdmlkZWQgYXMgcGFydCBvZgp0aGUgc2NoZW1hLgoKU2ln
bmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Ci0tLQoKKG5vIGNoYW5n
ZXMgc2luY2UgdjIpCgpDaGFuZ2VzIGluIHYyOgotIEZpeCAnYScgdHlwbyBpbiBjb21taXQgbWVz
c2FnZQoKIC4uLi9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwgICAgICB8IDM5
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2Jpbm1hbi1wYXJ0aXRpb24ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKaW5kZXggMzVhMzIwMzU5
ZWMxLi44ZThhM2I2ZDRkMTQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy9iaW5tYW4tcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi1wYXJ0aXRp
b24ueWFtbApAQCAtMjgsNiArMjgsNDIgQEAgcHJvcGVydGllczoKICAgICAgICAgICAtIGNvbnN0
OiB1LWJvb3QgICAgICAgIyB1LWJvb3QuYmluIGZyb20gVS1Cb290IHByb2plY3QKICAgICAgICAg
ICAtIGNvbnN0OiBhdGYtYmwzMSAgICAgIyBibDMxLmJpbiBvciBibDMxLmVsZiBmcm9tIFRGLUEg
cHJvamVjdAogCisgIGFsaWduOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGln
bm1lbnQgb2YgdGhlIGVudHJ5LiBUaGUgZW50cnkgb2Zmc2V0IGlzIGFkanVzdGVkCisgICAgICBz
byB0aGF0IHRoZSBlbnRyeSBzdGFydHMgb24gYW4gYWxpZ25lZCBib3VuZGFyeSB3aXRoaW4gdGhl
IGNvbnRhaW5pbmcKKyAgICAgIHNlY3Rpb24gb3IgaW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWdu
ID0gPDE2PuKAmSBtZWFucyB0aGF0IHRoZSBlbnRyeSB3aWxsCisgICAgICBzdGFydCBvbiBhIDE2
LWJ5dGUgYm91bmRhcnkuIFRoaXMgbWF5IG1lYW4gdGhhdCBwYWRkaW5nIGlzIGFkZGVkIGJlZm9y
ZQorICAgICAgdGhlIGVudHJ5LiBUaGUgcGFkZGluZyBpcyBwYXJ0IG9mIHRoZSBjb250YWluaW5n
IHNlY3Rpb24gYnV0IGlzIG5vdAorICAgICAgaW5jbHVkZWQgaW4gdGhlIGVudHJ5LCBtZWFuaW5n
IHRoYXQgYW4gZW1wdHkgc3BhY2UgbWF5IGJlIGNyZWF0ZWQgYmVmb3JlCisgICAgICB0aGUgZW50
cnkgc3RhcnRzLiBBbGlnbm1lbnQgc2hvdWxkIGJlIGEgcG93ZXIgb2YgMi4gSWYg4oCYYWxpZ27i
gJkgaXMgbm90CisgICAgICBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBlcmZvcm1lZC4KKwor
ICBhbGlnbi1zaXplOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQg
b2YgdGhlIGVudHJ5IHNpemUuIEZvciBleGFtcGxlLCB0byBlbnN1cmUKKyAgICAgIHRoYXQgdGhl
IHNpemUgb2YgYW4gZW50cnkgaXMgYSBtdWx0aXBsZSBvZiA2NCBieXRlcywgc2V0IHRoaXMgdG8g
NjQuCisgICAgICBXaGlsZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgY29udGVudHMgb2YgdGhl
IGVudHJ5IHdpdGhpbiBiaW5tYW4KKyAgICAgIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9y
bWVkIG9ubHkgd2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMKKyAgICAgIGFzc2VtYmxlZCksIHRo
ZSBlbmQgcmVzdWx0IGlzIHRoYXQgdGhlIGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZworICAg
ICAgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1zaXpl4oCZIGlzIG5vdCBwcm92aWRl
ZCwgbm8gYWxpZ25tZW50IGlzCisgICAgICBwZXJmb3JtZWQuCisKKyAgYWxpZ24tZW5kOgorICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2Ny
aXB0aW9uOgorICAgICAgVGhpcyBzZXRzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIGVuZCBvZiBhbiBl
bnRyeSB3aXRoIHJlc3BlY3QgdG8gdGhlCisgICAgICBjb250YWluaW5nIHNlY3Rpb24uIFNvbWUg
ZW50cmllcyByZXF1aXJlIHRoYXQgdGhleSBlbmQgb24gYW4gYWxpZ25tZW50CisgICAgICBib3Vu
ZGFyeSwgcmVnYXJkbGVzcyBvZiB3aGVyZSB0aGV5IHN0YXJ0LiBUaGlzIGRvZXMgbm90IG1vdmUg
dGhlIHN0YXJ0CisgICAgICBvZiB0aGUgZW50cnksIHNvIHRoZSBjb250ZW50cyBvZiB0aGUgZW50
cnkgd2lsbCBzdGlsbCBzdGFydCBhdCB0aGUKKyAgICAgIGJlZ2lubmluZy4gQnV0IHRoZXJlIG1h
eSBiZSBwYWRkaW5nIGF0IHRoZSBlbmQuIFdoaWxlIHRoaXMgZG9lcyBub3QKKyAgICAgIGFmZmVj
dCB0aGUgY29udGVudHMgb2YgdGhlIGVudHJ5IHdpdGhpbiBiaW5tYW4gaXRzZWxmICh0aGUgcGFk
ZGluZyBpcworICAgICAgcGVyZm9ybWVkIG9ubHkgd2hlbiBpdHMgcGFyZW50IHNlY3Rpb24gaXMg
YXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1bHQgaXMKKyAgICAgIHRoYXQgdGhlIGVudHJ5IGVuZHMg
d2l0aCB0aGUgcGFkZGluZyBieXRlcywgc28gbWF5IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmQor
ICAgICAgaXMgbm90IHByb3ZpZGVkLCBubyBhbGlnbm1lbnQgaXMgcGVyZm9ybWVkLgorCiBhZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6CkBAIC00MCwxMCArNzYsMTMgQEAg
ZXhhbXBsZXM6CiAgICAgICAgIHBhcnRpdGlvbkAxMDAwMDAgewogICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJ1LWJvb3QiOwogICAgICAgICAgICAgcmVnID0gPDB4MTAwMDAwIDB4ZjAwMDAwPjsK
KyAgICAgICAgICAgIGFsaWduLXNpemUgPSA8MHgxMDAwPjsKKyAgICAgICAgICAgIGFsaWduLWVu
ZCA9IDwweDEwMDAwPjsKICAgICAgICAgfTsKIAogICAgICAgICBwYXJ0aXRpb25AMjAwMDAwIHsK
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRmLWJsMzEiOwogICAgICAgICAgICAgcmVnID0g
PDB4MjAwMDAwIDB4MTAwMDAwPjsKKyAgICAgICAgICAgIGFsaWduID0gPDB4NDAwMD47CiAgICAg
ICAgIH07CiAgICAgfTsKLS0gCjIuNDIuMC42MDkuZ2JiNzZmNDY2MDYtZ29vZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
