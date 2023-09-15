Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C3AEE6428
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VavF3Td4b3FipMcyyUodC4DTOFiOtle5pbmC1aLpJSI=; b=KRNQ3u4O5vtb2ngQEmxb9xP0aX
	taP6EotZjLmAOu7dr1a0IwXuIXwJ217AFTtPHKKZAa7UG+9Yg5MpoaMXhbl2qkZm2N8i3+KuXokJ/
	bG7cgKNamwT5KEvMiCfwQMR5yAioymEV7fZXbfDH0+MfpTVFCCb+xOhw9buoFuPDMRJsdY0ClOw4S
	IKHrttfBzheKoVi3kE+yHmdzVi5hKHaXxb5hQB1fN/+tIfAN9vK1O9OYDmun217iPdRfKY/MnSYCn
	Paf/f2WeY5QrBnxVcz96DUlngNl+btb9U9+i5hFB3zUWn3UZJNDDEW5HERr4GbYtpMfAbwE7HSInb
	uiRNvhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Fg-00A2aF-0q;
	Fri, 15 Sep 2023 07:28:32 +0000
Received: from 4.mo561.mail-out.ovh.net ([178.33.46.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3Fb-00A2Y4-1s
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 07:28:30 +0000
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.20.85])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id A927826BD2
	for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 07:28:21 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kmpnv (unknown [10.110.171.251])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 863E91FEBC;
	Fri, 15 Sep 2023 07:28:20 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
	by ghost-submission-6684bf9d7b-kmpnv with ESMTPSA
	id 3NYNH5QHBGUBRAAAnwAMdg
	(envelope-from <rafal@milecki.pl>); Fri, 15 Sep 2023 07:28:20 +0000
MIME-Version: 1.0
Date: Fri, 15 Sep 2023 09:28:20 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Scott Branden <scott.branden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?Q?Rafa=C5=82_Mi?=
 =?UTF-8?Q?=C5=82ecki?= <zajec5@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH] nvmem: brcm_nvram: store a copy of NVRAM content
