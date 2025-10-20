Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11611CCD193
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ur9qIcS0blI+Ie8wU76Lnm2/QSQnhE6yxzC3R2hFoZc=; b=ZWRfb2pwMdj1fu
	aVHMIDNI5U6rEevIb3MT3v3nChELgk1+5KBy6iqVkAux9EVsX4rlVfa0Czj+HFbit9p1Ia+eq75bh
	wQNYVj/968LYKdVNzfjWVTRk9QIlQGjpsTFBUbLvMRMvdkhVT+zKwd1Fls093nQ71Byq2wnNHfZSd
	W5gATXPKLNJgj7r/kFaVodNjPGFhsBhRm+OJnedFdVPU8inlcx4eacjbrrw4mTi+mvtNMJvEJA2jb
	iA330gNmy9lOh4HzF0QOCmWuWkiV7j7VflTcaeKQXkscxprEaxMf6bxSBq4t7U3TiLWjjWcbFXMqt
	FR+T6hWIKVKb/WMWt7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoAY-0000000D5S4-1p99;
	Mon, 20 Oct 2025 11:35:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoAU-0000000D5Ql-3mRG
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 11:35:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63bea08a326so5790262a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2025 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760960113; x=1761564913; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVOiWvOXMFLpBcsmZhIb1ehYx8YPAUPw3m9ePPZKo/E=;
        b=ZDuCyfzfJCichajeCytU4mpeTpsXyqRq0j8R+YZusqWiC9vxBHwr0745bpNu1Afbg2
         SQV7Olw8K2p1XSzmDXgqqtBhjyC6t/lXmL0a9X0uEf1uEQW1ulZjoD2ah8PSOVpuECRV
         vf5mlmoBb8ZeVlDYBM0NI0GG2OK+Dh83te5x/sBXbAUP11PIjUkO2ImBmA626WXhZXwE
         iowB4k7ShvSs7S0HIu/pRgMq8PVnW+OP2FhncFWW9kFpweTFp8ImG0weA7UWmlN00JUx
         60dkQ8hHJJf8tladMPBdQKqs8PtnCGvWMUwP4RggoWySvPCmGOCxbraAKTaQgK9en+gs
         WrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960113; x=1761564913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVOiWvOXMFLpBcsmZhIb1ehYx8YPAUPw3m9ePPZKo/E=;
        b=kYhXZecgtaa3N565beoyHq50TcpCiwiNlh5lgnAjo3h8o8kzOO2MJBwnMvY/6wIGYR
         Z5OwthJGbX75ko5PpbO8gosOYRwPdqZ9iMo4wpyir61hY63jCWH5heI09Y2SYbUG+2pR
         Mw9OzHGDeNrk3f9FB5ILEGs2qNJWc+12M8Lsakt2f+hiJOH3mlYaGIV66Ms5Uc7iFpdJ
         6p1L3Ha9l9eeGyV/9ppe9dbwSguZdYD44cngzVcflf5NfP0UeOmqwsxzQasnZdPYnomX
         N84OOvs0pZCKDfBaT1hrcbFf21JyAwkBRfINfoTMKws1XA8XWo8dKoHPOUBmcD7yI6bO
         lSxA==
X-Forwarded-Encrypted: i=1; AJvYcCXf4wQWxquZWTIgsEWznvH/KHoBlEk8Xnd9pIjIL6MTB5DmM13eePxs9HOkrn1d7duGPqMfOZnOHZ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMIq6AsxegA4gXLgOO8NbPCduKedwCpOPv2GUodFuND365uQtc
	y/RvSXFf5GAK9mvLax/sTkFOEADRcLaymQTDLFYsfsvvEM5WfBON3s8nfrBh6jBIjz4=
