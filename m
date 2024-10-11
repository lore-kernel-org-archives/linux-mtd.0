Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDEAD24462
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 00:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljQ3PRgLlIC69ZQmLTsnUo8bex6wLj2NbuWVMCn6vc8=; b=35GEpaY5b57++k
	72PTHYo0oundgYW5gIFEhg+8PJYuGWMvnWBjLFtg+Dqvh4JOIrt+KwMr09sFLLGg11UlVz3Y8ZLAr
	TWEyNt6WA3Py8ztfx9oiu1ffiXeLKki6eKI7CVp6lVw/8JZK6O+5ULQPWfpCqYj5CPEjtkldNwzfP
	wlQPLCyVRfdGLMTaRihf2DOopDtLHNhCG+N5+LVN1SQ2evMT4LU0VFOhCojd7pyhvp4n7vc5AaPwZ
	rtgEynwnaRZCIDFBuPeoubXRPeWowiI54CWhARUFFWeV0rn3GWgI3GfOG65tS5Z0S7qDUEzF47XB0
	RQBXItaXkSD1yAZeiC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz3ai-0000000EoGa-3dj0;
	Fri, 11 Oct 2024 00:33:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz3ZL-0000000Eo2o-2TS1;
	Fri, 11 Oct 2024 00:31:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20b49ee353cso13021425ad.2;
        Thu, 10 Oct 2024 17:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728606706; x=1729211506; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tekWhDCN5toSUCUqsw16CTcau0DYG46Y6c1PLwZiPkk=;
        b=TlFyXRFcILtU9s6bn4Dr2cCb/GwJ0lmdjQ7YHCm60bqJN3AyipY+DcB9YxDaGXbGkM
         wysu79Lj58GMHpG5/RiDPKTF3pKP+MizEtgzPFKJa08ZY8o0P8KxxzeseAzc7hk5ZGlM
         9GYztAHarr8UEk14IEk0BDjR89jMb3ta5+RFzQHbAJ0YEZHiHwpiIMCTk62P/SkZlMyy
         UJlXHstTdbFlRwqVTRnL5s+7R36/EMG5UsxR3fDIczZk4OdRjOF1kAoJUJVXRA06kL85
         moolCBEuFTepMzlGPJyQA5Qaby4B60dsZob7dUIJzu0io+AxxYrjIStlYoaiYVfHzlMC
         qS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728606706; x=1729211506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tekWhDCN5toSUCUqsw16CTcau0DYG46Y6c1PLwZiPkk=;
        b=Df2mSUwcdQbSBgIjNjCPvaP7MX+sN60cBqkIhFrZhBOuQZ1neaQAyNnTJM3t7A5Bs6
         PfdD5m955S+IcXI+qODhGCF8/6IWzc9OtNvkcJ6q9BKqrVy6pldOJLuCXA7H+7H8oiy8
         eWLwdHv38Ev0rE7KniAX8NF8QfAZ4+SUzFqXZpXgQKcLvIrqlRHUz+L1oCM4zFQQi+Fc
         XIeqXBBg+bqN71Yjpt+8bhjowD8dnhyu45owve5XRYl5fAcp5Z9HvA407ljr/Vg30Y6L
         7gIHNHjqjkcLL3KByIujAnWllDLcuc0kWNnfy/6Mhj50UCcKfdlE+isR/SZ6RsBi4WlG
         9Y3A==
X-Forwarded-Encrypted: i=1; AJvYcCVEAkyQdZ3mg4E+Y5BjHedYmW/neihUHT/qKnMdXYYc7En4T7U6tzOo5oIPJ37b19pSkWnefMLn/TZ0eDXNDgsA@lists.infradead.org, AJvYcCWVUSMYPTwD3bYb0z9iQt3QlWq7LliOaYb21TSwTFnCSrPsboufBmkdqHy5hD8UH9Vieb3we8fHauGE@lists.infradead.org
X-Gm-Message-State: AOJu0YzYo3nTXGEGlSvmSO3ZdU248/X+BFgxwcqRWcTFfjW8O8Igzm06
	W9fBBN76o3KDQXeWaYoquQ7KpcvXQHOFQShH1CjtKvYCt3F0jcC0
X-Google-Smtp-Source: AGHT+IHUvRrkj3FkAVO0d+YRG+WVM1cjdUJiXP6ZpBkhyprfTNny88vxjsdCgMjhLkqdqnaNMYAmtg==
X-Received: by 2002:a17:902:d491:b0:20b:8aa1:d53e with SMTP id d9443c01a7336-20ca16bdc6bmr9881955ad.44.1728606706355;
        Thu, 10 Oct 2024 17:31:46 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad33b5sm14865485ad.37.2024.10.10.17.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 17:31:45 -0700 (PDT)
Message-ID: <037102f1-3e8d-4b76-a9d2-a23fde7a502a@gmail.com>
Date: Fri, 11 Oct 2024 08:31:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240927020749.46791-1-hpchen0nvt@gmail.com>
 <20240927020749.46791-3-hpchen0nvt@gmail.com>
 <20241001215755.5c2f8465@xps-13>
 <8d5e7755-17fd-4860-bcb0-8c1de04bf0c5@gmail.com>
 <20241008105230.7fd25438@xps-13>
 <02098767-19ce-407e-88be-24c6259c4053@gmail.com>
 <20241009100450.362e3556@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20241009100450.362e3556@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_173147_651061_D0C6F683 
X-CRM114-Status: GOOD (  14.75  )
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

