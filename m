Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6363C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:10:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886D060F5A
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 886D060F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tl3DmEYZykwB0dmiEi6fnXuTudVu4NEg7nQcHDxc8ws=; b=tDVE/2UMnmPERELARe+VImhYzn
	TZis28clHglNJscSVo+avh5XA8bZqrKhyTf4SHt6c/fUbelr3GcMrNmyAZTOz5OhW2Iac6fPo6H4f
	ZZwEHLrB4sGK10ZPsTeYSf4B6QUkvULcQ/P7cbjUW24ki6NeAOnrb+uXYt9+3AUaYa8sZJNvM2SpG
	3A3MwXti662KE/w89lcQLqV64In4Nw9i94SrOUiQyN1UNz7QPV9WEkPtT5ZIXw5ihAqRCpRyUq5Qx
	km3qFfJofs0QShHg4jsy2zEnXIjlqq7lvp6EvMd00no0bLBOZoWRXe/MUOTzrHPFrgtKT5kBXsL24
	qhaIjyYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKha-0067QL-CW; Wed, 03 Nov 2021 18:09:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKh4-0067Je-8b
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 18:09:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id t21so3045316plr.6
 for <linux-mtd@lists.infradead.org>; Wed, 03 Nov 2021 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4bnD5T+OD3RhmUwYkaByAynUXCVmyHL2tgnhkoQX1iI=;
 b=QIssOCA6Nq7OxuD0jRsEMJ34E0PTkpEJPMWmjgPX9gydhFFLV7EXql+lrNM7YgJcGP
 liYwsRhjnnfIsyz4L3W2R+LYZKJc3j4kpnyDKI82N7swb5qzZZkOko+CFlkRUzUqDV9C
 XAoiBYiFyiIrNq8icatdLaaEhQqA1FZoqwlXxEO8LHeslN4v5zSqYwrAXDQD+wCECxOa
 5Y66Oqi+Ffd/iGXHxYEhltzwdyfMVLrzH1R/ZuIBP179t+qrv2TQuGDkE/AL5kKPgzZL
 FG+5mlq2eqrkBNy7w5ow6D0/foYJhX+SeibHtLtNTeccvVYumAgIL4wDS2Y9nJPlqJf0
 o++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4bnD5T+OD3RhmUwYkaByAynUXCVmyHL2tgnhkoQX1iI=;
 b=3NT42CK9BtXoPKW8RmtnjVTRwWaHmPG1lVT6go6Cab8pEUDWbJr5QmQw1lns6cqFzQ
 0ooS2W1yby+YyOMg/XM1g6hUwsABeo4ct9Tm58uV3/tqcICK5re0yaLXHKDLJ2xuowf2
 F7YSy+TTZCqExQfDWkKq1p5ScgkK/z5q1NTOo16Qh82c5dALeSUBPgN4mOpe5O/D6P2N
 RTDIq1B1kvkLbp7pmUameSK2cbkT5A5GxR0uEHiWWRDV+bjN+QXZNklIZ8pVrOZ0j/b4
 tyDb+/W5YEV961PZBmMN4g6ca/f0NdJkswSjc565D21rN7UBfM3lCGrDJvj8J8Y6/9H1
 q41Q==
X-Gm-Message-State: AOAM530HkNsX5yL7Pr+3bMNbVHyf3EYSblfnOLyYODs8QERTn5AcXuVi
 AfE8c5s7t0vj7WMw6nLLVmw=
X-Google-Smtp-Source: ABdhPJwWATjGh96c6yk9qWzUfrnZA9v6IbpRCysBzxQEAQC9xqhE2Eg90RMnDUmJcuLZ4l2n5/WxEw==
X-Received: by 2002:a17:902:f542:b0:141:fa0e:1590 with SMTP id
 h2-20020a170902f54200b00141fa0e1590mr17019740plf.20.1635962941116; 
 Wed, 03 Nov 2021 11:09:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id s20sm3230306pfc.124.2021.11.03.11.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 11:09:00 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: support "no-wp" DT property
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20211103151117.18690-1-zajec5@gmail.com>
 <20211103151117.18690-2-zajec5@gmail.com>
 <c59157a1-2c15-928f-f5a7-fab7128e8dd2@gmail.com>
 <f4694a87a459ac19fea451294fda45ef@milecki.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <03140f48-8447-9431-2bf0-ed75578bdced@gmail.com>
Date: Wed, 3 Nov 2021 11:08:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f4694a87a459ac19fea451294fda45ef@milecki.pl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_110902_353493_09082F5C 
X-CRM114-Status: GOOD (  20.44  )
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

