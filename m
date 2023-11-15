Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA9FC07548
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Nov 2023 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKQwqQAPN7Tg0FAjBzqc9sJMTWu15Upn+dCLI8HCBrU=; b=LHbFbLakP+nMiI
	f0muMqBDeIfzaAcmGD/J8ulIhULKz8RA3EAZ4ahkIuIbALoNzunCowfad4w6pEHCY+pq47viuIPeX
	yK39Je+HjgKZi3kh5wowxvFXplhmjEQDUV4WFTZTb+YHgSm82ETKKr4wvh4tGCTdIDKDcKmb0mChO
	6F0Owl2gfbpykhLpxg2hnMDdmfHcil2xj7JGPTXscEO1E/WTkpDLGLvCiG3QnbTZlSn2T33th3M94
	zkKAQgigQE/P7Wxr6jLYtHHYcvYWK+yh9GVJMPWq/hINBCcwYo3XJ23/kiOTTewU1RYiV//7PCBrD
	SpZEk0fZvLKkK7Kl0EBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r39yZ-0006He-0w;
	Wed, 15 Nov 2023 07:06:15 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r39yV-0006Gn-2T
	for linux-mtd@lists.infradead.org;
	Wed, 15 Nov 2023 07:06:13 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9f2a53704aaso52586166b.3
        for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2023 23:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700031969; x=1700636769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHZJuPotwOiVFzpI/K+kvdVGevkr/vPYFImC1JZYRxc=;
        b=CvWw93S56eWQn6cV8GkEGv3+c/J2vlfZIFHmWgqbTojW1uyaikWs2Nph48MuipNrqT
         X041RzsER+Rt8F4A6Vo7Q6jrrDaZorVFrGLX6WwTKhUSuSc0tjhOIJVT4KHaUGKZb0re
         T0XFbzs7Mi0URUSMa1WmPNCXEwo/a+6cFWm+OO1zdecTwG2YPTi4RgRz2m3CWvfvdD0c
         XfXcRIIa0n9VpcMrnBiOPhKRiGRvp8Bzba9kVrwJrF4jqbmKCYGujxJVm8fv7xVZzpGs
         bO1ANL8uIrE/w70WJ+9p3vJgGKeBQsF764QSCvQviKRxbl4PHnSlQxRmp1ryzT0rTxCV
         M3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700031969; x=1700636769;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHZJuPotwOiVFzpI/K+kvdVGevkr/vPYFImC1JZYRxc=;
        b=YdOG2hf/sRsEDcHpkp2GtsP4J7fpB0TPOxVqLSOPj4NOQObWwvJK7cIAck1Odddype
         Uq06xRk827txMmq8ecaFS2CZKbEJZ5MhYihB8JfAAqKFU3WmF2ntsnpYGht1q4rXpCzs
         YpibPN79aCuoFJianiSpxvFpxDmGn6M2704SCY/Bga45HLCUWmraJfBBwCOlNirfxoEH
         rKBjaadO1wffAq+9jxVIbW70J1dLbZ4WW9CFiXH2L4tSY6Xp1u8Lj42Rd5e1OZsginVg
         Z31maFD76ZTYUvxv6b14ONXN057AF0J+cWBlWe8VyPMPYu4w+oJbVmj1frAxTYvELQpw
         3HKA==
X-Gm-Message-State: AOJu0YzdTjEUMfsT9PAeFiq9eT+bQZUh+f579bVfNIKq5VjGIVUpBpA4
	IaClaqFr6dMzDDwv5OsX3S4FnQ==
X-Google-Smtp-Source: AGHT+IGjGQ0H8y/FUvSdPoGYDiq7gyGdWUyUuxcqlHbj/uU3LjGTGExthM805cCXcjk1VkH1Uzp5Zw==
X-Received: by 2002:a17:906:2608:b0:9e2:b250:98ca with SMTP id h8-20020a170906260800b009e2b25098camr9078752ejc.28.1700031969387;
        Tue, 14 Nov 2023 23:06:09 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id mb24-20020a170906eb1800b00992e14af9c3sm6724284ejb.143.2023.11.14.23.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 23:06:08 -0800 (PST)
