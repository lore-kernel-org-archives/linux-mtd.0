Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F045C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtAu7p2FVUQ1mNDPlJjhwIb/W/HBRHgyC9PhlnT12aE=; b=bLJbkEnvB5vxoQ
	WOvefhyjYi9HE0lkMbOvgD3LTzYZuSEGsgpkGsgkI9Lgf0XdfX6tkWqbwygP9ETxxq/ONZOsBUZi0
	AuT0o05bj0uGnvrAQf6Y0ThGBpYcNwsDHQk8Q17oEP0i4q15WPbRLLiSzYBAf5GbS4SGwOMd4Fppj
	vjTI2cCdbwtrX0J459b0nOTDOHh83zDLfF9Fx2lcLS1xRZhPX95Bu6xJX/q4gz001idtNfCLM3tfg
	u2Eoue9HzNPL+PPcKT/h8BEotcXgJvlP3PwkBLfK+56puT39PkqNCdf2t8JNZACnvwo0nOCBmvO1t
	Qns7ToBx2YmCAEfZP9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndFRZ-003cST-Vk; Sat, 09 Apr 2022 18:04:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndFRV-003cS9-NE
 for linux-mtd@lists.infradead.org; Sat, 09 Apr 2022 18:04:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id p189so7459797wmp.3
 for <linux-mtd@lists.infradead.org>; Sat, 09 Apr 2022 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x+ZHRh6e82n5qKqvhVpyoJ5hZgFMYZM/zhsoK6Nbo1Q=;
 b=YKOP6jVnRkzeNqGA3VvHJwzmjyDK08GWK/YjBh5+xYw1W4RUHgOuaZJpf6wWfZbmwX
 UnS1BuFb+tfQ/sRE1kJdPw23yE9cepOTX12r+AXiVyTszFDEozTaL7SrgMHi+EyS0izg
 zq3+87+Kl8eGRCbCwdSeW1JXQ5R/VEg1MEeRrdoy5pyNAgP2Tr82+UVwvFHDA2WU1SJT
 R9SFIeBollfKOJiRQiY74UvCDqlOHd57iqXVJ2LfY2YhWhkOyc+1wL3OzXwEw+0QOE4w
 G3CLiYfPmFEVtwmzmv4OQBY12+MYpEOQoWC3OIfpyBnNKji7gDbyoVRVkMW3SdTtB/PS
 ABVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x+ZHRh6e82n5qKqvhVpyoJ5hZgFMYZM/zhsoK6Nbo1Q=;
 b=pTkBGL9BqYhNgXnpZKFYIqyfvum7Jtf6JDamoYjwSBMBFkev664mP+bWluxDSysanH
 kcQAfytDYmhwdPxR8vRKw5pOBwavJGeaqRJ8PfmrkWRz57n7xtE/aXTkZjvjV0cnZ5h/
 apkSC/bll2YIIH40c4tWVoMjO1YtKTbMmhfN9T7ekJuI4BboQz+vBA7lX6sOosgkJveU
 2XONaVnDLSU+PCUgs2R8ICsN3HnCUU3WoLusrVRC+V9AyPBszJ0qJvgmsvGXpVVv1zq7
 mGw+qDMyMtC8e0uQ4KZGWnZcaEIGEtac31YAmbYFjjulBj9Ys3TM9gmz+zURMru7bmhx
 IRaA==
X-Gm-Message-State: AOAM533WuPby/iqVHRnexqxgkS/fGNysU6aE4aFVbN3Xs2IcIka2D9Zt
 Ijer6VWKluAVxz7+Mw/85FM=
X-Google-Smtp-Source: ABdhPJwLn4H230P5wbpYMvAJbu0DCavPV2PqvXJ+80n8Ppagqwl4TVLKYE2L9RCL3YmS05IwqaKrDA==
X-Received: by 2002:a05:600c:213:b0:38e:6379:af70 with SMTP id
 19-20020a05600c021300b0038e6379af70mr21401923wmi.157.1649527448742; 
 Sat, 09 Apr 2022 11:04:08 -0700 (PDT)
Received: from ?IPV6:2001:470:9898:9eac:f1cb:6e16:4fc0:c830?
 ([2a09:bac0:79::82a:3425]) by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm13715098wmz.43.2022.04.09.11.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:04:08 -0700 (PDT)
