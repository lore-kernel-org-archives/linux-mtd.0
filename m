Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C0EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCklgxOCZv5BAUvckOcZ/WjZIq+NnU+BRKCurBWESTo=; b=qIPPftEKItPOJ+
	Lp3skcyk1M9MnfGnomGsfR9LK74WH7x58AUXI4pd1/191ORLpYMPFk9AV83TNJ7CYJu9s1higluOy
	qH4vKitC4n9ujb+AQKBUGYvFzozpTR+ziss6mcFHl/XLGY5rzTgFJ3rqVdXfB/kA3y4ZyOL5sBpWK
	gFiyBLmFgGzNeP6//2HzvlgvQ562cM6DT5SOHbobYjWBTVY/nOoROevlwROj6Q/EEtlzpCAmmgf7F
	O04tXVnbh48xktHNdVX9zjpcUVmRdIPTpaxPfYhbzlTJv2QM4cQmRecWGx8X6EttD6qRD41jYuf3+
	/CjvD4pZwmaMx9qkx8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2f9-006Oed-05;
	Wed, 19 Jul 2023 08:35:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2f7-006Odg-1O
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9HE+Oix7TpLVk1HmTfb4ABzqg7vkmtJM2h4JGp2urH0=; b=bDUOYazelJ9kwviBP+siRLuNNB
	hbTP4Qw0yJAoW1U0oErbpIKgJEnSlI41B+3fZTeiqUc6ebE0NMFgV1sc5Zine9E+6jPXpcQGDG3Ea
	OT0a6aWn8FCg7qND0WlLu8dSsVPtqklvLDeRsGWtADjn/jyOa39ZqPDRS4wORalrGp3n2FmhH+Ww4
	KhLIYr4Qdexw8RM7majcX7rKRIy4KQs7Kmx0yMv3P5/T7mfM1Fj58doAzJbkgOVrFUeyOhAvBZ8FV
	1hnNgqXsHun1QV6SYRXHP1kLv4eBpe/xxfQiIG1nAH/UwNeqAz9MW+rtSaJNDnh3qeEzALwHzuWi2
	DEG8ASSA==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfPl-00BGb8-04
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 07:46:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso49576045e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689666271; x=1692258271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HE+Oix7TpLVk1HmTfb4ABzqg7vkmtJM2h4JGp2urH0=;
        b=J8RUGAcUcigaAJQXgqRjsDIrBHp2ntqz7wavjEbkn3knygg9ahwPeGqkNBIYcKfIDw
         fL8btNa0oGfzo8Wv0ctTFMxbSoZprK+7GI5jjy6dZ8vj7Fq2z0ENcYR8y7jcIs+5fZcm
         x4ZaWAFMpcSPWGOD79eidsUaPp9oO4HB87zzV/pzYCp0B9aya3lOkowPk/Qs4M4xR0WM
         z8s3V7B+5+sX1hK+F70JTfQaI72EQ3JCkFdAdLAZhJASFHZ5UeVoYokXe2ZiV+0v2Cmv
         zbXa+KZtBNM9PYh9OHZHVpX7IiWZ7Ap0/XfTV4pl0DYd8Smx1VR/437BOdY4e987lKJ5
         n4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666271; x=1692258271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HE+Oix7TpLVk1HmTfb4ABzqg7vkmtJM2h4JGp2urH0=;
        b=H013kmd5hyETrcWn6ZGASJt1bB7s3z2Y9XXwAPgMznCZW7IWnn50Utj5T86N38roDG
         9daP/MAMYt4jeIkVb+1ggKXwsm2lxf6WChsWT8JKYVW/in5f7H41difneEzUycHEDYlf
         Wm2D4nKKUyw3UUy+8clkG16HxokIo44c2gs/3fNtRGmwWqQADDqWo8qK/UWlzq5ZWlXW
         uHYPUcMJtXVTxIAYMRKv1WcLjzdJCyheZbXEAPBg+WBZ1DyENUl0Od5kN4LoonIbutmT
         r3o1KMPttQNjxJb1gem6z+DlGs8Ywn+6aUI8/+WNbiY+pZIoETCkFhoOneDHHjnG7pVW
         rYuw==