T24gMTEvMy8yMSAxMTowMyBBTSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDIwMjEtMTEt
MDMgMTg6NTAsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4+IE9uIDExLzMvMjEgODoxMSBBTSwg
UmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+Pj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+Pj4KPj4+IFNvbWUgYm9hcmRzIG1heSB1c2UgV1AtY2FwYWJsZSBjb250cm9s
bGVyIGJ1dCBzdGlsbCBoYXZlIFdQIG5vdAo+Pj4gY29ubmVjdGVkLiBUaGlzIGNoYW5nZSBmaXhl
czoKPj4+IFvCoMKgwqAgMS4xNzU1NTBdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFuZDogdGlt
ZW91dCBvbiBzdGF0dXMgcG9sbAo+Pj4gKGV4cGVjdGVkIGMwMDAwMDQwIGdvdCBjMDAwMDBjMCkK
Pj4+IFvCoMKgwqAgMS4xODQ1MjRdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFuZDogbmFuZCAj
V1AgZXhwZWN0ZWQgb24KPj4+IFvCoMKgwqAgMS4yODU1NDddIGJjbTYzMTM4X25hbmQgZmY4MDE4
MDAubmFuZDogdGltZW91dCBvbiBzdGF0dXMgcG9sbAo+Pj4gKGV4cGVjdGVkIGMwMDAwMDQwIGdv
dCBjMDAwMDBjMCkKPj4+IFvCoMKgwqAgMS4yOTQ1MTZdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAu
bmFuZDogbmFuZCAjV1AgZXhwZWN0ZWQgb24KPj4+IFvCoMKgwqAgMS4zOTU1NDhdIGJjbTYzMTM4
X25hbmQgZmY4MDE4MDAubmFuZDogdGltZW91dCBvbiBzdGF0dXMgcG9sbAo+Pj4gKGV4cGVjdGVk
IGMwMDAwMDQwIGdvdCBjMDAwMDBjMCkKPj4+IFvCoMKgwqAgMS40MDQ1MTddIGJjbTYzMTM4X25h
bmQgZmY4MDE4MDAubmFuZDogbmFuZCAjV1AgZXhwZWN0ZWQgb24KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+PiAtLS0KPj4+IMKgZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDMgKystCj4+PiDCoDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+Pj4gYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+PiBpbmRleCBmNzU5Mjk3ODNi
OTQuLjhiNjE2NzQ1N2YwYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMKPj4+IEBAIC03MTQsNyArNzE0LDggQEAgc3RhdGljIGludCBicmNtbmFuZF9y
ZXZpc2lvbl9pbml0KHN0cnVjdAo+Pj4gYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKPj4+IMKg
wqDCoMKgIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNTAwKQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoCBjdHJsLT5mZWF0dXJlcyB8PSBCUkNNTkFORF9IQVNfMUtfU0VDVE9SUzsKPj4+Cj4+PiAt
wqDCoMKgIGlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNzAwKQo+Pj4gK8KgwqDCoCBpZiAo
Y3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDcwMCAmJgo+Pj4gK8KgwqDCoMKgwqDCoMKgICFvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2woY3RybC0+ZGV2LT5vZl9ub2RlLCAibm8td3AiKSkKPj4+IMKgwqDC
oMKgwqDCoMKgwqAgY3RybC0+ZmVhdHVyZXMgfD0gQlJDTU5BTkRfSEFTX1dQOwo+Pgo+PiBTaG91
bGQgbm90IHRoaXMgYmUgYSBsb2dpY2FsIE9SIGhlcmUgb3IgcmF0aGVyLCBzaG91bGQgaXQgYmUg
bW92ZWQgb3V0Cj4+IG9mIHRoZSBjaGVjayBvbiBjdHJsLT5uYW5kX3ZlcnNpb24gZW50aXJlbHk/
IFdoYXQgcmV2aXNpb24gb2YgdGhlIE5BTkQKPj4gY29udHJvbGxlciBkbyB5b3UgaGF2ZSBvbiB0
aGF0IGNoaXA/Cj4gCj4gSXQncyBOQU5EIGNvbnRyb2xsZXIgdmVyc2lvbiAweDA3MDEgKHY3LjEp
IGFuZCBJIHRoaW5rIGl0J3MgY29ycmVjdC4KPiAKPiBJIHRoaW5rIHdlIHdhbnQgV1AgZW5hYmxl
ZCBvbiByZXYgNy4wKyB1bmxlc3MgaXQgd2FzIGV4cGxpY2l0bHkgZGlzYWJsZWQuCgpUcnVlLCBJ
IHNvbWVob3cgZ290IGNvbmZ1c2VkIGFib3V0IHRoZSBuZWdhdGl2ZSBsb2dpYywgc28gbWF5YmUg
d2UgbmVlZAp0byBjb21iaW5lIHRoZSBsb2dpYyBvZiBhbGwgb2YgdGhlc2UgbGluZXMgaW50byBh
IHNpbmdsZSBvbmU6CgoJaWYgKChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHg3MDAgfHwKb2ZfcHJv
cGVydHlfcmVhZF9ib29sKGN0cmwtPmRldi0+b2Zfbm9kZSwgImJyY20sbmFuZC1oYXMtd3AiKSkg
JiYKIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChjdHJsLT5kZXYtPm9mX25vZGUsICJuby13cCIpCgpz
dWNoIHRoYXQgaXQgaXMgY2xlYXJlciwgS2FtYWwsIHdoYXQgZG8geW91IHRoaW5rPwotLSAKRmxv
cmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
