Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD01C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMQ8zU1TXohbUpvLuH6ueGXquRI1W3n9KOd2Ixn64TI=; b=yiVskmJKM0Uu61
	d9ld24kK3hboU3O0uSU0yZeBvJNlEU7ul0LoCLEwX6LP7hHPCx5lzW2DoywWxAU1AFzoTZm5QggHL
	vVthhBqQfh98THYmPC0dW+PzCPX+ebGBH4D3igrvgi6jSsYph49TnIbqIIdcO17Az+UcmGA89O9hN
	fUsFUsiSloT0s2WW34LBca1w5LZt55tPJks0OOm7++G1eK02PBdFM48gDfIJRYrVIp5DbW6nQqn9a
	m7kKLtjQ0lFq2SK+bu6GHTlLhSudWp9uwMSkvqg6pDciQCReogguqR6x8/RoC22QbyYE47trSmfwj
	MdanYrk8plgxI2hNK/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxxN-00CwYR-2j;
	Thu, 27 Jul 2023 10:10:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxxL-00CwVT-0O
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:10:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso7790775e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690452648; x=1691057448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rXAT+hL8co2Hy5v0mrmqh6EBmWA8AVdXXXzyEH3MYo=;
        b=v8FY5H4OTIiZY5Ab+J7pPViBM7BR95Qr61tco5trIxobY+fq3jmWgt7byG+Q0JTnqy
         Behoc3RykjojNZDOGZUNdF29RKMH14Q3gb9qLmXKGJ/SwFhuNaBJU/N/sfQuOppiZGOD
         P4qhCl4OLPCkGI9LcDgtWOd8MhaMvfOkqcGysQuDLaQv07JG4CyH8vk3a1HavtrVVbUj
         XY+ZvZv6nnAdcUKEl8kfbFV2thEyZd12xcw8m6PvCqGQogNp0xrrlK843xLopvcuLTjM
         V2b8MZQzQELqqfSJMtPIaT7lhhpf9yMv9xUE7LagbuJj0NKPlIR1a/cXSyKnytEgI/Z1
         CsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690452648; x=1691057448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rXAT+hL8co2Hy5v0mrmqh6EBmWA8AVdXXXzyEH3MYo=;
        b=WKk4n1jD9sXaQ4CwBZbTREufMhO8Tblm4bGLZ/r+w9Isq+NB3/D8oJyHzleaO126dS
         SLDldcYfg9oeTo8P5tTqRNRkUo/ORACAylBBp5F/b0I2v+wZpoziFeY7nugy5XkCnh/w
         bzQh9Zq4kiBj4Kmx6cQxcoTKFNckrkvglsvjGex0eifEzVpIk4Is7GEOgQp90Q2lPg5Q
         tunauYUA17Rnl3+DvdcjrBPUnKg5Ujaqleq4wGolQnbobn4C7hiQercM5oyfKEdAz1Gf
         wSMdiFhv1fsE69M0PadQ7wzNjSlQdWoUJxN/fqwsFRQ34qql1jJrqlHfp8DUdTCxen0y
         GM6A==
X-Gm-Message-State: ABy/qLbAOVMurUsBvBby0NbLqSs672RL8Nc49RjRDMDhoPCszGWJKVTq
	LoFmSzU7Inrd6yUM2OsTHmselw==
X-Google-Smtp-Source: APBJJlH5VsVKAP2UPl2T675Q3ynalrEfIYhm7R6jjQNmXJW09f35xz3YGnchPGQWjbYtxxSaFN603w==
X-Received: by 2002:a05:600c:21cc:b0:3fb:fed9:1c7f with SMTP id x12-20020a05600c21cc00b003fbfed91c7fmr1424789wmj.8.1690452648286;
        Thu, 27 Jul 2023 03:10:48 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b00313f61889ecsm1599877wrs.66.2023.07.27.03.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 03:10:47 -0700 (PDT)
Message-ID: <42731f09-e198-24b1-c293-c383dd706c10@linaro.org>
Date: Thu, 27 Jul 2023 11:10:46 +0100
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
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ef91b41242da72c4bf6b5e3bed9862d5@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_031051_169229_A78438FD 
X-CRM114-Status: GOOD (  12.07  )
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

