Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E356FC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juiqHryBID18QgmnDp4k88vgul2aEGXs9WgROTVUIIs=; b=jZ2kILmrUJovx+
	gkxJwxoSc6f8YuQR5hKrvEdDnF3C2A4aQ25C2irTUdcs3A6TCpGtSUl4ONuqeOFMIlJDqWj5xnt6A
	5+4b7P3m7+vOPUWIKpTc8sYLp/hAbYgRie7rcNg8xK13fQhVAS6D3wh+IJIqlqrWX5vTxrxygtxhk
	6Znwnt4NkbhVh7KQvpLPsyo4xZt+mSgRpDo+rtVuU4q0fwkKnUCoe7/p1ph1jDG3vr5CEP4xhKnAS
	r/M5SeGBe8VGOg+gCylnOpDCPmkt6c5GOrFbKPTYlpqh/Gy8THXYddKNRDLtwDXT8CqM9t3prYLLs
	B4a7NIO34kO2ARo1loMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r00VX-00GpGV-22;
	Mon, 06 Nov 2023 14:23:15 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r00VV-00GpEs-0O
	for linux-mtd@lists.infradead.org;
	Mon, 06 Nov 2023 14:23:14 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c6ed1b9a1cso61074591fa.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Nov 2023 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699280590; x=1699885390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FK2XRduqdWRKvf5BFgftpT4okExFEr8KGaaJShJBNNI=;
        b=eP3AsLh9hlJ9Fxmj5GvG+s+FuOZd7p+MzwZrzxvOJEonW9NLdI7fbZIOxAWUstWHt1
         mE+lrlHCkImnmbX6OuZhtWCWEUJxqJAk8HnYx62F8/IUuu9lRRPiMyMH5bxN77WGZukF
         +fid0CiwRE9FbqboZ6bwwZejpzUDC2J8WRF669RJzztjxkfepS7RqrksJwTkri6Fd4D+
         KYXA63PN317QTmJaOvELtdsMBKgMg4+Kp+hmRri3j4bqrjSR4k8amxUVMvqwaGQK58Ef
         zlZyRnq6vG2CXhKoLWr1k7nW6GNSfIGHtBNA4iQWCx2b7JBb+7RoczyAg3Lf9Big75/+
         MWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699280590; x=1699885390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FK2XRduqdWRKvf5BFgftpT4okExFEr8KGaaJShJBNNI=;
        b=K7/xMCiFK5IkHRVHhUpPLR5hkQW5RdBYL97WJ3iNmspBW+n/J7oQbeaV+gUE9vQ+Eo
         j1qweB8znb/duJOTgUGgt55ZJa4eTacZ5035B2NehksN/ZQ/B/y5/lczmBZVoBXcjMUb
         V3LLVz3/HbFyaz4hQAwSCKmdVPMHSiiAWoIYgJPRhOXvYeQ7m3YCjT3Kn8mms2B7QXJO
         jyCy+spB5jT1XpUqtKEUXhLsL5s+Z+w2hh5mVYEKtLlmA43zMZDMoYus0OrbB31oO3Ai
         rODsy37fesOSIG/awNtqwrWqTxKADm3SZr6s3e6ZYX9sEGlykuHYQL+tLKMvSpcbgSXr
         eeOA==
X-Gm-Message-State: AOJu0YyNgssog40MuOajxf0PJ9KU/cVHipwWiwbsZKeDW4tzktGE7Azr
	vEcxyFtKTyNPWZBEffeAHxi9mA==
X-Google-Smtp-Source: AGHT+IHZIwLRwzy0MuSxC8nWqWe/JkDD/+pZZfSG16duZrOuVz78884zxjdEgkZ0VrlltplhnLefCw==
X-Received: by 2002:a05:6512:25c:b0:502:9bb6:3aba with SMTP id b28-20020a056512025c00b005029bb63abamr21282633lfo.14.1699280589740;
        Mon, 06 Nov 2023 06:23:09 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.12])
        by smtp.gmail.com with ESMTPSA id i16-20020a5d6310000000b0032f983f7306sm9682094wru.78.2023.11.06.06.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 06:23:07 -0800 (PST)
