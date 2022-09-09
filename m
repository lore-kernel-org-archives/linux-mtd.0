Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D02ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5xLyHktxqXbJtiKxSnVIyu9kcNqNj7VewyltbDCFy8=; b=J+HrHuFzd2BIB4
	7drmwGClUyiWf29pryRqvkplgIw2XVUftRQMLiBCp9ChsdKo8qSrYfBr6lX/zvPWEXj426T7IVyYx
	04gOt1w7prXuz5BaothaGw4AJBJII/wRfj9uF8uufhLe7pmaVFpcEiNpvMRXIA8HBTkvCSq8nSjLT
	D9sU/Tp8VgJqBmzWe8w9F3EkxZwr9GMcNNuUC8ZeW46DbSqoBZsBqZK3x0r/VaEmyrz1ZL3p1ckz2
	ev+YYVVjq8SuqZJFxxOMirRV9AxErFEg+fGT43iV6JWKAkNqGaTg4y91uM+KTZDFkhSpF4V5K/d3c
	/rGKc+5XzOLD4eRPLktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZzo-00EvHp-CM; Fri, 09 Sep 2022 09:08:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZzb-00Ev2B-Hq
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2022 09:08:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id bz13so1667111wrb.2
        for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2022 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=V/JKdWLwqyfcF5XL2U75G3plGgDo+tzYRz+CopKoDoo=;
        b=mLoa3aHhb0UwKgQtSVQEWMkDIjd0UwwgQD9OZxJF1JJ52ZHU7sjpaq/nviK/kVklaH
         bsaGXf+k9K5iY0TKbJYfEh0YesR3AZNBdB/9uXrCvQuZo5TcXwHusw15O6SxRrT270/M
         iYeqdXc65YKN7sIRgrpWwXx3cdfHVHsazMcr9IFsnci+u0nFFSV7pGr95daPO5VM15y3
         dQRMYTdfrODbAsOwDS1yw9L3bV7JAJrQY+VGpQEveSoHaDx72JjaTCMRbc8qu6anOmPB
         1ujwvAPyhIKCMw0qenYVJ5xXR0u+1RtRLPYiXB/HXrU1QZXeRgSJCWY6LB2SIX8rwXIz
         KqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=V/JKdWLwqyfcF5XL2U75G3plGgDo+tzYRz+CopKoDoo=;
        b=INSCFFmMVRO0EaQ9HDuE6xy8qxkC9+IsvY2pde0MPs5Z6nf3uTW4GHcrmI15eIrUUE
         V32FsxPO2okv2CEDS6L2IEqfG2S67tglLHzcVKLonYLOngJAvWB5Bvs8Hj5i+oWwnPia
         Gip8cmNCuy+U33Og8RvSQ1FVEqInJlHPzBwchTmwOMOntYO9PltsZTd5Y/3bp986kK2r
         HGS7scolJKpukkhB/63dRhnbkql7ftwo/7E7eYEYMQ0cEKj6PyEUR/VDrAHn2fBRhm7j
         OfUrGiE/hOAighPS+dOkwrGIdck9vS1NhHLWS3XVOI27y8QoXMROdLMx/sie3ieh1gSn
         PP/Q==
X-Gm-Message-State: ACgBeo1Br/aUfNZwYRrvXfCaGBbPZOIwFC34FiM7nx4yOvHnvrYueDGP
	/23fNcj0IIGJ/wfOFwX9RTMPvg==
X-Google-Smtp-Source: AA6agR6CKOuXRCp2u/u7Dt4ZYxSBRyjw4ebI/vZDh00rUYVALqeQgFrPCC7XlvX2DXzrGP9u4otdVg==
X-Received: by 2002:a5d:5c0c:0:b0:228:df98:7516 with SMTP id cc12-20020a5d5c0c000000b00228df987516mr7316497wrb.208.1662714483905;
        Fri, 09 Sep 2022 02:08:03 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id o5-20020a05600c510500b003a31fd05e0fsm16469187wms.2.2022.09.09.02.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:08:03 -0700 (PDT)
Message-ID: <ccb50ec6-a0e9-e700-bd1e-220909fcc788@linaro.org>
Date: Fri, 9 Sep 2022 10:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 13/20] nvmem: core: drop priv pointer in post process
 callback
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-14-michael@walle.cc>
 <373b10aa-f5c8-28b3-88b0-f87a1a40b000@linaro.org>
 <42bc3f6796cc75baafc15c6d2c71ec92@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <42bc3f6796cc75baafc15c6d2c71ec92@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_020807_642202_6665F28F 
