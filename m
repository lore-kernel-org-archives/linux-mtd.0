Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDCFE92706
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/zrs/2LCEJ6udH0Gg1pxnicpUjIj2tctyjHuy74EwI=; b=AFlr5Q39TA3WAW
	JR/tMPw8BMpvDNnJAWEHFvKrISce06elIYKKrDoOXNPZ49HR33loMU3PGAuiJ9wwzuRLFMjdOqZZB
	XREjiRQQaeVEozXPowpmOeyJgdf+obw9ayx9SkVzwVw74YypBOu2QE8/GATyIDEx28Mkh1YN6IYUN
	O3YuVCyVI16JwTzzyAn3tHzaH4/ItiAf4LTSoiw6vDdLRTVLKxJTTUe7+ALyYRcjpnMBFqzXDQrf2
	VA1y8SmkDXjpJZP0tkLWE+mWz37pHVGTGptHbq2d0ls+KYBmRR4QmMK4i9cXkpEvbf2JO4VkwXUTe
	ss1tUYfgRuk0wfeL9MPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoPoz-003onY-0G;
	Thu, 05 Oct 2023 14:59:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoPop-003olQ-1d
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 14:59:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53639fb0ba4so1903789a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Oct 2023 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696517950; x=1697122750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JopC7TYgG/2635OqFhooPaGeIlxqKaTG9SmVPHwND4=;
        b=Wk0b55wNoagl03MlGGfwDCFCPb/flWeCdj+0I5Jwgg986ut0Cx+ys6rlhujyHmzjDj
         YWd88HyDuIHoFadnJkF3AFcL2OH1WIgjgIP9kccFbt6/B0nT0gMTQ9CkGEJ7iRLHAnEH
         NUoy/8hNz0pT+1+bB//X/9YHp4HJs9tbXUY2mN53zPMuHfQ6Me2T6ohypifxfOcAdqt6
         +q8jd7eseEEfs34J49N5MAmQojR1hZcrYsCcutdZK3jxC6QS6bT98CHxbn6INfou/7hq
         qKPdusXemFafSTWKFoJnSMxWrvpmPmxa2Bn065soB7kJG9nFvdU0DHoGG8yK+8ipJss9
         mAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696517950; x=1697122750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JopC7TYgG/2635OqFhooPaGeIlxqKaTG9SmVPHwND4=;
        b=XqIfyauePcmWmIY1rrF2fLguZ6E0PZ8uL4NDjqjxxXAr9d3WHuMav9Zxa8bw4TrkfX
         bd2JxmK5Hnv2jOHXa1YW0CrPVjBQ8sFlrBrb7Bk6I7YB0d4EPHF1l16FzbLW4101dNvA
         y9710fCquFLIYCkPnvkfKzi9rInIcf3nlLviewrVurVcGB9B2gzY8JwWWXc+m7UF8+hn
         iVrMa6bxsqLgDDrkY+hVTCKwwI0Ob5cToPRlY3AQGM3RnbiJUsP4To/AIOFqXqO1+kDY
         byZstVAXHg9KpFqUMpzcXmhkzFxZuJzGynZdrgj88bSdgx0A48rInMiAt9LUUL63I1ZC
         CRLg==
X-Gm-Message-State: AOJu0Yyq3sZ1OmdUsCagU1mHL4f6rKslyS3SzN6fOGubVdFvuuZETIg5
	S+NxrEtZn8ZGtQiGYfSLDYifuA==
X-Google-Smtp-Source: AGHT+IG+b38fOmKIDaw6BVPf/3UBHv2rMRe/9KU78PirBUUFV7dv/8OntgO0zC26Ise6h1LdCseR7w==
X-Received: by 2002:a17:907:7787:b0:9ae:7206:963c with SMTP id ky7-20020a170907778700b009ae7206963cmr5870014ejc.15.1696517949880;
        Thu, 05 Oct 2023 07:59:09 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id lr5-20020a170906fb8500b009adcb6c0f0esm1299270ejb.193.2023.10.05.07.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 07:59:09 -0700 (PDT)
