Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159C3C3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INDaDI2/cuXMsNDIeYSYyOkLU/vKuFlCAkLjrlZayyo=; b=wRY0ZfRhH9egnE
	qoIaHj1zengOLOKrWLJFtAfOnrn+kdKMO6s5HTSDBfIBhn/BeJ/Lt9oGdkmKFE3KZMaNFqze5FBJv
	VdcIzuyhKtvxfTJpST7XEOcDgAnvLxuqVS50yf2CAymAv8zg5rlGfMgXz+NElqz2bUiUHA+XyEGGe
	M0HB0f0tZN8lQOEuFM0Pdgtwq2osDSnDw7jhIg2Q9d+gwlAfpZmV2WFE9XLZGd1ZwbUhSc2TUtchd
	TtSPb96+Am6FsRDXy3GWmiAjlYRasSTruueiKk8K/O3xyP6Rn7LO1BuztEraY0FoCPOQjUojldwfz
	zCWPiyWrf1f1shm46PiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQxl-0000000HMKq-24Ag;
	Mon, 12 Aug 2024 09:03:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQx9-0000000HMFD-3B5A;
	Mon, 12 Aug 2024 09:03:01 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7bcf8077742so2959239a12.0;
        Mon, 12 Aug 2024 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723453379; x=1724058179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oA9UkiOfhBYAJUcDeMhwvbpEk5g3FJTd40aP2H5//4I=;
        b=SZwQ/zzs3T/gJ4n0jWP5pqCZ+d1ckOAgZe9JGOzOsY6GnqDEdE323ajusT0wjZhEtA
         Jn1VahTmr4dCvSU5R9smYfqfb+LNqbaKZzsIDxCTJ4rgKNrejwDYg96rM3+armoy5Lyj
         KxX4xWsKSYK95hJVUvUfjT9stlYZXkpoK2Ov4Y3wH2FIZn9ephnk4hdNJulwS354Hqky
         9cRaqexsLhj+J17L/d5kbKysgrMx2MvcIM8TgiSc0A0j1SOR2rC1xcDvI0VenQxuhczG
         V5B6NsXRbBehS1owZh3RZswq8jTfOB4Id3KIfxCo8zSnXWkJEWyx6ArdGgSyDj4vbH+S
         hgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723453379; x=1724058179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oA9UkiOfhBYAJUcDeMhwvbpEk5g3FJTd40aP2H5//4I=;
        b=M8uRvtVEYhVplkqA3IrfmtmEEevT4nXbMcSxIVEXTIiXJV8aIdP7NmScR+sK1VzePE
         5QLIpQG7aP/Na/ikpmX/7N5ML59bKB6jQzcJ1btJt9l0i78ys9nawy2fhrIix1y14nP2
         F6oCg34UboNdT0ZHSvM3QzUgsK7qomJ1BfoV33F8ZBJAJ5U51vBo9ZQiJyo6feomlaF8
         F9S9Nb3iVIn9+XDybF15u/ktGKZuxr72g+pudVgHFfs45IC2miSezBN+JJ3WfzhJ6aQb
         wtRl2SnX7kc8nJRbMdaQHm4FscKSNVUblqIFUPwf47WGaFtuVynf7XOo03oYHzm6vChf
         jspg==
X-Forwarded-Encrypted: i=1; AJvYcCUeUzrfRLYYSnfUmgKhAop5IRFk3Lj+eydU+JB9AwXqyBzlK/cuo4xtGMGo9nnpayhpRMrPIdiKvxoMLl9Ix3HPs5IpCa5myx99E7zXog==
X-Gm-Message-State: AOJu0YwNTM6vW++j4y+HNbldXZ3FmrgtM+A7aIVOMmY6m/oowAMemJEr
	xEMsF6tv4fUiS2iJX6MLMHnAxN/0Ocf/yne5G9D8G7jU5cs6F3To
X-Google-Smtp-Source: AGHT+IF1ltQ1rctffvZF5tYbkcGNp85XKx9gVHMvRsFPaQ95OUNPSPLfEIQJ2BniEwB8x2dmsNN4Rw==
X-Received: by 2002:a05:6a20:d50c:b0:1c4:dc2a:3775 with SMTP id adf61e73a8af0-1c89fee7304mr10402030637.27.1723453378691;
        Mon, 12 Aug 2024 02:02:58 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba0db27sm33487765ad.239.2024.08.12.02.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:02:58 -0700 (PDT)
