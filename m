Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13325C54798
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Feb 2024 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ct4+zyFuKVfDYc4pRD9Tr9c73aeep7iC8tP8ISnNHz4=; b=TpKXaIaKEODXiB
	GTsLemppjH4aVbzPAW1S/y6CB1ktR0XuS3Osk8h5cWggZhvn3mvmWwTm+v9TLHFtMtQN4BEKl7UUv
	M3dL6OGOW7D16lsWuNDfWc38Zzb11quGn2Jivh7pnyDbmR6MPiGrBaHkv0apwcmj19fMLVWdULE2m
	20Uxm+7zdfFhhwOIXdbE2PXQnVWeEk6BOD090iETOaT7ZF35IRpXxkwm9RUH6zqp1WdNM0LH1hVPS
	HVEKJLCvl7he/JFkyuTeBdaUlWDxcF91ml+1r6vyw0LrF1iyXj/q8wsOt3XjEyrAKHDVNaztawP86
	Pz1y0Dr8YLGk6D3DzZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdvv-0000000DDao-38cs;
	Thu, 29 Feb 2024 10:46:35 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfdvt-0000000DDZV-2EE6
	for linux-mtd@lists.infradead.org;
	Thu, 29 Feb 2024 10:46:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 580D9240007;
	Thu, 29 Feb 2024 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709203590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSqawodQhAXm0uNYPNSwPRYTs92YnsNNxC7dPJ5qtLU=;
	b=hf6hUjiwGpmHuoQAeUmASbuDpbm0LUh9gME0qOseq4wEJ9rzfWqzZF+4eppsb5M0IOwB1V
	0KZKvMcSp596dkILlnmBrx6V2fRSJyqjCIp6W9VoJ/rCYOR+qNJf6V/3YiQiSwzRzgYjdW
	zf6g3WF/vsk4nfuoyyW9a/Pm1bvslA6STi4kfcPpNIOyJZ+a2ceIwsFI6SnJa6S0sQf43K
	u/2c8VMjtNWRGFTDN/hvZuBhlbxapL9rJx6VTdEf6bHp9f7Xav73mq9+622upleF+7Oz5v
	QFiwf0s5fCTfZTmi0YkkUqQNSN9kALTdrvtdNEjjckrIpIbZlMkJYMYEEKOmGA==
Date: Thu, 29 Feb 2024 11:46:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Jaime Liao <jaimeliao.tw@gmail.com>, Alvin
 Zhou <alvinzhou@mxic.com.tw>, <eagle.alexander923@gmail.com>,
 <mans@mansr.com>, <martin@geanix.com>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean@geanix.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: More continuous read fixes
Message-ID: <20240229114627.647f4af2@xps-13>
In-Reply-To: <d950908e-5c2b-41f7-9708-2eae1e6d9c76@foss.st.com>
References: <20240223115545.354541-1-miquel.raynal@bootlin.com>
 <d950908e-5c2b-41f7-9708-2eae1e6d9c76@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_024633_891235_523C0804 