X-CRM114-Status: GOOD (  23.95  )
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

CgpPbiAwOS8wOS8yMDIyIDA5OjU4LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMDkt
MDkgMTA6NTIsIHNjaHJpZWIgU3Jpbml2YXMgS2FuZGFnYXRsYToKPj4gT24gMDEvMDkvMjAyMiAy
MzoxOCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEl0IGRvZXNuJ3QgbWFrZSBhbnkgbW9yZSBz
ZW5zZSB0byBoYXZlIGEgb3BhcXVlIHBvaW50ZXIgc2V0IHVwIGJ5IHRoZQo+Pj4gbnZtZW0gZGV2
aWNlLiBVc3VhbGx5LCB0aGUgbGF5b3V0IGlzbid0IGFzc29jaWF0ZWQgd2l0aCBhIHBhcnRpY3Vs
YXIKPj4+IG52bWVtIGRldmljZS4KPj4+Cj4+IFRoaXMgaXMgcmVhbGx5IG5vdCBhIGdvb2QgaWRl
YSB0byByZW1vdmUgdGhlIGNvbnRleHQgcG9pbnRlciwgYXMgdGhpcwo+PiBpcyB0aGUgb25seSB3
YXkgZm9yIGNhbGxiYWNrIHRvIGdldCBjb250ZXh0IHdoaWNoIGl0IGNhbiBtYWtlIHVzZSBvZi4K
PiAKPiBJbiB3aGljaCBjYXNlPyBBcyBJIG1lbnRpb25lZCBpdCdzIHRoZSBwcml2IHRvIHRoZSBu
dm1lbSBkcml2ZXIgYW5kIGFsbAo+IHRoZSAibm9ybWFsIiBjYWxsYmFja3MgY2FuIGRvIHZlcnkg
bGl0dGxlIHdpdGggaXQuIElmIHRoZXJlIHdpbGwgYmUgYQo+IGZ1dHVyZSBuZWVkLCB0aGVuIHRo
ZXJlIHNob3VsZCBiZSBhIHByb3BlciBvcGFxdWUgcG9pbnRlciBhc3NvY2lhdGVkCj4gd2l0aCB0
aGUgbGF5b3V0IGFuZCBub3QgdGhlIG52bWVtIGRyaXZlci4KClllcywgdGhlIG9wYXF1ZSBvYmpl
Y3QgaGVyZSBpcyB0aGUgbGF5b3V0IHByaXYgd2hpY2ggSSBhZ3JlZSB3aXRoLCBidXQgCnJlbW92
aW5nIHRoZSBjb250ZXh0IHRvdGFsbHkgZnJvbSB0aGUgY2FsbGJhY2sgaXMgbm90IGEgZ29vZCBp
ZGVhLgoKV2Ugc2hvdWxkIGhhdmUgc29tZSBjb250ZXh0IHRvIGNhbGxiYWNrcyB0byBiZSBhYmxl
IHRvIGFsbG93IHRoZW0gdG8gCmRlYWwgd2l0aCBzb21lIHByaXZhdGUgaW5mby4KCgotLXNyaW5p
Cgo+IAo+IC1taWNoYWVsCj4gCj4+IEkgd291bGQgcHJlZmVyIHRoaXMgdG8gYmUgbGVmdCBhcyBp
dCBpcy4KPj4KPj4gLS1zcmluaQo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8
bWljaGFlbEB3YWxsZS5jYz4KPj4+IC0tLQo+Pj4gY2hhbmdlcyBzaW5jZSB2MToKPj4+IMKgIC0g
bmV3IHBhdGNoCj4+Pgo+Pj4gwqAgZHJpdmVycy9udm1lbS9jb3JlLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDQgKystLQo+Pj4gwqAgZHJpdmVycy9udm1lbS9pbXgtb2NvdHAuY8KgwqDCoMKgwqAg
fCA0ICsrLS0KPj4+IMKgIGluY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCB8IDUgKysrLS0K
Pj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL2NvcmUuYyBiL2RyaXZlcnMvbnZtZW0v
Y29yZS5jCj4+PiBpbmRleCBkMzFkM2YwYWI1MTcuLjY5MTA3OTY5MzdmOSAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4+PiArKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+
Pj4gQEAgLTE1MjMsOCArMTUyMyw4IEBAIHN0YXRpYyBpbnQgX19udm1lbV9jZWxsX3JlYWQoc3Ry
dWN0IAo+Pj4gbnZtZW1fZGV2aWNlICpudm1lbSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBudm1l
bV9zaGlmdF9yZWFkX2J1ZmZlcl9pbl9wbGFjZShjZWxsLCBidWYpOwo+Pj4gwqDCoMKgwqDCoMKg
wqAgaWYgKGNlbGwtPnJlYWRfcG9zdF9wcm9jZXNzKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmMg
PSBjZWxsLT5yZWFkX3Bvc3RfcHJvY2Vzcyhudm1lbS0+cHJpdiwgaWQsIGluZGV4LAo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjZWxsLT5vZmZz
ZXQsIGJ1ZiwgY2VsbC0+Ynl0ZXMpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJjID0gY2VsbC0+cmVh
ZF9wb3N0X3Byb2Nlc3MoaWQsIGluZGV4LCBjZWxsLT5vZmZzZXQsIGJ1ZiwKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2VsbC0+Ynl0ZXMpOwo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyYykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByYzsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bnZtZW0vaW14LW9jb3RwLmMgYi9kcml2ZXJzL252bWVtL2lteC1vY290cC5jCj4+PiBpbmRleCBh
YzBlZGI2Mzk4ZjEuLjVlODY5ZDRhODFjNSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbnZtZW0v
aW14LW9jb3RwLmMKPj4+ICsrKyBiL2RyaXZlcnMvbnZtZW0vaW14LW9jb3RwLmMKPj4+IEBAIC0y
MjIsOCArMjIyLDggQEAgc3RhdGljIGludCBpbXhfb2NvdHBfcmVhZCh2b2lkICpjb250ZXh0LCB1
bnNpZ25lZCAKPj4+IGludCBvZmZzZXQsCj4+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiDC
oCB9Cj4+PiDCoCAtc3RhdGljIGludCBpbXhfb2NvdHBfY2VsbF9wcCh2b2lkICpjb250ZXh0LCBj
b25zdCBjaGFyICppZCwgaW50IAo+Pj4gaW5kZXgsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAqZGF0YSwgc2l6ZV90IGJ5dGVz
KQo+Pj4gK3N0YXRpYyBpbnQgaW14X29jb3RwX2NlbGxfcHAoY29uc3QgY2hhciAqaWQsIGludCBp
bmRleCwgdW5zaWduZWQgaW50IAo+Pj4gb2Zmc2V0LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHZvaWQgKmRhdGEsIHNpemVfdCBieXRlcykKPj4+IMKgIHsKPj4+IMKgwqDC
oMKgwqAgdTggKmJ1ZiA9IGRhdGE7Cj4+PiDCoMKgwqDCoMKgIGludCBpOwo+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaCAKPj4+IGIvaW5jbHVkZS9saW51eC9u
dm1lbS1wcm92aWRlci5oCj4+PiBpbmRleCA5ZDIyZGM1YTNmYTUuLjQ2MDY3YTZhMDM5NSAxMDA2
NDQKPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAo+Pj4gKysrIGIvaW5j
bHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4+PiBAQCAtMTksOCArMTksOSBAQCB0eXBlZGVm
IGludCAoKm52bWVtX3JlZ19yZWFkX3QpKHZvaWQgKnByaXYsIAo+Pj4gdW5zaWduZWQgaW50IG9m
ZnNldCwKPj4+IMKgIHR5cGVkZWYgaW50ICgqbnZtZW1fcmVnX3dyaXRlX3QpKHZvaWQgKnByaXYs
IHVuc2lnbmVkIGludCBvZmZzZXQsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpOwo+Pj4gwqAgLyogdXNlZCBmb3IgdmVuZG9y
IHNwZWNpZmljIHBvc3QgcHJvY2Vzc2luZyBvZiBjZWxsIGRhdGEgKi8KPj4+IC10eXBlZGVmIGlu
dCAoKm52bWVtX2NlbGxfcG9zdF9wcm9jZXNzX3QpKHZvaWQgKnByaXYsIGNvbnN0IGNoYXIgKmlk
LCAKPj4+IGludCBpbmRleCwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKmJ1Ziwgc2l6ZV90IGJ5dGVzKTsKPj4+
ICt0eXBlZGVmIGludCAoKm52bWVtX2NlbGxfcG9zdF9wcm9jZXNzX3QpKGNvbnN0IGNoYXIgKmlk
LCBpbnQgaW5kZXgsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICpidWYsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgYnl0ZXMpOwo+Pj4gwqDCoMKgIGVudW0gbnZt
ZW1fdHlwZSB7Cj4+PiDCoMKgwqDCoMKgIE5WTUVNX1RZUEVfVU5LTk9XTiA9IDAsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
