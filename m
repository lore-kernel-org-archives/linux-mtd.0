Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01D9C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtBs8sNo2/h39uerYHtJH9yh5VCkN65pvab1bpBwnOE=; b=v2T/CDtoetsfuD
	/hWE56wXtpN4iJi2HJtlGh0bXG4+vWWt6B09FVrG75rxJbkSOBN3aEzx5OuVQaxA+5a3Z2ir+ZMTi
	5gdqpbpYrGkcAszI060GQe/COzP7nPayeMvJTyk6oVCv7ULkZTJcYI8hIsnjmPaVCTssgKJ6FpQsU
	zdipPhbmR/Q0aRzu+xRmKVmSUDoTSjVKjGfE1V+ecaNfSB2aIhhoG+X/0G9btfs2inQ2A+QrnKvxE
	XmxBx3rtuxC/YYDNOO0ewgHDPfOF65PgIa40RbxY4p1pFQ9a8zrGw/Np2wIeI6dAaNzF5XhogRPIi
	EFay/TCGUiI4P599WuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyseW-00BLy6-0s;
	Fri, 03 Nov 2023 11:47:52 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyseP-00BLxI-2l
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:47:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9d8d3b65a67so284117366b.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Nov 2023 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699012062; x=1699616862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RPyXKKnhbzEcWIn2eK4NfRQWLIbyedtGhkQX6cgpW4=;
        b=AcWFpBrX3IYF4yE2KTfLnsRZpV1JcHRMGO888MkGMgQLZ2gm41nHndGsEd1tIYdMGQ
         Vx+UrAEjtVbSs5yVF/LXksLOKJYvSCYcsS8GvvtoE4Idg5bhLQXjTnJlDEsThSsP6t/p
         BaWmPhCxx77ZHD9DcCkA+Jup3vMx1+mMM464b/WMIa3YKAvCDCX3pRodd7+RJsWQo0aO
         Ux/Ij8NjyejJVnMD+T7AZfldv70avqGWSZDLVW0OvnEumu7yXDIj0KKtxAaNnWxUMHlh
         bL60es7kmWxy/OqgF98RqeJDbSxqKVYM7ZGirnGpEMegp7LibmVEWlb+cxWP8is8wIC1
         Xcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699012062; x=1699616862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RPyXKKnhbzEcWIn2eK4NfRQWLIbyedtGhkQX6cgpW4=;
        b=Wtcol6x/ZjU5FfF9TXeelvfh/hyOnlWJcPRLMyOphcYzW2i5TgJ460NHE7sWHIGLTH
         FIdr9umN4J4JVOsnD9aPpTcW93bZoRPEf3YbJwDKD1FdYZYz3xZCDkd4wo3zM13fo8mG
         1C22GszvteSOhhHlSLGWxUD0dQlfX43Fzoau4EJBx2r9lmtqV26IYR3XrTbUpae7yvxo
         PGsCBxCFpTkswgmoU5Bkdowspft4WUK4q0Ryxrsd1QrplBgJ74fylQlhlKkxaO7XCYIZ
         Rp8mAbS/rld2BJ3b4q1lRb2DWglkCQ0vHRfrRnWEfzekii8/Dg5xGXU0hjNrH4vOnZw/
         m46A==
X-Gm-Message-State: AOJu0Yw8nDvp3rp0vKYirktkcd6QqDyvBd/onHxad0kLBTgqQRoBMcmi
	ZZaahWMXpnNeCtgwVqe50R8Gjg==
X-Google-Smtp-Source: AGHT+IF+apbSvPswBEgJCCeMbNWHLdbaxOVea9QcM6cm0k+La/W1CfoR9tHNZn7b1UrHc/Lwu8Znlw==
X-Received: by 2002:a17:907:96a5:b0:9bf:2bf:65f3 with SMTP id hd37-20020a17090796a500b009bf02bf65f3mr6571513ejc.7.1699012062577;
        Fri, 03 Nov 2023 04:47:42 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id m21-20020a1709066d1500b009b9aa8fffdasm808324ejr.131.2023.11.03.04.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 04:47:42 -0700 (PDT)
Message-ID: <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
Date: Fri, 3 Nov 2023 11:47:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
To: Fabio Estevam <festevam@denx.de>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
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
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_044746_267258_E08829EC 
X-CRM114-Status: GOOD (  15.90  )
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