X-CRM114-Status: GOOD (  29.18  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBN
b24sIDI2IEZlYiAyMDI0IDE1OjI4OjU5ICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gMi8y
My8yNCAxMjo1NSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiBGb2xs
b3dpbmcgQ2hyaXN0b3BoZSByZXBvcnQgSSBtYW51YWxseSBpbnNlcnRlZCBtYW55IGRpZmZlcmVu
dAo+ID4gY29uZGl0aW9ucyB0byB0ZXN0IHRoZSBsb2dpYyBlbmFibGluZ2FuZCBjb25maWd1cmlu
ZyBjb250aW51b3VzIHJlYWRzIGluCj4gPiB0aGUgY29yZSwgdHJ5aW5nIHRvIGNsYXJpZnkgdGhl
IGNvcmUgYW5kIGhvcGVmdWxseSBmaXggaXQgZm9yIHJlYWwuIEkgYW0KPiA+IHByZXR0eSBjb25m
aWRlbnQgcmVnYXJkaW5nIHRoZSBmaXJzdCBwYXRjaCBidXQgYSBiaXQgbW9yZSBpbiB0aGUgZm9n
IGZvcgo+ID4gdGhlIHNlY29uZC90aGlyZC4gRXZlbiB0aG91Z2ggSSdtIHByZXR0eSBzdXJlIHRo
ZXkgaW1wcm92ZSB0aGUgc2l0dWF0aW9uCj4gPiB0aGVyZSBtaWdodCBzdGlsbCBiZSBjb3JuZXIg
Y2FzZXMgSSBkb24ndCBoYXZlIGluIG1pbmQuICAKPiAKPiBJIGhhdmUgdGVzdGVkIHRoZSBwYXRj
aHNldCBhbmQgdGhlIGlzc3VlIGlzIGZpeGVkLCBzbyBJIHdpbGwgc2VuZCBhIHRlc3RlZC1ieSBv
biBwYXRjaCAxLgoKR3JlYXQhIFRoYW5rcyEKCkZvciBub3cgSSBjb3VsZCBub3QgZ2V0IG15IGhh
bmRzIG9uIGEgY2hpcCB3aXRoIG1vcmUgdGhhbiBvbmUgTFVOLiBJZgpieSBjaGFuY2UgeW91cnMg
aGFzIHR3byBMVU5zIChvciBtb3JlKSwgY291bGQgeW91IHBsZWFzZSBydW4gc29tZQpleHBlcmlt
ZW50cyB3aGVuIGNyb3NzaW5nIHRoZSBMVU4gYm91bmRhcnk/CgpBbnlob3csIHlvdXIgVGVzdGVk
LWJ5IHdpbGwgYmUgd2VsY29tZS4KCj4gQnV0LCBJIHRoaW5rIHRoYXQgdGhlcmUgaXMgc3RpbGwg
YW4gaXNzdWUgdXNpbmcgRk1DMiBhbmQgcHJvYmFibHkgb3RoZXJzIGRyaXZlcnMuCj4gCj4gRk1D
MiBkcml2ZXIgaGFzIDIgbW9kZXM6IHBvbGxpbmcgbW9kZSB0aGF0IHdpbGwgY2FsbGVkIG5hbmRf
cmVhZF9wYWdlX29wIGFuZCB0aGUgc2VxdWVuY2VyIG1vZGUgdGhhdCBpcyBkZWZpbmluZyBpdHMg
b3duIEhXIHJlYWQgYWxnb3JpdGhtLgo+IAo+IFRoZSBGTUMyIHNlcXVlbmNlciBkbyBub3Qgc3Vw
cG9ydCBjb250aW51b3VzIHJlYWQgZmVhdHVyZS4KPiAKPiBJIGhhdmUgYWRkZWQgYmFzaWMgbG9n
cyBpbiBuYW5kX2RvX3JlYWRfb3BzLiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGNvbnRp
bnVvdXMgcmVhZCBmZWF0dXJlIHNob3VsZCBiZSBkaXNhYmxlZCBhdCB0aGUgZW5kIG9mIHRoaXMg
ZnVuY3Rpb24uCj4gCj4gRk1DMiBwb2xsaW5nIG1vZGU6Cj4gcm9vdEBzdG0zMm1wMTp+IyBtdGRf
ZGVidWcgcmVhZCAvZGV2L210ZDkgMCAweDIwMDAgL3RtcC9yZWFkLmhleAo+IFsgICA0MS4wODMx
MzJdIG5hbmRfZG9fcmVhZF9vcHMgc3RhcnRzOiBjb250X3JlYWQub25nb2luZz0xCj4gWyAgIDQx
LjA4NjQxMF0gbmFuZF9kb19yZWFkX29wcyBzdGFydHM6IGNvbnRfcmVhZC5maXJzdF9wYWdlPTAs
IGNvbnRfcmVhZC5sYXN0X3BhZ2U9MQo+IFsgICA0MS4wOTQ3OTddIG5hbmRfZG9fcmVhZF9vcHMg
ZW5kczogY29udF9yZWFkLm9uZ29pbmc9MAo+IFsgICA0MS4wOTgxMTFdIG5hbmRfZG9fcmVhZF9v
cHMgZW5kczogY29udF9yZWFkLmZpcnN0X3BhZ2U9MCwgY29udF9yZWFkLmxhc3RfcGFnZT0xCj4g
Q29waWVkIDgxOTIgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gL3Rt
cC9yZWFkLmhleAo+IAo+IEl0IGlzIE9LLiBJbiBwb2xsaW5nIG1vZGUsIGNvbl9yZWFkLm9uZ29p
bmcgaXMgc2V0IHRvIGZhbHNlIGJlZm9yZSBsZWF2aW5nIG5hbmRfZG9fcmVhZF9vcHMgZnVuY3Rp
b24uCj4gCj4gRk1DMiBzZXF1ZW5jZXI6Cj4gcm9vdEBzdG0zMm1wMTp+IyBtdGRfZGVidWcgcmVh
ZCAvZGV2L210ZDkgMCAweDIwMDAgL3RtcC9yZWFkLmhleAo+IFsgICA1Ny4xNDMwNTldIG5hbmRf
ZG9fcmVhZF9vcHMgc3RhcnRzOiBjb250X3JlYWQub25nb2luZz0xCj4gWyAgIDU3LjE0NjM3MF0g
bmFuZF9kb19yZWFkX29wcyBzdGFydHM6IGNvbnRfcmVhZC5maXJzdF9wYWdlPTAsIGNvbnRfcmVh
ZC5sYXN0X3BhZ2U9MQo+IFsgICA1Ny4xNTQ0NjldIG5hbmRfZG9fcmVhZF9vcHMgZW5kczogY29u
dF9yZWFkLm9uZ29pbmc9MQo+IFsgICA1Ny4xNTgwMjBdIG5hbmRfZG9fcmVhZF9vcHMgZW5kczog
Y29udF9yZWFkLmZpcnN0X3BhZ2U9MCwgY29udF9yZWFkLmxhc3RfcGFnZT0xCj4gQ29waWVkIDgx
OTIgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gL3RtcC9yZWFkLmhl
eAo+IAo+IEtPLCBjb25fcmVhZC5vbmdvaW5nIGlzIHNldCB0byB0cnVlIGJlZm9yZSBsZWF2aW5n
IG5hbmRfZG9fcmVhZF9vcHMgZnVuY3Rpb24uIFRoYXQgbWVhbnMgdGhhdCByZWFkX29vYiBjYW4g
cmV0dXJuZWQgd3JvbmcgZGF0YSAoc2ltaWxhciBpc3N1ZSBhcyB0aGUgaW5pdGlhbCByZXBvcnRl
ZCBpc3N1ZSkuCj4gCj4gU28sIEkgc2VlIDIgd2F5cyB0byBmaXggdGhpcyBpc3N1ZS4KPiAKPiBP
biBmcmFtZXdvcmsgc2lkZSBieSBhZGRpbmcgYSBjYWxsYmFjayAocmF3bmFuZF9kaXNhYmxlX2Nv
bnRfcmVhZHMpIHRoYXQgd2lsbCBzZXQgdG8gZmFsc2UgY29uX3JlYWQub25nb2luZyBiZWZvcmUg
bGVhdmluZyBuYW5kX2RvX3JlYWRfb3BzIGZ1bmN0aW9uLgoKQ2FuIHlvdSBwbGVhc2UgdHJhY2Ug
d2hhdCBoYXBwZW5zIGhlcmU/IFVwb24gd2hhdCBzcGVjaWZpYyBjb25kaXRpb24KbmFuZF9kb19y
ZWFkX29wcyBkb2VzIHJldHVybiB3aXRoIG9uZ29pbmcgc2V0IHRvIHRydWU/IFRoaXMgaXMgcHJv
YmFibHkKd2hhdCBuZWVkcyBmaXhpbmcsIGJ1dCBJIGRvbid0IGZlZWwgbGlrZSBhIGRyaXZlciBo
b29rIGlzIHRoZSByaWdodAphcHByb2FjaC4KCkkgd2FzIGV4cGVjdGluZyB0aGUgb25nb2luZyBi
b29sZWFuIHRvIGFsd2F5cyBiZSByZXNldCBhdCB0aGUgZW5kIG9mCm5hbmRfZG9fcmVhZF9vcHMo
KSwgSSBwcm9iYWJseSBtaXNzZWQgYSBzY2VuYXJpby4gSW4gYW55IGNhc2Ugd2hhdCBpcwpwcm9i
YWJseSBuZWVkZWQgZm9yIHRoZSBzZXF1ZW5jZXIgdG8gd29yayBpczoKCisrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCkBAIC0zNzI2LDYgKzM3MjYsNyBAQCBzdGF0aWMgaW50
IG5hbmRfZG9fcmVhZF9vcHMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IGZyb20sCiAg
ICAgICAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgIG5hbmRfZGVzZWxlY3RfdGFyZ2V0KGNo
aXApOworICAgICAgIGNoaXAtPmNvbnRfcmVhZC5vbmdvaW5nID0gZmFsc2U7CiAKICAgICAgICBv
cHMtPnJldGxlbiA9IG9wcy0+bGVuIC0gKHNpemVfdCkgcmVhZGxlbjsKICAgICAgICBpZiAob29i
KQoKPiAKPiBPcgo+IAo+IE9uIEZNQzIgZHJpdmVyIHNpZGUgYnkgZGlzYWJsaW5nIHRoZSBjb250
aW51b3VzIHJlYWQgZmVhdHVyZSBpbiBjYXNlIG9mIHRoZSBzZXF1ZW5jZXIgaXMgdXNlZCBsaWtl
IGl0IGlzIGRvbmUgaW4gbmFuZHNpbS5jIGRyaXZlci4KPiBTb21ldGhpbmcgbGlrZToKPiBpZiAo
Y2hlY2tfb25seSkgewo+IAkJZm9yIChvcF9pZCA9IDA7IG9wX2lkIDwgb3AtPm5pbnN0cnM7IG9w
X2lkKyspIHsKPiAJCQlpbnN0ciA9ICZvcC0+aW5zdHJzW29wX2lkXTsKPiAJCQlpZiAoaW5zdHIt
PnR5cGUgPT0gTkFORF9PUF9DTURfSU5TVFIgJiYKPiAJCQkgICAgKGluc3RyLT5jdHguY21kLm9w
Y29kZSA9PSBOQU5EX0NNRF9SRUFEQ0FDSEVFTkQgfHwKPiAJCQkgICAgIGluc3RyLT5jdHguY21k
Lm9wY29kZSA9PSBOQU5EX0NNRF9SRUFEQ0FDSEVTRVEpKQo+IAkJCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gCQl9Cj4gCj4gCQlyZXR1cm4gMDsKPiAJfQoKVGhpcyBpcyBhIHNlY29uZCBwb3NzaWJs
ZSBjaG9pY2UgaWYgdGhlIGZpcnN0IG9uZSBkb2VzIG5vdCBnaXZlCmludGVyZXN0aW5nIHJlc3Vs
dHMuIE5vdCBteSBmYXZvcml0ZSBpbiB5b3VyIGNhc2UuCgpUaGFua3MgZm9yIHlvdXIgaGVscCwK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
