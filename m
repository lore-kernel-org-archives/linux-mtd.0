Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1EDC197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppUzlfdmu8oXcMYAs0MWVM7BalZKp6FPeyimXrIVDdU=; b=WnEwQYqk9ldeq9
	zoYTyUXIHvKjUtyOy4QdrA0F/0MIFEIBZGQN67AH0SWfAzKeh66JFsAGmJM/lNHYmdKuuxeNtNoWo
	xQMkKnUApNDr08srYy8WtN6I8V6lkLAFS25G8ZW6hgaTnq/K/X/JaMAd010yERxK5sVlxA6CQL3JA
	rEkDmS2NNwYD7q5iYE1rWEJFQnaQADAf0VFTCAvoFP2kdntyxOOMwWGopfXjGjI5R0r8Svjqmon1m
	1eBWEORVstXgz/Hg6aXa0PX9WUHQAhZa8Vr1fQQk36jAF8gKT1g3sRhynxQr0LWH20HdP/YloejTE
	3g2SZQwzYBQeJmPgu07g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uml-00612x-0s;
	Fri, 17 Nov 2023 09:05:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3umi-00612Q-2Y
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 09:05:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507a5f2193bso1836850e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 01:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700211904; x=1700816704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBkpwN+1E/MUJuM4P0pw3yOMql8nx8MIXpikLl81gVE=;
        b=WGj4kRiKiYr0l8yjP4EKIFBqrE0nYBRZniqyHRgA+BFXP6f6ak1y7Ouw2AAKCvRMc9
         y/y8nh5h6gKP4ffVnJsorud00QPOVZzXpxI+fwcfDQIHxWYkkB6Xm7ULYkluqNlYriEH
         0WhnHXNKpcX8nASJCX5F4634S+YGIg8ECUjoBmYmDFVh+amWpYL27V1MKoUFKTqQwBa5
         /paA0mWq6g3418VUhmpWu8hMDcYOY8xOysinn4xLJz0AAdzZigl3e7ZeWpAt9aihaL/W
         6xxsdwqyM5RkARFlDEreTm0mFUP0cPyzTDUaRJ48D0FmSYHezvsitbtOrCkl9H0bKj7Y
         YjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211904; x=1700816704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBkpwN+1E/MUJuM4P0pw3yOMql8nx8MIXpikLl81gVE=;
        b=HTszu5flOGL0iHH9TwC7RCsf2GaoLktR8j4HaoDeIoVO+SVauuYG5nsUnWN+xQ3FA+
         97cOzvueJrltFBkIn6GdNwigX+mqn2ECzr+OnRnftTiLoR8XtlYabWa5vzoPvPd1Vp6g
         5lj870c9+G1bNnRSy9GXIXyJeymlYwFE8zRiU9u/d80p3cIcmyefV3DF53B4s3Vyh7Hd
         0/i0G1PgIO5iqDESGtCDnR8h7yccYQHXrnbOK9QiJwGWsyfpdaqlJQ0njxjfPBPr/doB
         B7gG3wrhdbJ9lXQUEsRM6KzFxjgbXPq6KH5BigZm/MSpt9HXl0XaghpSelCp8QY5GurN
         +i2w==
X-Gm-Message-State: AOJu0YxgpexVwh31IS7QMMM7mAgc8PDVjRIhPIyCe16Zn7vgIABFxJ3Y
	Ax6gxB4b1aCwLrZDxUH9Z46ujQ==
X-Google-Smtp-Source: AGHT+IFI0ErBnFT9sLycjnDA9EqyvmoQCgxqEDVrTyO3IkcrNlcPALyqKmEC3ShToSoMPVDRY23vkg==
X-Received: by 2002:ac2:5293:0:b0:509:30de:414a with SMTP id q19-20020ac25293000000b0050930de414amr1430343lfm.28.1700211903874;
        Fri, 17 Nov 2023 01:05:03 -0800 (PST)
Received: from [192.168.1.111] ([37.251.220.47])
        by smtp.gmail.com with ESMTPSA id t12-20020a19910c000000b00507a96d17b3sm168997lfd.237.2023.11.17.01.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 01:05:03 -0800 (PST)
