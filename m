Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A459C4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySw+Gec4f5nox8yNqGKfWAS4ZVvBrfeuwiwKm0GCaXQ=; b=ra56m0ldlFmlas
	/2bYppnFkDR/6H4ReXBtocwF0Wf+iglxVNVrzYxVB9AS0nZub1Kt/ZfTc6v3txZY1zxuSY33HFwyu
	73S46HusBdxeN6i6DbYbcvuV6ne2vARQH0JbTx6riJ+1xowoNASlFgPVLQITkbRaAWOADry0zvnXa
	AV6unzgNGTWQc0i/Ov1TQzUBplq0lQxL8kx6OFne7T5nF4ILrhCjv4DOFjhsExOjsicKBF4lugqta
	hZ/bVfQ4WsCfhUuh2ooIpzjiXmwaJ8QCoskq8LZgz3BjMqx2uz4SZSgUNviKNtGv+tSK3K34Lukx4
	jhPTtbYNRe156kIYgABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCup-002Cin-2P;
	Fri, 12 Jan 2024 08:29:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCun-002CiK-0B
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:29:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3368b9bbeb4so5669089f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 00:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705048155; x=1705652955; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCZFcA82RRsQdNSXWNUkOHX1Et4qUKZ35g5vteZ7dB0=;
        b=Q4fKrAVWRDHOol4sFBOF8HYSjjisvnaIjuhAzkF+2FCFLDtwNmUrO7oKNkbJd/06oz
         xJfHruhiz8gL2iMOHPeagmSMMbpZ9Pyev7TCPn2B2eBq0LLeS4BztUR4/dz1w5s/k1S6
         AFcjWI8kl7G280589/FYNRUhbg4FR1nLGk/KhSBpiLJvuumKT3vu/cweeQsw46KBJ3vS
         Rttd3XLDVCt0T+K6/I6nB9mhU4Syzfc8JSGwqFTAd44gAx3VOEKlitRKBxop5U/dXDiM
         zmMn6yUKQv9uOFheGwbRJnCDzuNB6A0NnfDDkdNQwWnx8LUNf62rExFVC3QxP1j02MeC
         b3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705048155; x=1705652955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCZFcA82RRsQdNSXWNUkOHX1Et4qUKZ35g5vteZ7dB0=;
        b=fmdBJMjENQQD23A22FXkltmvzkouW/c2XMTo5wqkDs1u8u8sZtJ2nCSNa/LLoRzc9o
         Duyzjvj3T9wTzA+7V+rIfY1kNmXbaMOwHj+ffkG+r5oQ+ziJ4bN4CQxuo2dcZWwCZB8q
         bVknVQvBef7jmD0YjinVCbjdi6yBcQiGaxOqjFwcjQwpblcRHGQ77vGoL3zMSwSTKxXn
         Q5U1+ohnXfyGA/1VT/U/4vDdIR+HMlW+UTMg9vhHSFNE64JCD7qluupL/xQrwjOMsbuX
         96dGKC5tByjRyUOdX62VsizDO3DWrc5LVeaYbBESUn2mYMZpE0D9FkGMv3Zfo+s5q8dK
         hpGw==
X-Gm-Message-State: AOJu0YyTKxxYfPV8GhSGgM8CeWNuy5xjxU510iUTo2E0VWTrAL0lrD/8
	umMjQW6WG5cOGi0tXoInNhr0Bf1le8MywA==
X-Google-Smtp-Source: AGHT+IG0NsfDOSBpR9Jvs2KEhfobNYFzI99cfceZAQhbpmMs+ZLKic/u+hvfNtaEajND9x73nhTXJQ==
X-Received: by 2002:a5d:634e:0:b0:337:1e97:b644 with SMTP id b14-20020a5d634e000000b003371e97b644mr229651wrw.260.1705048155450;
        Fri, 12 Jan 2024 00:29:15 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id l8-20020adfe588000000b0033662c2820bsm3181502wrm.117.2024.01.12.00.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:29:15 -0800 (PST)
