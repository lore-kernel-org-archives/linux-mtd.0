Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD995C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 16:41:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529186157F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 16:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529186157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7BAuWH4HnFP5QVEoV59QrHP0JDHgZZaHk4EGSPsADjU=; b=EeLx3b4uShWMFWrZiZ72YcvI8
	ZMCEZ/Ekxnhh5RwbWIMqzj6xbOKWkxooIZBV4zEZTa+ezlEnJoESkdIgyHddIFThyPimSI9eoZAha
	CPX1Xq9+Jg2kqtpeQ9mprdz4ugGxNkOUjWIt+z89pJSEqrAtV0Qpq/SNHqVTg7gG9tNuV2Ky2Y4Ck
	11scTZzAIHuF0KeKaXbEMAeUAZNikavhQlV+F7bUrmso3yD2hhd1eyn9J3GzErBe9OiF4jbp7yRti
	AZa8AHkjRFCpXHUlBxDR3ZXD3akWllT/X0bWVxvtJjHOVtUECRd4LIE+oEOKAkGq+xnoZy21W+LbB
	u2Qz76b1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lONas-00C3v6-7Q; Mon, 22 Mar 2021 16:39:54 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lONaj-00C3tj-JM
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 16:39:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id 75so22276236lfa.2
 for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2021 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZzcFovQFUWf8zncHThUZCkO1QDFqyA6DDea/YNXflao=;
 b=Tp3QV2kr2MR7w9ii+u0SfbD0VIglO/QpUYJBX+V0fT86PKXsYm8UUEVo4krj+Ga44o
 8p3FRJFvxvKtodJ0Bl5UCll3x6NLfddH8lDyxncsy3hhUdU7XX7x1tXhLYvHxtZ1DYYO
 VMiwcmJVRhsvIW8ylMCAz+mj7i7UQqzUDAp/5PZT7H/q+ogpOvodQTCazFnK9JKWBRVp
 cX6mQYHi8aUzsoJFNDyJPEn7orEpT2XB9YC+9pWWHvC9UAwBtc641NwiCCKHlLIZoJoP
 CHscHDfcasFop847B1MXRoUcw/0kvjES+XFm1WkFGGRg9Bl4i7L0rN2n2H4EVGLKGdSt
 cnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZzcFovQFUWf8zncHThUZCkO1QDFqyA6DDea/YNXflao=;
 b=pCle4oWgdsQ2xRel5Pw0WXyVJXmRo1txURghEKPws2OxkYq8DLYOM7yRaktPvCWBEe
 ayN+6Byy4bLLGSHCB1VQ0pG/bqGRK399cu10aU7SXURmBATZQrcvXLhS+BwjYH0jnply
 lCXPUiX0ZrQeGXRsgr29ibAcKUyuHC3IZCVMS8dbcsAoIFscW2+vE4eelfocHebYD9/K
 rAU4pWkpV5mTLCPYPTat9pszg5a6oShesfvhfMKFbXnL+EAj8JrqjP5KQXUr/s8+3lUB
 BQkXQkXzp9ffLAFVz3eP3Q0SwkkF8kt0vhFMfNh0NCx/UoEjSN0wUa8QXcLZ7AMD/49f
 xQ6Q==
X-Gm-Message-State: AOAM5318HC5ogIX6dGZwOyPGCzYkyJCipIHpvHxfVi8534mCHdLqhPgr
 BHWe75AolMsrM5LxUlLQ0zI=
X-Google-Smtp-Source: ABdhPJziISTWFT6m9AbP1Gaqpws7biEh8BclHlJNzJWUN2x6CSo2Up9+3ch8AvLyynk54fQeKzO1Zw==
X-Received: by 2002:a05:6512:1026:: with SMTP id
 r6mr145690lfr.598.1616431183883; 
 Mon, 22 Mar 2021 09:39:43 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id q14sm1988348ljj.132.2021.03.22.09.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 09:39:43 -0700 (PDT)
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210303155735.25887-1-michael@walle.cc>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <9fb7a635-75ed-2840-b751-3ab8764f0890@gmail.com>
Date: Mon, 22 Mar 2021 17:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210303155735.25887-1-michael@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_163949_643117_372DA685 
X-CRM114-Status: GOOD (  12.12  )
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

T24gMDMuMDMuMjAyMSAxNjo1NywgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBNRU1MT0NLLCBNRU1V
TkxPQ0sgYW5kIE9UUExPQ0sgbW9kaWZ5IHByb3RlY3Rpb24gYml0cy4gVGh1cyByZXF1aXJlCj4g
d3JpdGUgcGVybWlzc2lvbi4gRGVwZW5kaW5nIG9uIHRoZSBoYXJkd2FyZSBNRU1MT0NLIG1pZ2h0
IGV2ZW4gYmUKPiB3cml0ZS1vbmNlLCBlLmcuIGZvciBTUEktTk9SIGZsYXNoZXMgd2l0aCB0aGVp
ciBXUCMgdGllZCB0byBHTkQuIE9UUExPQ0sKPiBpcyBhbHdheXMgd3JpdGUtb25jZS4KPiAKPiBN
RU1TRVRCQURCTE9DSyBtb2RpZmllcyB0aGUgYmFkIGJsb2NrIHRhYmxlLgo+IAo+IEZpeGVzOiBm
N2U2YjE5YmM3NjQgKCJtdGQ6IHByb3Blcmx5IGNoZWNrIGFsbCB3cml0ZSBpb2N0bHMgZm9yIHBl
cm1pc3Npb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxl
LmNjPgoKU2hvdWxkIGJlIGZpbmUgZm9yIE9wZW5XcnQgdG9vbHMgdG8gbXkgYmVzdCBrbm93bGVk
Z2UgKGFuZCBxdWljayB0ZXN0aW5nKS4KCkFja2VkLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