Message-ID: <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
Date: Sat, 9 Apr 2022 21:04:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Content-Language: en-US
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
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_110413_923179_D3F4F75F 
X-CRM114-Status: GOOD (  17.97  )
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

T24gNC85LzIwMjIgMzo0MyBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4+IEknbSBu
b3Qgc3VyZSB0aGF0ICJzY3BhcnQtaWQiIGlzIG5lY2Vzc2FyeSBoZXJlLiAic2VyY29tbSxzYy1w
YXJ0aXRpb25zIgo+PiBpcyBuZWNlc3NhcnkuIEknbSBnb2luZyB0byBhZGQgdmVuZG9yIHByZWZp
eCBpbiBhIHNlcGFyYXRlIHBhdGNoLiBJcyB0aGlzCj4+IG9rPwo+IFllcy4KClRoYW5rcyEKCj4+
Pj4gK3JlcXVpcmVkOgo+Pj4+ICsgIC0gY29tcGF0aWJsZQo+Pj4gTWlzc2luZyByZWcuCj4+IHJl
ZyBpc24ndCByZXF1aXJlZC4gUGFyc2VyIGNhbiByZWFkIHBhcnRpdGlvbiBvZmZzZXRzIGFuZCBz
aXplcyBmcm9tCj4+IFNDIFBBUlQgTUFQIHRhYmxlLiBPciBkbyB5b3UgbWVhbiBzb21ldGhpbmcg
ZWxzZT/CoCBBbGwgaXMgb2sKPj4gd2l0aG91dCByZWcgZGVmaW5pdGlvbiBpbiAiRXhhbXBsZSIg
KGV4Y2VwdCB0aGUgd2FybnMgdGhhdCByZWcgcHJvcGVydHkKPj4gaXMgbWlzc2luZykuCj4gcmVn
IG1pZ2h0IG5vdCBiZSByZXF1aXJlZCBmb3IgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBidXQgaXQg
aXMgcmVxdWlyZWQKPiBieSBkZXZpY2V0cmVlIGZvciBldmVyeSBub2RlIHdpdGggdW5pdCBhZGRy
ZXNzLiBEbyB5b3UgZXhwZWN0IGhlcmUgbm9kZXMKPiB3aXRob3V0IHVuaXQgYWRkcmVzc2VzPwpP
bmx5ICJwYXJ0aXRpb25zIiBub2RlIGhhcyBubyB1bml0IGFkZHJlc3MuIEFsbCBzdWJub2Rlc8Kg
IGhhdmUgdW5pdAphZGRyZXNzZXMgYW5kIHRoZXJlZm9yZSBoYXZlIHRvIGhhdmUgcmVnIHByb3Bl
cnR5LiBJJ3ZlIGp1c3QgcmVhbGl6ZWQKdGhhdCAiZml4ZWQtcGFydGl0aW9ucy55YW1sIiBpcyBh
bG1vc3QgbXkgY2FzZS4gSXQgbG9va3MgbGlrZSBJIGNhbgpjb3B5J24ncGFzdGXCoCAicmVxdWly
ZWQiIGFuZCAiKnByb3BlcnRpZXMiLgpEbyB5b3UgbWluZCBpZiBJIGRvbid0IHJlaW52ZW50IHRo
ZSB3aGVlbCBhbmQgcmV1c2UgdGhpcyBnb29kCnByYWN0aWNlPwoKSGVyZSdzIHdoYXQgSSBnb3Qg
KG5vIGFueSB3YXJuaW5ncyBhcHBlYXJzKToKCi0tLQrCoC4uLi9tdGQvcGFydGl0aW9ucy9zZXJj
b21tLHNjLXBhcnRpdGlvbnMueWFtbCB8IDcwICsrKysrKysrKysrKysrKysrKysKwqAxIGZpbGUg
Y2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQrCoGNyZWF0ZSBtb2RlIDEwMDY0NApEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRp
b25zLnlhbWwKCmRpZmYgLS1naXQKYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwKYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25z
LnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5jYjE3MWEwMzgz
YWEKLS0tIC9kZXYvbnVsbAorKysKYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwKQEAgLTAsMCArMSw3MCBA
QAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZQorJVlBTUwgMS4yCistLS0KKyRpZDoKaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRk
L3BhcnRpdGlvbnMvc2VyY29tbSxzYy1wYXJ0aXRpb25zLnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNlcmNvbW0g
UGFydGl0aW9ucworCitkZXNjcmlwdGlvbjogfAorwqAgU2VyY29tbSBpcyBvbmUgb2YgaGFyZHdh
cmUgbWFudWZhY3R1cmVycyBwcm92aWRpbmcgU29DcyB1c2VkIGluIGhvbWUKcm91dGVycy4KK8Kg
IFRoZSBTZXJjb21tIHBhcnRpdGlvbiBtYXAgdGFibGUgY29udGFpbnMgaW5mb3JtYXRpb24gYWJv
dXQgbm9uLXN0YW5kYXJkCivCoCBwYXJ0aXRpb24gb2Zmc2V0cyBhbmQgc2l6ZXMgKGRlcGVuZGlu
ZyBvbiB0aGUgYmFkIGJsb2NrcyBwcmVzZW5jZSBhbmQKdGhlaXIKK8KgIGxvY2F0aW9ucykuIFBh
cnRpdGlvbiBtYXAgaXMgdXNlZCBieSBtYW55IFNlcmNvbW0tYmFzZWQgUmFsaW5rIGRldmljZXMK
K8KgIChlLmcuIEJlZWxpbmUsIE5ldGdlYXIpLgorCittYWludGFpbmVyczoKK8KgIC0gTWlraGFp
bCBaaGlsa2luIDxjc2hhcnBlcjIwMDVAZ21haWwuY29tPgorCitwcm9wZXJ0aWVzOgorwqAgY29t
cGF0aWJsZToKK8KgwqDCoCBjb25zdDogc2VyY29tbSxzYy1wYXJ0aXRpb25zCisKK8KgICIjYWRk
cmVzcy1jZWxscyI6IHRydWUKKworwqAgIiNzaXplLWNlbGxzIjogdHJ1ZQorCityZXF1aXJlZDoK
K8KgIC0gIiNhZGRyZXNzLWNlbGxzIgorwqAgLSAiI3NpemUtY2VsbHMiCisKK2FkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiB0cnVlCisKK2V4YW1wbGVzOgorwqAgLSB8CivCoMKgwqAgcGFydGl0aW9ucyB7
CivCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNlcmNvbW0sc2MtcGFydGl0aW9ucyI7CivC
oMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsKK8KgwqDCoMKgwqDCoMKgICNzaXpl
LWNlbGxzID0gPDE+OworCivCoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb25AMCB7CivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGxhYmVsID0gInUtYm9vdCI7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDAgMHgxMDAwMDA+OworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY3BhcnQtaWQgPSA8
MD47CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWQtb25seTsKK8KgwqDCoMKgwqDCoMKgIH07
CisKK8KgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkAxMDAwMDAgeworwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsYWJlbCA9ICJkeW5hbWljIHBhcnRpdGlvbiBtYXAiOworwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MHgxMDAwMDAgMHgxMDAwMDA+OworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
Y3BhcnQtaWQgPSA8MT47CivCoMKgwqDCoMKgwqDCoCB9OworCivCoMKgwqDCoMKgwqDCoCBmYWN0
b3J5OiBwYXJ0aXRpb25AMjAwMDAwIHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAi
RmFjdG9yeSI7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDIwMDAwMCAweDEwMDAw
MD47CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjcGFydC1pZCA9IDwyPjsKK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmVhZC1vbmx5OworCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAibnZtZW0tY2VsbHMiOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MT47CisKK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFjYWRkcl9mYWN0b3J5XzIxMDAwOiBtYWNhZGRyQDIxMDAw
IHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgyMTAwMCAweDY+Owor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9OworwqDCoMKgwqDCoMKgwqAgfTsKKworwqDCoMKgwqDC
oMKgwqAgLyogLi4uICovCisKK8KgwqDCoCB9OwotLSAKCiguLi4pCgo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKCi0tIApCZXN0IHJlZ2FyZHMsCk1pa2hhaWwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
