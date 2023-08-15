Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157AC001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMDu5ClLmZtbpteiDBr3KxBVNjdrXncCmMomkLTzIv0=; b=zpKHQwDLOD/Wq4
	fSxsiHtlVU7Hw1xj8EUMrmqRO/WsY/a0yRwNA8Sy3fwFV1XLm1mBL9FoCZTDYxF6SikYhlR6XIMc5
	9EBRFh7merZUXvoNg+CxSMtbTHF+o+J16Q0etMTzJ35Eah7DsA+KsMUXqdyuk/HmEmt/YjCBjvm1w
	piHr9I4RJTzR79J+0Rzbnpu/qkCJtxjMmQZCzLpmOcbrhYConQM9R/bOn7jpFhUWPdf+Np+MJGPhE
	u7AaXh6WyBL4Idb9lW5Ov2OeJyQgZDZXbIBrR0eYjXSu2wDjNhQhiuvlGVrE1bU5TJviPAW//Jo44
	sXTk/6G9SmEaS7BN25nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxkF-0024Iw-0q;
	Tue, 15 Aug 2023 17:22:15 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVxkC-0024GK-28
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 17:22:14 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6bc9d16c317so4512479a34.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692120127; x=1692724927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM9euffrr+V/1uq4G/APEfY56DZEA1NA8IRMKebX+WA=;
        b=g5L59vBep0r+/ftR+REWdJrS6nXl1s1W1biL/1VPx5rGQotoKUGwnHslJpYPCDZAOF
         AMKl73/0gdHxuwNmrwV/zm9rnTtp3RdE3KbtVT51jCPUaEI8vgdaIaOwRz0xKL2dSOrb
         aXO5MtavbYMX/1gkvgUnfTzMkPnbUln80MGfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692120127; x=1692724927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM9euffrr+V/1uq4G/APEfY56DZEA1NA8IRMKebX+WA=;
        b=laZ/ZZWqsGREfuLH3ljzR7mYiFAWLJ+YRYdSnOP9sQrsRL+7MMjIvHQ9M21H2wl7Hf
         5oAXJGre5hVoU/NTE1cPgYxctxWmSRepmkSnIrF+SZ8uVNEOrGFnHhv7fCRFQpBw0j/s
         5nMY5mdl/itXplRVPnP3baqhK7svV4oYqoVGrqLEnc2SoopmRGo/WmplrsNDh+bp3EF+
         AGOIkZmSDZbeG5IdwC1PdXtWSYhLk7d0SoVvME0ufHZlv3VkHNRQYuUg6IsPwXT/m5Et
         csZjSStOAiV1v8frWVi/0jDnaBlu7GhXUN99hfoxZapaJQW6VSSdF7+zEy+zuVBtktpY
         gLrA==
X-Gm-Message-State: AOJu0YxIRH7kKDYfPgiSGJImmIbOeAue9R3IUfrMXPbzFvkhxZ1vh4eD
	2nWmIGUcfaXo1C2L/5zYJftZ71G/Kn9NReww2V6WQw==
X-Google-Smtp-Source: AGHT+IHgC2abKSNjRtwoIG7RPv/B0LrW+zFvRJCKfHpiwIXf0dkMMKZr7PMY0mgXqpc3ZPNNCyBizoMu6rSLlcxkZZs=
X-Received: by 2002:a05:6830:1e85:b0:6bb:1629:ab44 with SMTP id
 n5-20020a0568301e8500b006bb1629ab44mr11361067otr.7.1692120126879; Tue, 15 Aug
 2023 10:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230815154412.713846-1-hsinyi@chromium.org> <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
In-Reply-To: <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 01:21:40 +0800
Message-ID: <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal )" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger )" <richard@nod.at>, "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_102212_712678_724F3BDC 
X-CRM114-Status: GOOD (  15.69  )
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

