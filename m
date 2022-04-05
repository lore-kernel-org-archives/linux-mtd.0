Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eHDv/BiBUKjpWL/PSFKugPZDnPO+8bN8muW38CmOlM=; b=pIorhf055gIUEq
	Ms3GuIYaPw6G4b9u5gv57Hc+3uLz9Mt4yekKe33KIa4IZ5bRUBRpI7xY0BpKDTTdfg9Qw0ibcvbHS
	U0MQCFh0wkjBYuV20J+vJVN+E2Ukgz0Myp4lb/rw0AbmCR8iwqz0vad6fFgHjzifuUe1BMUqt3gHK
	9f+Y8jQ7eodSWMlSsumcskV6cOEFMhDtMFenfIAI4DcOPPsqMg0IQRxBb95IAiWeDuHs5fhiqasCm
	dggSBdhdchnuU8Rhw0040HcJf3eMLhAV0kuNuKpfYvIpzDww3K1RGmSH1xe1I+hDrdzt3e6sIYi3B
	il6UVURELEh3XIYPsrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdf5-00HYNE-PC; Tue, 05 Apr 2022 07:31:36 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdUV-00HT7Q-Pk; Tue, 05 Apr 2022 07:20:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D202024000C;
 Tue,  5 Apr 2022 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649143234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpvfYdyA2PB7667ZTFEYC37nx0xbGndnvQLkh+GtoUc=;
 b=h7hY9Jo6S5R/X/FMHAFNGYaEyyD9HrfcpGcmAW5frfsecCC8u0xeUQQZ7JJb45pOrHonQB
 5BUPWLjFDMmnXKq8WFiKDZ403XDFDD3uIdBDZGdjYfUK2vA9d+Kl12efhuNWtX6uUBeAD1
 ZagFg9uip+bqYD9yNMQuWKLcKDvGVechHM2qXYq5Z7w0TZ7+vA4RMnPoIGlT4x8B7KblfB
 V24FmKwjDy+xZkws3pak/3FMAGk01NGyF9vPRPS4j6lir8BcHO7X57ZJqSo0K/d1ua1lm8
 udxlvKJRsxYPs3EMlnJ/PgeLM42VMwMEJGAUGncNYDAaN0Gxb83tniqf8XtcTg==
Date: Tue, 5 Apr 2022 09:20:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Pratyush Yadav
 <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org, Cai Huoqing
 <cai.huoqing@linux.dev>, Roger Quadros <rogerq@kernel.org>, Yu Kuai
 <yukuai3@huawei.com>, linux-mediatek@lists.infradead.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, Mark
 Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Paul Cercueil
 <paul@crapouillou.net>, Florian Fainelli <f.fainelli@gmail.com>, Colin Ian
 King <colin.king@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Message-ID: <20220405092024.25d97c33@xps13>
In-Reply-To: <CAJsYDVLaXAoL=TcPun6rckcA_cdUS-zFy_7M6uCpfzX+jbQEag@mail.gmail.com>
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
 <CAJsYDVLaXAoL=TcPun6rckcA_cdUS-zFy_7M6uCpfzX+jbQEag@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_002040_378732_A07C7D17 
X-CRM114-Status: GOOD (  14.05  )
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

SGVsbG8sCgpnY2g5ODEyMTNAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgNSBBcHIgMjAyMiAxMDo1
NTo1MSArMDgwMDoKCj4gSGkgUm9iIQo+IAo+IE9uIFR1ZSwgQXByIDUsIDIwMjIgYXQgMTI6MDkg
QU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBbLi4uXQo+ID4gTXkg
Ym90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0gZHRfYmlu
ZGluZ19jaGVjaycKPiA+IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGlu
IHY1LjEzKToKPiA+Cj4gPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4gPgo+ID4gZHRzY2hl
bWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiA+IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1y
ZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9tZWRpYXRlayxzcGkt
bXRrLXNuZmkuZXhhbXBsZS5kdC55YW1sOiBzcGlAMTEwMGQwMDA6ICdlY2MtZW5naW5lJyBpcyBh
IHJlcXVpcmVkIHByb3BlcnR5Cj4gPiAgICAgICAgIEZyb20gc2NoZW1hOiAvYnVpbGRzL3JvYmhl
cnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvbWVkaWF0ZWssc3BpLW10ay1zbmZpLnlhbWwKPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLW10ay1zbmZpLmV4YW1wbGUuZHQueWFtbDowOjA6
IC9leGFtcGxlLTAvc29jL3NwaUAxMTAwZDAwMC9mbGFzaEAwOiBmYWlsZWQgdG8gbWF0Y2ggYW55
IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnc3BpLW5hbmQnXSAgCj4gCj4gSSByYW4gdGhlIHRl
c3RzIG15c2VsZiBhbmQgaXQncyBvbmx5IGNvbXBsYWluaW5nIGFib3V0IHRoZSBlY2MtZW5naW5l
IG5hbWU6Cj4gCj4gL2hvbWUvdXNlci9zcmMva2VybmVscy9saW51eC9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS1tdGstc25maS5leGFtcGxlLmR0YjoK
PiBzcGlAMTEwMGQwMDA6ICdlY2MtZW5naW5lJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4gRnJv
bSBzY2hlbWE6IC9ob21lL3VzZXIvc3JjL2tlcm5lbHMvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NwaS9tZWRpYXRlayxzcGktbXRrLXNuZmkueWFtbAo+IAo+IEl0IHNh
eXMgbm90aGluZyBhYm91dCB0aGUgc3BpLW5hbmQgcGFydC4KPiBJJ2QgbGlrZSB0byBrZWVwIHRo
ZSBmbGFzaEAwIG5vZGUgaW4gdGhlIGV4YW1wbGUgdG8gZGVtb25zdHJhdGUgdGhlCj4gbmFuZC1l
Y2MtZW5naW5lIHVzYWdlLiBXaGF0IHNob3VsZCBJIGRvPwoKWW91IGNhbiB0cnkgaW5jbHVkaW5n
IHNwaS1uYW5kLnlhbWwgKGxpa2UgeW91IGRvIHdpdGgKc3BpLWNvbnRyb2xsZXIueWFtbCkuIFlv
dSBzaG91bGQgbm8gbG9uZ2VyIG5lZWQgdG8gZGVmaW5lCm5hbmQtZWNjLWVuZ2luZSB0aGVuIGFz
IGl0IGlzIGFscmVhZHkgZGVzY3JpYmVkIHRoZXJlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
