Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE3BC30653
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2024 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUR4G4HEaQr7MkIS3vl2a9tF9I/4sU9qA9EWILdrlZ8=; b=oyrHRquWAgIXxl
	SB8B7ELQ5TKuRziYSH70gozo0seeYvjbkw0wohHNvwteqSrrfTv174kGE4P4910HdRbZ/Ox5qTc12
	ZsNpVOl7bqxvSPtGlGnnHPyKNhgzZ/UJb5nSKqUL/+qmdrFqTyh8adgki5Zy8b1TwNL/cLmKjeTFB
	oJtYpbDtX50G/4sGo1Wgef2H73XjCEZhRmbzQWN41FeWAePaxVWPDVPeD/XY34NecSZ66jGSCZOgn
	1m5rOhklX0In+kP3QQo0vIQlo/3/LuXfWlVWNs/BIctrduH9dpn763uOmUpJnW+fiSCFqDkze1T7t
	XTDcOsDjrRYdJcvm8VZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQRak-00000001moR-12LN;
	Sun, 07 Jul 2024 13:06:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQRad-00000001mnb-466N
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jul 2024 13:06:08 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52ea929ea56so2457511e87.0
        for <linux-mtd@lists.infradead.org>; Sun, 07 Jul 2024 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720357562; x=1720962362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PlaWWgvhWy86HoNyxyxMrimJ+nnuKBX5wNNRa2VfaRM=;
        b=WrIAjBFb2A4XVWPQCXT9hHDTAljrnyNTPhlVguU8k38u13HqpPHi9TPRJTRT6iDXRV
         a9QKhdbjDUpVDpIKm/Rd4Ycfb/r2PQxYXfKLbV6oEh0ZifF93lPUxuPzj8GGmDze3FA1
         vU3ekSCBU6z/vFPNF/lsaChTw1bmohqOlAt9nFOQedY+Bm06XIZN+XAPG05k66LzEcex
         YP5wF0/GTjTXw77KwXlDAdOFwKOZEV/y24eCq2wKaIsYCXyn+Q5qN8l8p1P5zwUrqPxw
         gLl7K8p5iMTd14bDl534WNWp6mDLJpvD/4cU7zCNbgko4txLfWRv9Q+jLGY992+ru7iU
         JigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720357562; x=1720962362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlaWWgvhWy86HoNyxyxMrimJ+nnuKBX5wNNRa2VfaRM=;
        b=AphjYrgiSiBjU+5S/sFx0gv6XnLJKsWBcDwT5P9oi1XNKfXH+Ilg3k65njeRnNJXeb
         ztuiltfDX9rMpLnJ0xUsfE96ZMHwJvwRSIYHkRmyqgjRWHYNlOw3WDwTGuF/UsZHvj+D
         XU4MojFHLBY8cS78+bfTQ6VPYhHdmwIp8K65IXJ3CHA/EPG60BXWAj7REf/2zZdf+sv7
         LE7SP5ejW6KIQbeULPX7sY4wMzqFlThcdEf02fo2OikPQIhQgtq+01A825k7DEa3FE+2
         EADdkGuYy1e7KWVupPjFmSVFpE0nFZ9XZZn7rjugwNoN3KGzE9eGA7/cEz+cny86DIL9
         CxOw==
X-Forwarded-Encrypted: i=1; AJvYcCXQdx0CbLmj8iqKOIvt6xFyvdOzNfjBQZUBDPNpue5wKo4gsWFi/wZORav1w+3l+idgk7T23NURMgI+X7OYUZPIj/MBLeBx5z4pLUeZYQ==
X-Gm-Message-State: AOJu0YyuZpa5ETox6+XUdA8Uxxa/hkAA4epmnAeA8oPnhQW0izuBJB/E
	A9FisJgJSXrccikan80xQCyI2VwdwZNPshATKv7B+NJdmfaT464Y