Message-ID: <5c048899-f8ef-43bc-a488-daf4c157f34c@linaro.org>
Date: Mon, 6 Nov 2023 14:23:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Fabio Estevam <festevam@denx.de>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
 <ea846bc8c214836c40c06fd875aee575@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ea846bc8c214836c40c06fd875aee575@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_062313_161567_001C24DA 
X-CRM114-Status: GOOD (  15.81  )
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

CgpPbiAxMS82LzIzIDA5OjM0LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMTEtMDMg
MTQ6NDgsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMDMuMTEuMjAyMyAxNTozNywgRmFi
aW8gRXN0ZXZhbSB3cm90ZToKPj4+IE9uIDAzLzExLzIwMjMgMTA6MjYsIFR1ZG9yIEFtYmFydXMg
d3JvdGU6Cj4+Pgo+Pj4+IFdoaWNoIHZlcnNpb24gb2YgbXRkLXV0aWxzIGFyZSB5b3UgdXNpbmc/
IEkgZ3Vlc3MgdGhlIGZsYXNoLWVyYXNlCj4+Pgo+Pj4gbXRkLXV0aWxzIDIuMS41Cj4+Pgo+Pj4+
IHV0aWxpdHkgaXMgd3JpdHRlbiBpbiBhIGJhZCB3YXkuIFBsZWFzZSB1c2UgdGhlIGZvbGxvd2lu
ZyB3aGlsZSBJIGNoZWNrCj4+Pj4gd2hhdCBmbGFzaF9lcmFzZSBpcyBkb2luZzoKPj4+Pgo+Pj4+
IHRpbWUgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAwIDEzNDIxNzcyOAo+Pj4KPj4+ICJtdGRf
ZGVidWcgZXJhc2UiIGdpdmVzIHRoZSBzYW1lIHRpbWUgYXMgd2VsbDoKPj4+Cj4+PiByb290QG1j
ZGUzMDAwYTp+IyB0aW1lIG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMCAxMzQyMTc3MjgKPj4+
IFsgNDMyMi4xMTQ5NjddIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBub3ItPnJlZ19wcm90byA9IDB4
MDAwMTAxMDEKPj4+IFsgNDMyMi4xMjA4NjFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+Pj4gWyA0
MzIyLjEyNDIxMF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5uYnl0ZXMgPSAweDAxCj4+
PiBbIDQzMjIuMTI5NDc4XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLmJ1c3dpZHRoID0g
MHgwMQo+Pj4gWyA0MzIyLjEzNDkwM10gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5vcGNv
ZGUgPSAweGM0Cj4+PiBbIDQzMjIuMTQwMTU0XSBzcGktbm9yIHNwaTAuMDogKioqKioKPj4+IFsg
NDMyMi4xNDM0OTFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLm5ieXRlcyA9IDB4MDQK
Pj4+IFsgNDMyMi4xNDg4MzFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRo
ID0gMHgwMQo+Pj4gWyA0MzIyLjE1NDM0MV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIu
YnVzd2lkdGggPSAweDAKPj4+IFsgNDMyMi4xNTk3NjFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+
Pj4gWyA0MzIyLjE2MzA5OF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmR1bW15Lm5ieXRlcyA9
IDB4MDAKPj4+IFsgNDMyMi4xNjg1MjRdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kdW1teS5i
dXN3aWR0aCA9IDB4MDAKPj4+IFsgNDMyMi4xNzQxMThdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+
Pj4gWyA0MzIyLjE3NzQzOV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmRhdGEuYnVzd2lkdGgg
PSAweDAwCj4+PiBbIDQzMjIuMTgyOTQ4XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5u
Ynl0ZXMgPSAwCj4+PiBbIDQ0MzkuOTY2MDYwXSBzcGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5y
ZWdfcHJvdG8gPSAweDAwMDEwMTAxCj4+PiBbIDQ0MzkuOTcxOTIwXSBzcGktbm9yIHNwaTAuMDog
KioqKioKPj4+IFsgNDQzOS45NzUyNTJdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5jbWQubmJ5
dGVzID0gMHgwMQo+Pj4gWyA0NDM5Ljk4MDUxMV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNt
ZC5idXN3aWR0aCA9IDB4MDEKPj4+IFsgNDQzOS45ODU5MjhdIHNwaS1ub3Igc3BpMC4wOiAqKioq
KiBvcC5jbWQub3Bjb2RlID0gMHhjNAo+Pj4gWyA0NDM5Ljk5MTE3NF0gc3BpLW5vciBzcGkwLjA6
ICoqKioqCj4+PiBbIDQ0MzkuOTk0NTA0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRkci5u
Ynl0ZXMgPSAweDA0Cj4+PiBbIDQ0MzkuOTk5ODM0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3Au
YWRkci5idXN3aWR0aCA9IDB4MDEKPj4+IFsgNDQ0MC4wMDUzMzVdIHNwaS1ub3Igc3BpMC4wOiAq
KioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHg0MDAwMDAwCj4+PiBbIDQ0NDAuMDExMjcyXSBzcGkt
bm9yIHNwaTAuMDogKioqKioKPj4+IFsgNDQ0MC4wMTQ2MDRdIHNwaS1ub3Igc3BpMC4wOiAqKioq
KiBvcC5kdW1teS5uYnl0ZXMgPSAweDAwCj4+PiBbIDQ0NDAuMDIwMDE4XSBzcGktbm9yIHNwaTAu
MDogKioqKiogb3AuZHVtbXkuYnVzd2lkdGggPSAweDAwCj4+PiBbIDQ0NDAuMDI1NjA2XSBzcGkt
bm9yIHNwaTAuMDogKioqKioKPj4+IFsgNDQ0MC4wMjg5MzddIHNwaS1ub3Igc3BpMC4wOiAqKioq
KiBvcC5kYXRhLmJ1c3dpZHRoID0gMHgwMAo+Pj4gWyA0NDQwLjAzNDQzOF0gc3BpLW5vciBzcGkw
LjA6ICoqKioqIG9wLmRhdGEubmJ5dGVzID0gMAo+Pj4gRXJhc2VkIDEzNDIxNzcyOCBieXRlcyBm
cm9tIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaAo+Pj4KPj4+IHJlYWzCoMKgwqAgM201Ny4z
ODRzCj4+PiB1c2VywqDCoMKgIDBtMC4wMDVzCj4+PiBzeXPCoMKgwqAgM20zNS4yMTFzCj4+Pgo+
Pgo+PiBZZXAsIGl0J3Mgc3RyYW5nZSwgd2UnbGwgaGF2ZSB0byBjaGVjayB3aGF0J3MgaGFwcGVu
aW5nLiBJIGZvdW5kIG15Cj4+IG4yNXEwMCBmbGFzaCwgb24gbXkgc2lkZSBhbGwgaXRzIDQgZGlj
ZSBhcmUgZXJhc2VkIGluIDUgc2VjLsKgIFNGRFAKPj4gZGVmaW5lcyBob3cgbG9uZyB0aGUgZXJh
c2UgZGllIHNob3VsZCB0YWtlLCBzZWUgQkZQVCBkd29yZCAxMS4gWW91IGNhbgo+PiBzdGFydCB3
aXRoIHRoYXQuCj4gCj4gSGFkIHRoZSBmbGFzaCBzb21lIGNvbnRlbnRzIG9yIHdhcyBpdCBhbGwt
ZmY/IE1heWJlIHRoZSBNaWNyb24gZmxhc2ggd2lsbAo+IGNoZWNrIGlmIGFsbCBieXRlcyBhcmUg
b25lIGFuZCB3aWxsIHNraXAgdGhlIGVyYXNlLgoKaXQgaGFkIHNvbWUgY29udGVudHMsIGJ1dCBu
b3QgZGlmZmVyZW50IHRoYW4gMHhmZgo+IAo+IERpZS9DaGlwIGVyYXNlcyB3aWxsIHRha2UgbXVj
aCBsb25nZXIgbW9zdCBvZiB0aGUgdGltZSBhbmQgYXJlIGNvbXBhcmFibGUKPiB0byBpbmRpdmlk
dWFsIHNlY3RvciBlcmFzZXMgKGFzIEZhYmlvIGFsc28gZm91bmQgb3V0KS4gWW91J2xsIHByb2Jh
Ymx5Cj4ganVzdCBzYXZlIHRoZSBvdmVyaGVhZCBvZiB0aGUgaW5kaXZ1ZGFsIGNvbW1hbmRzLgoK
VGhlcmUgaXMgYSBzcGVlZCBiZW5lZml0IGluIHVzaW5nIGRpZSBlcmFzZSBpbnN0ZWFkIG9mIGlu
ZGl2aWR1YWwgc2VjdG9yCmVyYXNlcy4KPiAKPiBJJ3ZlIGxvb2tlZCBhdCB0aGUgTjI1UTAwQUEg
ZGF0YXNoZWV0IGFuZCB0aGUgZXJhc2UgdGltZSB0aGVyZSBpcyAxNTNzCj4gKHR5cCkgZm9yICpv
bmUqIGRpZS4KPiAKCnlvdSBtZWFuIG10MjVxLiBUYWJsZSA0OSBpbgpodHRwczovL3d3dy5taWNy
b24uY29tLy0vbWVkaWEvY2xpZW50L2dsb2JhbC9kb2N1bWVudHMvcHJvZHVjdHMvZGF0YS1zaGVl
dC9ub3ItZmxhc2gvc2VyaWFsLW5vci9tdDI1cS9kaWUtcmV2LWIvbXQyNXFfcWxrdF91XzAxZ19i
YmJfMC5wZGYKCgpFYWNoIGRpZSBoYXMgNjRNQi4gQSBkaWUgaXMgY29tcG9zZWQgb2YgZWl0aGVy
IDE2Mzg0IDRLQiBzZWN0b3JzIG9yIDIwNDgKc2VjdG9ycyBvZiAzMktCLgoKNEtCIHR5cGljYWwg
ZXJhc2UgdGltZSBpcyAwLjA1cywgdGh1cyBhIGRpZSB3aWxsIGJlIGVyYXNlZCBpbiA4MTkuMnMu
CjMyS0IgdHlwaWNhbCBlcmFzZSB0aW1lIGlzIDAuMXMsIHRodXMgYSBkaWUgd2lsbCBiZSBlcmFz
ZWQgaW4gMjA0LjhzLgpkaWUgZXJhc2UgdHlwaWNhbCBlcmFzZSB0aW1lIGlzIDE1M3MuCgo0SyBt
YXggZXJhc2UgdGltZSBpcyAwLjRzLCB0aHVzIGEgZGllIHdpbGwgYmUgZXJhc2VkIGluIDY1NTMu
NnMKMzJLQiBtYXggZXJhc2UgdGltZSBpcyAxLCB0aHVzIGEgZGllIHdpbGwgYmUgZXJhc2VkIGlu
IDIwNDhzLgpkaWUgZXJhc2UgbWF4IHRpbWUgaXMgNDYwcy4KCnNvIHlvdSBtaWdodCBzYXkgdGhh
dCAzMktCIHR5cGljYWwgZXJhc2UgdGltZSBtaWdodCBiZSBjb21wYXJhYmxlIHRvIGEKZGllIGVy
YXNlIGNvbW1hbmQgd2hlbiBlcmFzaW5nIGFuIGVudGlyZSBkaWUgd2l0aCAzMktCIGVyYXNlcywg
YnV0IGV2ZW4Kc28sIGl0IHNob3VsZCBiZSBwcmVmZXJhYmxlIHRvIHVzZSBkaWUgZXJhc2UgY21k
LiBJbnN0ZWFkIG9mIHNlbmRpbmcgYQp3cml0ZSBlbmFibGUgZm9sbG93ZWQgYnkgYSBzZWN0b3Ig
ZXJhc2UgY29tbWFuZCBmb3IgZWFjaCBzZWN0b3IsIHlvdQpjb3VsZCBpbnN0ZWFkIHVzZSBhIHNp
bmdsZSB3cml0ZSBlbmFibGUgZm9sbG93ZWQgYnkgYSBzaW5nbGUgZGllIGVyYXNlCmNvbW1hbmQu
Cgp0YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
