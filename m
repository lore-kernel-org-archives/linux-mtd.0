Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C1DEE4993
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQrlJn4iGgNNjFX2ajJV8+U9ypMk5B2Taq6FReO++1A=; b=1+zxzrY1lgk5TEjgKMHO98NPpG
	jJI3PPrR9GIHlStE+qNE0MWbqyugCZgtHJH4SZ90gUIhm263U/MIjRCRu/e2nWaWoLxcuzV4J7OJ/
	fkh44WBFYmGh13P4BiZxhoUib2bu22e2S+4Qxb9s9YnV/JWSlm59zwFM99ZvGAcEOQ/CK0tclqY+9
	w7832/EyxvZHHrus+wIPae6uYDaFxtAxoiA2FsiHfSY8kDdHzFJB/uNICG4N3X9ShrEiNAdbApni3
	xdARF+LmhVPqug2ZVTUpaHZJrMCWdT9sqUIIjQ1X26POuqL4ZkFd+obvLVmdojYTw42BbhdSKRXCf
	GkDDs3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYltz-000Q6X-1L;
	Wed, 23 Aug 2023 11:19:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYltv-000Q5Y-0i
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 11:19:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bf3f59905so724631466b.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1692789587; x=1693394387;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvogEUy0PT+ajo0QwJruDfQ0E466U1X0VLcmzNsZEgw=;
        b=rdSMJgjMCieyezquuoOiFzw0JYLaaIH954f73pHyclgJA5Rzqk5LOB0RmgwwOHAUnB
         eTIfEo5Q+M3R+gWevhp4v92SIZVNIQMYKELcMdak9fhpwl7XSkp7SuqPQgvMVqEyzS8P
         GU8e+PRna7ydLxJzj8N/bNSoRZMZ0KANgtErptA7uifswimCYsr1BMfFaeEdw9bmwtly
         3pnADD+Phn8t7idDf4w3VBs8ZtLarEqq88c7fa2CXQzaRynWcABg9OCDdKTo4ZMx9ytM
         QG9ZV895mCoaFrzRRLA2mhkranbauJXoU7rYXKcqCmYMjTO7ogQDA94EMwPgyiPyp1fC
         go/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692789587; x=1693394387;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvogEUy0PT+ajo0QwJruDfQ0E466U1X0VLcmzNsZEgw=;
        b=HK2Gjt72p2+y3neqs6s0tvugIkOF2QFYREQHZA3c/MV9+VEp7MRZRZd3rx6h0mXgS/
         c2vLeToWEcX9vArmaFqBJMnje31YAMQJ9ZyXCQsWE3mcnxhkwUfyrSO1P/fTgcLTqNM7
         4URieZab9Ke7gbIcQ+ArE6RKIjXd+05Hh0Wtk8IfcPOz6i5b+l8Z2Pxqqj9cBUXkMTnz
         8KoRxQ8FgURVPiSxkC97w1MqQ1HQ4DxMToIQ9PMAAyRGm8tyj3qAboVL+UFvCktKZzqP
         p/qR5jUCseNBXUujVearNyh2bpsyjOGoqQ7fAhHMYiV9ca28NVafqkS/XtWv8yoTq0j7
         mJhA==
X-Gm-Message-State: AOJu0YzrfZ8D/o6EbeFoa+aBeZozvh4YBvWmPV2zo7PMGnrmMY3tt3Rd
	5KJy6hCVLV1UDx5uwDSs16j0vBf3D+wmu0hFfog=
X-Google-Smtp-Source: AGHT+IGMAjrVMgtFKe/QS5V2/TCGsBuZ6c1eXhwV9Npj7BWFEAd+vwEylnazI11+aepfLGfZUucE1A==
X-Received: by 2002:a17:906:74d5:b0:9a1:bf88:b67a with SMTP id z21-20020a17090674d500b009a1bf88b67amr3649643ejl.52.1692789587199;
        Wed, 23 Aug 2023 04:19:47 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id l20-20020a17090615d400b009930308425csm9602358ejd.31.2023.08.23.04.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 04:19:46 -0700 (PDT)
