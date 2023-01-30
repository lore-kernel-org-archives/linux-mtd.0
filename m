Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A125BC636CD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmmBMvPU/HAmk9+OGLg71Np8LaUwZgFgumDtjTgJ0QY=; b=vh7PdJXlZLbenC
	2XbRx+MI+fXCDOyM0SGulWsLtDbhaVfEUZB7Jj/r3/Q59Fg2ipACu+L+zwths96X1dzUIHIb6NbhG
	QGHE96YvSkmBMy9oQB33fFaQWtRP2R0X50VFR8it7DFhv3dBxe9xjA9wCUbQ8lWOYwOtebb8zG1sh
	JRFdN9q0+oQQd2yTFG8Dr33BZXeEysrEMa/7lP0Fy7Dh+XyTUIhJAXD4C/prDoQIlzxj9C0vbbWH+
	XD0rPzmZTrwT1dXGc2Rk+w6+upqRBo6El/X1f+Bgcg4I9eIa/llZsC6bPrAwCAhAcfCFsV5gyZHGP
	lV2S3ypTQxnMY7nKTBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMbCS-005Pnh-8L; Mon, 30 Jan 2023 20:56:24 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMbCP-005PmH-8T; Mon, 30 Jan 2023 20:56:22 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-163adf0cfc4so5542061fac.7;
        Mon, 30 Jan 2023 12:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Um3RKnpjfXkq9mWJo4q+B/UMhf/0ck3dJkEENGHNeio=;
        b=m+NTnP/rw/83W4JhLWY8R+xtep0y80V0kj+F3h5U9frj7ayrFHU1BnRRALLbKV6mBF
         j43Pp/0tZNbcXd9zKCumggNH/VElF4Jkxg2onq3w8ufaMS3ueRuRJaTXxczifJylHQpJ
         YvTfABduGX7EfJLZucLLF06IbWgJJOk9F7TnFyi/CdiY1RY5rwQWN85/0Bv6YjEsocpE
         RpF9K7cgStSJWiDRxGT99IJPumNXVNxtxX+wdqrFvpxZsQye1Bo09+UlH6PN6TTp9ad4
         RqURsrRUrqk78vTJVgo/OPZqkl3X7PjqEM42qzLn6fGiI6E0UpCbRQbjHYzEEioe6lBQ
         iBQA==
X-Gm-Message-State: AFqh2krinHIANeX6dfVQSDMvqnqKALTOS8SVXuRo1WWQ/RT0BgvHbgLq
	FVnKSSVSYLNo67FgMdG12Q==
X-Google-Smtp-Source: AMrXdXuMGOH9ed9QMTQf8yNGL82yCaizoIAWODEuXMz67wCZsEJ3r+tXpXoEgrQSRomNPJajkcwaRA==
X-Received: by 2002:a05:6871:4489:b0:13c:e933:2898 with SMTP id ne9-20020a056871448900b0013ce9332898mr24894159oab.49.1675112179803;
        Mon, 30 Jan 2023 12:56:19 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id gn12-20020a056870d98c00b0013ae39d0575sm5619127oab.15.2023.01.30.12.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 12:56:19 -0800 (PST)
Received: (nullmailer pid 3339510 invoked by uid 1000);
	Mon, 30 Jan 2023 20:56:18 -0000
Date: Mon, 30 Jan 2023 14:56:18 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] nvmem: add generic driver for devices with I/O based
 access
Message-ID: <20230130205618.GB3290808-robh@kernel.org>
References: <20230127175831.26753-1-zajec5@gmail.com>
 <20230127175831.26753-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127175831.26753-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_125621_322637_D41691E6 
X-CRM114-Status: GOOD (  23.06  )
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