Message-ID: <203578df-11a6-425a-b2be-cc09dae62f8f@gmail.com>
Date: Mon, 12 Aug 2024 17:02:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-2-hpchen0nvt@gmail.com>
 <7a8b9bdf-f4df-4da0-83ca-157175817e99@kernel.org>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <7a8b9bdf-f4df-4da0-83ca-157175817e99@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_020259_820554_21509938 
X-CRM114-Status: GOOD (  16.44  )
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

RGVhciBLcnp5c3p0b2YsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKCk9uIDIwMjQvOC8x
MiDkuIvljYggMDI6MjUsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMTIvMDgvMjAy
NCAwNTowMCwgSHVpLVBpbmcgQ2hlbiB3cm90ZToKPj4gQWRkIGR0LWJpbmRpbmdzIGZvciB0aGUg
TnV2b3RvbiBNQTM1IFNvQyBOQU5EIENvbnRyb2xsZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEh1
aS1QaW5nIENoZW4gPGhwY2hlbjBudnRAZ21haWwuY29tPgo+PiAtLS0KPj4gICAuLi4vYmluZGlu
Z3MvbXRkL251dm90b24sbWEzNWQxLW5hbmQueWFtbCAgICAgfCA5NyArKysrKysrKysrKysrKysr
KysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9udXZvdG9uLG1h
MzVkMS1uYW5kLnlhbWwKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9udXZvdG9uLG1hMzVkMS1uYW5kLnlhbWwKPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi45ODhjNDNiYzZlOTkKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L251dm90b24sbWEzNWQxLW5hbmQueWFtbAo+PiBAQCAtMCwwICsxLDk3IEBACj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4gKyVZ
QU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210
ZC9udXZvdG9uLG1hMzVkMS1uYW5kLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IE51dm90b24gTUEz
NUQxIE5BTkQgRmxhc2ggSW50ZXJmYWNlIChORkkpIENvbnRyb2xsZXIKPj4gKwo+PiArYWxsT2Y6
Cj4+ICsgIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlhbWwjCj4gYWxsT2YgZ29lcyB1c3VhbGx5
IGp1c3QgYmVmb3JlIHByb3BlcnRpZXMuCgpPa2F5LiBJIHdpbGwgbW9kaWZ5IHRoaXMgb3JkZXIu
CgoKCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIEh1aS1QaW5nIENoZW4gPGhwY2hlbjBu
dnRAZ21haWwuY29tPgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiAr
ICAgIGVudW06Cj4+ICsgICAgICAtIG51dm90b24sbWEzNWQxLW5hbmQKPj4gKwo+PiArICByZWc6
Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0
ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1pbkl0ZW1zOiAxCj4gVGhpcyBjYW5u
b3QgYmUgbWluIG9ubHkuIEl0J3MgdW5jb25zdHJhaW5lZC4gbWF4SXRlbXMgaW5zdGVhZC4gVGhl
cmUgaXMKPiBubyBleGlzdGluZyBjb2RlIGxpa2UgdGhpcyBzbyB0aGlzIHNob3VsZCBtYWtlIHlv
dSB3b25kZXIuLi4KClllcywgaXQgc2hvdWxkIGJlIGBtYXhJdGVtc2AuIEkgd2lsbCBjb3JyZWN0
IHRoaXMgbWlzdGFrZS4KCgoKPj4gKwo+PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+ICsgICJebmFu
ZEBbYS1mMC05XSQiOgo+PiArICAgIHR5cGU6IG9iamVjdAo+PiArICAgICRyZWY6IHJhdy1uYW5k
LWNoaXAueWFtbAo+PiArICAgIHByb3BlcnRpZXM6Cj4+ICsgICAgICBuYW5kLWVjYy1tb2RlOgo+
PiArICAgICAgICBjb25zdDogaHcKPiBObywgZHJvcCB0aGUgcHJvcGVydHkuIEl0IGRvZXMgbm90
IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBpdCBjb25zdC4KPiBDb21wYXRpYmxlIGRlZmluZXMgaXQuCgpP
a2F5LiBJIHdpbGwgcmVtb3ZlIGl0LgoKCgo+PiArCj4+ICsgICAgICBuYW5kLWVjYy1zdGVwLXNp
emU6Cj4+ICsgICAgICAgIGVudW06IFs1MTIsIDEwMjRdCj4gTm8gZGVmYXVsdHM/IFNvIGlzIHRo
aXMgcmVxdWlyZWQ/CgpUaGlzIGlzIHJlcXVpcmVkLCBidXQgSSB3aWxsIGFsc28gYWRkIGEgZGVm
YXVsdC4KCgoKPj4gKwo+PiArICAgICAgbmFuZC1lY2Mtc3RyZW5ndGg6Cj4+ICsgICAgICAgIGVu
dW06IFs4LCAxMiwgMjRdCj4gTm8gZGVmYXVsdHM/IFNvIGlzIHRoaXMgcmVxdWlyZWQ/CgpUaGlz
IGlzIHJlcXVpcmVkLCBidXQgSSB3aWxsIGFsc28gYWRkIGEgZGVmYXVsdC4KCgoKPj4gKwo+PiAr
ICAgICAgbmFuZC1idXMtd2lkdGg6Cj4+ICsgICAgICAgIGNvbnN0OiA4Cj4gRHJvcCBwcm9wZXJ0
eS4KCk9rYXkuIEkgd2lsbCByZW1vdmUgaXQuCgoKCj4+ICsKPj4gKyAgICB1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4g
KyAgLSByZWcKPj4gKyAgLSBpbnRlcnJ1cHRzCj4+ICsgIC0gY2xvY2tzCj4+ICsKPj4gK3VuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiAr
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+
Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL251dm90b24sbWEzNWQxLWNsay5o
Pgo+PiArCj4+ICsgICAgc29jIHsKPj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+
ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+PiArCj4+ICsgICAgICAgIG5hbmQtY29udHJv
bGxlckA0MDFBMDAwMCB7Cj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm51dm90b24sbWEz
NWQxLW5hbmQiOwo+PiArICAgICAgICAgICAgcmVnID0gPDB4MCAweDQwMUEwMDAwIDB4MCAweDEw
MDA+Owo+PiArICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM4IElSUV9UWVBFX0xF
VkVMX0hJR0g+Owo+PiArICAgICAgICAgICAgY2xvY2tzID0gPCZjbGsgTkFORF9HQVRFPjsKPj4g
KyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47Cj4+ICsKPj4gKyAgICAgICAgICAgIG5hbmRAMCB7Cj4+ICsgICAgICAgICAg
ICAgICAgcmVnID0gPDA+Owo+PiArCj4+ICsgICAgICAgICAgICAgICAgbmFuZC1vbi1mbGFzaC1i
YnQ7Cj4+ICsgICAgICAgICAgICAgICAgbmFuZC1lY2MtbW9kZSA9ICJodyI7Cj4gRHJvcAoKT2th
eS4gSSB3aWxsIHJlbW92ZSBpdC4KCgoKPj4gKyAgICAgICAgICAgICAgICBuYW5kLWVjYy1zdGVw
LXNpemUgPSA8NTEyPjsKPj4gKyAgICAgICAgICAgICAgICBuYW5kLWVjYy1zdHJlbmd0aCA9IDw4
PjsKPj4gKyAgICAgICAgICAgICAgICBuYW5kLWJ1cy13aWR0aCA9IDw4PjsKPiBEcm9wCgpPa2F5
LiBJIHdpbGwgcmVtb3ZlIGl0LgoKCgo+PiArCj4+ICsgICAgICAgICAgICAgICAgcGFydGl0aW9u
cyB7Cj4+ICsgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9u
cyI7Cj4+ICsgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArICAg
ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPj4gKwo+PiArICAgICAgICAgICAg
ICAgICAgICB1Ym9vdEAwIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gIm5h
bmQtdWJvb3QiOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgcmVhZC1vbmx5Owo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDMwMDAwMD47Cj4+ICsgICAgICAgICAg
ICAgICAgICAgIH07Cj4+ICsgICAgICAgICAgICAgICAgfTsKPj4gKyAgICAgICAgICAgIH07Cj4+
ICsgICAgICAgIH07Cj4+ICsgICAgfTsKPj4gKwo+PiArLi4uCj4gQmVzdCByZWdhcmRzLAo+IEty
enlzenRvZgoKCkJlc3QgcmVnYXJkcywKCkh1aS1QaW5nIENoZW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
