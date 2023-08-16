Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70745C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cc1C9og0YOWgok4Z5ddgMP9Wk/3w33uiuLb9pu4fEgw=; b=EBJSDm0Q8YZafZ
	d9EsRffC8Z28UcGKmAuV4gNXsIpjxdEOHDg2AVBn0hrCnl/yoJSpzgikUPHLUfvv7BsECdkRT1ajo
	5RxDhhOoR5JEUkQPDaI9N2Tjg/0v2Ryl6/5wVyDzWOUj4AQa65/2ZpRCNvM4A+qjLHBcviIDvZLQg
	XuScrAEybf5GS/GzODMY7hHkBYNyxUs5YsXH8pbDhMr3eU7Hb4gjMmksVT+jq6MnqbWK6xRjGYl0c
	nCEKqB4//tp+wotkGWMrWpp/uCJleeVkJIeSaGzSG/p2EHop27ER1mqrRTx+MximF3pBRV2zMsHCV
	2TVk4SEadGa7tqxG3XmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE3Z-003tTZ-16;
	Wed, 16 Aug 2023 10:47:17 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE3V-003tSN-1M
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 10:47:15 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bca3311b4fso5092926a34.0
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182831; x=1692787631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHVFwf2+IJdhvL1m7bcmD2X+8MDeoieDkbHIWtoTZtU=;
        b=Nlgcv2HJLA79Yxsz2pDMqw8KXCAYKf35hze4/k++oS8i+tFaUoOBUCemVoo+mmy2et
         TkNIzFP6EPK8Ex14d6TifkAeVTJ7s5Ank/Jj+Gvch59tbIuJ+5GT75kH2Nw951pwiyDN
         vvYJMQprRBYlJFsncnqLvGU8DfW0XcaIcqmLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182831; x=1692787631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHVFwf2+IJdhvL1m7bcmD2X+8MDeoieDkbHIWtoTZtU=;
        b=HAVuQqpmyPOLd1E2J7f/qKAzDsIQBehACYz5IJW1XXc/y5kRJPcoS6Auh4lK2J5gQD
         AGpk7OIjaxODVtlJ0R5jO6sPqj4dZJtv/09bB7myrA9zMsFxFe6/OwXsRzNji22Z4olI
         RGoe9vr8O/6Hj7ftFixo2eCeeZYrxXdnsGYaYRu9QhnQjnDPwxAPDSp8PbrtvUcbIY57
         1f3j+v2dzK0tSppXrwljWfh81UB9H4x4PeVyj2IrAcHRqB9V9QfZr73ThSJNPiRwDFWA
         frt9C9KJkZ9BpOHW0OpLE14oMN2cApqQh4SyBrmWVF7wrlKzG+z5WDyZSApMo4/lSQO8
         G+5g==
X-Gm-Message-State: AOJu0YwwEb0o9dutgyTpV/g4SxxqwtmOp9Jb1hamn3UKjOGLFCSfGzKg
	Y+gq3UKVcvOW7njVlD7/CR7fy8L2HTOVgxSry+YyLQ==
X-Google-Smtp-Source: AGHT+IFop6ccKvKv4AO2QL1MFngv5Zyjpe0Iy6hNB7Ea7XfS2ppUUNyTqyfMkTCzFCreFuZWS/ZjF6x+8JoQCmIeYP8=
X-Received: by 2002:a05:6830:1d69:b0:6bd:b40:8912 with SMTP id
 l9-20020a0568301d6900b006bd0b408912mr1258271oti.35.1692182831303; Wed, 16 Aug
 2023 03:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org>
In-Reply-To: <20230816104245.2676965-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 18:46:45 +0800
Message-ID: <CAJMQK-hR0eaO0b4Vd0U8_KAndLyZapqdHjVLAoe42rWi9rdLkA@mail.gmail.com>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	"Miquel Raynal )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>, 
	"Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034713_520902_9176226E 