T24gRnJpLCBKYW4gMjcsIDIwMjMgYXQgMDY6NTg6MzFQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBX
aXRoIG52bWVtIGxheW91dHMgaW4gcGxhY2Ugd2Ugc2hvdWxkIG5vdyB3b3JrIG9uIHBsYWluIGNv
bnRlbnQgYWNjZXNzCj4gTlZNRU0gZHJpdmVycyAoZS5nLiBJTyBvbmUpLiBBY3R1YWwgTlZNRU0g
Y29udGVudCBoYW5kbGluZyBzaG91bGQgZ28gdG8KPiBsYXlvdXQgZHJpdmVycy4KClN1cmVseSB3
ZSBoYXZlIHNvbWUgZXhpc3RpbmcgZHJpdmVyIHRoYXQgY291bGQgdXNlIHRoaXM/IFBvaW50IGl0
cyAKY29tcGF0aWJsZSBoZXJlIGFuZCBkZWxldGUgdGhlIGRyaXZlci4KCkknbSBub3JtYWxseSBh
Z2FpbnN0ICdnZW5lcmljJyBiaW5kaW5ncywgYnV0IGZvciBnZW5lcmljIGRyaXZlcnMuIEluIAp0
aGlzIGNhc2UsIEkgdGhpbmsgbnZtZW0gaXMgc2ltcGxlIGVub3VnaCB0byBiZSBnZW5lcmljICho
b3BlZnVsbHkpLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+Cj4gLS0tCj4gIGRyaXZlcnMvbnZtZW0vS2NvbmZpZyAgfCAgNyArKysrCj4gIGRy
aXZlcnMvbnZtZW0vTWFrZWZpbGUgfCAgMiArKwo+ICBkcml2ZXJzL252bWVtL2lvLmMgICAgIHwg
NzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9u
dm1lbS9pby5jCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vS2NvbmZpZyBiL2RyaXZl
cnMvbnZtZW0vS2NvbmZpZwo+IGluZGV4IDc4OTcyOWZmN2U1MC4uZTc3YmZlNmViNTJlIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbnZtZW0vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbnZtZW0vS2Nv
bmZpZwo+IEBAIC05MCw2ICs5MCwxMyBAQCBjb25maWcgTlZNRU1fSU1YX09DT1RQX1NDVQo+ICAJ
ICBUaGlzIGlzIGEgZHJpdmVyIGZvciB0aGUgU0NVIE9uLUNoaXAgT1RQIENvbnRyb2xsZXIgKE9D
T1RQKQo+ICAJICBhdmFpbGFibGUgb24gaS5NWDggU29Dcy4KPiAgCj4gK2NvbmZpZyBOVk1FTV9J
Two+ICsJdHJpc3RhdGUgIklPIGFjY2VzcyBiYXNlZCBOVk1FTSBzdXBwb3J0Igo+ICsJZGVwZW5k
cyBvbiBIQVNfSU9NRU0KPiArCWhlbHAKPiArCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9y
dCBmb3IgTlZNRU0gZGV2aWNlcyB0aGF0IGNhbiBiZSBhY2Nlc3NlZAo+ICsJICB1c2luZyBJL08g
bWFwcGluZy4KPiArCj4gIGNvbmZpZyBOVk1FTV9KWjQ3ODBfRUZVU0UKPiAgCXRyaXN0YXRlICJK
WjQ3ODAgRUZVU0UgTWVtb3J5IFN1cHBvcnQiCj4gIAlkZXBlbmRzIG9uIE1BQ0hfSU5HRU5JQyB8
fCBDT01QSUxFX1RFU1QKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9NYWtlZmlsZSBiL2Ry
aXZlcnMvbnZtZW0vTWFrZWZpbGUKPiBpbmRleCA0NDJmOWE0ODc2YTUuLjgyZGIwYTg5YzRkNiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL252bWVtL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9udm1l
bS9NYWtlZmlsZQo+IEBAIC0yMCw2ICsyMCw4IEBAIG9iai0kKENPTkZJR19OVk1FTV9JTVhfT0NP
VFApCQkrPSBudm1lbS1pbXgtb2NvdHAubwo+ICBudm1lbS1pbXgtb2NvdHAteQkJCTo9IGlteC1v
Y290cC5vCj4gIG9iai0kKENPTkZJR19OVk1FTV9JTVhfT0NPVFBfU0NVKQkrPSBudm1lbS1pbXgt
b2NvdHAtc2N1Lm8KPiAgbnZtZW0taW14LW9jb3RwLXNjdS15CQkJOj0gaW14LW9jb3RwLXNjdS5v
Cj4gK29iai0kKENPTkZJR19OVk1FTV9JTykJCQkrPSBudm1lbS1pby5vCj4gK252bWVtLWlvLXkJ
CQkJOj0gaW8ubwo+ICBvYmotJChDT05GSUdfTlZNRU1fSlo0NzgwX0VGVVNFKQkrPSBudm1lbV9q
ejQ3ODBfZWZ1c2Uubwo+ICBudm1lbV9qejQ3ODBfZWZ1c2UteQkJCTo9IGp6NDc4MC1lZnVzZS5v
Cj4gIG9iai0kKENPTkZJR19OVk1FTV9MQU45NjYyX09UUEMpCSs9IG52bWVtLWxhbjk2NjItb3Rw
Yy5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vaW8uYyBiL2RyaXZlcnMvbnZtZW0vaW8u
Ywo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMDc1MjZmZGEw
MzYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvZHJpdmVycy9udm1lbS9pby5jCj4gQEAgLTAsMCAr
MSw3OSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8q
Cj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9tb2RfZGV2aWNldGFibGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5j
bHVkZSA8bGludXgvbnZtZW0tcHJvdmlkZXIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KPiArCj4gK3N0cnVjdCBpb19udm1lbSB7Cj4gKwl2b2lkIF9faW9tZW0gKmJh
c2U7Cj4gK307Cj4gKwo+ICtzdGF0aWMgaW50IGlvX252bWVtX3JlYWQodm9pZCAqY29udGV4dCwg
dW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCj4gK3sKPiArCXN0
cnVjdCBpb19udm1lbSAqcHJpdiA9IGNvbnRleHQ7Cj4gKwl1OCAqZHN0ID0gdmFsOwo+ICsKPiAr
CXdoaWxlIChieXRlcy0tKQo+ICsJCSpkc3QrKyA9IHJlYWRiKHByaXYtPmJhc2UgKyBvZmZzZXQr
Kyk7CgptZW1jcHlfZnJvbWlvCgpyZWFkYigpIGhhcyBhIGJhcnJpZXIgdG8gZW5zdXJlIG9yZGVy
aW5nLiBOb3QgbGlrZWx5IG5lZWRlZCBoZXJlLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
