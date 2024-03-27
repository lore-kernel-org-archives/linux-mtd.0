Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E8C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IU2u6ykiHpHcyqZsDBvD0VrQR0H2zO8fus363d/FfKo=; b=ZWlSQlKA6eNl+v
	A5sjnBBn6TND2v6lo1y7y366iJZzoN3sdRP2odvbs22xG9A5kZTdnevEyD24TuJ7MugZoKvZxUxyV
	VdAt70FtP4kkmpBM/W5qQVrTnk88xV5JOOjVHtJ+VDryxMRtbX1yxVAxzzDXxX0DLAIKv/ITyp1pC
	Ee1ks0TcZwTeE45JWRIhFc705fIKgml+wfDKgbCBgXGjJusa5bJ0IgVN7rdcsM36oNs2AfnLX1Y2x
	ZTPqG+ljSM7QC+dIK+qTd/UZ00Ic0f6yLCQUsdL3ry0i7PKzRX376EW+bypRbyZYdYtU3en/TvtIl
	P9lYPAGJYkWmLEYO7ccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUOm-00000009W67-36TM;
	Wed, 27 Mar 2024 14:37:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUOj-00000009W3M-2iJz
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 14:37:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4149529f410so5922825e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2024 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711550219; x=1712155019; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QlBuDPO4NDedXxsV0KoGnPJolaV0ADmz/BaiLD5HCQ=;
        b=PLzO7a9VLFDDlblukbluHndNYNJyseCuvPEKGuno+0erZ50fXlIwkyxg1VJjhLJdx8
         ZzLG6WYa8DE1Cj8k5OKLMNf2kLMNlp/n0qz+BX2NvQ545To7fxOo3vfLj8ldmEGDf6/R
         +8LxaVPNNXeYvXO8LemmIjEw/YT2eA90On5oWZdwGXc2f/OizbzoVEbdoCUcWjGpL/fm
         hpqnYd5xFRieZcO27KSjZv16lDe5WsHKdGQtQInARncYrAFr6Hxs4nsf6zdImE7QJRdV
         tA/aln6EA25ITcpJwdvrAfOHbTpLcYVtFPyFl0pR5wVMieyp0TvQDww0j/IQWqoLf8Zi
         U9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550219; x=1712155019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QlBuDPO4NDedXxsV0KoGnPJolaV0ADmz/BaiLD5HCQ=;
        b=VmWyiUw1QBo3mLtNecnbaDlhIBxr/vp/P84qOcu+Bdotp0UunIkwzlauUGJX0MfD2R
         qKgjWMtUwuwSFMWQz8EHDDrxcvjUtjX+/bkcyQQy7uoWzWijUjQ7F6qBLsYydi+XOCfF
         HjF68+LEOJSlEBW6AvmcOtWtagQh94oF1harji/ao5KNAjnOIYyYX4tt9xTc5kJ4aXhe
         WOp5FCSTD28JLWVBC1/beq2jwR7ysSr0N6Ezt/+RCB4hE8WddHHdMc9NgN78KO3Agarc
         lONMbMpJ3dBuTW9jVJ/kVrxttwgqGyKA6NpkEx+4pLbgaxEmbAgIhX8U021PCJTVCnOk
         C+rg==
X-Forwarded-Encrypted: i=1; AJvYcCWMqWqfmT/4EQ+xzp1i48L4Y+9Uh/Ftre7iMN9TuxsH3U7gAJ1LTeCIgnhqkeQlOmxzQzfRIwgMVxIaFOWLCsTmJq1EtwS2BNggAAZyEQ==
X-Gm-Message-State: AOJu0Yw1ghHrFqpWdhzMNbH9yv4qQDgike+7Tj4pHjxJnVQrJFQ0/5M+
	WQEP72tvA1nLHQOJK8lwbdqmcJ8JRDVFCUEABGAB91/gYCUS/sQg
X-Google-Smtp-Source: AGHT+IHIbyFyKXy/IZRZSRFF7DCQjRg/SHOr/w5jI1d9TxuX7iA2NeciNy2jNtJ3pwQ508N84aKcww==
X-Received: by 2002:a05:6000:1b8a:b0:341:bbf2:4c36 with SMTP id r10-20020a0560001b8a00b00341bbf24c36mr135699wru.27.1711550218658;
        Wed, 27 Mar 2024 07:36:58 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-247-253-192.retail.telecomitalia.it. [95.247.253.192])
        by smtp.gmail.com with ESMTPSA id bn15-20020a056000060f00b00341e2802a30sm1479190wrb.98.2024.03.27.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:36:58 -0700 (PDT)