Message-ID: <83b0d17f-ad37-2b22-b20b-49e9527e9623@sigma-star.at>
Date: Wed, 23 Aug 2023 13:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Christian Wendt he/him <cw@brainaid.de>, linux-mtd@lists.infradead.org
References: <bc09bc68-ca99-d69e-9da8-cd9fa89fd127@brainaid.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH] mtd-utils: nandtest: handle large nand devices
In-Reply-To: <bc09bc68-ca99-d69e-9da8-cd9fa89fd127@brainaid.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_041951_584860_219A3815 
X-CRM114-Status: GOOD (  12.03  )
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

SGksCgpJIGFwcGxpZWQgdGhpcyB0byBtdGQtdXRpbHMuZ2l0IG1hc3Rlci4KCkEgcXVpY2sgc2lk
ZSBub3RlOiBEaWQgeW91IHNlbmQgdGhpcyB2aWEgc29tZXRoaW5nIG90aGVyIHRoYW4gZ2l0LXNl
bmQtZW1haWw/CgpZb3VyIG1haWwgY2xpZW50IG9yIHNlcnZlciBzZWVtcyB0byBoYXZlIG1hbmds
ZWQgdGhlIHBhdGNoIGZvcm1hdCBxdWl0ZSBhIGJpdC4KCkUuZy4gaGVyZSwgdGhlcmUgaXMgc29t
ZSB3aGl0ZSBzcGFjZSBkYW1hZ2UgdGhhdCBicmVha3MgdGhlIGZpbGU6CgpPbiA4LzIyLzIzIDEw
OjA5LCBDaHJpc3RpYW4gV2VuZHQgaGUvaGltIHdyb3RlOgo+IEBAIC0xNDUsNiArMTQ2LDI3IEBA
IHN0YXRpYyBpbnQgZXJhc2VfYW5kX3dyaXRlKGxvZmZfdCBvZnMsIHVuc2lnbmVkIGNoYXIgKmRh
dGEsIHVuc2lnbmVkIGNoYXIgKnJidWYsCj4gIMKgfQo+ICDCoCArc3RhdGljIHVpbnQ2NF90IGdl
dF9tZW1fc2l6ZShjb25zdCBjaGFyKiBkZXZpY2UpCj4gK3sKPiArwqDCoMKgIGNvbnN0IGNoYXIq
IHAgPSBzdHJyY2hyKGRldmljZSwgJy8nKTsKCnNpbWlsYXJseSwgdGhlcmUgYXJlIHNvbWUgZXh0
cmEgc3BhY2VzIHdoZXJlIHRoZXkgZG9uJ3QgYmVsb25nLAphbmQgc29tZSBlbXB0eSBsaW5lIGFy
ZSBtaXNzaW5nIGhlcmU6Cgo+IEBAIC0yMTIsMTEgKzIzNSwxMSBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgIGNhc2UgJ28nOgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9mZnNl
dCA9IHNpbXBsZV9zdHJ0b3VsKG9wdGFyZywgJmVycm9yKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBvZmZzZXQgPSBzaW1wbGVfc3RydG91bGwob3B0YXJnLCAmZXJyb3IpOwo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlICdsJzoK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW5ndGggPSBzaW1wbGVfc3RydG91bChvcHRhcmcs
ICZlcnJvcik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuZ3RoID0gc2ltcGxlX3N0cnRv
dWxsKG9wdGFyZywgJmVycm9yKTsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
ICDCoMKgwqDCoMKgwqDCoMKgwqAgfQoKRm9yIG5vdywgSSBtYXNzYWdlZCB0aGUgcGF0Y2ggZmls
ZSBhIGxpdHRsZSB0byBtYWtlIGl0IGFwcGx5IG9uIG15IGVuZC4KClRoYW5rcywKCkRhdmlkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