RGVhciBNaXF1ZWwsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKT24gMjAyNC8xMC85IOS4
i+WNiCAwNDowNCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBIdWktUGluZywKPgo+Pj4+Pj4g
KwkJcmV0dXJuIDA7Cj4+Pj4+PiArCX0KPj4+Pj4+ICsKPj4+Pj4+ICsJbWEzNV9uYW5kX2RtYWNf
aW5pdChuYW5kKTsKPj4+Pj4+ICsKPj4+Pj4+ICsJd3JpdGVsKG10ZC0+b29ic2l6ZSwgbmFuZC0+
cmVncyArIE1BMzVfTkZJX1JFR19OQU5EUkFDVEwpOwo+Pj4+Pj4gKwo+Pj4+Pj4gKwkvKiBzZXR1
cCBhbmQgc3RhcnQgRE1BIHVzaW5nIGRtYV9hZGRyICovCj4+Pj4+PiArCWRtYV9hZGRyID0gZG1h
X21hcF9zaW5nbGUobmFuZC0+ZGV2LCAodm9pZCAqKWFkZHIsIGxlbiwgRE1BX0ZST01fREVWSUNF
KTsKPj4+Pj4+ICsJcmV0ID0gZG1hX21hcHBpbmdfZXJyb3IobmFuZC0+ZGV2LCBkbWFfYWRkcik7
Cj4+Pj4+PiArCWlmIChyZXQpIHsKPj4+Pj4+ICsJCWRldl9lcnIobmFuZC0+ZGV2LCAiZG1hIG1h
cHBpbmcgZXJyb3JcbiIpOwo+Pj4+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+PiArCX0KPj4+
Pj4+ICsKPj4+Pj4+ICsJd3JpdGVsKCh1bnNpZ25lZCBsb25nKWRtYV9hZGRyLCBuYW5kLT5yZWdz
ICsgTUEzNV9ORklfUkVHX0RNQVNBKTsKPj4+Pj4gUGxlYXNlIGVuZm9yY2UgYSBkbWEgbWFzayBv
ZiAzMiAoZXZlbiB0aG91Z2ggaXQgbWlnaHQgYmUgdGhlIGZhdWx0KS4KPj4+PiBJIHdpbGwgY2hh
bmdlIGl0IHRvIGRtYV9hZGRyICYgMHhmZmZmZmZmZi4KPj4+IFRoYXQncyBub3Qgd2hhdCBJIG1l
YW4sIEkgYmVsaWV2ZSB5b3Ugc2hvdWxkIHVzZSB0aGUgZG1hIEFQSSB0byBhc2sgZm9yCj4+PiBh
IG1hcHBpbmcgd2l0aGluIHRoZSBhY2Nlc3NpYmxlIDMyLWJpdCBhZGRyZXNzIHJhbmdlLiBUaGUK
Pj4+IGRtYV9tYXBwaW5nX2Vycm9yKCkgY2hlY2sgc2hvdWxkIHJldHVybiBhbiBlcnJvciBpZiB0
aGF0J3Mgbm90IHRoZQo+Pj4gY2FzZS4gVGhlbiB5b3UgY2FuIHNhZmVseSB3cml0ZSB0aGUgdmFs
dWUuCj4+IEhlcmUgaXMgbXkgbWlzdW5kZXJzdGFuZGluZzoganVzdCBmaWxsIGluIHRoZSBkbWFf
YWRkciBkaXJlY3RseSwKPj4KPj4gbm8gdHlwZSBjb252ZXJzaW9uIGlzIG5lZWRlZC4gSSBoYXZl
IGFscmVhZHkgdGVzdGVkIGl0Lgo+IEZZSSwgaXQgb25seSB3b3JrcyBiZWNhdXNlIHRoZSBkZWZh
dWx0IERNQSBtYXNrIGZvciB5b3VyIGRldmljZSBpcyBnb25uYQo+IGJlIDMyIGJpdHMuIElmIHRo
ZSByZWFsaXR5ICh3aGF0IHlvdXIgcGVyaXBoZXJhbCBETUEgY2FuIGRvKSB3YXMKPiBkaWZmZXJl
bnQgdGhhbiB0aGlzLCB5b3Ugd291bGQgaGF2ZSB0byBzZXQgYSBkaWZmZXJlbnQgbWFzayBleHBs
aWNpdGx5Cj4gdG8gbWFrZSBzdXJlIHRoZSBkbWEtbWFwcGluZyBzdGVwIHdvdWxkIG5vdCBwcm92
aWRlIGJ1ZmZlcnMgd2hpY2ggYXJlCj4gb3V0IG9mIHJlYWNoLgoKU3VyZSwgSSB3aWxsIGtlZXAg
dGhhdCBpbiBtaW5kLiBIb3dldmVyLCBkdWUgdG8gdGhlIG1lbW9yeSBhcmNoaXRlY3R1cmUgCm9m
IHRoZSBNQTM1LAoKd2hpY2ggaXMgZGVzaWduZWQgZm9yIGEgbWF4aW11bSBvZiA0R0IsIHRoZXJl
IHdvbuKAmXQgYmUgYW55IHNpdHVhdGlvbiAKZXhjZWVkaW5nIDMyIGJpdHMuCgpUaGFuayB5b3Uu
CgoKPiBUaGFua3MsCj4gTWlxdcOobAoKCkJlc3QgcmVnYXJkcywKCkh1aS1QaW5nIENoZW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
