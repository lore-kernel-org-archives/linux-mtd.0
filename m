Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E72C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFXad9dmuyyoEkYMemn9e1BrVTY9AzxUk3jF0Dtz06w=; b=Hu3cwVlE/pNGh/
	T9XA6AFPrNaL53ZocbTNVzCatQox7TagsByjWsVncCs/8zLaen7qzCycKrGQ5hX0gbvGbWTtSWALF
	Esv1Neoka9TW5WYzEiRzcYhcdmMhkhXegV5VkF0STxe+Wbd7MsC9YHMYyjqfTd7FaX9+KEkGHXv2n
	7XhE2tfDsy73Hk2/oXr7aGPHjTpnkR+bJ1X+7t5Az8AvVa3cENwvw9Qbeu5wbERP60AyLxj2WO4uN
	UnYrhobkD6uqV43Syx+FBueGEMT0P5WtQoOKtYs3iHrRruNi4pRzXM7rejdA/ijEpGt5HKn2zjjAc
	8fxieaGRd6nMPC7R41QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrMm-008NO5-3K; Mon, 11 Apr 2022 10:33:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndr7b-008Fba-NH
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 10:18:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so3163773wmh.2
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BphwVBJjBpMqmQLv0M0byMqAM4KgSCASp8z4utuZbwA=;
 b=prJsemH7plzs4ZQ+OhsYhu3hT7608gElhw5ZhxOppzBLIPiUA/FHeCJ9bMNPT828kA
 HO2w1JR08WeCaWzfqHGhUwDdHfm6oVVNy53yh81nwhWALEgljzC6TBFyBpRePN4IOoNT
 CKFIRKZyBP+Y7RzqTLEZrsBH+UxwB7ISprZJjbNjTnCZdu1KPOw07grHfREEM41U5M6R
 aKm7rUxlUyuFkG1dSXHr98G0caTRvffUNR2w2eREwzqKMzGt0Lr9LW8oeAvL0FInGvz2
 wTJEBzjSFw7Dfex71IJ1c7D9m5hgY/Y80YPwVLoaoch5EAbDoM9yDM8ZutnTVg5eQt/V
 n7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BphwVBJjBpMqmQLv0M0byMqAM4KgSCASp8z4utuZbwA=;
 b=eXja2V8x1qP9QZgUPgdbsVsgl/3smt5O+bfEVW4TKv4a8H4DTLFwXCSG5aZrHHSh4h
 /rxuMNg7JGZhqOEhvBRA45+EsLJu63nkgwTRjzkGQIBEwa0aGeI7k8HE+Uouu3rrynpc
 BvstIhweAwBdgb3UNAxE+Vt0E5FOYFud6t9Wiy52wLnzUYQdwsVhZxGqNDoQ+xSPoz9X
 WmlXe398UChpmGPIw92nA6LYlhJs/Ds0PAOtjegWQl5FatnHgdD1uravCbAWtYBeJbP8
 q9QshGd8u3CndnyOdC/J808/+c2lvWKy4DM7fAbVYNlP53FwHXsu5O2v4LMOPqrC7fpA
 rHaw==
X-Gm-Message-State: AOAM531C90mZ6fccS1Y5qaBae+t6jjSPUWRgL+UU3x1a2mXumo1vljxJ
 EE6wUu1yaQl6604TNqSG1UKWSg==
X-Google-Smtp-Source: ABdhPJzLlIIfsP2MNbFjOiMDPDX20Kmp7YVg8hJTZYwtZDw7RHhIvSOtAcSltl2it9wRa9TqtX2bAA==
X-Received: by 2002:a05:600c:2258:b0:38e:bbdc:426 with SMTP id
 a24-20020a05600c225800b0038ebbdc0426mr3669276wmm.184.1649672288935; 
 Mon, 11 Apr 2022 03:18:08 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm9662617wry.15.2022.04.11.03.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 03:18:08 -0700 (PDT)
Message-ID: <5c423482-03ee-ab05-b7fa-abac9b37ebb2@linaro.org>
Date: Mon, 11 Apr 2022 11:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] nvmem: add driver handling U-Boot environment
 variables
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220406143225.28107-1-zajec5@gmail.com>
 <20220406143225.28107-2-zajec5@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220406143225.28107-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_031811_851288_F4BEA785 
X-CRM114-Status: GOOD (  14.12  )
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

CgpPbiAwNi8wNC8yMDIyIDE1OjMyLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbnZtZW0vS2NvbmZpZyBiL2RyaXZlcnMvbnZtZW0vS2NvbmZpZwo+IGluZGV4
IDU1NWFhNzdhNTc0ZC4uMTdhNzhiMWJhMDc3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZtZW0v
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbnZtZW0vS2NvbmZpZwo+IEBAIC0zMjQsNCArMzI0LDE2
IEBAIGNvbmZpZyBOVk1FTV9TVU5QTFVTX09DT1RQCj4gICAJICBUaGlzIGRyaXZlciBjYW4gYWxz
byBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUKPiAgIAkgIHdpbGwgYmUg
Y2FsbGVkIG52bWVtLXN1bnBsdXMtb2NvdHAuCj4gICAKPiArY29uZmlnIE5WTUVNX1VfQk9PVF9F
TlYKPiArCXRyaXN0YXRlICJVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFibGVzIHN1cHBvcnQiCj4g
KwlkZXBlbmRzIG9uIEFSQ0hfQkNNNDkwOCB8fCBDT01QSUxFX1RFU1QKClRoaXMgbnZtZW0gcHJv
dmlkZXIgc2VlbXMgbW9yZSBnZW5lcmljLCBzbyB3aHkgQVJDSF9CQ000OTA4IGRlcGVuZGVuY3kg
aGVyZT8KCgotLXNyaW5pCj4gKwlkZXBlbmRzIG9uIE9GICYmIE1URAo+ICsJc2VsZWN0IENSQzMy
Cj4gKwloZWxwCj4gKwkgIFUtQm9vdCBzdG9yZXMgaXRzIHNldHVwIGFzIGVudmlyb25tZW50IHZh
cmlhYmxlcy4gVGhpcyBkcml2ZXIgYWRkcwo+ICsJICBzdXBwb3J0IGZvciB2ZXJpZnlpbmcgJiBl
eHBvcnRpbmcgc3VjaCBkYXRhLiBJdCBhbHNvIGV4cG9zZXMgdmFyaWFibGVzCj4gKwkgIGFzIE5W
TUVNIGNlbGxzIHNvIHRoZXkgY2FuIGJlIHJlZmVyZW5jZWQgYnkgb3RoZXIgZHJpdmVycy4KPiAr
Cj4gKwkgIElmIGNvbXBpbGVkIGFzIG1vZHVsZSBpdCB3aWxsIGJlIGNhbGxlZCBudm1lbV91LWJv
b3QtZW52Lgo+ICsKPiAgIGVuZGlmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
