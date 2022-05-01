Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B147DC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  1 May 2022 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzSSDCtXpgjCBSAQN92nUSHLIvOryQ+89ntVmiRaBMc=; b=nzNnyxKSH4llsf
	IN4pn2aq0rRa0QBTQxW7Y//UFRaPq9LuGpAujqaSvO/9UDLI5HinGJycC03mNYj1IvCs61TY/imt0
	C+QU5YL6iY1h38LizCBuTldy6b11Z6KATGSP8diTTJTMHX+S7oEA5vTHo+5OkF/3bNp0wOCJ1Ebq5
	/M7T8lLHlvdy97zKDfVhwl+FMBCsGu9ny+j2iqzTqI+Jgw4Y2ebIF4CwHvAYCm5eoHE74o7Cm/Z3n
	uQ5GFUvZh2VrOYea/RBqLPGmM8qQY2dYvPJXKclUwnlCs7BO86GzdtNSSw5bUQa4qvlRAlMzS62qM
	QW4mXATT6zDWarreoK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlAvY-00GT7k-06; Sun, 01 May 2022 14:52:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlAvS-00GT7C-J4
 for linux-mtd@lists.infradead.org; Sun, 01 May 2022 14:51:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id m20so23653847ejj.10
 for <linux-mtd@lists.infradead.org>; Sun, 01 May 2022 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=giNJtnXNgjus22Md6SDUlBihs7U3KtlYNlVQZ8xutao=;
 b=a2R50dzLINR25axZ4jeR88HH5E2Nq307jUkh0Fm5GrUuuRZWzUqA4Q5Hcg1nz8NZc1
 DJxtx5/pE/tUY54O2NEmiZke2aFCxfiJy2CzXyM38kTCegrxmEM7fJZOmq6ftT4KK4Ox
 VdGDODvbOAA6OjKoCjwOV/wcXudhvsbdlJykUnA5bwPlDv2gMYRSK0uyVMnIf+KhDKr3
 /mz52xADn7825LNNfzJ8WXSFZArwfq2FQMx2cN9b9bNepacrtjkulh1LW2V/hR0FMaRy
 AaA/tidfxqpRattY6gdS91nAKByH52NvlzonTRWrRjS9bdMN5abTt1B4ULrY9McMdJG+
 k57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=giNJtnXNgjus22Md6SDUlBihs7U3KtlYNlVQZ8xutao=;
 b=JhsluTQuvraTFfgzHuy08Ycubk+DI5e6//nxqRYNgrXy8iqLFF7Gh5N0FAOYMvPKBU
 LqGua6MUg63oXihl8S123SbAk+NFmBF504hEYsq+PgzFbEdNTM0u7RwJMpbNdV7ZGhmF
 co08r+o0V6sx0dvjEvWnNfnfiJF/qVewdvBzWiOYmdxxNShs8nwSu5f200mfoceGUI07
 BDKJ++DRrRsMYuCU7sD3gaeuh+A89TFKVEtAV8xB/N1bpz3nQm5wSgsjPj1sNWXNZ9b1
 nZtWjOAXrkb2lhqFkcgcg5KEcI6m0G2CPfGT7AEMgDoXQ6dwPkXnJqUJmffQN4a+XPoh
 paqQ==
X-Gm-Message-State: AOAM530Upojz3E9UBrOHN8cSMmvJqVQ1gCEmUmOaiRRz91C8M6wcGyBX
 j7anpX0sSTKpMz3n8/pF2bIQhFh8aDqIhBhex4c=
X-Google-Smtp-Source: ABdhPJzAO4OVzB2zKnvo1AwV1LuTGcHkEWaqmZKCH4RV4X60K2GobawEweLrCj7L0xaq2A5NPwSIoQ==
X-Received: by 2002:a17:906:559:b0:6f3:8ba6:39c8 with SMTP id
 k25-20020a170906055900b006f38ba639c8mr7852405eja.486.1651416712663; 
 Sun, 01 May 2022 07:51:52 -0700 (PDT)
Received: from ?IPV6:2a06:a003:501a:a7ce:5405:3d01:56ff:a60d?
 ([2a06:a003:501a:a7ce:5405:3d01:56ff:a60d])
 by smtp.gmail.com with ESMTPSA id
 de46-20020a1709069bee00b006f3ef214e5asm2667120ejc.192.2022.05.01.07.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 07:51:52 -0700 (PDT)