Message-ID: <1635de27-d723-4b6a-8295-7e00fa899427@linaro.org>
Date: Wed, 15 Nov 2023 09:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
To: Michael Walle <michael@walle.cc>
Cc: Fabio Estevam <festevam@denx.de>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
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
 <5c048899-f8ef-43bc-a488-daf4c157f34c@linaro.org>
 <68510dcd915488fce08170aec52b2c01@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <68510dcd915488fce08170aec52b2c01@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_230611_803917_DC743C25 
X-CRM114-Status: GOOD (  27.24  )
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

CgpPbiAwOS4xMS4yMDIzIDExOjA5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMTEt
MDYgMTU6MjMsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMTEvNi8yMyAwOTozNCwgTWlj
aGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjMtMTEtMDMgMTQ6NDgsIHNjaHJpZWIgVHVkb3Ig
QW1iYXJ1czoKPj4+PiBPbiAwMy4xMS4yMDIzIDE1OjM3LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+
Pj4+PiBPbiAwMy8xMS8yMDIzIDEwOjI2LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+Pj4+Pgo+Pj4+
Pj4gV2hpY2ggdmVyc2lvbiBvZiBtdGQtdXRpbHMgYXJlIHlvdSB1c2luZz8gSSBndWVzcyB0aGUg
Zmxhc2gtZXJhc2UKPj4+Pj4KPj4+Pj4gbXRkLXV0aWxzIDIuMS41Cj4+Pj4+Cj4+Pj4+PiB1dGls
aXR5IGlzIHdyaXR0ZW4gaW4gYSBiYWQgd2F5LiBQbGVhc2UgdXNlIHRoZSBmb2xsb3dpbmcgd2hp
bGUgSQo+Pj4+Pj4gY2hlY2sKPj4+Pj4+IHdoYXQgZmxhc2hfZXJhc2UgaXMgZG9pbmc6Cj4+Pj4+
Pgo+Pj4+Pj4gdGltZSBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGQwIDAgMTM0MjE3NzI4Cj4+Pj4+
Cj4+Pj4+ICJtdGRfZGVidWcgZXJhc2UiIGdpdmVzIHRoZSBzYW1lIHRpbWUgYXMgd2VsbDoKPj4+
Pj4KPj4+Pj4gcm9vdEBtY2RlMzAwMGE6fiMgdGltZSBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGQw
IDAgMTM0MjE3NzI4Cj4+Pj4+IFsgNDMyMi4xMTQ5NjddIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBu
b3ItPnJlZ19wcm90byA9IDB4MDAwMTAxMDEKPj4+Pj4gWyA0MzIyLjEyMDg2MV0gc3BpLW5vciBz
cGkwLjA6ICoqKioqCj4+Pj4+IFsgNDMyMi4xMjQyMTBdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBv
cC5jbWQubmJ5dGVzID0gMHgwMQo+Pj4+PiBbIDQzMjIuMTI5NDc4XSBzcGktbm9yIHNwaTAuMDog
KioqKiogb3AuY21kLmJ1c3dpZHRoID0gMHgwMQo+Pj4+PiBbIDQzMjIuMTM0OTAzXSBzcGktbm9y
IHNwaTAuMDogKioqKiogb3AuY21kLm9wY29kZSA9IDB4YzQKPj4+Pj4gWyA0MzIyLjE0MDE1NF0g
c3BpLW5vciBzcGkwLjA6ICoqKioqCj4+Pj4+IFsgNDMyMi4xNDM0OTFdIHNwaS1ub3Igc3BpMC4w
OiAqKioqKiBvcC5hZGRyLm5ieXRlcyA9IDB4MDQKPj4+Pj4gWyA0MzIyLjE0ODgzMV0gc3BpLW5v
ciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAweDAxCj4+Pj4+IFsgNDMyMi4xNTQz
NDFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHgwCj4+Pj4+IFsg
NDMyMi4xNTk3NjFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+Pj4+PiBbIDQzMjIuMTYzMDk4XSBz
cGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0gMHgwMAo+Pj4+PiBbIDQzMjIu
MTY4NTI0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkuYnVzd2lkdGggPSAweDAwCj4+
Pj4+IFsgNDMyMi4xNzQxMThdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+Pj4+PiBbIDQzMjIuMTc3
NDM5XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5idXN3aWR0aCA9IDB4MDAKPj4+Pj4g
WyA0MzIyLjE4Mjk0OF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmRhdGEubmJ5dGVzID0gMAo+
Pj4+PiBbIDQ0MzkuOTY2MDYwXSBzcGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5yZWdfcHJvdG8g
PSAweDAwMDEwMTAxCj4+Pj4+IFsgNDQzOS45NzE5MjBdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+
Pj4+PiBbIDQ0MzkuOTc1MjUyXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLm5ieXRlcyA9
IDB4MDEKPj4+Pj4gWyA0NDM5Ljk4MDUxMV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5i
dXN3aWR0aCA9IDB4MDEKPj4+Pj4gWyA0NDM5Ljk4NTkyOF0gc3BpLW5vciBzcGkwLjA6ICoqKioq
IG9wLmNtZC5vcGNvZGUgPSAweGM0Cj4+Pj4+IFsgNDQzOS45OTExNzRdIHNwaS1ub3Igc3BpMC4w
OiAqKioqKgo+Pj4+PiBbIDQ0MzkuOTk0NTA0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRk
ci5uYnl0ZXMgPSAweDA0Cj4+Pj4+IFsgNDQzOS45OTk4MzRdIHNwaS1ub3Igc3BpMC4wOiAqKioq
KiBvcC5hZGRyLmJ1c3dpZHRoID0gMHgwMQo+Pj4+PiBbIDQ0NDAuMDA1MzM1XSBzcGktbm9yIHNw
aTAuMDogKioqKiogb3AuYWRkci5idXN3aWR0aCA9IDB4NDAwMDAwMAo+Pj4+PiBbIDQ0NDAuMDEx
MjcyXSBzcGktbm9yIHNwaTAuMDogKioqKioKPj4+Pj4gWyA0NDQwLjAxNDYwNF0gc3BpLW5vciBz
cGkwLjA6ICoqKioqIG9wLmR1bW15Lm5ieXRlcyA9IDB4MDAKPj4+Pj4gWyA0NDQwLjAyMDAxOF0g
c3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmR1bW15LmJ1c3dpZHRoID0gMHgwMAo+Pj4+PiBbIDQ0
NDAuMDI1NjA2XSBzcGktbm9yIHNwaTAuMDogKioqKioKPj4+Pj4gWyA0NDQwLjAyODkzN10gc3Bp
LW5vciBzcGkwLjA6ICoqKioqIG9wLmRhdGEuYnVzd2lkdGggPSAweDAwCj4+Pj4+IFsgNDQ0MC4w
MzQ0MzhdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kYXRhLm5ieXRlcyA9IDAKPj4+Pj4gRXJh
c2VkIDEzNDIxNzcyOCBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAwMDAwMCBpbiBmbGFzaAo+Pj4+
Pgo+Pj4+PiByZWFswqDCoMKgIDNtNTcuMzg0cwo+Pj4+PiB1c2VywqDCoMKgIDBtMC4wMDVzCj4+
Pj4+IHN5c8KgwqDCoCAzbTM1LjIxMXMKPj4+Pj4KPj4+Pgo+Pj4+IFllcCwgaXQncyBzdHJhbmdl
LCB3ZSdsbCBoYXZlIHRvIGNoZWNrIHdoYXQncyBoYXBwZW5pbmcuIEkgZm91bmQgbXkKPj4+PiBu
MjVxMDAgZmxhc2gsIG9uIG15IHNpZGUgYWxsIGl0cyA0IGRpY2UgYXJlIGVyYXNlZCBpbiA1IHNl
Yy7CoCBTRkRQCj4+Pj4gZGVmaW5lcyBob3cgbG9uZyB0aGUgZXJhc2UgZGllIHNob3VsZCB0YWtl
LCBzZWUgQkZQVCBkd29yZCAxMS4gWW91IGNhbgo+Pj4+IHN0YXJ0IHdpdGggdGhhdC4KPj4+Cj4+
PiBIYWQgdGhlIGZsYXNoIHNvbWUgY29udGVudHMgb3Igd2FzIGl0IGFsbC1mZj8gTWF5YmUgdGhl
IE1pY3JvbiBmbGFzaAo+Pj4gd2lsbAo+Pj4gY2hlY2sgaWYgYWxsIGJ5dGVzIGFyZSBvbmUgYW5k
IHdpbGwgc2tpcCB0aGUgZXJhc2UuCj4+Cj4+IGl0IGhhZCBzb21lIGNvbnRlbnRzLCBidXQgbm90
IGRpZmZlcmVudCB0aGFuIDB4ZmYKPj4+Cj4+PiBEaWUvQ2hpcCBlcmFzZXMgd2lsbCB0YWtlIG11
Y2ggbG9uZ2VyIG1vc3Qgb2YgdGhlIHRpbWUgYW5kIGFyZQo+Pj4gY29tcGFyYWJsZQo+Pj4gdG8g
aW5kaXZpZHVhbCBzZWN0b3IgZXJhc2VzIChhcyBGYWJpbyBhbHNvIGZvdW5kIG91dCkuIFlvdSds
bCBwcm9iYWJseQo+Pj4ganVzdCBzYXZlIHRoZSBvdmVyaGVhZCBvZiB0aGUgaW5kaXZ1ZGFsIGNv
bW1hbmRzLgo+Pgo+PiBUaGVyZSBpcyBhIHNwZWVkIGJlbmVmaXQgaW4gdXNpbmcgZGllIGVyYXNl
IGluc3RlYWQgb2YgaW5kaXZpZHVhbCBzZWN0b3IKPj4gZXJhc2VzLgo+Pj4KPj4+IEkndmUgbG9v
a2VkIGF0IHRoZSBOMjVRMDBBQSBkYXRhc2hlZXQgYW5kIHRoZSBlcmFzZSB0aW1lIHRoZXJlIGlz
IDE1M3MKPj4+ICh0eXApIGZvciAqb25lKiBkaWUuCj4+Pgo+Pgo+PiB5b3UgbWVhbiBtdDI1cS4g
VGFibGUgNDkgaW4KPj4gaHR0cHM6Ly93d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9i
YWwvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEtc2hlZXQvbm9yLWZsYXNoL3NlcmlhbC1ub3IvbXQy
NXEvZGllLXJldi1iL210MjVxX3Fsa3RfdV8wMWdfYmJiXzAucGRmCj4+Cj4+Cj4+IEVhY2ggZGll
IGhhcyA2NE1CLiBBIGRpZSBpcyBjb21wb3NlZCBvZiBlaXRoZXIgMTYzODQgNEtCIHNlY3RvcnMg
b3IgMjA0OAo+PiBzZWN0b3JzIG9mIDMyS0IuCj4+Cj4+IDRLQiB0eXBpY2FsIGVyYXNlIHRpbWUg
aXMgMC4wNXMsIHRodXMgYSBkaWUgd2lsbCBiZSBlcmFzZWQgaW4gODE5LjJzLgo+PiAzMktCIHR5
cGljYWwgZXJhc2UgdGltZSBpcyAwLjFzLCB0aHVzIGEgZGllIHdpbGwgYmUgZXJhc2VkIGluIDIw
NC44cy4KPj4gZGllIGVyYXNlIHR5cGljYWwgZXJhc2UgdGltZSBpcyAxNTNzLgo+Pgo+PiA0SyBt
YXggZXJhc2UgdGltZSBpcyAwLjRzLCB0aHVzIGEgZGllIHdpbGwgYmUgZXJhc2VkIGluIDY1NTMu
NnMKPj4gMzJLQiBtYXggZXJhc2UgdGltZSBpcyAxLCB0aHVzIGEgZGllIHdpbGwgYmUgZXJhc2Vk
IGluIDIwNDhzLgo+PiBkaWUgZXJhc2UgbWF4IHRpbWUgaXMgNDYwcy4KPj4KPj4gc28geW91IG1p
Z2h0IHNheSB0aGF0IDMyS0IgdHlwaWNhbCBlcmFzZSB0aW1lIG1pZ2h0IGJlIGNvbXBhcmFibGUg
dG8gYQo+PiBkaWUgZXJhc2UgY29tbWFuZCB3aGVuIGVyYXNpbmcgYW4gZW50aXJlIGRpZSB3aXRo
IDMyS0IgZXJhc2VzLCBidXQgZXZlbgo+PiBzbywgaXQgc2hvdWxkIGJlIHByZWZlcmFibGUgdG8g
dXNlIGRpZSBlcmFzZSBjbWQuIEluc3RlYWQgb2Ygc2VuZGluZyBhCj4+IHdyaXRlIGVuYWJsZSBm
b2xsb3dlZCBieSBhIHNlY3RvciBlcmFzZSBjb21tYW5kIGZvciBlYWNoIHNlY3RvciwgeW91Cj4+
IGNvdWxkIGluc3RlYWQgdXNlIGEgc2luZ2xlIHdyaXRlIGVuYWJsZSBmb2xsb3dlZCBieSBhIHNp
bmdsZSBkaWUgZXJhc2UKPj4gY29tbWFuZC4KPiAKPiBJIHdhcyBqdXN0IGltcGx5aW5nIHRoYXQg
eW91ciA1cyBjaGlwIGVyYXNlIHRpbWUgc291bmRlZCB1bmxpa2VseS4KPiAKPiBJJ20gYWxzbyBz
dGlsbCB1bmRlY2lkZWQgb24gdGhlIHVzZSBvZiBhIGNoaXAvZGllIGVyYXNlIGNvbW1hbmQuIEhv
dwo+IG9mdGVuIGlzIGEgZmxhc2ggZXJhc2VkIGVudGlyZWx5PyBJIGRvbid0IHRoaW5rIHZlcnkg
b2Z0ZW4sIG1heWJlIGR1cmluZwo+IGJvYXJkIG1hbnVmYWN0dXJpbmcuIEFuZCBpcyB0aGF0IHdv
cnRoIHRoZSAobWFpbnRlbmFuY2UpIGVmZm9ydHM/Cj4gCj4gQW55d2F5LCBJIHdvbid0IHN0YW5k
IGluIHRoZSB3YXkgaWYgeW91IGluc2lzdC4KCkkgZG9uJ3QgaW5zaXN0LCBidXQgSSBmZWVsIGl0
IGlzIHdvcnRoIGl0LCB5ZXMuIFdlIGhhdmUgc29tZSBzcGVlZAppbXByb3ZlbWVudCBhbmQgd2Ug
c2hvdWxkIGJlbmVmaXQgb2YgaXQuCgo+IAo+IE5vYm9keSBjb21tZW50ZWQgb24gdGhhdCBzbyBm
YXI6IFRoZSBqZWRlYyBzcGVjIGRvZXNuJ3Qgc2F5IGFueXRoaW5nCj4gYWJvdXQgdGhlIGNoaXAv
ZGllIGVyYXNlIGNvbW1hbmQsIHJpZ2h0PyBUaGVyZSBpcyBhIGZsYWcgd2hpY2gKPiBpbmRpY2F0
ZXMgd2V0aGVyIHRoZSBjaGlwIGhhcyBvbmUgKGluIDhkOGQ4ZCBtb2RlKSBhbmQgdGhlcmUgaXMg
YSBmaWVsZAo+IGZvciBpdHMgZXJhc2UgdGltZSwgYnV0IG5vdCAqd2hhdCogdGhlIGFjdHVhbCBj
b21tYW5kIGlzLiBTdWNoIGEgcGl0eSwKCmplc2QyMTYgbWVudGlvbnMgZGllIGVyYXNlLCBidXQg
ZG9lcyBub3QgcHJvdmlkZSBhbiBvcGNvZGUgZm9yIGl0LiBDaGVjawpCRlBUIGR3b3JkIDExLCBi
aXRzIDMwOjI0LCAiQ2hpcCBFcmFzZSwgVHlwaWNhbCB0aW1lIiwgaXQgc2F5czoKCiJUeXBpY2Fs
IHRpbWUgdG8gZXJhc2Ugb25lIGNoaXAgKGRpZSkuIFVzZXIgbXVzdCBwb2xsIGRldmljZSBidXN5
IHRvCmRldGVybWluZSBpZiB0aGUgb3BlcmF0aW9uIGhhcyBjb21wbGV0ZWQuIEZvciBhIGRldmlj
ZSBjb25zaXN0aW5nIG9mCm11bHRpcGxlIGRpZXMsIHRoYXQgYXJlIGluZGl2aWR1YWxseSBhY2Nl
c3NlZCwgdGhlIHRpbWUgaXMgZm9yIGVhY2ggZGllCnRvIHdoaWNoIGEgY2hpcCBlcmFzZSBjb21t
YW5kIGlzIGFwcGxpZWQuIgoKU28gd2hlbiBhIGZsYXNoIGNvbnNpc3RzIG9mIGEgc2luZ2xlIGRp
ZSwgdGhpcyBpcyB0aGUgZXJhc2UgdGltZSBmb3IgdGhlCmZ1bGwgY2hpcCAoZGllKSBlcmFzZSwg
YW5kIHdoZW4gaXQgY29uc2lzdHMgb2YgbXVsdGlwbGUgZGllcywgaXQncyB0aGUKZGllIGVyYXNl
IHRpbWUuIENoaXAgYW5kIGRpZSBhcmUgdGhlIHNhbWUgdGhpbmcuCgo+IGVzcC4gYmVjYXVzZSB0
aGUgZGllIGVyYXNlIG5vdyBkaWZmZXJzIGFtb25nIHZlbmRvcnMuLiB3aGVyZWFzIHRoZSBjaGlw
Cj4gZXJhc2UgY29tbWFuZCBzZWVtcyB0byBiZSBjb21tb24gYW1vbmcgdmVuZG9ycy4KCkluZGVl
ZCB3ZSBzYXcgdGhhdCB0aGUgZGllIGVyYXNlIG9wY29kZSBkaWZmZXJzIGFtb25nIHZlbmRvcnMs
IG5vdGhpbmcKdGhhdCB3ZSBjYW4gZG8gYWJvdXQgaXQgbm93LiBCdXQgd2UgY2FuIGhhbmRsZSBp
dCBpbiBzb2Z0d2FyZSwgbm8gYmlnIGRlYWwuCgo+IAo+IEJ0dy4gaWYgd2Ugd2FudCB0byBzcGVl
ZCB0aGUgZXJhc2UgdXAgd2Ugc2hvdWxkIG1ha2UgdXNlIG9mIHRoZSBlcmFzZQo+IHJlZ2lvbnMu
IEFGQUlLLCBhdCB0aGUgbW9tZW50IHdlIGRvIChzbG93KSA0ayBlcmFzZXMgbW9zdCBvZiB0aGUg
dGltZQo+IGJlY2F1c2UgZGlzdHJvcyBoYXZlIHRoaXMga2VybmVsIG9wdGlvbiBlbmFibGVkLgo+
IAoKeWVzLCBJIGtub3csIHRoZXJlIHdlcmUgc29tZSBhdHRlbXB0cyBhbmQgdGhlIG1haW4gY29u
Y2VybiB3YXMgaG93IGl0CndpbGwgY29wZSB3aXRoIHdoYXQgZmlsZXN5c3RlbXMgYXJlIHJlcXVp
cmluZy4gQW55d2F5LCBkaWZmZXJlbnQgdG9waWMKdGhhdCBuZWVkcyBzb21lIHRob3VnaHQuCgpD
aGVlcnMsCnRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
