Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF631C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7oe17nN/f6BLnXyzLvlUcxrUNbJ2rKvqunVs9qD2Pc=; b=3w3oPaAF4nkAQA
	kEKm+0iPIw/SyBuM9WJt5Vh5oHJrjadv1e8Pv3r5oeEO9ylY4NV9DPaI2udxTiZ8296UFmfg88KHC
	f9lP8GcguokAw2QavZxTdaXzD5JnJ02YD3FKSifM1gbVwvFKWQWheGLk2MewBCrJqjQQfE6yF/Dvy
	GcSSgDcER8Nyv+wazQ2CEBl0caCD4YTbUPg5Gt+65MGerNy1GODLNzPaVXeS1twqAQeb5MvTwGzn0
	d/jZPrcw9mdWetnaWZeyViC8nBHd1e/4PZEDoBLQzjhxfEUxXU+3t9VP5KrTIs0MImj2VLlP27JNy
	0GaBw9OTs5J70ZCr74+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOy0n-00CxjW-2O;
	Thu, 27 Jul 2023 10:14:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOy0k-00Cxif-21
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:14:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317798b359aso777111f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690452859; x=1691057659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAuBNgexiRs5gygdouxUThJ9duD0teTR8Wg3E90u7I4=;
        b=q0TiTFUPIoTDfNVvPgshETGdDWu8x0JXAZ6LpEAWnbnw5aZeRoRaiWpxtrdAVoZw2c
         uNftutRHbxh5lzU1VkdzSfUmlrVSjzOUlElIJ0JzOQYKt3qbPHfINymvwOsyR0j1nvTt
         Mtmwrj3W6xYGrW44tRTtuaRkjqq8mzygs+c5gCsF9PRojKSToKGofvptZr27kLd/vuvO
         7iQm0pi84a0pRAKKZjMgtcCKf3Fa5bma0qnMsxzEW+xFDbVFjb0pXXZGQngLJFopoBjK
         xTlG2SDxzIiVPmFcUQogk92vYF1C0V2ycItMakz3Sreixiw5F/6zgHcWX+giE/KNPfyF
         d+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690452859; x=1691057659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAuBNgexiRs5gygdouxUThJ9duD0teTR8Wg3E90u7I4=;
        b=Hnna/7Dk/Ow+t/A3t0ebE8La/zeiFeM8FXyT2HV9L/ONuyWCBpCflt6cykrYQp040a
         EzeBrmF/BibAY1nZMNpYc7ioHe46S5LgWiWXRSayi4GpcDKMXIjMHv32XtzWCtwVy8kl
         cBKXlJ6C8q4QOwK/p9HQs2qBKkR5YBK5xuNIHZ/lLInTEtDCeKaJVB6s6i+7EAnwYb6N
         t5cEoO4es8vxP6gqUcbj6OTh4DRvvOOkxp30rNdlbauzgLXcb0/NNis/tl3uyw4o9HiO
         etKOjrx3Vi64ai7yfQTvzpQhkBR9OachW1z3SZ1LqimGkwyUK6Yw8fKNOSSAj7w1WaD/
         mWTw==
X-Gm-Message-State: ABy/qLYODMfKdnlTvPtDoyIGgCypOnItf1TalT7mJXro9+TSSkxpeY06
	07duXdgKSkeWhhAUjRY9NveIrA==
X-Google-Smtp-Source: APBJJlFreTl8X93LWCp1rqgVHPZAXc9eeIVzxBn0G84CIJI8iZ/39Fz+lvrZBgqlAdWFiTCYXP8DYg==
X-Received: by 2002:adf:fd47:0:b0:313:f98a:1fd3 with SMTP id h7-20020adffd47000000b00313f98a1fd3mr1428039wrs.27.1690452858749;
        Thu, 27 Jul 2023 03:14:18 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id g17-20020adfe411000000b0031437299fafsm1647891wrm.34.2023.07.27.03.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 03:14:18 -0700 (PDT)
Message-ID: <5b141fdd-663f-16db-d20f-0f00a78f8edb@linaro.org>
Date: Thu, 27 Jul 2023 11:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add support for Macronix Octal flash
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-3-jaimeliao.tw@gmail.com>
 <a2e8544b-f97b-e318-1c98-7f424b1c810c@linaro.org>
 <ef91b41242da72c4bf6b5e3bed9862d5@walle.cc>
 <42731f09-e198-24b1-c293-c383dd706c10@linaro.org>
 <eeb66e55d77a4933f7c20ffee9d5f84b@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <eeb66e55d77a4933f7c20ffee9d5f84b@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_031422_681635_0C65E79A 