X-CRM114-Status: GOOD (  27.19  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgNjo0MuKAr1BNIEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBnZDI1bHE2NGMgaGFzIFF1YWQgRW5hYmxlIFJlcXVpcmVt
ZW50IGZsYWcgcGFyc2VkIGFzCj4gQkZQVF9EV09SRDE1X1FFUl9TUjJfQklUMV9CVUdHWSBpbiBC
RlBULCBldmVuIGlmIHNwaS17cngvdHh9LWJ1cy13aWR0aAo+IHNldCBhcyBub24gUVVBRCwgZWcu
IDAsIDEsIDIuLi4gVGh1cyBxdWFkX2VuYWJsZSB3aWxsIG5vdCBiZSBOVUxMIGFuZAo+IHF1YWQg
ZW5hYmxlIChRRSkgYml0IHdpbGwgYmUgc2V0IHRvIDEgYnkgZGVmYXVsdC4gQWNjb3JkaW5nIHRv
Cj4gZGF0YXNoZWV0WzFdLCBpZiBRRSBiaXQgaXMgZW5hYmxlZCwgV1AgcGluIHdpbGwgYmVjb21l
IElPIHBpbiBhbmQgdGhlCj4gc3lzdGVtIGNhbid0IHVzZSB3cml0ZSBwcm90ZWN0aW9uIGZlYXR1
cmUsIGFuZCBpdCdzIGFsc28gbm90IHJlY29tbWVuZGVkCj4gdG8gc2V0IFFFIGJpdCB0byAxWzFd
Lgo+Cj4gQWRkIGEgcG9zdF9iZnB0IGZpeHVwIHRoYXQgcmVhZHMgc3BpLXJ4LWJ1cy13aWR0aCB0
byByZW1vdmUgcXVhZF9lbmFibGUKPiBpZiB0aGUgd2lkdGggaXMgc2V0IHRvIGJlbG93IFFVQUQg
bW9kZS4KPgo+IFsxXQo+IGh0dHBzOi8vd3d3LmdpZ2FkZXZpY2UuY29tLmNuL1B1YmxpYy9VcGxv
YWRzL3VwbG9hZGZpbGUvZmlsZXMvMjAyMjA3MTQvRFMtMDAwMTItR0QyNUxRNjRDLVJldjMuNC5w
ZGYKPiBwYWdlIDEzCj4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+Cj4gLS0tCmNoYW5nZSBsb2c6CnYxLT52MjogcmVhZCBidXMgd2lkdGggcHJvcGVy
dHkgaW4gZHJpdmVyIGluc3RlYWQgb2YgY3JlYXRpbmcgYQpkdXBsaWNhdGUgZHQgcHJvcGVydHku
CnYxIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA4MTUxNTQ0MTIuNzEz
ODQ2LTEtaHNpbnlpQGNocm9taXVtLm9yZy8KLS0tCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvZ2ln
YWRldmljZS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9naWdh
ZGV2aWNlLmMKPiBpbmRleCBkNTdkZGFmMTUyNWIzLi44ZWE4OWUxODU4ZjliIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4gKysrIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9naWdhZGV2aWNlLmMKPiBAQCAtMzMsNiArMzMsMzEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGlfbm9yX2ZpeHVwcyBnZDI1cTI1Nl9maXh1cHMgPSB7Cj4gICAgICAgICAucG9zdF9i
ZnB0ID0gZ2QyNXEyNTZfcG9zdF9iZnB0LAo+ICB9Owo+Cj4gK3N0YXRpYyBpbnQKPiArZ2QyNWxx
NjRjX3Bvc3RfYmZwdChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ICsgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IHNmZHBfcGFyYW1ldGVyX2hlYWRlciAqYmZwdF9oZWFkZXIsCj4gKyAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc2ZkcF9iZnB0ICpiZnB0KQo+ICt7Cj4gKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gc3BpX25vcl9nZXRfZmxhc2hfbm9kZShub3IpOwo+
ICsgICAgICAgdTMyIHZhbHVlOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBFdmVuIGlm
IHNwaS17dHgscnh9LWJ1cy13aWR0aCBpcyBzZXQgdG8gRFVBTCBtb2RlLCBkdWUgdG8gdGhlIFFF
Ugo+ICsgICAgICAgICogZmxhZyBwYXJzZWQgZnJvbSBCRlBUIGlzIEJGUFRfRFdPUkQxNV9RRVJf
U1IyX0JJVDFfQlVHR1ksIHNvIHRoZQo+ICsgICAgICAgICogcXVhZF9lbmFibGUgd2lsbCBiZSBz
ZXQgYW5kIFFFIGJpdCBzZXQgdG8gMS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKCFvZl9w
cm9wZXJ0eV9yZWFkX3UzMihucCwgInNwaS1yeC1idXMtd2lkdGgiLCAmdmFsdWUpKSB7Cj4gKyAg
ICAgICAgICAgICAgIGlmICh2YWx1ZSA8PSAyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5v
ci0+cGFyYW1zLT5xdWFkX2VuYWJsZSA9IE5VTEw7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
cmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgZ2QyNWxx
NjRjX2ZpeHVwcyA9IHsKPiArICAgICAgIC5wb3N0X2JmcHQgPSBnZDI1bHE2NGNfcG9zdF9iZnB0
LAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGdpZ2FkZXZpY2Vf
bm9yX3BhcnRzW10gPSB7Cj4gICAgICAgICB7ICJnZDI1cTE2IiwgSU5GTygweGM4NDAxNSwgMCwg
NjQgKiAxMDI0LCAgMzIpCj4gICAgICAgICAgICAgICAgIEZMQUdTKFNQSV9OT1JfSEFTX0xPQ0sg
fCBTUElfTk9SX0hBU19UQikKPiBAQCAtNTMsNyArNzgsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZsYXNoX2luZm8gZ2lnYWRldmljZV9ub3JfcGFydHNbXSA9IHsKPiAgICAgICAgIHsgImdkMjVs
cTY0YyIsIElORk8oMHhjODYwMTcsIDAsIDY0ICogMTAyNCwgMTI4KQo+ICAgICAgICAgICAgICAg
ICBGTEFHUyhTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIpCj4gICAgICAgICAgICAg
ICAgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBTUElfTk9SX1FVQURfUkVBRCkgfSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTUElfTk9SX1FVQURfUkVBRCkKPiArICAgICAgICAgICAgICAg
LmZpeHVwcyA9ICZnZDI1bHE2NGNfZml4dXBzIH0sCj4gICAgICAgICB7ICJnZDI1bHExMjhkIiwg
SU5GTygweGM4NjAxOCwgMCwgNjQgKiAxMDI0LCAyNTYpCj4gICAgICAgICAgICAgICAgIEZMQUdT
KFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQikKPiAgICAgICAgICAgICAgICAgTk9f
U0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfAo+IC0tCj4gMi40MS4wLjY5
NC5nZTc4NjQ0MmE5Yi1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