X-Gm-Message-State: ABy/qLaGTxl0cW9O3c64t7NSuJJsLsXzgJn+Idf/ShPflrp+zkvt38B7
	CVWEUB8jlQXzpbRHACeeadoyOw==
X-Google-Smtp-Source: APBJJlEC+GZ2Wuo773tHd6/PokbpabY/9JONiWrESJsgr8zMIvZ0NtmsY30tsNx+iLjwk/w+wQE32A==
X-Received: by 2002:a1c:7212:0:b0:3fb:afc0:56c5 with SMTP id n18-20020a1c7212000000b003fbafc056c5mr1232534wmc.12.1689666271265;
        Tue, 18 Jul 2023 00:44:31 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003fb225d414fsm9518654wmi.21.2023.07.18.00.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:44:30 -0700 (PDT)
Message-ID: <2d71326c-023e-69af-9337-62672f50fed9@linaro.org>
Date: Tue, 18 Jul 2023 08:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
To: Michael Walle <michael@walle.cc>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
 <f00fa2ae-6d4a-90cb-3724-2bedb96cb4fb@linaro.org>
 <0525440a652854a2a575256cd07d3559@walle.cc>
 <d99d87e7-47ba-d6fe-735f-16de2a2ec280@linaro.org>
 <e642ff27fd0bc0f1f0e293972145f680@walle.cc>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e642ff27fd0bc0f1f0e293972145f680@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_084633_206767_34841811 
X-CRM114-Status: GOOD (  36.78  )
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

