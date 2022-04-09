Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC5EC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuxtmgghLl5Un2CjgW8xriz1M/T3IcT+GTB7MNISFcY=; b=4bFNJqk5Ua0Z3A
	MIhxnnHXlPjMTHtYHhrixIBYCc1gam023K4yok/S8S9S39QRhoH6J143nok6Tye9ZvbRmlJb+qn1C
	k08dutjCDoUuPQzywH5OgrLfUagSiTsAPGnuiN5K5cK9IeayoW4zsj8hmWN/Zy+5xQOLFXcvaaYqa
	J8t3JEZCb9tG/5YPonR482E66Wogf/21f1Z6lhbqmwXEsMR3PVCoju5oQ2VBqZnUeJilW5Pkjb2Gq
	sTfH71j/4IaPqHUlxqYn80Lht9MOiq8XDI6V6ETUemq4GcAOGVKzXsT9XdQG59XaDWwfWZ0zGbRos
	SzzSK23AWJD/sNGUGJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndFe1-003dP3-Oy; Sat, 09 Apr 2022 18:17:09 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndFdy-003dOe-RX
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 18:17:08 +0000
Received: by mail-lf1-x129.google.com with SMTP id j9so11987613lfe.9
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=dkZS+u1u1YMngtfyHQMffzDhiw+IRddRGo68l2Ra+Cw=;
 b=erY9p/SC8sRYECfqtwi8P4kDVvNzSfEgfZtOq+pRsbxMJq07ScwSMtPUWRQHnh+vza
 IqHeExlv5yo/1N9Sc5E0doa7hVgqo4N9POWAGnGiZSFqvV7BADRVCdFGL/Xn5p4E7xb+
 wyeg1k745NLeIXDofjdUbcohVEZgHCgZuVjGFWUSfEAppANZoFqip+gZAGxlko4RQBAa
 2KvX6UCudD9c14VOX49GfdTAXm60zQn2ycPVEl9/4eDWGTXxgTC311wxZ2g33GToPZfG
 jmYtxDjFzuvQDM8CMwkILGPY40cmuFL/wsiaIs04AvyfFSQp17FyBmu9wq2E+7M+QcT1
 DFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dkZS+u1u1YMngtfyHQMffzDhiw+IRddRGo68l2Ra+Cw=;
 b=LYdi432LcUXBfqFenzNvzYou55bSUElOwi415ANOblQ5pnr54DM+Q9SofXJlwyKpGv
 A+SVg8cs7yRjHfrSRXHtJeCsk5BoMf35lppg/ufiqYzhUJR5KsA8fGv/L6Xfpsi97M63
 7H5yiEZ4J5ZPHCoj0NC8NUig9V2R4/G++4S013n2iUUdU67JHDvB3hlcm2Lgv5LxOiHq
 tqxPrqDHocP0tJZIw79CTgLxRJegBZ1Ola7TfNdNi+bLQah6BKhYI89lzrMJgsstvIJR
 oszxAnE0yOsas3+kL2C4x/VumaGMSmTP/QFNKISprPj3IZa0pZmyD6AIl5jHcMf6SmxL
 aIcQ==
X-Gm-Message-State: AOAM530ZJhcxm0eRY6TLYnVwviPDnqogjlSPpZbrE+v00513zf4vejEl
 mA7Sl4yjtf9WRoEOGTWHNS6BePIixvVZEUh3VFQ=
X-Google-Smtp-Source: ABdhPJzNKxmzhOEn8UegFgZGFUfZwPUfAuqLLZWOhmFvJDh2/sWtPffSkZCE4rJw545FObXYwPcVRA==
X-Received: by 2002:ac2:508b:0:b0:46b:9141:a66f with SMTP id
 f11-20020ac2508b000000b0046b9141a66fmr2768168lfm.198.1649528224929; 
 Sat, 09 Apr 2022 11:17:04 -0700 (PDT)
Received: from ?IPV6:2001:470:9898:9eac:f1cb:6e16:4fc0:c830?
 ([2a09:bac0:87::815:6e3d]) by smtp.gmail.com with ESMTPSA id
 q23-20020a2e8757000000b0024b5e0ec306sm38082ljj.97.2022.04.09.11.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:17:04 -0700 (PDT)
Message-ID: <bd533827-b575-caad-c230-af060851b231@gmail.com>
Date: Sat, 9 Apr 2022 21:17:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Content-Language: en-US
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
 <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