T24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMTE6NTnigK9QTSBNaWNoYWVsIFdhbGxlIDxtaWNoYWVs
QHdhbGxlLmNjPiB3cm90ZToKPgo+IEhpLAo+Cj4gPk9uIGdpZ2FkZXZpY2UgZ2QyNWxxNjRjLCB0
aGUgcXVhZCBtb2RlIGlzIGVuYWJsZWQgYWZ0ZXIgQkZQVCBpcyBwYXJzZWQuCj4gPkFjY29yZGlu
ZyB0byBkYXRhc2hlZXRbMV0sIFF1YWQgZW5hYmxlIChRRSkgYml0IG5lZWRzIHRvIGJlIHNldCB0
byAwIHRvCj4gPnVzZSB3cml0ZSBwcm90ZWN0aW9uIChXUCkgcGluLiBJdCBhbHNvIHJlY29tbWVu
ZHMgc2V0dGluZyBkZWZhdWx0IHZhbHVlIG9mCj4gPlFFIHRvIDAgdG8gYXZvaWQgYSBwb3RlbnRp
YWwgc2hvcnQgaXNzdWUuCj4KPiBTbyB5b3UgYXJlIHVzaW5nIGVpdGhlciBkdWFsIG9yIHNpbmds
ZSBpbyBtb2RlLiBXaHkgY2FuJ3QgeW91IHVzZSB0aGUgZGV2aWNlIHRyZWUgcHJvcGVydHkgc3Bp
LXt0eCxyeH0tYnVzLXdpZHRoPwoKSSB0cmllZCBzZXR0aW5nIHNwaS10eC1idXMtd2lkdGggYW5k
IHNwaS1yeC1idXMtd2lkdGggdG8gZWl0aGVyIDAgb3IgMQphbmQgV1Agc3RpbGwgZG9lc24ndCB3
b3JrLgpGb3IgdGhpcyBjaGlwLCBxdWFkX2VuYWJsZSB3aWxsIGJlIHNldCB0byBzcGlfbm9yX3Ny
Ml9iaXQxX3F1YWRfZW5hYmxlCihRRVIgZmxhZyBpcyBCRlBUX0RXT1JEMTVfUUVSX1NSMl9CSVQx
X0JVR0dZKVsxXQoKc3BpX25vcl93cml0ZV9zcl9hbmRfY2hlY2soKSBjYWxscwpzcGlfbm9yX3dy
aXRlXzE2Yml0X3NyX2FuZF9jaGVjaygpWzJdIGFuZCB0aGUgZnVuY3Rpb24gc2V0cyBRRSBiaXQg
aWYKcXVhZF9lbmFibGUgaXMgbm90IE5VTEwuCgpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyNMNTc1Clsy
XSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jI0w4NzkKClNldHRpbmcgc3BpLXt0eCxyeH0tYnVzLXdpZHRoIHN0
aWxsIGZhbGxzIHRvIHRoaXMgZnVuY3Rpb24gYW5kIGNhc2VzLgoKPgo+ID5BZGQgYSBkaXNhYmxl
LXF1YWQtbW9kZSBwcm9wZXJ0eSBpbiBkZXZpY2V0cmVlIHRoYXQgcGxhdGZvcm0gY2FuIHVzZSBp
dCB0bwo+ID5vdmVycmlkZSB0aGUgcXVhZCBtb2RlIHN0YXR1cyBwYXJzZWQgZnJvbSBCRlBUIHRv
IHVzZSB3cml0ZSBwcm90ZWN0aW9uLgo+ID4KPiA+WzFdCj4gPmh0dHBzOi8vd3d3LmVsbS10ZWNo
LmNvbS9qYS9wcm9kdWN0cy9zcGktZmxhc2gtbWVtb3J5L2dkMjVscTY0L2dkMjVscTY0LnBkZgo+
Cj4gc2hvdWxkIGJlIGEgbGluayBvbiB0aGUgdmVuZG9yIEhvbWVwYWdlIGlmIHBvc3NpYmxlLgoK
UmlnaHQsIGh0dHBzOi8vd3d3LmdpZ2FkZXZpY2UuY29tLmNuL1B1YmxpYy9VcGxvYWRzL3VwbG9h
ZGZpbGUvZmlsZXMvMjAyMjA3MTQvRFMtMDAwMTItR0QyNUxRNjRDLVJldjMuNC5wZGYKaXMgYSBt
b3JlIHByb3BlciBkYXRhc2hlZXQgc291cmNlLiBUaGUgUUUgZGVzY3JpcHRpb24gaXMgYWxzbyBp
biBwYWdlCjEzLgoKPgo+IC1taWNoYWVsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