CgpPbiAxMS8yLzIzIDIxOjQyLCBGYWJpbyBFc3RldmFtIHdyb3RlOgo+IE9uIDAyLzExLzIwMjMg
MTU6NTYsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4+IExldCdzIHRyeSBzb21ldGhpbmcgZWxz
ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMKPj4gaW5kZXggNTU4NGJmOWNiZmQxLi5hMGFmN2E3ZWI3MjcgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jCj4+IEBAIC0xMDc0LDcgKzEwNzQsNyBAQCBzdGF0aWMgaW50IHNw
aV9ub3JfZXJhc2VfZGllKHN0cnVjdCBzcGlfbm9yICpub3IsCj4+IGxvZmZfdCBhZGRyLCBzaXpl
X3QgZGllX3NpemUpCj4+Cj4+IMKgwqDCoMKgwqDCoMKgIGlmIChub3ItPnNwaW1lbSkgewo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNwaV9tZW1fb3Agb3AgPQo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPj4gU1BJX05PUl9E
SUVfRVJBU0VfT1Aobm9yLT5wYXJhbXMtPmRpZV9lcmFzZV9vcGNvZGUsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX0RJRV9FUkFTRV9PUChu
b3ItPmVyYXNlX29wY29kZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3It
PmFkZHJfbmJ5dGVzLCBhZGRyLAo+PiBtdWx0aV9kaWUpOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3BpX25vcl9zcGltZW1fc2V0dXBfb3Aobm9yLCAmb3AsIG5vci0+cmVn
X3Byb3RvKTsKPj4KPj4gSSBleHBlY3QgdGhhdCB3aXRoIHRoaXMgdGhlIGZpcnN0IHNlY3RvciBm
cm9tIGVhY2ggZGllIHdpbGwgYmUgZXJhc2VkLgo+IAo+IFlvdSBhcmUgcmlnaHQuIFRoaXMgaXMg
ZXhhY3RseSB3aGF0IGhhcHBlbnMgd2l0aCB0aGlzIGNoYW5nZToKPiAKPiBGaXJzdCBkaWU6Cj4g
Cj4gfiMgaGV4ZHVtcMKgIC9kZXYvbXRkMAo+IDAwMDAwMDAgZmZmZiBmZmZmIGZmZmYgZmZmZiBm
ZmZmIGZmZmYgZmZmZiBmZmZmCj4gKgo+IDAwMTAwMDAgOTIzMSBlZmI4IGQ2NjQgZDc3YiAyMzFj
IDM1MjIgZDdlOCA0ZjZlCj4gCj4gU2Vjb25kIGRpZToKPiAKPiB+IyBoZXhkdW1wIC1zIDB4NDAw
MDAwMCAvZGV2L210ZDAKPiA0MDAwMDAwIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZm
ZmYgZmZmZgo+ICoKPiA0MDEwMDAwIDA0MTggMDUxOCA2MGEwIDkyMTQgMjQxMSAyMDA0IGMxNDQg
OWUyYgoKCkkgdGhpbmsgSSBrbm93IHdoYXQgaGFwcGVucyB3aXRoIHlvdXIgZmxhc2guIFBsZWFz
ZSB0cnkgdGhlIGRlYnVnIHBhdGNoCmZyb20gaHR0cHM6Ly9naXRodWIuY29tL2FtYmFydXMvbGlu
dXgtMGRheS5naXQKc3BpLW5vci9uZXh0LWRpZS1lcmFzZS12Mi1kZWJ1Zy4KCkkgYXNzdW1lIHlv
dXIgZmxhc2ggd29ya3MgaW4gMy1ieXRlIG1vZGUuIFRoZSBkaWUgZXJhc2UgY21kIG5lZWRzIGFu
CmV4dGVuZGVkIHJlZ2lzdGVyIGluIDMtYnl0ZSBtb2RlIG90aGVyd2lzZSBpcyBpZ25vcmVkLiBQ
bGVhc2UgdHJ5IHRoZQpwYXRjaCBhbmQgbGV0IG1lIGtub3cgaWYgaXQgd29ya3MuCgpSZWFkaW5n
IHRoZSBkYXRhc2hlZXQgSSBmb3VuZCBvdXQgdGhhdAoiVGhlIGRldmljZSBzdXBwb3J0cyAzLWJ5
dGUgYWRkcmVzc2luZyAoZGVmYXVsdCksIHdpdGggQVsyMzowXSBpbnB1dApkdXJpbmcgYWRkcmVz
cyBjeWNsZS4gQWZ0ZXIgYW55IFJFQUQgY29tbWFuZCBpcyBleGVjdXRlZCwgdGhlIGRldmljZQp3
aWxsIG91dHB1dCBkYXRhIGZyb20gdGhlIHNlbGVjdGVkIGFkZHJlc3MuIEFmdGVyIHRoZSBib3Vu
ZGFyeSBpcwpyZWFjaGVkLCB0aGUgZGV2aWNlIHdpbGwgc3RhcnQgcmVhZGluZyBhZ2FpbiBmcm9t
IHRoZSBiZWdpbm5pbmcuIgoKU28gSSBleHBlY3QgdXAgdG8gbm93IHdlIHRlc3RlZCBqdXN0IHRo
ZSBmaXJzdCBkaWUsIGFsbCB0ZXN0cyBpbiAzLWJ5dGUKbW9kZS4gVGh1cyB3aGVuIHdlIHdhbnRl
ZCB0byBkbyBhIGNyb3NzLWRpZSB0ZXN0LCByZWFkaW5nIGZyb20gdGhlIGxhc3QKMiBNQiBvZiBm
aXJzdCBkaWUgdG8gdGhlIGZpcnN0IDJNQiBvZiB0aGUgc2Vjb25kIGRpZSwgd2hhdCB3ZSBhY3R1
YWxseQpkaWQgd2FzIHRvIHJlYWQgdGhlIGxhc3QgYW5kIHRoZSBmaXJzdCAyTUIgb2YgdGhlIGZp
cnN0IGRpZS4KCkNoZWVycywKdGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