CgpPbiA3LzI3LzIzIDExOjA0LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+Pj4gK8Kg
wqDCoCB7ICJteDY2dXcyZzM0NWd4MCIsIElORk9CKDB4YzI5NDNjLCAwLCAwLCAwLCA0KQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIEZMQUdTKFNQSV9OT1JfUldXKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIE5P
X1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxfUkVBRCB8IFNQSV9OT1JfT0NUQUxf
RFRSX1JFQUQgfAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05P
Ul9PQ1RBTF9EVFJfUFApIH0sCj4+PiArwqDCoMKgIHsgIm14MjV1dzUxMzQ1ZyIsIElORk9CKDB4
YzI4NDNhLCAwLCAwLCAwLCA0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIEZMQUdTKFNQSV9OT1JfUldX
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfT0NU
QUxfRFRSX1JFQUQgfCBTUElfTk9SX09DVEFMX0RUUl9QUCkgfSwKPj4+ICvCoMKgwqAgeyAibXgy
NXVtMjUzNDVnIiwgSU5GTygweGMyODMzOSwgMCwgMCwgMCkKPj4+ICvCoMKgwqDCoMKgwqDCoCBO
T19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX09DVEFMX0RUUl9SRUFEIHwgU1BJX05PUl9P
Q1RBTF9EVFJfUFApIH0sCj4+PiArwqDCoMKgIHsgIm14MjV1dzI1MzQ1ZyIsIElORk9CKDB4YzI4
NDM5LCAwLCAwLCAwLCA0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIEZMQUdTKFNQSV9OT1JfUldXKQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxf
RFRSX1JFQUQgfCBTUElfTk9SX09DVEFMX0RUUl9QUCkgfSwKPj4+ICvCoMKgwqAgeyAibXgyNXV3
MTIzNDVnIiwgSU5GT0IoMHhjMjg0MzgsIDAsIDAsIDAsIDQpCj4+PiArwqDCoMKgwqDCoMKgwqAg
RkxBR1MoU1BJX05PUl9SV1cpCj4+PiArwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNU
XzRLIHwgU1BJX05PUl9PQ1RBTF9EVFJfUkVBRCB8IFNQSV9OT1JfT0NUQUxfRFRSX1BQKSB9LAo+
Pj4gK8KgwqDCoCB7ICJteDI1dXc2MzQ1ZyIsIElORk9CKDB4YzI4NDM3LCAwLCAwLCAwLCA0KQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIEZMQUdTKFNQSV9OT1JfUldXKQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IE5PX1NGRFBfRkxBR1MoU0VDVF80SyB8IFNQSV9OT1JfT0NUQUxfRFRSX1JFQUQgfCBTUElfTk9S
X09DVEFMX0RUUl9QUCkgfSwKPj4KPj4gUEFSU0VfU0ZEUCBmb3IgYWxsIHRoZSBmbGFzaGVzIHBs
ZWFzZS4KPiAKPiBBbmQgbm8gTk9fU0ZEUF9GTEFHUygpIGFzIGRpc2N1c3NlZC4KPiAKCkFyZSB0
aGVyZSBmbGF2b3JzIG9mIHRoZXNlIGZsYXNoZXMgdGhhdCBkb24ndCBzdXBwb3J0IFNGRFAsCm9y
IHdoeSBkaWQgeW91IGFzayBmb3IgTk9fU0ZEUF9GTEFHUz8gRG8gZWFjaCBvZiB0aGVzZSBmbGFz
aGVzCmhhdmUgU0ZEUCBhbmQgbm8tU0ZEUCBmbGF2b3JzPwoKSWYgdGhhdCdzIHRoZSBjYXNlLCBJ
J20gbm90IHlldCBzdXJlIGlmIHdlIHdhbnQgdG8gbWl4IFBBUlNFX1NGRFAKd2l0aCBOT19TRkRQ
X0ZMQUdTKCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
