Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5C3C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhBU9RlU1lX0tHYib1+gDCcjWmjNiVxzN1Ilrgf9ht0=; b=I6Ic3gf+HIyqHf
	H26X5hp/idfdY99cOdpIVLWQpCSd1AJ29I5+vVPkJgU8soW/Iws7b04YRztJpaiwLSph6V1KzYaR5
	HGmtFfVY0RF6KrNH/Ay61gCbXnj1sgrdQ40gHbIk2UF/s9apS2iGMPP9qv8KvVK7+yrNnhCHKbz+4
	QlkE08WVmiNmrkHm9HOVoJsNyQtDnhT1DL3eri7J/we/GWgaSnqzQJvtch2rXhxp9Y7g7IZSBdoYv
	ts2eoWhxqihkZlDXby8b6uMhuS5B7Sp2SY3OcInzKJSJOD1M4NJl7h9igmXKYQAD3bu9I86O7hNB5
	Q5uJ2uPc+uY3+LtM4OMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyci5-00A6sW-2X;
	Thu, 02 Nov 2023 18:46:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyci1-00A6rl-03
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 18:46:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53e08e439c7so2279623a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698950779; x=1699555579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKA3SDL8pG/6DgBqKfyWHLI6OVmshxpKXiLNa+EePbE=;
        b=j8QHbkZZlEr/Gc6sl51xoOEhwXMpylHfUz8l0pILfahWRfAuS3JztNaAQ6IPDBXO+D
         sle6PTjqZJSeXoYGG4D5Hb9LjBI3Vlb15qvL/Uie9MD3641QyFTlLuieDSd3LDMOq3xx
         r9Es11IlDM86AQDnJByb8CzAFm7wcPK/6nkYjr0sTidlhQ3N/EiLHULzc4u3oVFQTLu1
         d1nePRP6OWNnJMn80brYwaz2OnLpqAqTqsTBfwGfu/WHq9stnhxz06hGb0CQtDA80thb
         CpktbYJ6/rbkp79qLLq0nkZdC94/dxVjelKuGHPhtZLv970AXp69bgPBShc9GWxlpT+B
         iXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698950779; x=1699555579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKA3SDL8pG/6DgBqKfyWHLI6OVmshxpKXiLNa+EePbE=;
        b=ase2wMUTu3uLg0pMkVmRixx39JDNOo2DOG+XhT/u5v9FSPYPLItlhTzRBX3lUR1Axt
         zUlEiiPYxbGAfaSXL8UcEPEbrfFLGtpehM57DU6bJADpCfVUplu+TuxgCkL6/sreFfB1
         NhXO2YEwmrhDO/0vilCg9KaMjDL3OVIE9qsWO4UiLt6CBaKA2k1A4G/y2v+2WR2kGZC9
         MpOKoBpzjnZXyaMtxZNMSOTEHo9b4HxgoD9qccEHSO56oSoKVnTrHNNAQ0HCC1Fb6Qlk
         Kqhmm4DE3M6bt8ErZ2sV1GgsOxMjCwjCrg1G46/TI9JFNpp9HFa7uEaBLQEMcDuGaQqM
         7h0A==
X-Gm-Message-State: AOJu0YxflljomzvH2gj6EekgKGtcxQY7tbsJLPiLxZT+VCyWPpiHtxh2
	KXkn+C09+J1k2Nr+oMxq8DkXLQ==
X-Google-Smtp-Source: AGHT+IEYdIpp82rganQllC4ZxDZaxa+1Bgpxo6UisNkBKMz3FKa+cEcvtxAPmFR6UAZJU4TdsDnlhg==
X-Received: by 2002:a50:9994:0:b0:53f:bab5:1949 with SMTP id m20-20020a509994000000b0053fbab51949mr15535208edb.12.1698950779385;
        Thu, 02 Nov 2023 11:46:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7df96000000b005435d434a90sm28271edy.57.2023.11.02.11.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 11:46:19 -0700 (PDT)
Message-ID: <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
Date: Thu, 2 Nov 2023 18:46:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cf0e4284f2e3193ddd57b715196ca202@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_114625_082707_297A09B4 
X-CRM114-Status: GOOD (  11.20  )
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