X-Google-Smtp-Source: AGHT+IEVdYFuUpkKTKY4SQN/EFfsGHXUTrqtN0FlQdO7rRHyMqnVwDOmaXtETwFSbJE8+eDN3f0+bA==
X-Received: by 2002:a05:6512:485b:b0:52c:a5cc:27e7 with SMTP id 2adb3069b0e04-52ea06c902emr7451026e87.66.1720357561486;
        Sun, 07 Jul 2024 06:06:01 -0700 (PDT)
Received: from [192.168.178.20] (dh207-40-28.xnet.hr. [88.207.40.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77dfd03b3fsm151213166b.162.2024.07.07.06.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 06:06:00 -0700 (PDT)
Message-ID: <d58cee6a-156a-4d3c-b80e-a35bd27b4223@gmail.com>
Date: Sun, 7 Jul 2024 15:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPROBLEM_linux-next=5D_drivers/mtd/mtdpart=2Ec=3A?=
 =?UTF-8?B?NjkzOjM0OiBlcnJvcjog4oCYJXPigJkgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG51?=
 =?UTF-8?Q?ll?=
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <47e0483d-6e3d-43a8-9273-25278a4a74b9@gmail.com>
 <0c095098-4b3e-481b-b866-29cacb9f165d@milecki.pl>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <0c095098-4b3e-481b-b866-29cacb9f165d@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_060604_041781_D3DFC556 
X-CRM114-Status: GOOD (  14.92  )
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

SGksIFJhZmHFgiwgb3RoZXJzLAoKT24gNy83LzI0IDA5OjM3LCBSYWZhxYIgTWnFgmVja2kgd3Jv
dGU6Cj4gU29tZSBtb3JlIGRlc2NyaXB0aXZlIHN1YmplY3Qgd291bGQgYmUgbmljZSA6KQoKSSBj
b3VsZCBoYXZlIHN3b3JuIEkgcHV0IGl0IHRoZXJlLCBJIHdhc24ndCBpbnRveGljYXRlZCA6LVAK
Cj4gT24gNy4wNy4yMDI0IDAyOjEwLCBNaXJzYWQgVG9kb3JvdmFjIHdyb3RlOgo+PiBJbiBmaWxl
IGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2FzbS1nZW5lcmljL2J1Zy5oOjIyLAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9i
dWcuaDo4NywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vaW5j
bHVkZS9saW51eC9idWcuaDo1LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZyb20gLi9pbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6NiwKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS9saW51eC9zdHJpbmcuaDozNzQs
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3BhZ2VfMzIuaDoxOCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmcm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZS5oOjE0LAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9j
ZXNzb3IuaDoyMCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC4v
YXJjaC94ODYvaW5jbHVkZS9hc20vdGltZXguaDo1LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3RpbWV4Lmg6NjcsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUvbGludXgvdGltZTMyLmg6
MTMsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuL2luY2x1ZGUv
bGludXgvdGltZS5oOjYwLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZy
b20gLi9pbmNsdWRlL2xpbnV4L3N0YXQuaDoxOSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmcm9tIC4vaW5jbHVkZS9saW51eC9tb2R1bGUuaDoxMywKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIGRyaXZlcnMvbXRkL210ZHBhcnQuYzoxMDoK
Pj4gZHJpdmVycy9tdGQvbXRkcGFydC5jOiBJbiBmdW5jdGlvbiDigJhwYXJzZV9tdGRfcGFydGl0
aW9uc+KAmToKPj4gZHJpdmVycy9tdGQvbXRkcGFydC5jOjY5MzozNDogZXJyb3I6IOKAmCVz4oCZ
IGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCj4+
IMKgwqAgNjkzIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJfZGVidWcoIiVzOiBnb3QgcGFyc2VyICVzXG4iLCBtYXN0ZXItPm5hbWUsCj4+IMKgwqDC
oMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+PiAuL2luY2x1ZGUvbGlu
dXgvcHJpbnRrLmg6Mzc2OjIxOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmHByX2Zt
dOKAmQo+PiDCoMKgIDM3NiB8ICNkZWZpbmUgcHJfZm10KGZtdCkgZm10Cj4+IMKgwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn4KPj4gLi9pbmNs
dWRlL2xpbnV4L2R5bmFtaWNfZGVidWcuaDoyNDg6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmF9fZHluYW1pY19mdW5jX2NhbGxfY2xz4oCZCj4+IMKgwqAgMjQ4IHzCoMKgwqDCoMKg
wqDCoMKgIF9fZHluYW1pY19mdW5jX2NhbGxfY2xzKF9fVU5JUVVFX0lEKGRkZWJ1ZyksIGNscywg
Zm10LCBmdW5jLCAjI19fVkFfQVJHU19fKQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gLi9pbmNsdWRlL2xpbnV4L2R5bmFtaWNfZGVi
dWcuaDoyNTA6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9keW5hbWljX2Z1bmNf
Y2FsbF9jbHPigJkKPj4gwqDCoCAyNTAgfMKgwqDCoMKgwqDCoMKgwqAgX2R5bmFtaWNfZnVuY19j
YWxsX2NscyhfRFBSSU5US19DTEFTU19ERkxULCBmbXQsIGZ1bmMsICMjX19WQV9BUkdTX18pCj4+
IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+
IC4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVnLmg6MjY5Ojk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhfZHluYW1pY19mdW5jX2NhbGzigJkKPj4gwqDCoCAyNjkgfMKgwqDCoMKg
wqDCoMKgwqAgX2R5bmFtaWNfZnVuY19jYWxsKGZtdCwgX19keW5hbWljX3ByX2RlYnVnLMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoCBe
fn5+fn5+fn5+fn5+fn5+fn4KPj4gLi9pbmNsdWRlL2xpbnV4L3ByaW50ay5oOjYxMDo5OiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYZHluYW1pY19wcl9kZWJ1Z+KAmQo+PiDCoMKgIDYx
MCB8wqDCoMKgwqDCoMKgwqDCoCBkeW5hbWljX3ByX2RlYnVnKGZtdCwgIyNfX1ZBX0FSR1NfXykK
Pj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn4KPj4gZHJp
dmVycy9tdGQvbXRkcGFydC5jOjY5MzoyNTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mHByX2RlYnVn4oCZCj4+IMKgwqAgNjkzIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcHJfZGVidWcoIiVzOiBnb3QgcGFyc2VyICVzXG4iLCBtYXN0ZXIt
Pm5hbWUsCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+Cj4+IGRyaXZlcnMvbXRkL210ZHBhcnQuYzo2OTM6NTA6
IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJlCj4+IMKgwqAgNjkzIHzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZGVidWcoIiVzOiBn
b3QgcGFyc2VyICVzXG4iLCBtYXN0ZXItPm5hbWUsCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn4KPj4KPj4gT2ZmZW5kaW5nIGNvbW1p
dCBpcyA1YjY0NGFhMDEyZjY3Lgo+IAo+IEFjdHVhbGx5IGl0IGdvZXMgYmFjayB0byAyMDE1IHRv
IHRoZSBjb21taXQgOGUyYzk5MmI1OWZjICgibXRkOiBtdGRwYXJ0OiBhZGQgZGVidWcgcHJpbnRz
IHRvIHBhcnRpdGlvbiBwYXJzZXIuIikuCgpUaGlzIGlzIGFsc28gY29ycmVjdC4KCj4+IFByb3Bv
c2VkIG5vbi1pbnRydXNpdmUgZml4IHJlc29sdmVzIHRoZSB3YXJuaW5nL2Vycm9yLCBidXQgSSBj
b3VsZCBub3QgdGVzdCB0aGUgY29kZS4KPj4gKEkgZG9uJ3QgaGF2ZSB0aGUgcGh5c2ljYWwgZGV2
aWNlLikKPj4KPj4gLS0tLS0tLS0tLS0tLS0tLS0+PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkcGFydC5jIGIv
ZHJpdmVycy9tdGQvbXRkcGFydC5jCj4+IGluZGV4IDY4MTFhNzE0MzQ5ZC4uODE2NjVkNjdlZDJk
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPj4gKysrIGIvZHJpdmVycy9t
dGQvbXRkcGFydC5jCj4+IEBAIC02OTEsNyArNjkxLDcgQEAgaW50IHBhcnNlX210ZF9wYXJ0aXRp
b25zKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLCBjb25zdCBjaGFyICpjb25zdCAqdHlwZXMsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXBh
cnNlciAmJiAhcmVxdWVzdF9tb2R1bGUoIiVzIiwgKnR5cGVzKSkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJzZXIg
PSBtdGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBlcyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9kZWJ1ZygiJXM6IGdvdCBwYXJzZXIgJXNcbiIs
IG1hc3Rlci0+bmFtZSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJzZXIgPyBwYXJzZXItPm5hbWUgOiBOVUxMKTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwYXJzZXIgPyBwYXJzZXItPm5hbWUgOiAiKG51bGwiKSk7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXBhcnNlcikKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb250aW51ZTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IG10ZF9wYXJ0X2RvX3BhcnNlKHBhcnNlciwgbWFzdGVyLCAmcHBhcnRzLCBk
YXRhKTsKPj4KPj4KPj4gSG9wZSB0aGlzIGhlbHBzLgo+IAo+IEknZCBzYXkgaXQncyBzaW1wbGUg
ZW5vdWdoIHRvIHNlbmQgcGF0Y2ggd2l0aG91dCBhY3R1YWwgaHcgdGVzdGluZy4KCkFjdHVhbGx5
LCBpdCBpc24ndCBzaW1wbGUgZW5vdWdoIHRvIHByZXZlbnQgYSB0eXBvLgoKSGVyZSBpcyB0aGUg
djIuCgpEbyBJIGhhdmUgeW91ciBSZXZpZXdlZC1ieTogb3IgQWNrZWQtYnk6ID8KCkFuZHkgZnJv
bSBJbnRlbCBzYWlkIHRoYXQgaXQgaGFzIHRvIGJlIGdpdmVuIGV4cGxpY2l0bHkuCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210
ZHBhcnQuYwppbmRleCA2ODExYTcxNDM0OWQuLjZmN2UyNTBlZjcxMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbXRkcGFydC5jCisrKyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwpAQCAtNjkxLDcg
KzY5MSw3IEBAIGludCBwYXJzZV9tdGRfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3Rl
ciwgY29uc3QgY2hhciAqY29uc3QgKnR5cGVzLAogICAgICAgICAgICAgICAgICAgICAgICBpZiAo
IXBhcnNlciAmJiAhcmVxdWVzdF9tb2R1bGUoIiVzIiwgKnR5cGVzKSkKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwYXJzZXIgPSBtdGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBlcyk7CiAg
ICAgICAgICAgICAgICAgICAgICAgIHByX2RlYnVnKCIlczogZ290IHBhcnNlciAlc1xuIiwgbWFz
dGVyLT5uYW1lLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcnNlciA/IHBhcnNl
ci0+bmFtZSA6IE5VTEwpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcnNlciA/
IHBhcnNlci0+bmFtZSA6ICIobnVsbCkiKTsKICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFw
YXJzZXIpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7CiAgICAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IG10ZF9wYXJ0X2RvX3BhcnNlKHBhcnNlciwgbWFzdGVyLCAm
cHBhcnRzLCBkYXRhKTsKCi0tCgpCZXN0IHJlZ2FyZHMsCk1pcnNhZCBUb2Rvcm92YWMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
