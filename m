Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9ACC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsdeNTMPqUcVvuvvj4ik8AFR0W5YzaMwMe6xsU/R9LE=; b=AMQ3TMLJ1HLpGb
	4JkGgMcAuNLTW0CUieJm5ANRKFNuRSQjQHpZCroLetPHYxHzLrtFK+pBvZx65t5eLveeloigvbE0X
	VSB4FNZ46IhtK2LPcrM94nqAySJJvO6y2vlrqI6BOo2tzRHR7WQL8FUnPgYG3tbOVZ+bjP5TZEUDu
	k0Lcxt1uBp4TTBvPhzURC4v4sS07FPPsxtKK50FhO6h8kexAiN8bmIO39UuVbTKNGklAhbU/f64Iz
	UBwQ25z4+7ydUAzKVGCjBED1eeQPtRfyewygrrzfu97+1tJCNsnXtkEpefS3LBCwicJ89RHJQBgx5
	o08c9cJKncg8JRLv+wKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuXZ-00BVW2-1f;
	Fri, 03 Nov 2023 13:48:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuXU-00BVUo-20
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 13:48:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4083f613275so15169755e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 06:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699019319; x=1699624119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNNdf6QKeQGXpCicGHvT1KkPHfqLqD6zkXNLwqK+mXE=;
        b=SjLE8n6liX8+w3bV90DYV4goKeZBpotrI7aGASa9wTDl2ldlhO/J6DHJoRArewbif4
         bBRLKOzafG3hCauM1DrBovXspVlRc13PaoUk2y4bzhQ72r9/q9Q+FJt43azQMWJ/FtSg
         pnchK+8w9+jrg7Wjo9x2ARKItzL/Mw716zqJ6BKkQMaGWWHUIQrkiSJD3MJr6yl1z8ZI
         KqPs64gZ15hUsnN+KWBuWzvS5m0FYc6mDBJ9YdyjhggBoPn2BwMxopfO0l/IG12iV89k
         fw9+QTroBYeq1af/9sr9F1GnJNFRpcx/3GTqRL9v9FX46+cXCVv0uwIFJQfirhWsjNKY
         Cg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699019319; x=1699624119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNNdf6QKeQGXpCicGHvT1KkPHfqLqD6zkXNLwqK+mXE=;
        b=icDhcr8hdm3S+y1CLIw/l/10SIPa4ZbD5cwIBw058GWhQOrC0E7snJujQgfOq3cZRW
         Hkw6AmAbFuvoqxTfpJfYpEieOm27FW1AwsHA9F3YCs1ogKBDilDhA9UGhNlGN6AQzU6q
         xfQNIvP70miuBFayEH5H/0lFi58XUIGvHQ5bIp6NOQ+2191qqjLHYwkac+iOKR+z7MmZ
         8M6OD6zZemo7p/4Szo33JSNVdugX8fTKmLAyy+p0wlrrSA7c+CMCUUpy5/rkagHSmjVg
         qxypSXhSDrPokswNB3xXoz20PE2gYM7p+28YDi1XCzSEIkxjKtE/nWB6k0N0Nr66F8a+
         7bhw==
X-Gm-Message-State: AOJu0YyzE4YW/Di1YRTRoBSgBqz/0OJSvl7NYnQrAYLfXA6H/8kx5Z3C
	9vplnZ9x+GMgUgspZoHC4J6wrQ==
X-Google-Smtp-Source: AGHT+IGUWGkPT1FCIdPXgspubEcKtzq4u88cSZCud2Z2MP3xzdQ0hlFp6hALGHmE+rDKB2OxM8Z3qA==
X-Received: by 2002:adf:fc4b:0:b0:32d:90f7:ce4f with SMTP id e11-20020adffc4b000000b0032d90f7ce4fmr15634622wrs.38.1699019319129;
        Fri, 03 Nov 2023 06:48:39 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id e4-20020adfef04000000b0032dde679398sm1942469wro.8.2023.11.03.06.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 06:48:37 -0700 (PDT)