CgpPbiAxMS8yLzIzIDE4OjMzLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIDAyLzExLzIwMjMg
MTU6MjEsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IExldCdzIHNlZSB3aGF0IGdldHMgdG8g
dGhlIFNQSSBjb250cm9sbGVyLiBXaGljaCBTUEkgY29udHJvbGxlciBkbyB5b3UKPj4gdXNlPwo+
IAo+IEkgYW0gdXNpbmcgaS5NWDhNUCwgd2hpY2ggaGFzIGRyaXZlcnMvc3BpL3NwaS1ueHAtZnNw
aS5jLgo+IAo+IEhlcmUgaXMgdGhlIHJlc3VsdDoKPiAKPiByb290QG1jZGUzMDAwYTp+IyBmbGFz
aF9lcmFzZSAvZGV2L210ZDAgMCAwCj4gRXJhc2luZyAxMzEwNzIgS2lieXRlIEAgMCAtLcKgIDAg
W8KgwqAgMjYuMDQwOTAzXSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBub3ItPnJlZ19wcm90byA9
IDB4MDAwMTAxMDEKPiAlIGNvbXBsZXRlIFvCoMKgIDI2LjA0OTU3MF0gc3BpLW5vciBzcGkwLjA6
ICoqKioqCj4gW8KgwqAgMjYuMDUzODQ5XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLm5i
eXRlcyA9IDB4MDEKPiBbwqDCoCAyNi4wNTkxMThdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5j
bWQuYnVzd2lkdGggPSAweDAxCj4gW8KgwqAgMjYuMDY0NTM5XSBzcGktbm9yIHNwaTAuMDogKioq
Kiogb3AuY21kLm9wY29kZSA9IDB4YzQKPiBbwqDCoCAyNi4wNjk3ODddIHNwaS1ub3Igc3BpMC4w
OiAqKioqKgo+IFvCoMKgIDI2LjA3MzExOF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIu
bmJ5dGVzID0gMHgwNAo+IFvCoMKgIDI2LjA3ODQ1MV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9w
LmFkZHIuYnVzd2lkdGggPSAweDAxCj4gW8KgwqAgMjYuMDgzOTQ5XSBzcGktbm9yIHNwaTAuMDog
KioqKiogb3AuYWRkci5idXN3aWR0aCA9IDB4MAo+IFvCoMKgIDI2LjA4OTM2OF0gc3BpLW5vciBz
cGkwLjA6ICoqKioqCj4gW8KgwqAgMjYuMDkyNjk5XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3Au
ZHVtbXkubmJ5dGVzID0gMHgwMAo+IFvCoMKgIDI2LjA5ODEyM10gc3BpLW5vciBzcGkwLjA6ICoq
KioqIG9wLmR1bW15LmJ1c3dpZHRoID0gMHgwMAo+IFvCoMKgIDI2LjEwMzcxM10gc3BpLW5vciBz
cGkwLjA6ICoqKioqCj4gW8KgwqAgMjYuMTA3MDQ1XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3Au
ZGF0YS5idXN3aWR0aCA9IDB4MDAKPiBbwqDCoCAyNi4xMTI1NDldIHNwaS1ub3Igc3BpMC4wOiAq
KioqKiBvcC5kYXRhLm5ieXRlcyA9IDAKPiBbwqDCoCAyNi4xMTc3MjddIHNwaS1ub3Igc3BpMC4w
OiAqKioqKiBub3ItPnJlZ19wcm90byA9IDB4MDAwMTAxMDEKPiBbwqDCoCAyNi4xMjM1ODldIHNw
aS1ub3Igc3BpMC4wOiAqKioqKgo+IFvCoMKgIDI2LjEyNzAxMl0gc3BpLW5vciBzcGkwLjA6ICoq
KioqIG9wLmNtZC5uYnl0ZXMgPSAweDAxCj4gW8KgwqAgMjYuMTMyMjc0XSBzcGktbm9yIHNwaTAu
MDogKioqKiogb3AuY21kLmJ1c3dpZHRoID0gMHgwMQo+IFvCoMKgIDI2LjEzNzcwNl0gc3BpLW5v
ciBzcGkwLjA6ICoqKioqIG9wLmNtZC5vcGNvZGUgPSAweGM0Cj4gW8KgwqAgMjYuMTQyOTU2XSBz
cGktbm9yIHNwaTAuMDogKioqKioKPiBbwqDCoCAyNi4xNDYyOTBdIHNwaS1ub3Igc3BpMC4wOiAq
KioqKiBvcC5hZGRyLm5ieXRlcyA9IDB4MDQKPiBbwqDCoCAyNi4xNTE2MjVdIHNwaS1ub3Igc3Bp
MC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHgwMQo+IFvCoMKgIDI2LjE1NzEzMl0gc3Bp
LW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAweDQwMDAwMDAKPiBbwqDCoCAy
Ni4xNjMwNjVdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+IFvCoMKgIDI2LjE2NjQwMl0gc3BpLW5v
ciBzcGkwLjA6ICoqKioqIG9wLmR1bW15Lm5ieXRlcyA9IDB4MDAKPiBbwqDCoCAyNi4xNzE4MTVd
IHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kdW1teS5idXN3aWR0aCA9IDB4MDAKPiBbwqDCoCAy
Ni4xNzc0MDVdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+IFvCoMKgIDI2LjE4MDczN10gc3BpLW5v
ciBzcGkwLjA6ICoqKioqIG9wLmRhdGEuYnVzd2lkdGggPSAweDAwCj4gW8KgwqAgMjYuMTg2MjQx
XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5uYnl0ZXMgPSAwCj4gRXJhc2luZyAxMzEw
NzIgS2lieXRlIEAgMCAtLSAxMDAgJSBjb21wbGV0ZQo+IAoKSXQgbG9va3MgZ29vZCAuLi4KCj4g
cm9vdEBtY2RlMzAwMGE6fiMgaGV4ZHVtcCAvZGV2L210ZDAKPiAwMDAwMDAwIGExZDQgMTY4YyA0
ZGFkIGRmYjIgMmEzZCBjMmFmIDBhYWUgYzE4YQo+IDAwMDAwMTAgMmQ1ZiAxNzdhIGMzOWYgNDZh
NCBmOWNkIGI4ODAgMzMxZSAyNTQzCgpidXQgdGhlIHBhdGllbnQgaXMgZGVhZCA6KS4gV291bGQg
YmUgZ29vZCBpZiBUYWthaGlybyBjYW4gdGVzdCBvbiBJRlgKdG9vLiBJbiB0aGUgbWVhbnRpbWUg
SSdsbCB0cnkgdG8gZmluZCBhIG4yNXEwMCwgSSByZW1lbWJlciBJIGhhZCBvbmUgaW4KdGhlIHBh
c3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