X-Gm-Gg: ASbGnctS1h4B675sRXqs0CnvEPKW0s/4gwNssPxdENKJsapW+0Vij15s5Gys6Q6jQ5p
	M08jiFq54UGCdOGHYfTFBpuJBHgp6WzQeTeOgKSr8KxLayDRHm5yeL8HL9/bcA3gJeuUIoKoNDB
	Wap2tAz0GGmNzxp3GApCDPOT0OtLxB19MAOlewQ2DvLWc4vh/ruDDfKbmcE7YAHLO81u7wY7VIM
	Zqf/89kU1w+RVyPPGTkCmd4Vh55QE2K1twvQ1JW+J/5ZRrmkF4wX8mjgDiB4YiaovjYhcBZvQbi
	lYY40z1Qy/nN09BFN/HWMS5bsYB8CxGlfttoduoV0fSrHUY3xTS7OH9h8YeLelWAM+pjBJsHilC
	89KoPxV6xtxwLsSqwELm93DYzbXT3CnUV9c0W4BndUlYLzgQcjw8PmtLJhNpJVBlwJHybgCl4pr
	jO7hHxTsvr
X-Google-Smtp-Source: AGHT+IGmQaYS5YQrTXUZnVbXbPa6WETnNR7RFo6LEjL9c8jO6SH0WaHZGgofjnkJG3Bekcn4U1sz+A==
X-Received: by 2002:a05:6402:2049:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-63c1f6dfc43mr9044826a12.35.1760960112921;
        Mon, 20 Oct 2025 04:35:12 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4943027fsm6574326a12.26.2025.10.20.04.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:35:12 -0700 (PDT)
Message-ID: <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Date: Mon, 20 Oct 2025 12:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_043515_145518_8B91218C 
X-CRM114-Status: GOOD (  17.13  )
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