Message-ID: <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
Date: Fri, 3 Nov 2023 15:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
To: Fabio Estevam <festevam@denx.de>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
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
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_064844_663465_729906D1 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAwMy4xMS4yMDIzIDE1OjM3LCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIDAzLzExLzIw
MjMgMTA6MjYsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IFdoaWNoIHZlcnNpb24gb2YgbXRk
LXV0aWxzIGFyZSB5b3UgdXNpbmc/IEkgZ3Vlc3MgdGhlIGZsYXNoLWVyYXNlCj4gCj4gbXRkLXV0
aWxzIDIuMS41Cj4gCj4+IHV0aWxpdHkgaXMgd3JpdHRlbiBpbiBhIGJhZCB3YXkuIFBsZWFzZSB1
c2UgdGhlIGZvbGxvd2luZyB3aGlsZSBJIGNoZWNrCj4+IHdoYXQgZmxhc2hfZXJhc2UgaXMgZG9p
bmc6Cj4+Cj4+IHRpbWUgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAwIDEzNDIxNzcyOAo+IAo+
ICJtdGRfZGVidWcgZXJhc2UiIGdpdmVzIHRoZSBzYW1lIHRpbWUgYXMgd2VsbDoKPiAKPiByb290
QG1jZGUzMDAwYTp+IyB0aW1lIG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMCAxMzQyMTc3MjgK
PiBbIDQzMjIuMTE0OTY3XSBzcGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5yZWdfcHJvdG8gPSAw
eDAwMDEwMTAxCj4gWyA0MzIyLjEyMDg2MV0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyA0MzIy
LjEyNDIxMF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5uYnl0ZXMgPSAweDAxCj4gWyA0
MzIyLjEyOTQ3OF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5idXN3aWR0aCA9IDB4MDEK
PiBbIDQzMjIuMTM0OTAzXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLm9wY29kZSA9IDB4
YzQKPiBbIDQzMjIuMTQwMTU0XSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBbIDQzMjIuMTQzNDkx
XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRkci5uYnl0ZXMgPSAweDA0Cj4gWyA0MzIyLjE0
ODgzMV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAweDAxCj4gWyA0
MzIyLjE1NDM0MV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAweDAK
PiBbIDQzMjIuMTU5NzYxXSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBbIDQzMjIuMTYzMDk4XSBz
cGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0gMHgwMAo+IFsgNDMyMi4xNjg1
MjRdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kdW1teS5idXN3aWR0aCA9IDB4MDAKPiBbIDQz
MjIuMTc0MTE4XSBzcGktbm9yIHNwaTAuMDogKioqKioKPiBbIDQzMjIuMTc3NDM5XSBzcGktbm9y
IHNwaTAuMDogKioqKiogb3AuZGF0YS5idXN3aWR0aCA9IDB4MDAKPiBbIDQzMjIuMTgyOTQ4XSBz
cGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5uYnl0ZXMgPSAwCj4gWyA0NDM5Ljk2NjA2MF0g
c3BpLW5vciBzcGkwLjA6ICoqKioqIG5vci0+cmVnX3Byb3RvID0gMHgwMDAxMDEwMQo+IFsgNDQz
OS45NzE5MjBdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+IFsgNDQzOS45NzUyNTJdIHNwaS1ub3Ig
c3BpMC4wOiAqKioqKiBvcC5jbWQubmJ5dGVzID0gMHgwMQo+IFsgNDQzOS45ODA1MTFdIHNwaS1u
b3Igc3BpMC4wOiAqKioqKiBvcC5jbWQuYnVzd2lkdGggPSAweDAxCj4gWyA0NDM5Ljk4NTkyOF0g
c3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5vcGNvZGUgPSAweGM0Cj4gWyA0NDM5Ljk5MTE3
NF0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyA0NDM5Ljk5NDUwNF0gc3BpLW5vciBzcGkwLjA6
ICoqKioqIG9wLmFkZHIubmJ5dGVzID0gMHgwNAo+IFsgNDQzOS45OTk4MzRdIHNwaS1ub3Igc3Bp
MC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHgwMQo+IFsgNDQ0MC4wMDUzMzVdIHNwaS1u
b3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHg0MDAwMDAwCj4gWyA0NDQwLjAx
MTI3Ml0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyA0NDQwLjAxNDYwNF0gc3BpLW5vciBzcGkw
LjA6ICoqKioqIG9wLmR1bW15Lm5ieXRlcyA9IDB4MDAKPiBbIDQ0NDAuMDIwMDE4XSBzcGktbm9y
IHNwaTAuMDogKioqKiogb3AuZHVtbXkuYnVzd2lkdGggPSAweDAwCj4gWyA0NDQwLjAyNTYwNl0g
c3BpLW5vciBzcGkwLjA6ICoqKioqCj4gWyA0NDQwLjAyODkzN10gc3BpLW5vciBzcGkwLjA6ICoq
KioqIG9wLmRhdGEuYnVzd2lkdGggPSAweDAwCj4gWyA0NDQwLjAzNDQzOF0gc3BpLW5vciBzcGkw
LjA6ICoqKioqIG9wLmRhdGEubmJ5dGVzID0gMAo+IEVyYXNlZCAxMzQyMTc3MjggYnl0ZXMgZnJv
bSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2gKPiAKPiByZWFswqDCoMKgIDNtNTcuMzg0cwo+
IHVzZXLCoMKgwqAgMG0wLjAwNXMKPiBzeXPCoMKgwqAgM20zNS4yMTFzCj4gCgpZZXAsIGl0J3Mg
c3RyYW5nZSwgd2UnbGwgaGF2ZSB0byBjaGVjayB3aGF0J3MgaGFwcGVuaW5nLiBJIGZvdW5kIG15
Cm4yNXEwMCBmbGFzaCwgb24gbXkgc2lkZSBhbGwgaXRzIDQgZGljZSBhcmUgZXJhc2VkIGluIDUg
c2VjLiAgU0ZEUApkZWZpbmVzIGhvdyBsb25nIHRoZSBlcmFzZSBkaWUgc2hvdWxkIHRha2UsIHNl
ZSBCRlBUIGR3b3JkIDExLiBZb3UgY2FuCnN0YXJ0IHdpdGggdGhhdC4KCiMgdGltZSBtdGRfZGVi
dWcgZXJhc2UgL2Rldi9tdGQxIDAgMTM0MjE3NzI4CnNwaS1ub3Igc3BpMS4wOiAqKioqKiBub3It
PnJlZ19wcm90byA9IDB4MDAwMTAxMDEKc3BpLW5vciBzcGkxLjA6ICoqKioqCnNwaS1ub3Igc3Bp
MS4wOiAqKioqKiBvcC5jbWQubmJ5dGVzID0gMHgwMQpzcGktbm9yIHNwaTEuMDogKioqKiogb3Au
Y21kLmJ1c3dpZHRoID0gMHgwMQpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuY21kLm9wY29kZSA9
IDB4YzQKc3BpLW5vciBzcGkxLjA6ICoqKioqCnNwaS1ub3Igc3BpMS4wOiAqKioqKiBvcC5hZGRy
Lm5ieXRlcyA9IDB4MDQKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAw
eDAxCnNwaS1ub3Igc3BpMS4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHgwCnNwaS1ub3Ig
c3BpMS4wOiAqKioqKgpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0gMHgw
MApzcGktbm9yIHNwaTEuMDogKioqKiogb3AuZHVtbXkuYnVzd2lkdGggPSAweDAwCnNwaS1ub3Ig
c3BpMS4wOiAqKioqKgpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuZGF0YS5idXN3aWR0aCA9IDB4
MDAKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmRhdGEubmJ5dGVzID0gMApzcGktbm9yIHNwaTEu
MDogKioqKiogbm9yLT5yZWdfcHJvdG8gPSAweDAwMDEwMTAxCnNwaS1ub3Igc3BpMS4wOiAqKioq
KgpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuY21kLm5ieXRlcyA9IDB4MDEKc3BpLW5vciBzcGkx
LjA6ICoqKioqIG9wLmNtZC5idXN3aWR0aCA9IDB4MDEKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9w
LmNtZC5vcGNvZGUgPSAweGM0CnNwaS1ub3Igc3BpMS4wOiAqKioqKgpzcGktbm9yIHNwaTEuMDog
KioqKiogb3AuYWRkci5uYnl0ZXMgPSAweDA0CnNwaS1ub3Igc3BpMS4wOiAqKioqKiBvcC5hZGRy
LmJ1c3dpZHRoID0gMHgwMQpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuYWRkci5idXN3aWR0aCA9
IDB4MjAwMDAwMApzcGktbm9yIHNwaTEuMDogKioqKioKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9w
LmR1bW15Lm5ieXRlcyA9IDB4MDAKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmR1bW15LmJ1c3dp
ZHRoID0gMHgwMApzcGktbm9yIHNwaTEuMDogKioqKioKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9w
LmRhdGEuYnVzd2lkdGggPSAweDAwCnNwaS1ub3Igc3BpMS4wOiAqKioqKiBvcC5kYXRhLm5ieXRl
cyA9IDAKc3BpLW5vciBzcGkxLjA6ICoqKioqIG5vci0+cmVnX3Byb3RvID0gMHgwMDAxMDEwMQpz
cGktbm9yIHNwaTEuMDogKioqKioKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmNtZC5uYnl0ZXMg
PSAweDAxCnNwaS1ub3Igc3BpMS4wOiAqKioqKiBvcC5jbWQuYnVzd2lkdGggPSAweDAxCnNwaS1u
b3Igc3BpMS4wOiAqKioqKiBvcC5jbWQub3Bjb2RlID0gMHhjNApzcGktbm9yIHNwaTEuMDogKioq
KioKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmFkZHIubmJ5dGVzID0gMHgwNApzcGktbm9yIHNw
aTEuMDogKioqKiogb3AuYWRkci5idXN3aWR0aCA9IDB4MDEKc3BpLW5vciBzcGkxLjA6ICoqKioq
IG9wLmFkZHIuYnVzd2lkdGggPSAweDQwMDAwMDAKc3BpLW5vciBzcGkxLjA6ICoqKioqCnNwaS1u
b3Igc3BpMS4wOiAqKioqKiBvcC5kdW1teS5uYnl0ZXMgPSAweDAwCnNwaS1ub3Igc3BpMS4wOiAq
KioqKiBvcC5kdW1teS5idXN3aWR0aCA9IDB4MDAKc3BpLW5vciBzcGkxLjA6ICoqKioqCnNwaS1u
b3Igc3BpMS4wOiAqKioqKiBvcC5kYXRhLmJ1c3dpZHRoID0gMHgwMApzcGktbm9yIHNwaTEuMDog
KioqKiogb3AuZGF0YS5uYnl0ZXMgPSAwCnNwaS1ub3Igc3BpMS4wOiAqKioqKiBub3ItPnJlZ19w
cm90byA9IDB4MDAwMTAxMDEKc3BpLW5vciBzcGkxLjA6ICoqKioqCnNwaS1ub3Igc3BpMS4wOiAq
KioqKiBvcC5jbWQubmJ5dGVzID0gMHgwMQpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuY21kLmJ1
c3dpZHRoID0gMHgwMQpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuY21kLm9wY29kZSA9IDB4YzQK
c3BpLW5vciBzcGkxLjA6ICoqKioqCnNwaS1ub3Igc3BpMS4wOiAqKioqKiBvcC5hZGRyLm5ieXRl
cyA9IDB4MDQKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lkdGggPSAweDAxCnNw
aS1ub3Igc3BpMS4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRoID0gMHg2MDAwMDAwCnNwaS1ub3Ig
c3BpMS4wOiAqKioqKgpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0gMHgw
MApzcGktbm9yIHNwaTEuMDogKioqKiogb3AuZHVtbXkuYnVzd2lkdGggPSAweDAwCnNwaS1ub3Ig
c3BpMS4wOiAqKioqKgpzcGktbm9yIHNwaTEuMDogKioqKiogb3AuZGF0YS5idXN3aWR0aCA9IDB4
MDAKc3BpLW5vciBzcGkxLjA6ICoqKioqIG9wLmRhdGEubmJ5dGVzID0gMApFcmFzZWQgMTM0MjE3
NzI4IGJ5dGVzIGZyb20gYWRkcmVzcyAweDAwMDAwMDAwIGluIGZsYXNoCgpyZWFsCTBtNS40ODVz
CnVzZXIJMG0wLjAwMHMKc3lzCTBtNS40NjFzCiMgaGV4ZHVtcCAvZGV2L210ZDEKMDAwMDAwMCBm
ZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYKKgo4MDAwMDAwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