In-Reply-To: <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_111706_949785_B005A413 
X-CRM114-Status: GOOD (  18.12  )
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

Ck9uIDQvOS8yMDIyIDk6MDQgUE0sIE1pa2hhaWwgWmhpbGtpbiB3cm90ZToKPj4+Pj4gK3JlcXVp
cmVkOgo+Pj4+PiArICAtIGNvbXBhdGlibGUKPj4+PiBNaXNzaW5nIHJlZy4KPj4+IHJlZyBpc24n
dCByZXF1aXJlZC4gUGFyc2VyIGNhbiByZWFkIHBhcnRpdGlvbiBvZmZzZXRzIGFuZCBzaXplcyBm
cm9tCj4+PiBTQyBQQVJUIE1BUCB0YWJsZS4gT3IgZG8geW91IG1lYW4gc29tZXRoaW5nIGVsc2U/
wqAgQWxsIGlzIG9rCj4+PiB3aXRob3V0IHJlZyBkZWZpbml0aW9uIGluICJFeGFtcGxlIiAoZXhj
ZXB0IHRoZSB3YXJucyB0aGF0IHJlZyBwcm9wZXJ0eQo+Pj4gaXMgbWlzc2luZykuCj4+IHJlZyBt
aWdodCBub3QgYmUgcmVxdWlyZWQgZm9yIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gYnV0IGl0IGlz
IHJlcXVpcmVkCj4+IGJ5IGRldmljZXRyZWUgZm9yIGV2ZXJ5IG5vZGUgd2l0aCB1bml0IGFkZHJl
c3MuIERvIHlvdSBleHBlY3QgaGVyZSBub2Rlcwo+PiB3aXRob3V0IHVuaXQgYWRkcmVzc2VzPwo+
IE9ubHkgInBhcnRpdGlvbnMiIG5vZGUgaGFzIG5vIHVuaXQgYWRkcmVzcy4gQWxsIHN1Ym5vZGVz
wqAgaGF2ZSB1bml0Cj4gYWRkcmVzc2VzIGFuZCB0aGVyZWZvcmUgaGF2ZSB0byBoYXZlIHJlZyBw
cm9wZXJ0eS4gSSd2ZSBqdXN0IHJlYWxpemVkCj4gdGhhdCAiZml4ZWQtcGFydGl0aW9ucy55YW1s
IiBpcyBhbG1vc3QgbXkgY2FzZS4gSXQgbG9va3MgbGlrZSBJIGNhbgo+IGNvcHknbidwYXN0ZcKg
ICJyZXF1aXJlZCIgYW5kICIqcHJvcGVydGllcyIuCj4gRG8geW91IG1pbmQgaWYgSSBkb24ndCBy
ZWludmVudCB0aGUgd2hlZWwgYW5kIHJldXNlIHRoaXMgZ29vZAo+IHByYWN0aWNlPwo+Cj4gSGVy
ZSdzIHdoYXQgSSBnb3QgKG5vIGFueSB3YXJuaW5ncyBhcHBlYXJzKToKCgpJJ20gc29ycnksIEty
enlzenRvZiAmIEFsbC4gSGVyZSBpcyB0aGUgZmluYWwgb25lLgoKLS0tCsKgLi4uL210ZC9wYXJ0
aXRpb25zL3NlcmNvbW0sc2MtcGFydGl0aW9ucy55YW1sIHwgNzggKysrKysrKysrKysrKysrKysr
KwrCoDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCsKgY3JlYXRlIG1vZGUgMTAwNjQ0
CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9zZXJjb21t
LHNjLXBhcnRpdGlvbnMueWFtbAoKZGlmZiAtLWdpdAphL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9zZXJjb21tLHNjLXBhcnRpdGlvbnMueWFtbApiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9zZXJjb21tLHNj
LXBhcnRpdGlvbnMueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAu
LjMzMTcyZjBiZTkyYQotLS0gL2Rldi9udWxsCisrKwpiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9zZXJjb21tLHNjLXBhcnRpdGlvbnMueWFtbApAQCAt
MCwwICsxLDc4IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOgpodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9tdGQvcGFydGl0aW9ucy9zZXJjb21tLHNjLXBhcnRpdGlvbnMueWFtbCMKKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRs
ZTogU2VyY29tbSBQYXJ0aXRpb25zCisKK2Rlc2NyaXB0aW9uOiB8CivCoCBTZXJjb21tIGlzIG9u
ZSBvZiBoYXJkd2FyZSBtYW51ZmFjdHVyZXJzIHByb3ZpZGluZyBTb0NzIHVzZWQgaW4gaG9tZQpy
b3V0ZXJzLgorwqAgVGhlIFNlcmNvbW0gcGFydGl0aW9uIG1hcCB0YWJsZSBjb250YWlucyBpbmZv
cm1hdGlvbiBhYm91dCBub24tc3RhbmRhcmQKK8KgIHBhcnRpdGlvbiBvZmZzZXRzIGFuZCBzaXpl
cyAoZGVwZW5kaW5nIG9uIHRoZSBiYWQgYmxvY2tzIHByZXNlbmNlIGFuZAp0aGVpcgorwqAgbG9j
YXRpb25zKS4gUGFydGl0aW9uIG1hcCBpcyB1c2VkIGJ5IG1hbnkgU2VyY29tbS1iYXNlZCBSYWxp
bmsKZGV2aWNlcyAoZS5nLgorwqAgQmVlbGluZSwgTmV0Z2VhcikuCisKK8KgIFRoZSBwYXJ0aXRp
b24gdGFibGUgc2hvdWxkIGJlIGEgbm9kZSBuYW1lZCAicGFydGl0aW9ucyIuIFBhcnRpdGlvbnMK
YXJlIHRoZW4KK8KgIGRlZmluZWQgYXMgc3Vibm9kZXMuCisKK21haW50YWluZXJzOgorwqAgLSBN
aWtoYWlsIFpoaWxraW4gPGNzaGFycGVyMjAwNUBnbWFpbC5jb20+CisKK3Byb3BlcnRpZXM6CivC
oCBjb21wYXRpYmxlOgorwqDCoMKgIGNvbnN0OiBzZXJjb21tLHNjLXBhcnRpdGlvbnMKKworwqAg
IiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQorCivCoCAiI3NpemUtY2VsbHMiOiB0cnVlCisKK3BhdHRl
cm5Qcm9wZXJ0aWVzOgorwqAgIkBbMC05YS1mXSskIjoKK8KgwqDCoCAkcmVmOiAicGFydGl0aW9u
LnlhbWwjIgorCityZXF1aXJlZDoKK8KgIC0gY29tcGF0aWJsZQorwqAgLSAiI2FkZHJlc3MtY2Vs
bHMiCivCoCAtICIjc2l6ZS1jZWxscyIKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKKwor
ZXhhbXBsZXM6CivCoCAtIHwKK8KgwqDCoCBwYXJ0aXRpb25zIHsKK8KgwqDCoMKgwqDCoMKgIGNv
bXBhdGlibGUgPSAic2VyY29tbSxzYy1wYXJ0aXRpb25zIjsKK8KgwqDCoMKgwqDCoMKgICNhZGRy
ZXNzLWNlbGxzID0gPDE+OworwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MT47CisKK8Kg
wqDCoMKgwqDCoMKgIHBhcnRpdGlvbkAwIHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwg
PSAidS1ib290IjsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDEwMDAwMD47
CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjcGFydC1pZCA9IDwwPjsKK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVhZC1vbmx5OworwqDCoMKgwqDCoMKgwqAgfTsKKworwqDCoMKgwqDCoMKgwqAg
cGFydGl0aW9uQDEwMDAwMCB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImR5bmFt
aWMgcGFydGl0aW9uIG1hcCI7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDEwMDAw
MCAweDEwMDAwMD47CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjcGFydC1pZCA9IDwxPjsKK8Kg
wqDCoMKgwqDCoMKgIH07CisKK8KgwqDCoMKgwqDCoMKgIGZhY3Rvcnk6IHBhcnRpdGlvbkAyMDAw
MDAgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJGYWN0b3J5IjsKK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MjAwMDAwIDB4MTAwMDAwPjsKK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2NwYXJ0LWlkID0gPDI+OworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFkLW9u
bHk7CisKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJudm1lbS1jZWxscyI7
CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+OworwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwxPjsKKworwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtYWNhZGRyX2ZhY3RvcnlfMjEwMDA6IG1hY2FkZHJAMjEwMDAgeworwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDIxMDAwIDB4Nj47CivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH07CivCoMKgwqDCoMKgwqDCoCB9OworCivCoMKgwqDCoMKgwqDCoCAvKiAuLi4gKi8KKwor
wqDCoMKgIH07Ci0tIAoKCj4gQmVzdCByZWdhcmRzLAo+IE1pa2hhaWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