CgpPbiAxMC8xNy8yNSA1OjA0IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxMC8xMy8yNSA1
OjQxIFBNLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IEhlbGxvIFR1ZG9yLAoKSGkhCgo+IAo+
Pj4+IFRoZSAiSW5kZXggVmFsdWUiIHNoYWxsIGJlIHRoZSBtYXBfaWQgdGhhdCB5b3UgcGFzc2Vk
IGluIHRoZSBjb2RlOgo+Pj4+IHNwaV9ub3JfcG9zdF9zbXB0X2ZpeHVwcyhub3IsICZtYXBfaWQp
Owo+Pj4+Cj4+Pj4gQ2FuIHlvdSBwbGVhc2UgcHJpbnQgdGhlIG1hcF9pZCB2YWx1ZSB0aGF0IHlv
dSBvYnRhaW4gd2l0aG91dCB1cGRhdGluZyBpdD8KPj4+Cj4+PiAweDQKPj4KPj4gVGhpcyB0cmFu
c2xhdGVzIHRvIENSM05WWzNdID0gMSwgQ1IxTlZbMl0gPSAwLMKgIENSM05WWzFdID0gMC4KPj4+
Cj4+Pj4gTGV0J3MgYWxzbyBwcmludCB0aGUgdmFsdWVzIG9mIENSM05WIGFuZCBDUjFOVi4KPj4+
Cj4+PiBCb3RoIDB4MCBhbmQgMHgwIC4KPj4KPj4gQnV0IGhlcmUgQ1IzTlYgaXMgMCwgaXQgY29u
dHJhZGljdHMgdGhlIHJlc3VsdCBmcm9tIGFib3ZlLgo+IAo+IE1heWJlIEkgbWVzc2VkIHVwIGFu
ZCB3YXMgcmVhZGluZyBpdCB0aGUgd3Jvbmcgd2F5ID8KPiAKPj4gTWF5YmUgaXQncyB0aGUgc2Ft
ZSBwcm9ibGVtIHRoYXQgVGFrYWhpcm8gaWRlbnRpZmllZDogdGhlIGZsYXNoIG5lZWRzCj4+IDgg
ZHVtbXkgY3ljbGVzLCBidXQgdGhlIGNvZGUgdXNlcyB6ZXJvIGR1bW15IGN5Y2xlcywgcmVzdWx0
aW5nIGluCj4+IHJlYWRpbmcgZ2FyYmFnZSBkYXRhLCBkZXBlbmRpbmcgb24gd2hldGhlciB5b3Vy
IElPIGxpbmVzIGFyZSBwdWxsZWQgdXAvZG93bgo+PiBvciBmbG9hdGluZy4KPj4KPj4gQ2FuIHlv
dSByZWRvIHRoZSB0ZXN0IHdpdGggdGhlIGZvbGxvd2luZyBwbGVhc2U/Cj4gCj4gU3VyZSwgYWx0
aG91Z2ggSSBzYXcgc29tZSBmdXJ0aGVyIGRpc2N1c3Npb24gYmV0d2VlbiB5b3UgYW5kIEt1d2Fu
by1zYW4gLCBpcyB0aGlzIHN0aWxsIGFwcGxpY2FibGUgPwoKSXQncyBzdGlsbCBhcHBsaWNhYmxl
LCBpdCB3aWxsIGNvbmZpcm0gd2hhdCBLdXdhbm8tc2FuIGRpc2NvdmVyZWQ6CnRoZSBmbGFzaCBu
ZWVkcyA4IGR1bW15IGN5Y2xlcyBmb3IgdXNpbmcgdGhhdCByZWFkIHJlZyBjb21tYW5kLgoKV2Un
bGwgYWxzbyBuZWVkIGEgaG9vayB0byBhbWVuZCB0aGUgQ1IzTlZbMV0gdmFsdWUgKHdoaWNoIGlz
IHJlc2VydmVkLAp6ZXJvIG9uIHNvbWUgZmxhdm9ycyBvZiBmbGFzaCkgYW5kIHJlcGxhY2UgaXQg
d2l0aCAxLCBzaW1pbGFyIHRvIHdoYXQKeW91IGRpZCBpbiB0aGlzIHBhdGNoLgoKWW91IGNhbiBl
aXRoZXIgdGVzdCBvciBsZXQgS3V3YW5vLXNhbiBjb21lIHVwIHdpdGggYSBwYXRjaCBhZGRyZXNz
aW5nCmJvdGggaXNzdWVzIGFuZCB0ZXN0IGhpcyBwYXRjaCBhZnRlcndhcmRzLCBzeW5jIHVwIHdp
dGggaGltIHBsZWFzZS4KCj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3Nm
ZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+IGluZGV4IDIxNzI3ZjlhNGFjNi4u
ODU0NDNjOTAzZTU5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+
PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+PiBAQCAtNzUyLDcgKzc1Miw3IEBA
IHN0YXRpYyBjb25zdCB1MzIgKnNwaV9ub3JfZ2V0X21hcF9pbl91c2Uoc3RydWN0IHNwaV9ub3Ig
Km5vciwgY29uc3QgdTMyICpzbXB0LAo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWFkX2RhdGFfbWFzayA9IFNNUFRfQ01EX1JFQURfREFUQShzbXB0W2ldKTsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5hZGRyX25ieXRlcyA9IHNwaV9ub3Jf
c21wdF9hZGRyX25ieXRlcyhub3IsIHNtcHRbaV0pOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBub3ItPnJlYWRfZHVtbXkgPSBzcGlfbm9yX3NtcHRfcmVhZF9kdW1teShub3IsIHNt
cHRbaV0pOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPnJlYWRfZHVtbXkg
PSA4Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPnJlYWRfb3Bjb2Rl
ID0gU01QVF9DTURfT1BDT0RFKHNtcHRbaV0pOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBhZGRyID0gc21wdFtpICsgMV07Cj4+IMKgIEBAIC03NjcsNiArNzY3LDggQEAgc3Rh
dGljIGNvbnN0IHUzMiAqc3BpX25vcl9nZXRfbWFwX2luX3VzZShzdHJ1Y3Qgc3BpX25vciAqbm9y
LCBjb25zdCB1MzIgKnNtcHQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBDb25maWd1cmF0aW9uIHRoYXQgaXMgY3VycmVudGx5IGluIHVzZS4KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtYXBfaWQgPSBtYXBfaWQgPDwgMSB8ICEhKCpidWYgJiByZWFkX2RhdGFfbWFzayk7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIobm9yLT5kZXYsICJpID0gJWQs
IGJ1ZiA9ICUwMngsIG1hcF9pZCA9ICUwMnhcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpLCBidWZbMF0sIG1hcF9pZCk7Cj4+IMKgwqDCoMKgwqDC
oMKgwqAgfQo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KeWVhaCwgbm8gd29ycmllcywgaXQn
cyBzdGlsbCBmcmVzaC4KCkNoZWVycywKdGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