CgpPbiA3LzE4LzIzIDA3OjI1LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEhpLAo+IAo+Pj4+IHdo
aWxlIGhlcmUgdHJ5LCB1c2luZyBJTkZPIHdpdGggSU5GTygweGVmNDAxOCwgMCwgMCwgMCksIHRo
b3NlCj4+Pj4gcGFyYW1ldGVycyBzaGFsbCBiZSBkaXNjb3ZlcmVkIGF0IHJ1bi10aW1lLCBzbyB3
ZSBwcmVwYXJlIHRvIGdldCByaWQgb2YKPj4+PiBleHBsaWNpdGx5IHNldHRpbmcgdGhlbSBzb29u
ZXIgb3IgbGF0ZXIuCj4+Pgo+Pj4gVGhpcyBpcyBhbiBlbnRyeSBtYXRjaGluZyB2YXJpb3VzIGZs
YXNoIGZhbWlsaWVzIGZyb20gV2luYm9uZCwgc2VlIG15Cj4+PiByZXBseSBpbiB2MS4gSSdtIG5v
dCBzdXJlIHdlIHNob3VsZCByZW1vdmUgdGhlc2UgYXMgd2UgY291bGQgYnJlYWsgdGhlCj4+PiBv
bGRlciBvbmVzLCB3aGljaCBtaWdodCBvciBtaWdodCBub3QgaGF2ZSBTRkRQIHRhYmxlcy4gV2Ug
ZG9uJ3Qga25vdy4KPj4KPj4gSSdkIHRha2UgdGhlIHJpc2sgYW5kIGJyZWFrIHRoZSBvbGRlciBv
bmVzIGlmIHRoZXJlIGFyZSBzb21lIHRoYXQgZG9uJ3QKPj4gZGVmaW5lIFNGRFAgaW5kZWVkLCBq
dXN0IHRvIGhhbmRsZSB0aGUgY29uZmxpY3QgcHJvcGVybHkuIFdlIGNhbid0Cj4+IGVuY291cmFn
ZSBjb2RlIGJhc2VkIG9uIGFzc3VtcHRpb25zIG90aGVyd2lzZSB3ZSdsbCBnZXQgYmFjayB0byB0
aGUKPj4ga25vdHRlZCBzcGktbm9yIGNvZGUgdGhhdCB3ZSB0cmllZCB0byB1bnRpZSBpbiB0aGUg
bGFzdCB5ZWFycy4KPiAKPiBXYWl0IGEgbWludXRlLCBub3cgSSdtIHRoZSBtb3JlIGNvbnNlcnZh
dGl2ZSBvbmUgb2YgdGhlIGJvdGggb2YKPiB1cz8gKDoKCjspCgo+IAo+IEpva2VzIGFzaWRlLCBi
YXNpY2FsbHkgeW91IGFyZSBzYXlpbmcgdGhhdCBpZiB0aGVyZSBhcmUgdHdvIGZsYXNoZXMKPiB3
aXRoIHRoZSBzYW1lIGlkLCBvbmUgc3VwcG9ydHMgSkVERUMgb25lIGRvZXNuJ3QsIHdlIGNhbiBi
cmFrZSB0aGUKPiBsYXR0ZXIgb25lLgoKSSBzYXkgSSBkb24ndCB3YW50IHRvIHN1ZmZvY2F0ZSB0
aGUgY29kZSBiYXNlZCBvbiBhc3N1bXB0aW9ucyBhbmQgSSdtIHJlYWR5CnRvIHRha2UgdGhlIHJp
c2sgYW5kIGJyZWFrIHNvbWUgcHJlc3VtYWJseSBvbGQgZmxhc2hlcyB0aGF0IGRvbid0IHN1cHBv
cnQKU0ZEUC4gSWYgd2Uga25vdyBmb3Igc3VyZSB0aGF0IHdlIGJyZWFrIG9sZCB2YXJpYW50cyBv
ZiB0aGlzIGZsYXNoIElELAp0aGVuIHdlIGhhdmUgdG8gcmV3b3JrIHRoZSBjb3JlIG5vdy4gT3Ro
ZXJ3aXNlIEknbGwgcmV3b3JrIGl0IHdoZW4gYSBidWcKaXMgcmVwb3J0ZWQuCgo+IAo+Pj4+PiAt
wqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLKSB9LAo+Pj4KPj4+IFRodXMsIEkn
ZCBhbHNvIGtlZXAgdGhpcyBvbmUuCj4+Pgo+Pgo+PiBLZWVwaW5nIHRoaXMgb25lIGRvZXMgbm90
IGhhdmUgdGhlIGVmZmVjdCB0aGF0IHlvdSB3YW50IGFzIFNFQ1RfNEsgaXMKPj4gdXNlZCBpbiBz
cGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKSB3aGljaCBpcyBub3QgY2FsbGVkIHdoZW4KPj4g
UEFSU0VfU0ZEUCBpcyBzZXQsIHdoaWNoIG1ha2VzIHBlcmZlY3RseSBzZW5zZS4gTGV0J3MgZHJv
cCB0aGlzIGFuZCBpZgo+PiBidWdzIHdpbGwgYmUgcmVwb3J0ZWQsIEkgY29tbWl0IEknbGwgZml4
IHRoZW0gaW4gdGhlIHNhbWUgcmVsZWFzZSBjeWNsZS4KPiAKPiBNaGgsIEkgc2hvdWxkIGhhdmUg
YmVlbiBtb3JlIGN1cmlvdXMgdG8gd2h5IExpbnVzIG5lZWRlZCB0aGUgUEFSU0VfU0ZEUAo+IGZs
YWcgaW4gdGhlIGZpcnN0IHBsYWNlLiBUYWtpbmcgYSBjbG9zZXIgbG9vaywgdGhhdCBpcyBiZWNh
dXNlIGluIHRoZQo+IGxlZ2FjeSBiZWhhdmlvciwgdGhlIFNGRFAgaXMgb25seSByZWFkIGlmIHRo
ZSBjaGlwIHN1cHBvcnRzIGR1YWwgb3IKPiBxdWFkIHJlYWQgKHdoYXRldmVyIHRoZSByYXRpb25h
bGUgd2FzIGZvciB0aGF0KS4KCmR1YWwgb3IgcXVhZCByZWFkcyBhcmUgcGFyYW1zIHRoYXQgY291
bGQgYmUgZGlzY292ZXJlZCBpbiB0aGUgZmlyc3QgdmVyc2lvbiBvZgpTRkRQLCB0aGF0IHdoeSB0
aGV5IGFzc29jaWF0ZWQgdGhlbSB3aXRoIHJlYWRpbmcgU0ZEUC4gTm90IGdyZWF0LCBidXQgaXQK
d29ya2VkLgoKPiAKPiBBbHNvLCBpZiBQQVJTRV9TRkRQIGlzIHNldCwgbm9uZSBvZiB0aGUgbm9f
c2ZkcF9mbGFncyBhcmUgZXZlciBoYW5kbGVkLgo+IElmIHRoZSBjaGlwIGRvZXNuJ3Qgc3VwcG9y
dCB0aGUgU0ZEUCBpcyB3aWxsIGp1c3QgZmFpbCBwcm9iaW5nLgo+IAo+IEFzIEknbSByZWFkaW5n
IHRoZSBjb2RlIHJpZ2h0IG5vdywgZm9yIHRoZSBuZXcgYmVoYXZpb3IKPiBpdCBpcyBlaXRoZXIK
PiDCoCogZXhwZWN0IHRoZSBmbGFzaCBzdXBwb3J0cyBTRkRQLCBpZiBub3QsIHByb2JlIGZhaWxz
Cj4gwqAqIGV4cGVjdCB0aGUgZmxhc2ggdG8gZG9uJ3Qgc3VwcG9ydCBTRkRQLCBubyBTRkRQIGlz
IGV2ZXIgcmVhZCBhdCBhbGwKPiAKCnNvcnQgb2YuIEl0J3MgbW9yZSBlbGFib3JhdGUgdGhhbiB0
aGF0LiBDaGVjayBzcGlfbm9yX2luaXRfcGFyYW1zKCkuCj4gU2hvdWxkbid0IHdlIGhhbmRsZSB0
aGUgdGhpcmQgY2FzZSBpbiB0aGUgbmV3IGJlaGF2aW9yLCB0b286Cj4gwqAqIHN0YXJ0IHdpdGgg
dGhlIHN0YXRpYyBkYXRhIHdlIGhhdmUgYW5kIHRyeSByZWFkaW5nIFNGRFAgdG8gYW1lbmQvY29y
cmVjdCBpdC4KClRoaXMgY2FzZSBpcyBhbHJlYWR5IHN1cHBvcnRlZCBhbmQgaXQncyB0aGUgb2xk
IHdheSBvZiBpbml0aWFsaXppbmcgZmxhc2gKcGFyYW1ldGVycy4gQ2hlY2sgc3BpX25vcl9pbml0
X3BhcmFtc19kZXByZWNhdGVkKCkuCgpJIGRvbid0IHdhbnQgdG8gZG8gdGhhdCBmb3IgdGhlIFNG
RFAgY2FwYWJsZSBmbGFzaGVzIGZvciBub3csIG90aGVyd2lzZQp3ZSdsbCBoYXZlIGFnYWluIHBh
cmFtZXRlcnMgaW5pdGlhbGl6ZWQgYWxsIG92ZXIgdGhlIHBsYWNlLCB3aGljaCByZXN1bHRzCmlu
IHVnbHkgaGFyZCB0byByZWFkIGNvZGUuIFlvdSBoYXZlIHRoZSBmaXh1cCBob29rcyBpZiB5b3Ug
bmVlZCB0byBhbWVuZCBTRkRQCmRhdGEuIEFuZCBzaW5jZSB0aGUgZmlyc3QgdGFibGUgb2YgU0ZE
UCBpcyBtYW5kYXRvcnkgKEJGUFQpLCBpZiB5b3Ugc2V0IFBBUlNFX1NGRFAKYW5kIGdldCBhbiBl
cnJvciwgdGhlbiB5b3Ugc2hvdWxkbid0IGhhdmUgc2V0IFBBUlNFX1NGRFAgaW4gdGhlIGZpcnN0
IHBsYWNlLgpPcHRpb25hbCBTRkRQIHRhYmxlcyByZXR1cm4gdm9pZCBhbmQgd2UgaGF2ZSBhIHJv
bGxiYWNrIG1lY2hhbmlzbSBmb3IgdGhlIHBhcmFtZXRlcnMKc2V0IGluIHRob3NlIG9wdGlvbmFs
IHRhYmxlcyBpbiBjYXNlIG9mIGVycm9ycy4KCj4gCj4gSWYgbm90LCB3aWxsIHlvdSBhY2NlcHQg
YnJlYWthZ2UgZm9yIGZ1dHVyZSBmbGFzaGVzLCB0b28/IExvb2tpbmcgYXQgd2luYm9uZC5jCj4g
Zm9yIGV4YW1wbGUsIEkgZ3Vlc3MgYWxsIGNoaXBzIHdpdGggMHhlZjQwLi4gMHhlZjUwLi4gYW5k
IDB4ZWY2MC4uIHN1cHBvcnRzCj4gU0ZEUCBub3dhZGF5cyBhbmQgbW9zdCBvZiB0aGVtIG9ubHkg
aGF2ZSBTRUNUXzRLIHNldC4KCkkgd2lsbC4gTm90ZSB0aGF0IHlvdSBoYXZlIHRvIGFjdHVhbGx5
IGhhdmUgYSBwaHlzaWNhbCBmbGFzaCB0byBkbyBjaGFuZ2VzLApJIGRvbid0IHF1ZXVlIHVudGVz
dGVkIHBhdGNoZXMuCj4gCj4+IElmIGJvdGggb2YgeW91IGFncmVlLCBJJ2xsIGFtZW5kIExpbnVz
J3MgdjQgcGF0Y2ggd2hlbiBhcHBseWluZy4KPiAKPiBTbyBpdCB3b3VsZCBiZSB0aGUgZmlyc3Qg
Y2hpcCB3aXRob3V0IGZsYWdzIGF0IGFsbD8gVGhlbiB3ZSBjb3VsZAo+IGRyb3AgdGhlIGVudHJ5
IGVudGlyZWx5IDopIEFuZCBpZiB3ZSBkbyB0aGlzLCB0aGVuIHdlIHNob3VsZCBhbHNvCgpObywg
eW91IGhhdmUgdGhlIGxvY2tpbmcgZmxhZ3MgdGhhdCBjYW4ndCBiZSBkaXNjb3ZlcmVkIGJ5IHBh
cnNpbmcgU0ZEUCwKdGh1cyB5b3UgbmVlZCB0byBkZWZpbmUgYSBmbGFzaCBlbnRyeSBmb3IgaXQu
Cgo+IGRyb3AgYWxsIHRoZSBvdGhlciBlbnRyaWVzIGZvciB0aGUgbmV3ZXIgd2luYm9uZCBmbGFz
aGVzLgoKSWYgeW91IGNhbiB0ZXN0IGl0LCBhbmQgdGhlcmUncyBubyBkZWRpY2F0ZWQgY29tcGF0
aWJsZSBmb3IgdGhhdCBmbGFzaCwKSSdtIG9rIHRvIGRyb3AgdGhlbS4KPiAKPiBJZiB5b3UgZGVj
aWRlIHRvIGJyZWFrIG9sZGVyIGZsYXNoZXMsIHRoZW4gSSdkIHByZWZlciB0byBhbHNvIGRyb3AK
PiB0aGUgbl9zZWN0b3JzIGFuZCBzZWN0b3Jfc2l6ZSwgaS5lLiBJTkZPKDB4ZWYuLi4uLCAwLCAw
LCAwKS4KPiAKCklzbid0IHY0IGFscmVhZHkgZG9pbmcgdGhpcz8gSSdsbCBhbWVuZCBpdCBpZiBu
b3QuIFdhaXRpbmcgZm9yIGFjayBmcm9tCmJvdGggeW91IGFuZCBMaW51cy4KCkNoZWVycywKdGEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
