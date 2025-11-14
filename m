Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32522CE8D4F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zo3YiE1K022eUmvqrRMgZWaU0WktPCYrrRkxKKJKN4E=; b=18XaKceg8NvoRb
	VPECZY1x84My0FQ7jhEZWWwKQWgU5BQz37ssZ5oOWKZ3TJU6rh7qe6hv78V9ejbjqC0fwJHAGbI9+
	OULPnpgRP4C0cs5POSe3T+i19VX3lNoW6mwvMsm/4eqcdWy3Y+zpdRaHrcp+heMyAtQ4slQKHEOQ3
	Lqyq/KgcSHEhK7l3/hjm1VzDF2JK52qqo6haGMU9YE2EWQ5qVntru4uQhDvToX/5HzcTuUI8qwodn
	ysfsCmgfFhgPMgQf4tKje8Y+DEYeWrnRiYZTnAhYnrbY2hSli1lLoEx2gYdYre5Zfg+aNF6LqqMWp
	Y38+ZsuSEroq6S3ySO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwZM-0000000CjVr-0pLC;
	Fri, 14 Nov 2025 16:22:40 +0000
Received: from se.sotapeli.fi ([2a13:7c81:40::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwZH-0000000CjUG-2yzr
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 16:22:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0272A181AA00;
	Fri, 14 Nov 2025 17:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sotapeli.fi; s=dkim;
	t=1763137344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=HGaeTixCEYtVZPa/9mnBAaR0ro5gdRziLjqh2q7e75A=;
	b=TtyzcBPcnaNZhPD7tU+luXBtFfeXRB5qpsXH6cgsaIsfuRSgP8jUvff0iUJZMoo749zGWb
	Konf0Rsq+RLbrd7Rn3LXubJ0yMO/IjOoEcjYoC2H7gNb+AtkFmUTEoeS9OlC3i7mB/cF4z
	ZhH/ALZdeJTiDYpnhSahmTYzQEePRbw6hynaCVKhJ7tGWbcPZ8aav1aknURIym+W5FMaHo
	DOT8teR8VD2ncNRyWPxmr7+VWbdYIff0jdHiJIaGJDyO5kMLkbkFskzXJbN5eLEYzcj5fB
	eVTHDSehDK9XwY0Q/lE9BJgWRDPHodYUMAZXw7+QkhnV4BxEbYoVRhLiTKDiug==
Message-ID: <1774d0f9-9d9c-4636-93eb-bfae8d1ed3ec@sotapeli.fi>
Date: Fri, 14 Nov 2025 18:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug?
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
 <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
 <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <98df450751f934f3a5c20ec09a08b72ef8fa2763@intel.com>
 <CY5PR11MB6366FD61EF0FC69D077F80E0EDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <3oma7kpe3fzt2kch3g7h5ejmpkni4arf3sm65gfojrkhu6ih26@seedyt6xjwhv>
Content-Language: en-US
From: Jani Partanen <jiipee@sotapeli.fi>
Autocrypt: addr=jiipee@sotapeli.fi; keydata=
 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
In-Reply-To: <3oma7kpe3fzt2kch3g7h5ejmpkni4arf3sm65gfojrkhu6ih26@seedyt6xjwhv>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_082236_374366_67A08BBE 
X-CRM114-Status: GOOD (  10.81  )
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

SSB3YXMgZmluYWxseSBhYmxlIHRvIHRlc3QgdGhpcyBhbmQgaXRzIHdvcmtpbmcuCgoKVGhhbmtz
IGZvciBxdWljayBmaXguCgoKLy8gSmFuaQoKCk9uIDEyLzExLzIwMjUgMTYuNTcsIEx1Y2FzIERl
IE1hcmNoaSB3cm90ZToKPiBPbiBUdWUsIE5vdiAxMSwgMjAyNSBhdCAxMDo1ODowM0FNICswMDAw
LCBVc3lza2luLCBBbGV4YW5kZXIgd3JvdGU6Cj4+PiA+PiA+Cj4+PiA+PiA+SXQncyBwcm9iYWJs
eSBkdWUgdG8gc3RydWN0IGludGVsX2RnX252bSByZWdpb25zW10gbWVtYmVyIGJlaW5nCj4+PiA+
PiA+X19jb3VudGVkX2J5KG5yZWdpb25zKSBidXQgcmVnaW9uc1tdIGlzIGluZGV4ZWQgYmVmb3Jl
IG5yZWdpb25zIGhhcwo+Pj4gYmVlbgo+Pj4gPj4gPmluaXRpYWxpemVkLgo+Pj4gPj4KPj4+ID4+
IHllYWguLi4gYW5kIHdlIHNob3VsZG4ndCBzaWxlbnRseSBjb250aW51ZSBoaWRpbmcgdGhlIEVO
T01FTS4uLiAKPj4+IFNhc2hhLAo+Pj4gPj4gc29tZXRoaW5nIGxpa2UgdGhpcz8KPj4+ID4+Cj4+
PiA+Cj4+PiA+IEluIGdlbmVyYWwsIGxvb2tzIGdvb2QgZm9yIG1lLCBidXQgSSBzZWUgdGhhdCB3
ZSBjYW4gZmlsbCBsZXNzIAo+Pj4gZW50cmllcyBiZWNhdXNlCj4+PiBvZgo+Pj4gPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaW52bS0+cmVnaW9uc1tpXS5uYW1lKQo+Pj4g
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51
ZTsKPj4+ID4KPj4+ID4gTGV0J3MgbGVhdmUgJ252bS0+bnJlZ2lvbnMgPSBuOycgaW4gcGxhY2Us
IG9ubHkgbmVlZCB0byBmaXggdGhlIAo+Pj4gY29tbWVudC4KPj4+Cj4+PiBZb3UgaGF2ZSB0aGlz
IGluIHBsYWNlLCBucmVnaW9ucyBhbHJlYWR5IGFjY291bnMgZm9yIHRoZW06Cj4+Pgo+Pj4gwqDC
oMKgwqAvKiBjb3VudCBhdmFpbGFibGUgcmVnaW9ucyAqLwo+Pj4gwqDCoMKgwqBmb3IgKG5yZWdp
b25zID0gMCwgaSA9IDA7IGkgPCBJTlRFTF9ER19OVk1fUkVHSU9OUzsgaSsrKSB7Cj4+PiDCoMKg
wqDCoMKgwqDCoCBpZiAoaW52bS0+cmVnaW9uc1tpXS5uYW1lKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBucmVnaW9ucysrOwo+Pj4gwqDCoMKgwqB9Cj4+Pgo+Pgo+PiBZZWFoLCBtaXNzZWQg
dGhpcywgc28gb3JpZ2luYWwgZml4IGZyb20gTHVjYXMgaXMgb2sKPgo+IEkgc3VibWl0dGVkIGl0
IGFzIGEgcHJvcGVyIHBhdGNoIHdpdGggY29tbWl0IG1lc3NhZ2U6Cj4KPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNTExMTEtbXRkLW5yZWdpb25zLXYxLTEtNjFkYjYxZTc4YzYzQGlu
dGVsLmNvbS8gCj4KPgo+IEx1Y2FzIERlIE1hcmNoaQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
