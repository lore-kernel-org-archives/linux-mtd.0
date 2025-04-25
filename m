Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CE6C369D1
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koo8HwrAhNWikq9Y7V4nh7Sjcryl7SaMLQbastsIsuw=; b=z4siwK1RbMN12M
	C5YRJWf6LXTdw+W9dyaeUjcyOXV2hGScz97dPqRQmHkx8I9incNLEUWIK+0Adz8AUfBw6cSigH/CK
	5LTHfnRZ3rSUIVh4L8LFXJv2coXl8lZEn6PeqtZJ91TDh8urvPDalRqYs5MtzUl8lXxGzMtXzU0T7
	sFitLxtOkhLUctHb18oZqebTOTXbqRilCm2qkY8FE2St/nar2wf+BNRnwxzSDV7zbP/cceXNbnf9M
	zWn7/NdRY5sCXjL5lEf9MEc/hPQ68zz4t7s0kSiLPt4fMHw0x/8UpdjfRA/RAYrwv5hwJlanqsRRZ
	ATMsyo79qELXmqhWtorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Dbj-0000000GCqE-1x5A;
	Fri, 25 Apr 2025 07:36:23 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Dbg-0000000GCpl-2KHa
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 07:36:21 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso242352866b.1
        for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2025 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745566578; x=1746171378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f/aoAOajG2LJH/fap10d3juwU0GRv8oLLbcqOZ94sZ4=;
        b=XJIWpmaTDHSrqQcVwJzDtqtXmLyfZPoLBZNsrbKZHdG8Ykq9Z5pKQaE+xyiKBnk0A9
         6Z1IRrhTaqGrPf6ftwngH5PGOg10e10FlY8TcwIcv+kJStHihIQyOB0xCCjl46AR41fk
         897i1mtobwQdY3/KqtYMQOb26TWxegs5Ay/pZ5J9qtwB3T9sKJxFau/jv9b1f+4uet+q
         dulhD1FN6EMIyevBJP1c/O8/M1jLvK6Ewmi0URae1FSovxjs8KcnVVOMUof7tKM3kMmT
         WUV+EApTnzRk6FO21WC75yeLtg4G0LwcPRqeLz+IfRoy1Lcgem1c3BQSvFdxry+0VA06
         SRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566578; x=1746171378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/aoAOajG2LJH/fap10d3juwU0GRv8oLLbcqOZ94sZ4=;
        b=FTpVTrW/ISYleOJF/7N1vGkWfUYlLkciVpq6oDiN1KfKE7JrccIS382ObbaxwcWMfz
         AlIFnzqcnT9F9D8htfyqrMzTh6hy+lYG/b/i4cVY0h9dIVfIQzB7KseXdBkposbq/gRE
         K9WL4O7lpCiK+MQSI32KcML2Jl7xu4mejNVafttJ5UmrPEIc62VNH9vEeDZjq2Wb3Bn8
         zlSALoC9p9JarPg0QV6ykKVu3RV7i6AaSMljZRDe2IwfhZNqisx4teCE0/JZWDbW6dx8
         UbjxBhF6wODaUDYprUotIvu1NEkwrH5WampJdarIrKMo7yxrWSrXBw5yJ3Gd8mALtrWy
         +cmA==
X-Forwarded-Encrypted: i=1; AJvYcCXNp/aF+TAbQq8jkzpKpuge7aav+YqdwU/n7wbD04j7mr7aTDqGoyUEEE/qUOgpY3on26Zhknd0iRE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrhqqGBrHU2Vu8rCZ5lRntQxoE3isN8loPdPGHSlQCP5d2OqkP
	gn4YDcoG0txXbDduoOigtHiiRn+c1KpdKwGnsxEx0/JPRbTGbZ4x
X-Gm-Gg: ASbGncugi3eXczCIygIcef6XGNd7EtOqvdPfobHDHL0NByz+tJ3/Z5tc9Cvp7JuJINv
	1t9vQCWzDXcKX8lJo+xZnikHCMFV3iH13wXglKrATGRNrEn09wAoshQENUFyOvOR2d1H6QLBnlu
	xOyrdkHKRfyfjABGizqHmdEgluNBYGWcaYxNrQS4kVg/QzMapc/8Hcae7oACBILYZwJjtTPR65n
	Met1hQ7eC9MzkvKY7Y92/870opefbECQQ7DjEFOXxfIeKhar7P40bBTZ+95xwgg3qYqir9mZQ2k
	g5QJcpxFc8Hyvl4cq3vfYvJpeCoGUtHf3saYhHnRvX27PNee7crUuNcBih+f7kKRl/TUTnml8Pn
	q1SJ9KA==