X-CRM114-Status: GOOD (  11.13  )
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

CgpPbiA3LzI3LzIzIDExOjEyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDctMjcg
MTI6MTAsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gNy8yNy8yMyAxMTowNCwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+Pj4gK8KgwqDCoCB7ICJteDY2dXcyZzM0NWd4
MCIsIElORk9CKDB4YzI5NDNjLCAwLCAwLCAwLCA0KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgRkxB
R1MoU1BJX05PUl9SV1cpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1Rf
NEsgfCBTUElfTk9SX09DVEFMX1JFQUQgfCBTUElfTk9SX09DVEFMX0RUUl9SRUFEIHwKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9PQ1RBTF9EVFJfUFAp
IH0sCj4+Pj4+ICvCoMKgwqAgeyAibXgyNXV3NTEzNDVnIiwgSU5GT0IoMHhjMjg0M2EsIDAsIDAs
IDAsIDQpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBGTEFHUyhTUElfTk9SX1JXVykKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxfRFRSX1JF
QUQgfCBTUElfTk9SX09DVEFMX0RUUl9QUCkgfSwKPj4+Pj4gK8KgwqDCoCB7ICJteDI1dW0yNTM0
NWciLCBJTkZPKDB4YzI4MzM5LCAwLCAwLCAwKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgTk9fU0ZE
UF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9PQ1RBTF9EVFJfUkVBRCB8IFNQSV9OT1JfT0NUQUxf
RFRSX1BQKSB9LAo+Pj4+PiArwqDCoMKgIHsgIm14MjV1dzI1MzQ1ZyIsIElORk9CKDB4YzI4NDM5
LCAwLCAwLCAwLCA0KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgRkxBR1MoU1BJX05PUl9SV1cpCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX09DVEFM
X0RUUl9SRUFEIHwgU1BJX05PUl9PQ1RBTF9EVFJfUFApIH0sCj4+Pj4+ICvCoMKgwqAgeyAibXgy
NXV3MTIzNDVnIiwgSU5GT0IoMHhjMjg0MzgsIDAsIDAsIDAsIDQpCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBGTEFHUyhTUElfTk9SX1JXVykKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxB
R1MoU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxfRFRSX1JFQUQgfCBTUElfTk9SX09DVEFMX0RUUl9Q
UCkgfSwKPj4+Pj4gK8KgwqDCoCB7ICJteDI1dXc2MzQ1ZyIsIElORk9CKDB4YzI4NDM3LCAwLCAw
LCAwLCA0KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgRkxBR1MoU1BJX05PUl9SV1cpCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX09DVEFMX0RUUl9S
RUFEIHwgU1BJX05PUl9PQ1RBTF9EVFJfUFApIH0sCj4+Pj4KPj4+PiBQQVJTRV9TRkRQIGZvciBh
bGwgdGhlIGZsYXNoZXMgcGxlYXNlLgo+Pj4KPj4+IEFuZCBubyBOT19TRkRQX0ZMQUdTKCkgYXMg
ZGlzY3Vzc2VkLgo+Pj4KPj4KPj4gQXJlIHRoZXJlIGZsYXZvcnMgb2YgdGhlc2UgZmxhc2hlcyB0
aGF0IGRvbid0IHN1cHBvcnQgU0ZEUCwKPj4gb3Igd2h5IGRpZCB5b3UgYXNrIGZvciBOT19TRkRQ
X0ZMQUdTPyBEbyBlYWNoIG9mIHRoZXNlIGZsYXNoZXMKPj4gaGF2ZSBTRkRQIGFuZCBuby1TRkRQ
IGZsYXZvcnM/Cj4gCj4gSSBhc2tlZCB0byBkcm9wIE5PX1NGRFBfRkxBR1MoKS4KPiAKCk9oLCB5
ZXMsIHRoYXQncyB3aGF0IEkgbWVhbnQgdG9vLiBUaGVyZSB3YXMgYSBwcmV2aW91cyBjb21tZW50
CndoaWNoIHNhaWQgIlBBUlNFX1NGRFAgaW5zdGVhZCIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
