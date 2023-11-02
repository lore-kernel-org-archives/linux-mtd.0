Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D090C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 22:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzbbQ+XEpm6ZyytJ2wv9JJae670yjZhq6hYNSvVkj7g=; b=C+2gBnHHx0e0j2
	l/jy69jWxHOluEHItFqzk4S+6OdLWHHJLubeIuERE7Aeaw8fZetV29X8sBXeYinXYhQjPtw5l2873
	9fvsINwGwU35RvKox/2d70G3ndqXAVvmjLTYHL5ckaGa5JBHOMMQyqlD9hzTEw06/PgK1FE1OiqP0
	IwMtGGU9FS/kit6LNEN4iTmRyZ+LkxjEKvlQc+sX7PwvvW+2uCgZy8pqZBUb0Fd4Ms4Oiptl+ik+Q
	AcomIbOjsb2pWaLNnFTMpXsANYuyo1qWB0dqt+3IXP4Qf/BRqyL6jSrscGO6AZXk6A7Tp9KLuQ/0F
	cHK+OOdl3yQ606XuEh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfwv-00AN40-2V;
	Thu, 02 Nov 2023 22:14:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyfwt-00AN3L-2I;
	Thu, 02 Nov 2023 22:14:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6c34e87b571so465097b3a.3;
        Thu, 02 Nov 2023 15:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698963237; x=1699568037; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ug7dn92bD+Yvd5MMsrEQFQcE7ZhCC7DdUlY886VCjjI=;
        b=RzhpRHA/tM5t0owGarmoiZouONTK241pOuFyQJ0wfAGdwR/sZoH3zAbx1U+3dxC3Ds
         FDcZKnGe66BEZx1MleqeGsIpSB2r5/ZcmtfziYilFhKr7/kENdUizRhkK21WazJC4qIH
         XQxDgX+iac9KGLV+XqK9cyC68l/C345p7SxtDriiXJzmAwJRcToT8zThhdCuXfv3a6Ph
         r2QHrKwUM5+v9Al39s+bY6YezdUpRxbYvyXXy0q3xSG3XZ/lIyDF8ySJmS/cwTa5Uijv
         tYs+KUH0P9P3F4JIITVfRW5iD7OpV66zYOVgNQ8u8QYgrmvpzZTceVzX6ppGTnt5SaWi
         vicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698963237; x=1699568037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ug7dn92bD+Yvd5MMsrEQFQcE7ZhCC7DdUlY886VCjjI=;
        b=B2qwP4BtdshbIQ0dX/5biEi9vkpEK213mw5bLXnE2Kc0IaRmaP7fdCN+nANPObJqvR
         JUqksa0e/10dU3+U+ZTpVE+V1IsVaqtQ8RjTFXISFCv/qMXAJI9SoobCjvKYYjMg3pZf
         Q8C4vUSR4uEJz5ZdILWfyUoR3GOPrnLWR7kxE37Tux/9xnQq6HypzxwOPuWl78X0SdRj
         h1A8uhKD1iGv+4MgB6B4yD/uLnTx1YpT/RRIs6VG24LT4QM6/gzBNe6k3neLlPXfxtqA
         7E7nsuUvSLGbpqY4JM3M83LmgImvWwq+Q1mgK/J4faepA9BkPrknF4IJ14ZCmTCgGEhW
         3wtg==
X-Gm-Message-State: AOJu0Yzw6VxPcgoETeH5wbaHAWE2KwFGPQ7cKtqre/HYUypVEldKMezg
	xDiglFmLp4KXr7PYQpPRcfI=
X-Google-Smtp-Source: AGHT+IF8LF6U2bmCUbT6h+uDaNoZByhIX/Ybb3XyAAD8+I5FXAhHmz0Rl16LzZx26Fr+RUO6ZNh/Bg==
X-Received: by 2002:a05:6a00:2996:b0:6c2:cc57:7e2b with SMTP id cj22-20020a056a00299600b006c2cc577e2bmr8675925pfb.24.1698963237274;
        Thu, 02 Nov 2023 15:13:57 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x16-20020aa793b0000000b006c344c9f8bfsm212231pff.87.2023.11.02.15.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 15:13:56 -0700 (PDT)
Message-ID: <bd298769-e7a2-44b0-8894-1b596599644d@gmail.com>
Date: Thu, 2 Nov 2023 15:13:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mtd: rawnand: brcmnand: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Richard Weinberger
 <richard@nod.at>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20231102220246.3336154-6-u.kleine-koenig@pengutronix.de>
 <20231102220246.3336154-7-u.kleine-koenig@pengutronix.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231102220246.3336154-7-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_151359_770859_C6BE671F 
X-CRM114-Status: GOOD (  14.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMi8yMyAxNTowMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gVGhlIC5yZW1vdmUo
KSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFr
ZXMKPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8g
ZG8gZXJyb3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0
aGUgdmFsdWUgcmV0dXJuZWQgaXMgaWdub3JlZCAoYXBhcnQKPiBmcm9tIGVtaXR0aW5nIGEgd2Fy
bmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuCj4gCj4g
VG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxi
YWNrIHJldHVybgo+IHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwo+IC5yZW1vdmVfbmV3KCksIHdoaWNoIGFscmVhZHkgcmV0
dXJucyB2b2lkLiBFdmVudHVhbGx5IGFmdGVyIGFsbCBkcml2ZXJzCj4gYXJlIGNvbnZlcnRlZCwg
LnJlbW92ZV9uZXcoKSB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLgo+IAo+IEJ5IGNoYW5n
aW5nIHRoZSBmdW5jdGlvbiBicmNtbmFuZF9yZW1vdmUoKSB0byByZXR1cm4gdm9pZCBzZXZlcmFs
Cj4gZHJpdmVycyB0aGF0IHVzZSB0aGlzIGZ1bmN0aW9uIGFzIHJlbW92ZSBjYWxsYmFjayBjYW4g
YmUgY29udmVydGVkIHRvCj4gLnJlbW92ZV9uZXcoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQt
Ynk6IEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPgotLSAK
RmxvcmlhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
