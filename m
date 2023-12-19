Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA205C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssgWtCYkyRnR3G0TYvkpnWAn1uWhS2leNZhBbVpWAQ0=; b=3lnxkO6XtFZ3cY
	kw//Zkwy6mi9SHV2c3lqUI9/iHSGO9fWu8JGHgoof0aXNuq1C55gENDfgNmQcPi5KLGRJ1R9bYVQv
	EZ/XED6ahVxgCyuASeleaMG1GjIdyN3Ujtb22/BsuciKpzHmxfp/tP1a3+yBihqlAhljQayGiGQvN
	XswFaLnEQfGeUoRXddCcEWYvPlPNpkMv5ViVS/bFNTC3KbfTf6sTME5Pc404Mj0PRQvrnNMlUGnf6
	OBIYzPyYKH7BrA62BgHKJQ372pDNTqm5GpKFZGbfAvUXzUtsfGC21vqRMi8AlrPrsCC2b+Br9mXbD
	wh3yVmhdOtn+YjtEwvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZID-00E239-1N;
	Tue, 19 Dec 2023 12:33:49 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZIA-00E221-2Q;
	Tue, 19 Dec 2023 12:33:48 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7b7f996e076so6590239f.1;
        Tue, 19 Dec 2023 04:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702989225; x=1703594025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47B4J9PJ8CbVtGXi7aaGO0pXjzWtuUJsl1hSW+/clM0=;
        b=e9VbXHr7/7F806zQ8sHQdKTw11gYt3VQjxoE0aq7+/V9g/FIXcasdaP0CfOS4T6m/v
         KpCw0qlcr1xK8KQW6y+Uy6VKTlZ5//emOwc6lAsx0huxEdthKhBcR3jAcl/xEJLJZHks
         d4TC9gUL8oriu4aBwrJ6Ii7B4DLPASnrpiTxF/HNbQberwYgacIL8e/rv0aMdLXs7hET
         BLL+d+46ECqjmxOql63Z3Ps8hwiHDIC3C2uAz++G3RG6i8OCS0ofHMuBgsJJHtM6aPEE
         ST7Dh+Hqqi8nXiiDSRKF7vSHV+/D4VyruR1y67AwgBADlQJIcxA9j+Dlv+MftIFk+QjY
         2HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702989225; x=1703594025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47B4J9PJ8CbVtGXi7aaGO0pXjzWtuUJsl1hSW+/clM0=;
        b=hVwEJqTbJ+tK1AVep2WHJf3ViZE/PNVT+26lXInRVT45ZDUB7Hidjb/QxH4gJ0z4V/
         H1btMBglQ+MH9C+woeFe4VtKhbs+ONdLocVffejZXECkV1GodFvNKI4xM2jCqbUoA52X
         xLq5Gsyvlj3oP3LJX7lgzwWUL86lnmi/XhpLk5aIFu2cmjPXk4ScryHaeFuDVLrKLvVS
         urOdq2r/0KbaKWcX38woyFOoJh0DfswripqBjJDB/2lyCb7M80rYDbpZaZvlcHcD9vUH
         vfIswBb5cEGAONu6Iw+V+1oR6PJhu/9+49UM8r91/nep1E+Am4a5YGt7JMtmvDmpNNfX
         mrdg==
X-Gm-Message-State: AOJu0Yz3NzlpeL55g0KXGYpyzXBNGKQgeP1o8Jg87d10dfCTCZfSBO0d
	6Jitjd5kP2f69llBEYjeLDM=
X-Google-Smtp-Source: AGHT+IEXpl/HsqfETIvhoNyvJx3esAZtdQ4nZMK58D9UPDS8hzawo2vd45dGcfflCZlw5Y97JZ8bqg==
X-Received: by 2002:a6b:6d0b:0:b0:7b7:fb2a:aa29 with SMTP id a11-20020a6b6d0b000000b007b7fb2aaa29mr131668iod.25.1702989225565;
        Tue, 19 Dec 2023 04:33:45 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d928d000000b007b7ab7442efsm2189432iom.22.2023.12.19.04.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 04:33:45 -0800 (PST)
Message-ID: <09f433c0-72cd-4ebe-b405-4c9acc26e8fd@gmail.com>
Date: Tue, 19 Dec 2023 13:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6.8 2/2] nvmem: drop nvmem_layout_get_match_data()
To: Michael Walle <michael@walle.cc>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231219120104.3422-1-zajec5@gmail.com>
 <20231219120104.3422-2-zajec5@gmail.com>
 <040fbc414bf7404046b12dfed7a1c647@walle.cc>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <040fbc414bf7404046b12dfed7a1c647@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_043346_786313_FA162645 
X-CRM114-Status: UNSURE (   9.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTkuMTIuMjAyMyAxMzoyMSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gRnJvbTogUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pgo+PiBUaGFua3MgZm9yIGxheW91dHMgcmVm
YWN0b3Jpbmcgd2Ugbm93IGhhdmUgInN0cnVjdCBkZXZpY2UiIGFzc29jaWF0ZWQKPj4gd2l0aCBs
YXlvdXQuIEFsc28gaXRzIE9GIHBvaW50ZXIgcG9pbnRzIGRpcmVjdGx5IHRvIHRoZSAibnZtZW0t
bGF5b3V0Igo+PiBEVCBub2RlLgo+Pgo+PiBBbGwgaXQgdGFrZXMgdG8gZ2V0IG1hdGNoIGRhdGEg
aXMgYSBnZW5lcmljIG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgpLgo+IAo+IElzbid0IGRldmlj
ZV9nZXRfbWF0Y2hfZGF0YSgpIHByZWZlcnJlZD8KCllvdSdyZSByaWdodC4gSSB0aGluayBhIGJp
ZyBjcnVzYWRlIGFnYWluc3Qgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkKaXMgc3RpbGwgYWhl
YWQgb2YgdXMgYnV0IEknbGwgbWFrZSBzdXJlIHRvIHVzZSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEo
KQppbiBVLUJvb3QgZW52IGxheW91dCB0byBzaGluZSBhcyBhbiBleGFtcGxlIDopCgoKPj4gU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IFJldmlld2Vk
LWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgoKVGhhbmsgeW91IGZvciBxdWlj
ayByZXZpZXdzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