Message-ID: <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
Date: Thu, 5 Oct 2023 15:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
 <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
 <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_075920_324708_B23FE95C 
X-CRM114-Status: GOOD (  24.49  )
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

CgpPbiAxMC81LzIzIDE1OjIxLCBTSFVLTEEgTWFtdGEgUmFtZW5kcmEgd3JvdGU6Cj4gCj4gCj4g
T24gMDUuMTAuMjMgMTU6NTEsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IFtTb21lIHBlb3BsZSB3
aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHR1ZG9y
LmFtYmFydXNAbGluYXJvLm9yZy4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdCj4+Cj4+IFRoaXMgZW1h
aWwgaXMgbm90IGZyb20gSGV4YWdvbuKAmXMgT2ZmaWNlIDM2NSBpbnN0YW5jZS4gUGxlYXNlIGJl
IGNhcmVmdWwgd2hpbGUgY2xpY2tpbmcgbGlua3MsIG9wZW5pbmcgYXR0YWNobWVudHMsIG9yIHJl
cGx5aW5nIHRvIHRoaXMgZW1haWwuCj4+Cj4+Cj4+IE9uIDEwLzUvMjMgMTA6MjEsIFNIVUtMQSBN
YW10YSBSYW1lbmRyYSB3cm90ZToKPj4KPj4gY3V0Cj4+Cj4+Pj4KPj4+PiBhbmQgdGhlIHNlY29u
ZCBvbmUgd2lsbCBhZGQganVzdCB0aGUgQlAgc3VwcG9ydCwgc29tZXRoaW5nIGxpa2U6Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMKPj4+PiBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMKPj4+PiBpbmRleCBhOGRhMWYxOGUzMzUuLmZkYWZi
ZmEwZjkzNiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5j
Cj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+Pj4+IEBAIC00MDUs
NiArNDA1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHN0X25vcl9wYXJ0c1td
ID0gewo+Pj4+ICAgICAgICAgICB9LCB7Cj4+Pj4gICAgICAgICAgICAgICAgICAgLmlkID0gU05P
Ul9JRCgweDIwLCAweGJiLCAweDIwLCAweDEwLCAweDQ0LCAweDAwKSwKPj4+PiAgICAgICAgICAg
ICAgICAgICAubmFtZSA9ICJtdDI1cXU1MTJhIiwKPj4+PiArICAgICAgICAgICAgICAgLmZsYWdz
ID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwKPj4+PiBTUElfTk9SXzRCSVRf
QlAgfAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBTUElfTk9SX0JQM19TUl9CSVQ2LAo+
Pj4+ICAgICAgICAgICAgICAgICAgIC5tZnJfZmxhZ3MgPSBVU0VfRlNSLAo+Pj4+ICAgICAgICAg
ICB9LCB7Cj4+Pj4gICAgICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgweDIwLCAweGJiLCAw
eDIwKSwKPj4+Pgo+Pj4+IE9mIGNvdXJzZSwgSSBleHBlY3QgeW91IHRvIHJ1biBhZ2FpbiB0aGUg
bXRkX2RlYnVnIHRlc3RzIGFuZCBhbHNvIHZlcmlmeQo+Pj4+IHRoZSBsb2NraW5nLiBUaGFua3Mh
Cj4+Pgo+Pj4gSSBhcHBsaWVkIGJvdGggY2hhbmdlcyBhcyBtZW50aW9uZWQgYWJvdmUgaS5lCj4+
PiAxXSBTd2l0Y2ggdG8gU0ZEUCBhbmQgMl0gVXNpbmcgQlAgRmxhZ3MuCj4+Pgo+Pj4gQ2FzZSAx
OiBVc2UgQlAgRmxhZ3MgYW5kIFN3aXRjaCB0byBTRkRQCj4+PiBXaXRoIGJvdGggdGhlc2UgY2hh
bmdlcywgdGhlIGxvY2svdW5sb2NrIGRvZXNuJ3Qgd29yay4KPj4+Cj4+PiAjIyB4ODYtNjQtc21h
cmMtZXZrLXV3ZDBqMDAwNyAjIHVuYW1lIC1yCj4+PiA2LjYuMC1yYzIKPj4+Cj4+PiAjIGZsYXNo
X2xvY2sgLWkgL2Rldi9tdGQwCj4+PiBEZXZpY2U6IC9kZXYvbXRkMAo+Pj4gU3RhcnQ6IDAKPj4+
IExlbjogMHg0MDAwMDAwCj4+PiBMb2NrIHN0YXR1czogdW5sb2NrZWQKPj4+IFJldHVybiBjb2Rl
OiAwCj4+PiAjIGZsYXNoX2xvY2sgLWwgL2Rldi9tdGQwCj4+PiBmbGFzaF9sb2NrOiBlcnJvciE6
IGNvdWxkIG5vdCBsb2NrIGRldmljZTogL2Rldi9tdGQwCj4+Pgo+Pj4gICAgICAgICAgICAgICBl
cnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3IpCj4+Pgo+Pj4KPj4+IEkgc3VzcGVjdGVkIHRoaXMg
aXMgYmVjYXVzZSBvZiBtaXNjYWxjdWxhdGlvbiBvZiBCUCBiaXRzLCBsaWtlIHRoZQo+Pj4gcG9z
c2liaWxpdHkgbWVudGlvbmVkIGhlcmU6Cj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0L2NvbW1pdC8/aD1zcGktbm9yL25leHQm
aWQ9M2VhM2YwYWMyNDJjODZjMDI3NWQzNDdhYjhjOTJiZjFlYjg1NGI0OSAKPj4+Cj4+Pgo+Pj4g
QnV0IGZ1cnRoZXIgY2hlY2tlZCBzaXplLCBpdCBpcyBjb3JyZWN0Ogo+Pj4KPj4+ICAgICMgbXRk
X2RlYnVnIGluZm8gL2Rldi9tdGQwCj4+PiBtdGQudHlwZSA9IE1URF9OT1JGTEFTSAo+Pj4gbXRk
LmZsYWdzID0gTVREX0NBUF9OT1JGTEFTSAo+Pj4gbXRkLnNpemUgPSA2NzEwODg2NCAoNjRNKQo+
Pj4gbXRkLmVyYXNlc2l6ZSA9IDQwOTYgKDRLKQo+Pj4gbXRkLndyaXRlc2l6ZSA9IDEKPj4+IG10
ZC5vb2JzaXplID0gMAo+Pj4gcmVnaW9ucyA9IDAKPj4+Cj4+PiBBbmQgcmVzdCBvZiByZWFkL3dy
aXRlIGZ1bmN0aW9ucyB3b3JrIGFzIGV4cGVjdGVkLgo+Pj4KPj4+IEFueSBzdWdnZXN0aW9ucyBh
Ym91dCB0aGlzPwo+Pj4KPj4+IENhc2UgMjogSnVzdCBhZGRlZCBCUCBmbGFncywgcmVzdCBvZiB0
aGUgc2l6ZSwgbWZyX2ZsYWdzLCBmaXh1cCBmbGFncwo+Pj4ga2VwdCBhcyBpdCBpcy4KPj4KPj4g
d291bGQgeW91IHBsZWFzZSBkZXRhaWwgd2hhdCBleGFjdCBkZWZpbml0aW9ucyB5b3UgdXNlZCBp
biBjYXNlIDI/IFNlbmQKPj4gdXMgdGhlIGRpZmYgcGxlYXNlLgo+IENhc2UgMjogQWRkaW5nIEZs
YWdzIGZvciBCUAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1z
dC5jIAo+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+IGluZGV4IDRhZmNmYzU3
Yzg5Ni4uNmM4Y2FiYmVhZDJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWlj
cm9uLXN0LmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gQEAgLTQw
NSw2ICs0MDUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3Rfbm9yX3BhcnRz
W10gPSB7Cj4gICAgICAgICAgfSwgewo+ICAgICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgw
eDIwLCAweGJiLCAweDIwLCAweDEwLCAweDQ0LCAweDAwKSwKPiAgICAgICAgICAgICAgICAgIC5u
YW1lID0gIm10MjVxdTUxMmEiLAo+ICsgICAgICAgICAgICAgICAuZmxhZ3MgPSBTUElfTk9SX0hB
U19MT0NLIHwgU1BJX05PUl9IQVNfVEIgfCAKPiBTUElfTk9SXzRCSVRfQlAgfAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIFNQSV9OT1JfQlAzX1NSX0JJVDYsCj4gICAgICAgICAgICAgICAgICAu
c2l6ZSA9IFNaXzY0TSwKPiAgICAgICAgICAgICAgICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80
SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgCj4gU1BJX05PUl9RVUFEX1JFQUQsCj4gICAgICAgICAg
ICAgICAgICAuZml4dXBfZmxhZ3MgPSBTUElfTk9SXzRCX09QQ09ERVMsCj4gCj4gCgpUaGFua3Mu
IE5vdGhpbmcgb2J2aW91cyBvbiBhIGZpcnN0IGxvb2suIEkgbG9va2VkIGF0IHRoZSBzZmRwIGR1
bXAsIGl0Cmxvb2tzIGxpa2UgNEJBSVQgdGFibGUgaXMgbWlzc2luZywgc28geW91J2xsIHByb2Jh
Ymx5IG5lZWQ6CgkuZml4dXBfZmxhZ3MgPSBTUElfTk9SXzRCX09QQ09ERVMsCgpJIGRvbid0IHNl
ZSBob3cgdGhpcyBjb3VsZCBhZmZlY3QgQlAsIGJ1dCBpdCBpcyB3b3J0aCB0byB0ZXN0CmluY3Jl
bWVudGFsIGNoYW5nZXMgYW5kIGZpbmQgb3V0IHdoYXQgbWlzc2VzLgoKQWZ0ZXIgeW91IHRlc3Qg
dGhlIGFib3ZlLCBJJ2QgbGlrZSB5b3UgdG8gZXh0ZW5kIHRoZSBwYXRjaCB3aXRoOgoJLnNpemUg
PSBTWl82NE0sCkNoZWNrIGlmIGl0IHdvcmtzIGFuZCBzZW5kIHVzIHRoZSBvdXRwdXQgb2YgbXRk
X2RlYnVnIGluZm8gL2Rldi9tdGQwIGhlcmUuCgpBbHNvIHlvdSBjb3VsZCBlbmFibGUgZGV2X2Ri
ZyB0byBzZWUgd2hlcmUgeW91IGdldCAtRUlPLiBQcm9iYWJseSB3aGVuCnJlYWRpbmcgdGhlIFNS
IGJhY2suIEFsc28geW91IGNhbiB1c2UgZGVidWdmcyB0byBjaGVjayB3aGF0IGlzIHNldCBpbgp0
aGUgd29ya2luZyBzY2VuYXJpbyBhbmQgd2hhdCBwYXJhbXMgYXJlIGRpZmZlcmVudCBpbiB0aGUg
bm9uLXdvcmtpbmcKY2FzZS4gU2VlIGRyaXZlcnMvbXRkL3NwaS1ub3IvZGVidWdmcy5jCgpDaGVl
cnMsCnRhCgoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IENhc2UgMTogQlAgRmxhZ3MgYW5kIHJlbW92ZWQgc2l6ZSwg
YW5kIG5vX3NmZHAgc28gYnkgZGVmYXVsdCBleHBlY3RpbmcgCj4gdG8gcmVhZCBTRkRQCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMgCj4gYi9kcml2ZXJz
L210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gaW5kZXggNmM4Y2FiYmVhZDJlLi40ZmViMDNlZTJk
MTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMKPiBAQCAtNDA3LDkgKzQwNyw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzdF9ub3JfcGFydHNbXSA9IHsKPiAgICAgICAg
ICAgICAgICAgIC5uYW1lID0gIm10MjVxdTUxMmEiLAo+ICAgICAgICAgICAgICAgICAgLmZsYWdz
ID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwgCj4gU1BJX05PUl80QklUX0JQ
IHwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgU1BJX05PUl9CUDNfU1JfQklUNiwKPiAtICAg
ICAgICAgICAgICAgLnNpemUgPSBTWl82NE0sCj4gLSAgICAgICAgICAgICAgIC5ub19zZmRwX2Zs
YWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgCj4gU1BJX05PUl9RVUFEX1JFQUQs
Cj4gLSAgICAgICAgICAgICAgIC5maXh1cF9mbGFncyA9IFNQSV9OT1JfNEJfT1BDT0RFUywKPiAg
ICAgICAgICAgICAgICAgIC5tZnJfZmxhZ3MgPSBVU0VfRlNSLAo+ICAgICAgICAgIH0sIHsKPiAK
PiAKPiAKPj4KPj4gQ2hlZXJzLAo+PiB0YQo+Pgo+Pj4gTG9jay91bmxvY2sgd29ya3MuCj4+Pgo+
Pj4gIyMgeDg2LTY0LXNtYXJjLWV2ay11d2QwajAwMDcgIyB1bmFtZSAtcgo+Pj4gNi42LjAtcmMy
Cj4+Pgo+Pj4gIyBmbGFzaF9sb2NrIC1pIC9kZXYvbXRkMAo+Pj4gU3RhcnQ6IDAKPj4+IExlbjog
MHg0MDAwMDAwCj4+PiBMb2NrIHN0YXR1czogdW5sb2NrZWQKPj4+IFJldHVybiBjb2RlOiAwCj4+
Pgo+Pj4gIyBmbGFzaF9sb2NrIC1sIC9kZXYvbXRkMAo+Pj4gIyBmbGFzaF9sb2NrIC1pIC9kZXYv
bXRkMAo+Pj4gRGV2aWNlOiAvZGV2L210ZDAKPj4+IFN0YXJ0OiAwCj4+PiBMZW46IDB4NDAwMDAw
MAo+Pj4gTG9jayBzdGF0dXM6IGxvY2tlZAo+Pj4gUmV0dXJuIGNvZGU6IDEKPj4+Cj4+PiAjIyB4
ODYtNjQtc21hcmMtZXZrLXV3ZDBqMDAwNyAjIG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMCAx
MDQ4NTc2Cj4+PiBbICA0MTMuNDcyNDExXSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBFcmFzZSBv
cGVyYXRpb24gZmFpbGVkLgo+Pj4gWyAgNDEzLjQ3ODA4NF0gc3BpLW5vciBzcGktUFJQMDAwMTow
MDogQXR0ZW1wdGVkIHRvIG1vZGlmeSBhIHByb3RlY3RlZAo+Pj4gc2VjdG9yLgo+Pj4gTUVNRVJB
U0U6IElucHV0L291dHB1dCBlcnJvcgo+Pj4KPj4+ICMgZmxhc2hfbG9jayAtdSAvZGV2L210ZDAK
Pj4+ICMgZmxhc2hfbG9jayAtaSAvZGV2L210ZDAKPj4+IERldmljZTogL2Rldi9tdGQwCj4+PiBT
dGFydDogMAo+Pj4gTGVuOiAweDQwMDAwMDAKPj4+IExvY2sgc3RhdHVzOiB1bmxvY2tlZAo+Pj4g
UmV0dXJuIGNvZGU6IDAKPj4+Cj4+PiAjIyB4ODYtNjQtc21hcmMtZXZrLXV3ZDBqMDAwNyAjICBt
dGRfZGVidWcgZXJhc2UgL2Rldi9tdGQwIDAgMTA0ODU3Ngo+Pj4gRXJhc2VkIDEwNDg1NzYgYnl0
ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPj4+Cj4+Pgo+Pj4gRnVydGhlciBJ
IHRlc3RlZCBvbiBzdGFibGUgNi41LjUgS2VybmVsIHdpdGggb2xkIHdheSBvZiBGbGFzaCBJbmZv
Cj4+PiBGb3JtYXQgYW5kIHdoaWNoIGhhcyBmb3JjZWQgUEFSU0VfU0ZEUCBGbGFnLCBubyBpc3N1
ZXMgd2l0aCBsb2NrL3VubG9jay4KPj4+Cj4+Pgo+IAo+IC0tLQo+IE1hbXRhCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