Message-ID: <45095e0a-2fb9-4653-8845-f7f95d8f640e@linaro.org>
Date: Fri, 17 Nov 2023 09:05:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Michael Walle <michael@walle.cc>, Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com>
 <8eba400c77127b0df74d2a336561a49d@walle.cc>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <8eba400c77127b0df74d2a336561a49d@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_010508_835485_E852A702 
X-CRM114-Status: GOOD (  14.94  )
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

CgpPbiAxMS8xNy8yMyAwODo1NywgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+PiBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvbWFjcm9uaXguYwo+PiBpbmRleCA0OGU1NzBjMDRhZDkuLjIxMTVhMjViMjFjZSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+PiBAQCAtMjYwLDYgKzI2MCwyNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8KPj4gbWFjcm9uaXhfbm9yX3BhcnRzW10gPSB7Cj4+
IMKgwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXg2NnV3MmczNDVneDAiLAo+PiDCoMKgwqDCoMKg
wqDCoMKgIC5uX2JhbmtzID0gNCwKPj4gwqDCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBTUElfTk9S
X1JXVywKPj4gK8KgwqDCoCB9LCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4
YzIsIDB4ODMsIDB4MzkpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXgyNXVtMjUzNDVn
IiwKPj4gK8KgwqDCoCB9LCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4YzIs
IDB4ODAsIDB4MzkpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXgyNXVtMjU2NDVnIiwK
Pj4gK8KgwqDCoCB9LCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4
ODUsIDB4MzkpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXgyNWxtMjU2NDVnIiwKPj4g
K8KgwqDCoCB9LCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4ODAs
IDB4M2EpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXgyNXVtNTEyNDVnIiwKPj4gK8Kg
wqDCoCB9LCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4ODUsIDB4
M2EpLAo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXgyNWxtNTEyNDVnIiwKPj4gK8KgwqDC
oCB9LCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4ODAsIDB4M2Ip
LAo+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXg2NnVtMWc0NWciLAo+PiArwqDCoMKgIH0s
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIC5pZCA9IFNOT1JfSUQoMHhjMiwgMHg4NSwgMHgzYiksCj4+
ICvCoMKgwqDCoMKgwqDCoCAubmFtZSA9ICJteDY2bG0xZzQ1ZyIsCj4gCj4gWW91IG5lZWQgdGhp
cyBiZWNhdXNlIG9mIHRoZSBtYW51ZmFjdHVyZXIgZml4dXAsIGNvcnJlY3Q/IEknZCBsaWtlIHRv
Cj4gYXZvaWQgdGhlc2UgImVtcHR5IiBlbnRyaWVzIGlmIHBvc3NpYmxlLiBUaGUgbmFtZSBpcyB1
c2VsZXNzIHRvIHRoZSBrZXJuZWwKPiBhbmQgc29tZXRpbWVzIGluY29ycmVjdC4gVGhlcmVmb3Jl
LCBhdCBsZWFzdCBkcm9wIGl0IGFuZCBqdXN0IGxpc3QgdGhlCj4gSURzLgo+IAoKSSBhZ3JlZS4K
Cj4gVHVkb3IsIFByYXR5dXNoLCB3aGF0IGRvIHlvdSB0aGluayBhYm91dCBjYWxsaW5nIHRoZSB2
ZW5kb3IgZml4dXBzCj4gYnkganVzdCBsb29raW5nIGF0IHRoZSBKRURFQyBtYW51ZmFjdHVyZXIg
SUQgKmlmZiogdGhlcmUgaXMgbm8KPiBlbnRyeSBpbiB0aGUgZmxhc2hkYj8gQXMgYSBmYWxsYmFj
ayBzbyB0byBzcGVhay4gVGhhdCB3b3VsZCBhbHNvCj4gaGVscCBmb3IgdGhlIGNoaXAgZXJhc2Ug
dG9waWMsIGJlY2F1c2UgSSdkIHByZXN1bWUgdGhlIGNoaXAgZXJhc2UKPiBvcCBpcyB0aGUgc2Ft
ZSBhbW9uZyB0aGUgZmxhc2hlcyBvZiBvbmUgdmVuZG9yLiBTbyB0aGVyZSBjb3VsZCBiZQo+IGEg
dmVuZG9yIGZpeHVwLCB0byBzZXQgdGhlIGNoaXAgZXJhc2Ugb3AuCj4gCgpzb3VuZHMgZ29vZCEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
