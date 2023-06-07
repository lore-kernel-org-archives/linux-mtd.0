Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C8BC7EE23
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 08:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ricT9JGag6RxULPmj2uGTNkteJzEWl1YwWizPanFukk=; b=bq+UXTv/w8bCGn
	BsxXcUJn91mRcOvQy2A+LE6MS1OSn5KGbDb2EKeXVDBRBIQX8e3qkWHEe7jX6+WHiyal9cWpBu313
	4u+5PWhsPjOBiDuSaqXDHkSWwAngN/TWVCyGamaVHHp6pieCPBSvWL4X8qgxgvzkdZEKto9kbW7cz
	tVN7b+lkGc6s1byYu4nQlNhjeCYWPnUokiMWkNIqnB8o29d15QkQuMO6/rB4DMDrXe4Zh3uJfEXPe
	i9v8tX/RD9HB7RQDa1JoIsIaCFTUxPpPFGUKH4YYbnLZeYdB4Wanyvh0SB2dA+OMyQrLbhjhYN0ak
	4ICSbeOJsP3w1peILjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oo1-0052ZN-33;
	Wed, 07 Jun 2023 08:46:13 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6onv-0052ON-08;
	Wed, 07 Jun 2023 08:46:11 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 531D95FD5C;
	Wed,  7 Jun 2023 11:45:56 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686127556;
	bh=uBSKsrbRuolQZg/+wG53i1qmpUFa/MrANVgb91lYcfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=MxOw7qzEgxWEAD9hil/w/JFHtOGjEZq5QYLAyDNyLlk4PqAwHKPEsgxnulQC02XWM
	 lwMI3vIh9DLyjXyIbeWT8xe5TzYS1QEtXolV0jCZqMx7a4pHasNKyP2rGopWt6pawi
	 vFmT/RWjjae/ieN1LLunhHErDMhKfluxORC+M1s2sAXStqpj3a9cqUY3MawSqc1b7x
	 M31vPKCMHjD0SyivSVNNf14ljs6st90g1H7Nry+Adel5Ii+nJnOLOlQWcmtrP3Cl7C
	 FAURsCHPQNWfjop1wqJ8SWRW6Ws9ioeDdmcqlnyPoAdQ5sM2edIg+jswOAXZ6EGJsN
	 IEYpbkbkq9img==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 11:45:53 +0300 (MSK)
Message-ID: <166bdc27-f77c-9076-f866-180cfa5bff76@sberdevices.ru>
Date: Wed, 7 Jun 2023 11:40:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] dt-bindings: nand: meson: Fix 'nand-rb' property
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230606193507.35024-1-AVKrasnov@sberdevices.ru>
 <20230607095802.3adcd4f9@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230607095802.3adcd4f9@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 04:52:00 #21449589
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_014608_299957_A90C9704 
X-CRM114-Status: GOOD (  19.55  )
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

SGVsbG8gTWlxdWVsLCAKCk9uIDA3LjA2LjIwMjMgMTA6NTgsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cgo+IEhpIEFyc2VuaXksCj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1
ZSwgNiBKdW4gMjAyMyAyMjozNTowNyArMDMwMDoKPiAKPj4gQWRkIGRlc2NyaXB0aW9uIG9mICdu
YW5kLXJiJyBwcm9wZXJ0eS4gVXNlICJGaXhlcyIgYmVjYXVzZSB0aGlzIHByb3BlcnR5Cj4+IG11
c3QgYmUgc3VwcG9ydGVkIHNpbmNlIHRoZSBiZWdpbm5pbmcuIEZvciB0aGlzIGNvbnRyb2xsZXIg
J25hbmQtcmInIGlzCj4+IHN0b3JlZCBpbiB0aGUgY29udHJvbGxlciBub2RlIChub3QgaW4gY2hp
cCksIGJlY2F1c2UgaXQgaGFzIG9ubHkgc2luZ2xlCj4+IHIvYiB3aXJlIGZvciBhbGwgY2hpcHMu
Cj4gCj4gU29ycnkgaWYgSSBtaXNsZWFkIHlvdSBpbiB0aGUgZmlyc3QgcGxhY2UsIGJ1dCB5b3Ug
Y291bGQgZGVmaW5pdGVseQo+IGhhdmUgdHdvIGNoaXBzIGFuZCBvbmx5IG9uZSB3aXRoIFJCIHdp
cmVkLiBJdCBuZWVkcyB0byBiZSBkZWZpbmVkIGluCj4gdGhlIGNoaXBzLgoKT2ssIHNvIHRvIGNs
YXJpZnk6IGlzIGl0IG9rLCB0aGF0IGluIGJpbmRpbmdzIHRoaXMgcHJvcGVydHkgd2lsbCBiZSBw
bGFjZWQgaW4gdGhlCmNoaXAsIGJ1dCBpbiBkcml2ZXIsIGknbSB0cnlpbmcgdG8gcmVhZCBpdCBm
cm9tIHRoZSBjb250cm9sbGVyIG5vZGUgKHRodXMgIGluCmR0cyBmaWxlIGl0IHdpbGwgYmUgYWxz
byBpbiBjb250cm9sbGVyIG5vZGUpPyBCZWNhdXNlIGluIGRyaXZlciB0aGVyZSBpcyBubyBzZW5z
ZQp0byBzdG9yZSB0aGlzIHZhbHVlIGluIGNoaXAgc3RydWN0dXJlLiBJbiBmYWN0LCBpbiBkcml2
ZXIsIEkgY2FuIHJlYWQgaXQgZnJvbSB0aGUKY2hpcCBub2RlLCBidXQgc2V0ICdub19yYl9waW4n
IGZsYWcgaW4gdGhlIGNvbnRyb2xsZXIgc3RydWN0dXJlLgoKVGhhbmtzLCBBcnNlbml5Cgo+IAo+
IFBsZWFzZSBrZWVwIHRoZSBiaW5kaW5ncyBhbmQgZHJpdmVyIGNoYW5nZXMgcmVsYXRlZCB0byB0
aGlzIGluIHRoZSBzYW1lCj4gc2VyaWVzLgoKQWNrCgo+IAo+Pgo+PiBGaXhlczogZmJjMDBiNWU3
NDZmICgiZHQtYmluZGluZ3M6IG5hbmQ6IG1lc29uOiBjb252ZXJ0IHR4dCB0byB5YW1sIikKPj4g
U2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+
Cj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2lj
LG1lc29uLW5hbmQueWFtbCB8IDMgKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+PiBpbmRleCAyOGZiOWE3ZGQ3MGYu
Ljg2NmVkZjgwMGI4MSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FtbG9naWMsbWVzb24tbmFuZC55YW1sCj4+IEBAIC0z
Nyw2ICszNyw4IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAtIGNvbnN0OiBjb3JlCj4+ICAgICAg
ICAtIGNvbnN0OiBkZXZpY2UKPj4gIAo+PiArICBuYW5kLXJiOiB0cnVlCj4+ICsKPj4gIHBhdHRl
cm5Qcm9wZXJ0aWVzOgo+PiAgICAiXm5hbmRAWzAtN10kIjoKPj4gICAgICB0eXBlOiBvYmplY3QK
Pj4gQEAgLTgxLDYgKzgzLDcgQEAgZXhhbXBsZXM6Cj4+ICAKPj4gICAgICAgIHBpbmN0cmwtMCA9
IDwmbmFuZF9waW5zPjsKPj4gICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICsg
ICAgICBuYW5kLXJiID0gInRydWUiOwo+PiAgCj4+ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwx
PjsKPj4gICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