Message-ID: <909094fd-ded0-38f9-b374-dd5f7b63e298@gmail.com>
Date: Sun, 1 May 2022 17:51:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
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
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
 <bd533827-b575-caad-c230-af060851b231@gmail.com>
 <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
 <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
 <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
 <1c19faf9-fc1c-9adf-d038-97b673a8f0be@gmail.com>
 <a84df850-149e-9656-43fa-1f040368a9f1@linaro.org>
 <0450d781-c506-c28e-a0e5-435bee16721f@gmail.com>
 <2e51842a-d2c9-8953-13aa-02ad3abb3f14@linaro.org>
 <ee5f293a-e59a-03d8-d9e4-ef35d33b5383@gmail.com>
 <6c3ba4a7-80b0-5fd1-eb08-1f9e256b02c4@linaro.org>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <6c3ba4a7-80b0-5fd1-eb08-1f9e256b02c4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_075155_254145_428B3672 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNS8xLzIwMjIgMTE6MTcgQU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cgo+IE9uIDMw
LzA0LzIwMjIgMjA6NTQsIE1pa2hhaWwgWmhpbGtpbiB3cm90ZToKPj4gwqBwYXR0ZXJuUHJvcGVy
dGllczoKPj4gwqDCoCAiQFswLTlhLWZdKyQiOgo+PiAtwqDCoMKgICRyZWY6ICJwYXJ0aXRpb24u
eWFtbCMiCj4+ICvCoMKgwqAgYWxsT2Y6Cj4+ICvCoMKgwqDCoMKgIC0gJHJlZjogInBhcnRpdGlv
bi55YW1sIyIKPj4gK8KgwqDCoMKgwqAgLSBpZjoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9w
ZXJ0aWVzOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29uc3Q6IHNlcmNvbW0sc2MtcGFydGl0aW9ucwo+PiArwqDCoMKgwqDCoMKgwqAg
dGhlbjoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzZXJjb21tLHNjcGFydC1pZDoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRlc2NyaXB0aW9uOiBQYXJ0aXRpb24gaWQgaW4gU2VyY29tbSBwYXJ0aXRpb24gbWFwLiBQ
YXJzZXIKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2VzIHRoaXMgaWQgdG8g
Z2V0IHBhcnRpdGlvbiBvZmZzZXQgYW5kIHNpemUgdmFsdWVzIGZyb20KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkeW5hbWljIHBhcnRpdGlvbiBtYXAuCj4gUGFydGl0aW9uIG9m
ZnNldCBhbmQgc2l6ZSB2YWx1ZXMgYXJlIG5vdCBkZXJpdmVkIGZyb20gc2NwYXJ0LWlkLiBJIGFt
Cj4gc29ycnkgYnV0IGFmdGVyIGFsbCB0aGVzZSBxdWVzdGlvbnMgLSBpdCdzIHRoZSB0aGlyZCB0
aW1lIG5vdyAtIHlvdQo+IG5ldmVyIGFuc3dlciB3aHkgZG8geW91IG5lZWQgdGhpcyBwcm9wZXJ0
eSBhbmQgd2hhdCBpcyBpdCB1c2VkIGZvci4gRnJvbQo+IGFsbCB0aGUgZXhhbXBsZXMgaXQgY291
bGQgYmUgc2ltcGx5IHJlbW92ZWQgYW5kIHRoZSBwYXJ0aXRpb24gbWFwIHdpbGwKPiBiZSBleGFj
dGx5IHRoZSBzYW1lLgpzY3BhcnQtaWQgaXMgbmVjZXNzYXJ5IHRvIGdldCAodXNpbmcgbXRkIHBh
cnNlcikgcGFydGl0aW9uIG9mZnNldCBhbmQKc2l6ZSBmcm9tIGR5bmFtaWMgcGFydGl0aW9uIG1h
cCAoTk9UIGZyb20gdGhlIHJlZyBwcm9wZXJ0eSk6Cgrina8geHhkIC1lIC1jIDEyIC1zICQoKDB4
ODAwKSkgLWwgJCgoMHg3OCkpIG10ZDEKMDAwMDA4MDA6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMTAw
MDAwwqAgLi4uLi4uLi4uLi4uCjAwMDAwODBjOiAwMDAwMDAwMSAwMDEwMDAwMCAwMDEwMDAwMMKg
IC4uLi4uLi4uLi4uLgowMDAwMDgxODogMDAwMDAwMDIgMDAyMDAwMDAgMDAxMDAwMDDCoCAuLi4u
Li4gLi4uLi4KMDAwMDA4MjQ6IDAwMDAwMDAzIDAwMzAwMDAwIDAwMTAwMDAwwqAgLi4uLi4uMC4u
Li4uCjAwMDAwODMwOiAwMDAwMDAwNCAwMDQwMDAwMCAwMDYwMDAwMMKgIC4uLi4uLkAuLi5gLgow
MDAwMDgzYzogMDAwMDAwMDUgMDBhMDAwMDAgMDA2MDAwMDDCoCAuLi4uLi4uLi4uYC4KMDAwMDA4
NDg6IDAwMDAwMDA2IDAxMDAwMDAwIDAyMDAwMDAwwqAgLi4uLi4uLi4uLi4uCjAwMDAwODU0OiAw
MDAwMDAwNyAwMzAwMDAwMCAwMjAwMDAwMMKgIC4uLi4uLi4uLi4uLgowMDAwMDg2MDogMDAwMDAw
MDggMDUwMDAwMDAgMDE0MDAwMDDCoCAuLi4uLi4uLi4uQC4KMDAwMDA4NmM6IDAwMDAwMDA5IDA2
NDAwMDAwIDAxYjgwMDAwwqAgLi4uLi4uQC4uLi4uCsKgwqDCoMKgwqDCoMKgwqDCoCBzY3BhcnQt
aWTCoCBvZmZzZXTCoMKgIMKgwqAgc2l6ZQoKV2l0aCBzZXJjb21tLHNjLXBhcnRpdGlvbnMgdGhl
IHJlZyBwcm9wZXJ0eSB3aWxsIGJlIGlnbm9yZWQgKG9mZnNldCA9CjB4MjAwMDAwLCBzaXplID0g
MHgxMDAwMDApIGFuZCB0aGUgdmFsdWVzIHdpbGwgYmUgdGFrZW4gZnJvbSBwYXJ0aXRpb24gbWFw
LgoKRm9yIGV4YW1wbGUgd2UgaGF2ZSB0aGlzIGlzIGR0czoKCnBhcnRpdGlvbkAyMDAwMDAgewrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gIkZhY3RvcnkiOwrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlZyA9IDwweDIwMDAwMCAweDEwMDAwMD47CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2VyY29tbSxzY3BhcnQtaWQgPSA8Mj47CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZC1vbmx5
OwrCoMKgwqDCoMKgwqDCoCB9OwoKRHluYW1pYyBwYXJ0aXRpb24gbWFwOgoKc2NwYXJ0LWlkID0g
Mjsgb2Zmc2V0ID0gMHgwMDIwMDAwMDsgc2l6ZSA9IDB4MDAxMDAwMDAKCjAwMDAwMDAyIDAwMjAw
MDAwIDAwMTAwMDAwwqAgLi4uLi4uIC4uLi4uCgpJbiB0aGlzIGV4YW1wbGUgdGhlIG9mZnNldCBh
bmQgc2l6ZSBhcmUgdGhlIHNhbWUgaW4gcmVnIGFuZCBkeW5hbWljCnBhcnRpdGlvbiBtYXAuIElm
IGRldmljZSBoYXZlIGJhZCBibG9ja3Mgb24gTkFORCB0aGUgdmFsdWVzIHdpbGwgYmUgYQpsaXR0
bGUgZGlmZmVyZW50LiBBbmQgd2UgaGF2ZSB0byB0YWtlIHBhcnRpdGlvbiBvZmZzZXRzIGZyb20g
cGFydGl0aW9uCm1hcCB0byBhdm9pZCBib290IGxvb3BzLCB3cm9uZyBlZXByb20gbG9jYXRpb24g
YW5kIG90aGVyIGJhZCB0aGluZ3MuCgpJcyB0aGVyZSBhbnl0aGluZyB0aGF0IG5lZWRzIHRvIGJl
IGV4cGxhaW5lZCBpbiBtb3JlIGRldGFpbD8KCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoK
LS0gCkJlc3QgcmVnYXJkcywKTWlraGFpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