In-Reply-To: <CA+Jzhd+HLoUDifQQ5vF7m66X3rsk1Bk2yx_0h6eSzaUwXVa72w@mail.gmail.com>
References: <20230914064922.3986-1-zajec5@gmail.com>
 <28fad55f-1253-deb2-9615-b32746129664@gmail.com>
 <CA+Jzhd+HLoUDifQQ5vF7m66X3rsk1Bk2yx_0h6eSzaUwXVa72w@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <24ab9df46703695cfa7402695a5dc5a2@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 546342932523559692
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudejuddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgffhueeihfeitdettdehfefhieefffevkedvgeetteekteejtdeivddvhffgffffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudehuddrkedtrddvledrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002827_914031_89DFC229 
X-CRM114-Status: GOOD (  17.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0wOS0xNCAyMzozMCwgU2NvdHQgQnJhbmRlbiB3cm90ZToKPiBPbiBUaHUsIFNlcCAx
NCwgMjAyMyBhdCAyOjI24oCvUE0gRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5j
b20+IAo+IHdyb3RlOgo+PiAKPj4gT24gOS8xMy8yMyAyMzo0OSwgUmFmYcWCIE1pxYJlY2tpIHdy
b3RlOgo+PiA+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gPgo+
PiA+IFRoaXMgZHJpdmVyIHVzZXMgTU1JTyBhY2Nlc3MgZm9yIHJlYWRpbmcgTlZSQU0gZnJvbSBh
IGZsYXNoIGRldmljZS4KPj4gPiBVbmRlcm5lYXRoIHRoZXJlIGlzIGEgZmxhc2ggY29udHJvbGxl
ciB0aGF0IHJlYWRzIGRhdGEgYW5kIHByb3ZpZGVzCj4+ID4gbWFwcGluZyB3aW5kb3cuCj4+ID4K
Pj4gPiBVc2luZyBNTUlPIGludGVyZmFjZSBhZmZlY3RzIGNvbnRyb2xsZXIgY29uZmlndXJhdGlv
biBhbmQgbWF5IGJyZWFrIHJlYWwKPj4gPiBjb250cm9sbGVyIGRyaXZlci4gSXQgd2FzIHJlcG9y
dGVkIGJ5IG11bHRpcGxlIHVzZXJzIG9mIGRldmljZXMgd2l0aAo+PiA+IE5WUkFNIHN0b3JlZCBv
biBOQU5ELgo+PiA+Cj4+ID4gTW9kaWZ5IGRyaXZlciB0byByZWFkICYgY2FjaGUgYWxsIE5WUkFN
IGNvbnRlbnQgZHVyaW5nIGluaXQgYW5kIHVzZSB0aGF0Cj4+ID4gY29weSB0byBwcm92aWRlIE5W
TUVNIGRhdGEgd2hlbiByZXF1ZXN0ZWQuCj4+ID4KPj4gPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tdGQvQ0FDbmE2cndmM185UVZqWWNNKzg0N2JpVFg9SzBFb1dYdVhjU01r
Sk8xVnlfNXZtVnFBQG1haWwuZ21haWwuY29tLwo+PiA+IENjOiBBcsSxbsOnIMOcTkFMIDxhcmlu
Yy51bmFsQGFyaW5jOS5jb20+Cj4+ID4gQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFp
bmVsbGlAYnJvYWRjb20uY29tPgo+PiA+IENjOiBTY290dCBCcmFuZGVuIDxzY290dC5icmFuZGVu
QGJyb2FkY29tLmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+Cj4+ID4gLS0tCj4+IFtzbmlwXQo+PiA+IC0gICAgIHByaXYtPmJhc2UgPSBk
ZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwLCAmcmVzKTsKPj4g
PiAtICAgICBpZiAoSVNfRVJSKHByaXYtPmJhc2UpKQo+PiA+IC0gICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIocHJpdi0+YmFzZSk7Cj4+ID4gKyAgICAgYmFzZSA9IGRldm1fcGxhdGZvcm1fZ2V0
X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZXMpOwo+PiA+ICsgICAgIGlmIChJU19F
UlIoYmFzZSkpCj4+ID4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihiYXNlKTsKPj4gPiAr
Cj4+ID4gKyAgICAgcHJpdi0+c2l6ZSA9IHJlc291cmNlX3NpemUocmVzKTsKPj4gPiArCj4+ID4g
KyAgICAgcHJpdi0+ZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHByaXYtPnNpemUsIEdGUF9LRVJO
RUwpOwo+PiAKPj4gVGhlc2UgY2FuIGNvbmNlaXZhYmx5IHF1aXRlIGJpZyBkYXRhIHN0cnVjdHVy
ZXMsIGhvdyBhYm91dCB1c2luZyAKPj4ga3ZtYWxsb2MoKT8KPiBXaHkgZG8gd2UgZXZlbiBuZWVk
IHRvIGV4cG9zZSBNTUlPIGludGVyZmFjZSB0byBOQU5EIHRob3VnaD8gIFdoeSBub3QKPiBhbHdh
eXMgZ28gdGhyb3VnaCB0aGUgY29udHJvbGxlciBkcml2ZXIuICBJIGRvbid0IHNlZSBob3cgdGhl
IE1NSU8KPiBhY2Nlc3Mgd291bGQgYmUgdXNlZCBnaXZlbiBiYWQgYmxvY2tzIGFyZW4ndCBoYW5k
bGVkPwoKV2UgbmVlZCB0byByZWFkIE5WTVJBTSAqZWFybHkqIGZvciBib290aW5nIHB1cnBvc2Vz
LiBTb21lIHZlbmRvcnMgc3RvcmUKdGhlcmUgaW5mb3JtYXRpb24gYWJvdXQgdXNlZCBmaXJtd2Fy
ZSBpbiBjYXNlIG9mIGhhdmluZyBtYWluIG9uZSBhbmQKZmFsbGJhY2sgb25lLiBUaGF0IGluZm8g
aXMgcmVxdWlyZWQgZm9yIHBhcnRpdGlvbmluZyB3aGljaCBoYXBwZW5zCmR1cmluZyBtdGQgaW5p
dGlhbGl6YXRpb24gYmVmb3JlIHdlIGhhdmUgTkFORCBkcml2ZXIgZnVsbHkgaW5pdGlhbGl6ZWQu
CgotLSAKUmFmYcWCIE1pxYJlY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