Message-ID: <abd91bff-2e28-46bc-9269-e5c294bbab68@linaro.org>
Date: Fri, 12 Jan 2024 08:29:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in
 DTR mode
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-3-jaimeliao.tw@gmail.com>
 <efe82e9c57edd12714e67215bb71d286@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <efe82e9c57edd12714e67215bb71d286@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_002921_097910_B235C86B 
X-CRM114-Status: GOOD (  26.34  )
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

CgpPbiAxLzUvMjQgMTI6NDgsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gSGksCj4gCj4+IFRoZXJl
IGFyZSBOT1IgZmxhc2hlcyAoTWFjcm9uaXgpIHRoYXQgc3dhcCB0aGUgYnl0ZXMgb24gYSAxNi1i
aXQKPj4gYm91bmRhcnkgd2hlbiBjb25maWd1cmVkIGluIE9jdGFsIERUUiBtb2RlLiBUaGUgYnl0
ZSBvcmRlciBvZgo+PiAxNi1iaXQgd29yZHMgaXMgc3dhcHBlZCB3aGVuIHJlYWQgb3Igd3JpdHRl
biBpbiBPY3RhbCBEb3VibGUKPj4gVHJhbnNmZXIgUmF0ZSAoRFRSKSBtb2RlIGNvbXBhcmVkIHRv
IFNpbmdsZSBUcmFuc2ZlciBSYXRlIChTVFIpCj4+IG1vZGVzLiBJZiBvbmUgd3JpdGVzIEQwIEQx
IEQyIEQzIGJ5dGVzIHVzaW5nIDEtMS0xIG1vZGUsIGFuZCB1c2VzCj4+IDhELThELThEIFNQSSBt
b2RlIGZvciByZWFkaW5nLCBpdCB3aWxsIHJlYWQgYmFjayBEMSBEMCBEMyBEMi4KPj4gU3dhcHBp
bmcgdGhlIGJ5dGVzIG1heSBpbnRyb2R1Y2Ugc29tZSBlbmRpYW5uZXNzIHByb2JsZW1zLiBJdCBj
YW4KPj4gYWZmZWN0IHRoZSBib290IHNlcXVlbmNlIGlmIHRoZSBlbnRpcmUgYm9vdCBzZXF1ZW5j
ZSBpcyBub3QgaGFuZGxlZAo+PiBpbiBlaXRoZXIgOEQtOEQtOEQgbW9kZSBvciAxLTEtMSBtb2Rl
LiBTbyB3ZSBtdXN0IHN3YXAgdGhlIGJ5dGVzCj4+IGJhY2sgdG8gaGF2ZSB0aGUgc2FtZSBieXRl
IG9yZGVyIGFzIGluIFNUUiBtb2Rlcy4gRm9ydHVuYXRlbHkgdGhlcmUKPj4gYXJlIGNvbnRyb2xs
ZXJzIHRoYXQgY291bGQgc3dhcCB0aGUgYnl0ZXMgYmFjayBhdCBydW50aW1lLAo+PiBhZGRyZXNz
aW5nIHRoZSBmbGFzaCdzIGVuZGlhbm5lc3NlcyByZXF1aXJlbWVudHMuIFByb3ZpZGUgYSB3YXkg
Zm9yCj4+IHRoZSB1cHBlciBsYXllcnMgdG8gc3BlY2lmeSB0aGUgYnl0ZSBvcmRlciBpbiBPY3Rh
bCBEVFIgbW9kZS4KPj4KPj4gTWVyZ2UgVHVkb3IncyBwYXRjaCBhbmQgYWRkIG1vZGlmaWNhdGlv
bnMgZm9yIHN1aXRpbmcgbmV3ZXIgdmVyc2lvbgo+PiBvZiBMaW51eCBrZXJuZWwuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KPj4g
U2lnbmVkLW9mZi1ieTogSmFpbWVMaWFvIDxqYWltZWxpYW9AbXhpYy5jb20udHc+Cj4+IC0tLQo+
PiDCoGRyaXZlcnMvc3BpL3NwaS1tZW0uY8KgwqDCoMKgwqDCoCB8IDQgKysrKwo+PiDCoGluY2x1
ZGUvbGludXgvc3BpL3NwaS1tZW0uaCB8IDYgKysrKysrCj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMg
Yi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPj4gaW5kZXggZWRkNzQzMGQ0YzA1Li45YzAzYjU2MTdm
ZmYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+PiArKysgYi9kcml2ZXJz
L3NwaS9zcGktbWVtLmMKPj4gQEAgLTE3Miw2ICsxNzIsMTAgQEAgYm9vbCBzcGlfbWVtX2RlZmF1
bHRfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0KPj4gKm1lbSwKPj4gwqDCoMKgwqDCoMKgwqDC
oCBpZiAoIXNwaV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIGR0cikpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAob3AtPmRhdGEuZHRyX3N3YWIxNiAmJgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhKHNw
aV9tZW1fY29udHJvbGxlcl9pc19jYXBhYmxlKGN0bHIsIGR0cl9zd2FiMTYpKSkKPiAKPiB1bm5l
Y2Vzc2FyeSBwYXJlbnRoZXNlcy4KPiAKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGZhbHNlOwo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9wLT5jbWQubmJ5dGVzICE9IDIp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+IMKgwqDCoMKgIH0g
ZWxzZSB7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmggYi9pbmNs
dWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPj4gaW5kZXggNmIwYTdkYzQ4YTRiLi5kNDkzNWM1YzNj
N2EgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvc3BpL3NwaS1tZW0uaAo+PiArKysgYi9p
bmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPj4gQEAgLTg5LDYgKzg5LDggQEAgZW51bSBzcGlf
bWVtX2RhdGFfZGlyIHsKPj4gwqAgKiBAZHVtbXkuZHRyOiB3aGV0aGVyIHRoZSBkdW1teSBieXRl
cyBzaG91bGQgYmUgc2VudCBpbiBEVFIgbW9kZSBvciBub3QKPj4gwqAgKiBAZGF0YS5idXN3aWR0
aDogbnVtYmVyIG9mIElPIGxhbmVzIHVzZWQgdG8gc2VuZC9yZWNlaXZlIHRoZSBkYXRhCj4+IMKg
ICogQGRhdGEuZHRyOiB3aGV0aGVyIHRoZSBkYXRhIHNob3VsZCBiZSBzZW50IGluIERUUiBtb2Rl
IG9yIG5vdAo+PiArICogQGRhdGEuZHRyX3N3YWIxNjogd2hldGhlciB0aGUgYnl0ZSBvcmRlciBv
ZiAxNi1iaXQgd29yZHMgaXMKPj4gc3dhcHBlZCB3aGVuIHJlYWQKPj4gKyAqwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG9yIHdyaXR0ZW4gaW4gT2N0YWwgRFRSIG1vZGUgY29tcGFyZWQgdG8gU1RS
IG1vZGUuCj4gCj4gbWF5YmUganVzdCBzd2FwMTY/IEknbSBub3Qgc3VyZS4gRG9lc24ndCByZWFs
bHkgYXBwbHkgdG8gRFRSLCBiZWNhdXNlCj4gaXQgaXMgbm90IGEgdGhpbmcgZm9yIDRiaXQgRFRS
IGZvciBleGFtcGxlLiBKdXN0IGZvciA4ZDhkOGQgYW5kICJmYXN0ZXIiCj4gYmVjYXVzZSB0aGVy
ZSB5b3UgdHJhbnNtaXQgbW9yZSB0aGFuIG9uZSBieXRlIGluIG9uZSBjbG9jayBjeWNsZS4KCnJl
bmFtaW5nIHRvIHN3YXAxNiB3b3VsZCBiZSBnb29kLCB5ZXMuCgo+IAo+ICJ3aGV0aGVyIGJ5dGVz
IHdpdGhpbiBhIDE2LWJpdCB3b3JkIHNob3VsZCBiZSBzd2FwcGVkLiBTb21lIGZsYXNoZXMgd2ls
bAo+IHN3YXAgdGhlIGRhdGEgaW4gOEQgbW9kZS4gSW4gdGhhdCBjYXNlLCB0aGlzIHNob3VsZCBi
ZSBzZXQgdG8gdHJ1ZQo+IHRvIGluc3RydWN0IHRoZSBjb250cm9sbGVyIHRvIHN3YXAgdGhlIGRh
dGEgYmFjayBvbiB0aGUgZmx5Lgo+IAo+PiDCoCAqIEBkYXRhLmVjYzogd2hldGhlciBlcnJvciBj
b3JyZWN0aW9uIGlzIHJlcXVpcmVkIG9yIG5vdAo+PiDCoCAqIEBkYXRhLmRpcjogZGlyZWN0aW9u
IG9mIHRoZSB0cmFuc2Zlcgo+PiDCoCAqIEBkYXRhLm5ieXRlczogbnVtYmVyIG9mIGRhdGEgYnl0
ZXMgdG8gc2VuZC9yZWNlaXZlLiBDYW4gYmUgemVybyBpZgo+PiB0aGUKPj4gQEAgLTEyMyw2ICsx
MjUsNyBAQCBzdHJ1Y3Qgc3BpX21lbV9vcCB7Cj4+IMKgwqDCoMKgIHN0cnVjdCB7Cj4+IMKgwqDC
oMKgwqDCoMKgwqAgdTggYnVzd2lkdGg7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgdTggZHRyIDogMTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHU4IGR0cl9zd2FiMTYgOiAxOwo+PiDCoMKgwqDCoMKgwqDCoMKg
IHU4IGVjYyA6IDE7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgdTggX19wYWQgOiA2Owo+IAo+IF9fcGFk
IDogNTsKPiAKPiBEb2VzIGFueW9uZSBrbm93IGlmIHRoaXMgaXMgcmVhbGx5IG5lY2Vzc2FyeT8K
PiAKCml0J3MgdG8gbWl0aWdhdGUgYSBnY2MtezEyLCAxM30gYnVnLCBzZWUKNzFjOGY5Y2YyNjIz
ZDBkYjc5NjY1Zjg3NmI5NWFmY2RkODIxNGFlYwoKTm8gaWRlYSBpZiB0aGUgYnVnIHdhcyBmaXhl
ZCBpbiB0aGUgbWVhbnRpbWUuCgo+PiDCoMKgwqDCoMKgwqDCoMKgIGVudW0gc3BpX21lbV9kYXRh
X2RpciBkaXI7Cj4+IEBAIC0yOTQsMTAgKzI5NywxMyBAQCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJf
bWVtX29wcyB7Cj4+IMKgLyoqCj4+IMKgICogc3RydWN0IHNwaV9jb250cm9sbGVyX21lbV9jYXBz
IC0gU1BJIG1lbW9yeSBjb250cm9sbGVyIGNhcGFiaWxpdGllcwo+PiDCoCAqIEBkdHI6IFN1cHBv
cnRzIERUUiBvcGVyYXRpb25zCj4+ICsgKiBAZHRyX3N3YWIxNjogU3VwcG9ydHMgc3dhcHBpbmcg
Ynl0ZXMgb24gYSAxNiBiaXQgYm91bmRhcnkgd2hlbgo+PiBjb25maWd1cmVkIGluCj4+ICsgKsKg
wqDCoMKgwqDCoMKgIE9jdGFsIERUUgo+IAo+IEkgZ3Vlc3MgdGhlIHNhbWUgY29tbWVudCBhcyBh
Ym92ZSBhcHBsaWVzLCBkb2Vzbid0IHJlYWxseSBoYXZlIHNvbWV0aGluZwo+IHRvIGRvIHdpdGgg
ZHRyLCBidXQgb25seSA4ZC4KCk9LLgpUaGFua3MsCnRhCj4gCj4gLW1pY2hhZWwKPiAKPj4gwqAg
KiBAZWNjOiBTdXBwb3J0cyBvcGVyYXRpb25zIHdpdGggZXJyb3IgY29ycmVjdGlvbgo+PiDCoCAq
Lwo+PiDCoHN0cnVjdCBzcGlfY29udHJvbGxlcl9tZW1fY2FwcyB7Cj4+IMKgwqDCoMKgIGJvb2wg
ZHRyOwo+PiArwqDCoMKgIGJvb2wgZHRyX3N3YWIxNjsKPj4gwqDCoMKgwqAgYm9vbCBlY2M7Cj4+
IMKgfTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