X-Google-Smtp-Source: AGHT+IEFRDNwT/tszm82KKO50dkALibFBs/YMWdHV7MAruEyimBlWP+qHuPyZVHwmxBzxuAdsnf6Bw==
X-Received: by 2002:a17:907:1b1f:b0:abf:6d24:10bb with SMTP id a640c23a62f3a-ace7136c44bmr114322666b.44.1745566577785;
        Fri, 25 Apr 2025 00:36:17 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cb3sm89574966b.93.2025.04.25.00.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 00:36:17 -0700 (PDT)
Message-ID: <3850e8df-9744-420d-a5e0-46cb85b76fcd@gmail.com>
Date: Fri, 25 Apr 2025 09:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] mtd: rawnand: qcom: Pass 18 bit offset from NANDc
 base to BAM base
To: Md Sadre Alam <quic_mdalam@quicinc.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 broonie@kernel.org, absahu@codeaurora.org, bbrezillon@kernel.org,
 architt@codeaurora.org, quic_srichara@quicinc.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
 <20250410100019.2872271-2-quic_mdalam@quicinc.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20250410100019.2872271-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_003620_590934_08A6A8D0 
X-CRM114-Status: UNSURE (   9.35  )
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

MjAyNS4gMDQuIDEwLiAxMjowMCBrZWx0ZXrDqXNzZWwsIE1kIFNhZHJlIEFsYW0gw61ydGE6Cj4g
VGhlIEJBTSBjb21tYW5kIGRlc2NyaXB0b3IgcHJvdmlkZXMgb25seSAxOCBiaXRzIHRvIHNwZWNp
ZnkgdGhlIE5BTkQKPiByZWdpc3RlciBvZmZzZXQuIEFkZGl0aW9uYWxseSwgaW4gdGhlIEJBTSBj
b21tYW5kIGRlc2NyaXB0b3IsIHRoZSBOQU5ECj4gcmVnaXN0ZXIgb2Zmc2V0IGlzIHN1cHBvc2Vk
IHRvIGJlIHNwZWNpZmllZCBhcyAiKE5BTkRjIGJhc2UgLSBCQU0gYmFzZSkKPiArIHJlZ19vZmYi
LiBTaW5jZSwgdGhlIEJBTSBjb250cm9sbGVyIGV4cGVjdGluZyB0aGUgdmFsdWUgaW4gdGhlIGZv
cm0gb2YKPiAiTkFORGMgYmFzZSAtIEJBTSBiYXNlIiwgc28gdGhhdCBhZGRlZCBhIG5ldyBmaWVs
ZCAnYmFtX29mZnNldCcgaW4gdGhlIE5BTkQKPiBwcm9wZXJ0aWVzIHN0cnVjdHVyZSBhbmQgdXNl
IGl0IHdoaWxlIHByZXBhcmluZyB0aGUgY29tbWFuZCBkZXNjcmlwdG9yLgo+IAo+IFByZXZpb3Vz
bHksIHRoZSBkcml2ZXIgd2FzIHNwZWNpZnlpbmcgdGhlIE5BTkRjIGJhc2UgYWRkcmVzcyBpbiB0
aGUgQkFNCj4gY29tbWFuZCBkZXNjcmlwdG9yLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4gRml4ZXM6IDhkNmI2ZDdlMTM1ZSAoIm10ZDogbmFuZDogcWNvbTogc3VwcG9ydCBmb3Ig
Y29tbWFuZCBkZXNjcmlwdG9yIGZvcm1hdGlvbiIpCj4gVGVzdGVkLWJ5OiBMYWtzaG1pIFNvd2ph
bnlhIEQgPHF1aWNfbGFrc2RAcXVpY2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUg
QWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+CgpUZXN0ZWQtYnk6IEdhYm9yIEp1aG9zIDxq
NGc4eTdAZ21haWwuY29tPiAjIG9uIElQUTk1NzQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