Message-ID: <66042f0a.050a0220.374bd.5e4a@mx.google.com>
X-Google-Original-Message-ID: <ZgQvBopKexcur9H9@Ansuel-XPS.>
Date: Wed, 27 Mar 2024 15:36:54 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: limit OTP NVMEM Cell parse to non Nand devices
References: <20240322040951.16680-1-ansuelsmth@gmail.com>
 <44a377b11208ff33045f12f260b667dd@milecki.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44a377b11208ff33045f12f260b667dd@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_073701_718332_A079A727 
X-CRM114-Status: GOOD (  30.27  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMDM6MjY6NTVQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDIwMjQtMDMtMjIgMDU6MDksIENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOgo+
ID4gTVREIE9UUCBsb2dpYyBpcyB2ZXJ5IGZyYWdpbGUgYW5kIGNhbiBiZSBwcm9ibGVtYXRpYyB3
aXRoIHNvbWUgc3BlY2lmaWMKPiA+IGtpbmQgb2YgZGV2aWNlcy4KPiA+IAo+ID4gTlZNRU0gYWNy
b3NzIHRoZSB5ZWFycyBoYWQgdmFyaW91cyBpdGVyYXRpb24gb24gaG93IENlbGxzIGNvdWxkIGJl
Cj4gPiBkZWNsYXJlZCBpbiBEVCBhbmQgTVREIE9UUCBwcm9iYWJseSB3YXMgbGVmdCBiZWhpbmQg
YW5kCj4gPiBhZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzIHdhcyBlbmFibGVkIHdpdGhvdXQgdGhp
bmtpbmcgb2YgdGhlCj4gPiBjb25zZXF1ZW5jZXMuCj4gCj4gRXIuLi4gdGhhbmsgeW91Pwo+CgpQ
cm9iYWJseSBtYWRlIHNvbWUgYmFkIGFzc3VtcHRpb24gYW5kIHNvcnJ5IGZvciBpdCEKCj4gCj4g
PiBUaGF0IG9wdGlvbiBlbmFibGVzIE5WTUVNIHRvIHNjYW4gdGhlIHByb3ZpZGVkIG9mX25vZGUg
YW5kIHRyZWF0IGVhY2gKPiA+IGNoaWxkIGFzIGEgTlZNRU0gQ2VsbCwgdGhpcyB3YXMgdG8gc3Vw
cG9ydCBsZWdhY3kgTlZNRU0gaW1wbGVtZW50YXRpb24KPiA+IGFuZCBkb24ndCBjYXVzZSByZWdy
ZXNzaW9uLgo+ID4gCj4gPiBUaGlzIGlzIHByb2JsZW1hdGljIGlmIHdlIGhhdmUgZGV2aWNlcyBs
aWtlIE5hbmQgd2hlcmUgdGhlIE9UUCBpcwo+ID4gdHJpZ2dlcmVkIGJ5IHNldHRpbmcgYSBzcGVj
aWFsIG1vZGUgaW4gdGhlIGZsYXNoLiBJbiB0aGlzIGNvbnRleHQgcmVhbAo+ID4gcGFydGl0aW9u
cyBkZWNsYXJlZCBpbiB0aGUgTmFuZCBub2RlIGFyZSByZWdpc3RlcmVkIGFzIE9UUCBDZWxscyBh
bmQKPiA+IHRoaXMgY2F1c2UgcHJvYmUgZmFpbCB3aXRoIC1FSU5WQUwgZXJyb3IuCj4gPiAKPiA+
IFRoaXMgd2FzIG5ldmVyIG5vdGljZSBkdWUgdG8gdGhlIGZhY3QgdGhhdCB0aWxsIG5vdywgbm8g
TmFuZCBzdXBwb3J0ZWQKPiA+IHRoZSBPVFAgZmVhdHVyZS4gV2l0aCBjb21taXQgZTg3MTYxMzIx
YTQwICgibXRkOiByYXduYW5kOiBtYWNyb25peDogT1RQCj4gPiBhY2Nlc3MgZm9yIE1YMzBMRnhH
MThBQyIpIHRoaXMgY2hhbmdlZCBhbmQgY29pbmNpZGVudGFsbHkgdGhpcyBOYW5kIGlzCj4gPiB1
c2VkIG9uIGFuIEZyaXR6Qm94IDc1MzAgc3VwcG9ydGVkIG9uIE9wZW5XcnQuCj4gCj4gU28gYXMg
eW91IG5vdGljZWQgdGhpcyBwcm9ibGVtIHdhcyAqZXhwb3NlZCogYnkgYWRkaW5nIE9UUCBzdXBw
b3J0IGZvcgo+IE1hY3Jvbml4IE5BTkQgY2hpcHMuCj4gCj4gCj4gPiBBbHRlcm5hdGl2ZSBhbmQg
bW9yZSByb2J1c3Qgd2F5IHRvIGRlY2xhcmUgT1RQIENlbGxzIGFyZSBhbHJlYWR5Cj4gPiBwcm9z
c2libGUgYnkgdXNpbmcgdGhlIGZpeGVkLWxheW91dCBub2RlIG9yIGJ5IGRlY2xhcmluZyBhIGNo
aWxkIG5vZGUKPiA+IHdpdGggdGhlIGNvbXBhdGlibGUgc2V0IHRvICJvdHAtdXNlciIgb3IgIm90
cC1mYWN0b3J5Ii4KPiA+IAo+ID4gVG8gZml4IHRoaXMgYW5kIGxpbWl0IGFueSByZWdyZXNzaW9u
IHdpdGggb3RoZXIgTVREIHRoYXQgbWFrZXMgdXNlIG9mCj4gPiBkZWNsYXJpbmcgT1RQIGFzIGRp
cmVjdCBjaGlsZCBvZiB0aGUgZGV2IG5vZGUsIGRpc2FibGUKPiA+IGFkZF9sZWdhY3lfZml4ZWRf
b2ZfY2VsbHMgaWYgd2UgZGV0ZWN0IHRoZSBNVEQgdHlwZSBpcyBOYW5kLgo+ID4gCj4gPiBXaXRo
IHRoZSBmb2xsb3dpbmcgbG9naWMsIHRoZSBPVFAgTlZNRU0gZW50cnkgaXMgY29ycmVjdGx5IGNy
ZWF0ZWQgd2l0aAo+ID4gbm8gQ2VsbHMgYW5kIHRoZSBNVEQgTmFuZCBpcyBjb3JyZWN0bHkgcHJv
YmVkIGFuZCBwYXJ0aXRpb25zIGFyZQo+ID4gY29ycmVjdGx5IGV4cG9zZWQuCj4gPiAKPiA+IEZp
eGVzOiAyY2MzYjM3ZjViNmQgKCJudm1lbTogYWRkIGV4cGxpY2l0IGNvbmZpZyBvcHRpb24gdG8g
cmVhZCBvbGQKPiA+IHN5bnRheCBmaXhlZCBPRiBjZWxscyIpCj4gCj4gSXQncyBub3QgdGhhdCBj
b21taXQgaG93ZXZlciB0aGF0IGludHJvZHVjZWQgdGhlIHByb2JsZW0uIEludHJvZHVjaW5nCj4g
ImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMiIGp1c3QgYWRkZWQgYSBjbGVhbiB3YXkgb2YgZW5h
YmxpbmcgcGFyc2luZwo+IG9mIG9sZCBjZWxscyBzeW50YXguIEV2ZW4gYmVmb3JlIG15IGNvbW1p
dCBOVk1FTSBzdWJzeXN0ZW0gd2FzIGxvb2tpbmcKPiBmb3IgTlZNRU0gY2VsbHMgaW4gTkFORCBk
ZXZpY2VzLgo+IAo+IEkgYm9vdGVkIGtlcm5lbCA2LjYgd2hpY2ggaGFzIGNvbW1pdCBlODcxNjEz
MjFhNDAgKCJtdGQ6IHJhd25hbmQ6Cj4gbWFjcm9uaXg6IE9UUCA+IGFjY2VzcyBmb3IgTVgzMExG
eEcxOEFDIikgYnV0IGRvZXMgTk9UIGhhdmUgY29tbWl0Cj4gMmNjM2IzN2Y1YjZkICgibnZtZW06
IGFkZCBleHBsaWNpdCBjb25maWcgb3B0aW9uIHRvIHJlYWQgb2xkIHN5bnRheAo+IGZpeGVkIE9G
IGNlbGxzIikuCj4gCj4gTG9vayBhdCB0aGlzIGxvZyBmcm9tIEJyb2FkY29tIE5vcnRoc3RhciAo
TGludXggNi42KToKPiBbICAgIDAuNDEwMTA3XSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0
dXJlciBJRDogMHhjMiwgQ2hpcCBJRDogMHhkYwo+IFsgICAgMC40MTY1MzFdIG5hbmQ6IE1hY3Jv
bml4IE1YMzBMRjRHMThBQwo+IFsgICAgMC40MjA0MDldIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJh
c2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0IKPiBzaXplOiA2NAo+IFsgICAg
MC40MjgwMjJdIGlwcm9jX25hbmQgMTgwMjgwMDAubmFuZC1jb250cm9sbGVyOiBkZXRlY3RlZCA1
MTJNaUIgdG90YWwsCj4gMTI4S2lCIGJsb2NrcywgMktpQiBwYWdlcywgMTZCIE9PQiwgOC1iaXQs
IEJDSC04Cj4gWyAgICAwLjQzODk5MV0gU2Nhbm5pbmcgZGV2aWNlIGZvciBiYWQgYmxvY2tzCj4g
WyAgICAwLjg3MzU5OF0gQmFkIGVyYXNlYmxvY2sgNzM4IGF0IDB4MDAwMDA1YzQwMDAwCj4gWyAg
ICAxLjAzMDI3OV0gcmFuZG9tOiBjcm5nIGluaXQgZG9uZQo+IFsgICAgMS44NTQ4OTVdIEJhZCBl
cmFzZWJsb2NrIDI0MTQgYXQgMHgwMDAwMTJkYzAwMDAKPiBbICAgIDIuNjU3MzU0XSBCYWQgZXJh
c2VibG9jayAzNzgzIGF0IDB4MDAwMDFkOGUwMDAwCj4gWyAgICAyLjY2Mjk2N10gQmFkIGVyYXNl
YmxvY2sgMzc4NSBhdCAweDAwMDAxZDkyMDAwMAo+IFsgICAgMi44NDg0MThdIG52bWVtIHVzZXIt
b3RwMTogbnZtZW06IGludmFsaWQgcmVnIG9uCj4gL25hbmQtY29udHJvbGxlckAxODAyODAwMC9u
YW5kQDAKPiBbICAgIDIuODU2MTI2XSBpcHJvY19uYW5kIDE4MDI4MDAwLm5hbmQtY29udHJvbGxl
cjogZXJyb3IgLUVJTlZBTDogRmFpbGVkIHRvCj4gcmVnaXN0ZXIgT1RQIE5WTUVNIGRldmljZQo+
IAo+IFNvIHRvIHN1bW1hcnkgaXQgdXA6Cj4gMS4gUHJvYmxlbSBleGlzdHMgc2luY2UgbXVjaCBl
YXJsaWVyIGFuZCB3YXNuJ3QgaW50cm9kdWNlZCBieSAyY2MzYjM3ZjViNmQKPiAyLiBDb21taXQg
MmNjM2IzN2Y1YjZkIGp1c3QgZ2l2ZXMgeW91IGEgY2xlYW4gd2F5IG9mIHNvbHZpbmcgdGhpcyBp
c3N1ZQo+IDMuIFByb2JsZW0gd2FzIGV4cG9zZWQgYnkgY29tbWl0IGU4NzE2MTMyMWE0MAo+IDQu
IFdlIG1pc3MgZml4IGZvciB2Ni42IHdoaWNoIGRvZXNuJ3QgaGF2ZSAyY2MzYjM3ZjViNmQgKGl0
IGhpdCB2Ni43KQo+IAoKU28gdGhlIHRoaW5nIHdhcyBicm9rZW4gYWxsIGFsb25nPyBNYXliZSB0
aGUgcmVncmVzc2lvbiB3YXMgaW50cm9kdWNlZAp3aGVuIE9GIHN1cHBvcnQgZm9yIE5WTUVNIGNl
bGwgd2FzIGludHJvZHVjZWQ/IChhbmQgT0Ygc2NhbiB3YXMgZW5hYmxlZApieSBkZWZhdWx0PykK
CkFueXdheSBTb3JyeSBmb3IgYWRkaW5nIHRoZSB3cm9uZyBmaXhlcywgbWF5YmUgTWlxdWVsIGNh
biByZW1vdGUgdGhlCmNvbW1pdCBmcm9tIG10ZC9maXhlcyBhbmQgZml4IHRoZSBwcm9ibGVtYXRp
YyBmaXhlcyB0YWc/Cgo+IAo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgoKLS0g
CglBbnN1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
