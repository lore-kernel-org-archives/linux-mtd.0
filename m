Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09452C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:31:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28AE60F38
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C28AE60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yv4zfFZNsvzPQag297kdQwSfbdqDsT0OSYIpdWcwfXk=; b=Ltr29O69YBJ20xgkHfVM8Ikdp5
	UDTQ/Yfe4QQP89TBZuagDlchv79vdT4foNNpotRT/gOsPgFGcDdoKIshx/+dB37QZKSP7z+RaTGtA
	pq/TWrarRE/tUsA5GmFr+QuCTqj9vDKcj1oP7tz1yhOzxx3kFw0MzDGixdodUQErIuwrnGd0d+8Mk
	6lY1Mov+21Nr8+iCSfKXhBrkdpqaYxcr1N1ggOtUMqFK1CtssPVyN9Za1cN1mUQcw5UWzvUNrVRpZ
	5FIOJqyT5DtszGgjTBkiJmK+17/mP4rv9a/GpEL+114S6ZXGfObtIwWOXF/cUfhrivrvdKSekXm0j
	2TTXwB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDEK-0047Wv-A6; Wed, 18 Aug 2021 04:31:08 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDEF-0047VT-Kt
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 04:31:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id w20so1789442lfu.7
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 21:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bJVDC5sFMx5wdJrVE/CISF2TdQfB6rbYeeYCC0J1Ol8=;
 b=LiU1hgzrqwTnfH2RGkGOLvOMBIR+Dpr0pPox0drlJMVWW7rU2xXSm44gIeI0Xb4pT5
 1DCudjHNE+om3k16PzKa7gXd9w5/yPDgTlxoJPZ6PZkJ88qhuNXBI7j6uRQBnXkra+p1
 G8mYKN4huRcHr6lMOkR2iHFaktWcjtOCFhruBBUBGyInSaHjeOQ/MGLSXZnOOvUbWg5q
 hnuex/UPnBX0ZqA0EXW+bqgAYzqDV3YPuArMnDsPfTHvfMg8hkCHc8k3OocdmNqKVCgO
 0tnl22ivLpiKmcMsdUXvXY9Ki5SXuLaOXETJ3hpKkonGX9ienLPJKjeI8uFpB7i3Qjn+
 d3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bJVDC5sFMx5wdJrVE/CISF2TdQfB6rbYeeYCC0J1Ol8=;
 b=CxttVwMZEsIRBsS5QEqxH4SJPf1IY8p0dzGh+TufuG0x0dmEqgX9oU7dnay59+xDtg
 sbmLKh9wwDJhU1AoixnjPVoJZNO3Ur6r8bc8rUJV179yuxjrW1KKiQqAUE/z6OMOJ3Ja
 QBQ4gzOr+wQXXxwAAOIjnTnTq3onbLkk5SbQWT3DlYJC5M3T+zSs/mWVX7nHJK+L2hi9
 eSW5xRLNI9aFKGXv0Crz1vVeI6DM/z0lIKIug5lSdK9QCWnU7Rg8VkouCBYpm/YuRHQb
 Gq0HBiNbjFKdEcjjSusFGfgmAcV78XhnRpWysBm//N6X9OCzS+YZNPtW0iGopgZEgwmO
 6ghg==
X-Gm-Message-State: AOAM530kl15M6ElBxIBmybJnbUQYOglqjyDZ/+c1I+a8HCU+DMbfAAKo
 t55Qnn9ohjILoqRhcXRQytM=
X-Google-Smtp-Source: ABdhPJx+RUklo1VZR89XCu0X3oAVXKEHQLdw/QolyoJg/PV7VvbR0COzQj6CtKZ4QI3fzPlA0p3mQg==
X-Received: by 2002:ac2:5b9d:: with SMTP id o29mr5044866lfn.26.1629261061194; 
 Tue, 17 Aug 2021 21:31:01 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id q5sm377111lfc.283.2021.08.17.21.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 21:31:00 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
From: Dmitry Osipenko <digetx@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
Message-ID: <6438bdfb-3e9e-40dd-fa7c-c79f0892e12a@gmail.com>
Date: Wed, 18 Aug 2021 07:30:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_213103_718743_9CACDFE7 
X-CRM114-Status: GOOD (  17.72  )
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

MTguMDguMjAyMSAwNzoyOSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTguMDguMjAy
MSAwNzoxMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDE4LjA4LjIwMjEgMDY6NTUs
IFZpcmVzaCBLdW1hciDQv9C40YjQtdGCOgo+Pj4gT24gMTctMDgtMjEsIDE4OjQ5LCBEbWl0cnkg
T3NpcGVua28gd3JvdGU6Cj4+Pj4gMTcuMDguMjAyMSAxMDo1NSwgVmlyZXNoIEt1bWFyINC/0LjR
iNC10YI6Cj4+Pj4gLi4uCj4+Pj4+PiAraW50IGRldl9wbV9vcHBfc3luYyhzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4+Pj4+PiArewo+Pj4+Pj4gKwlzdHJ1Y3Qgb3BwX3RhYmxlICpvcHBfdGFibGU7Cj4+
Pj4+PiArCXN0cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4+Pj4+PiArCWludCByZXQgPSAwOwo+Pj4+
Pj4gKwo+Pj4+Pj4gKwkvKiBEZXZpY2UgbWF5IG5vdCBoYXZlIE9QUCB0YWJsZSAqLwo+Pj4+Pj4g
KwlvcHBfdGFibGUgPSBfZmluZF9vcHBfdGFibGUoZGV2KTsKPj4+Pj4+ICsJaWYgKElTX0VSUihv
cHBfdGFibGUpKQo+Pj4+Pj4gKwkJcmV0dXJuIDA7Cj4+Pj4+PiArCj4+Pj4+PiArCWlmICghX2dl
dF9vcHBfY291bnQob3BwX3RhYmxlKSkKPj4+Pj4+ICsJCWdvdG8gcHV0X3RhYmxlOwo+Pj4+Pj4g
Kwo+Pj4+Pj4gKwlvcHAgPSBfZmluZF9jdXJyZW50X29wcChkZXYsIG9wcF90YWJsZSk7Cj4+Pj4+
PiArCXJldCA9IF9zZXRfb3BwKGRldiwgb3BwX3RhYmxlLCBvcHAsIG9wcC0+cmF0ZSk7Cj4+Pj4+
Cj4+Pj4+IEFuZCBJIGFtIG5vdCBzdXJlIGhvdyB0aGlzIHdpbGwgZW5kIHVwIHdvcmtpbmcsIHNp
bmNlIG5ldyBPUFAgd2lsbCBiZQo+Pj4+PiBlcXVhbCB0byBvbGQgb25lLiBTaW5jZSBJIHNlZSB5
b3UgY2FsbCB0aGlzIGZyb20gcmVzdW1lKCkgYXQgbWFueQo+Pj4+PiBwbGFjZXMuCj4+Pj4KPj4+
PiBJbml0aWFsbHkgT1BQIHRhYmxlIGlzICJ1bmluaXRpYWxpemVkIiBhbmQgb3BwX3RhYmxlLT5l
bmFibGVkPWZhbHNlLAo+Pj4+IGhlbmNlIHRoZSBmaXJzdCBzeW5jIGFsd2F5cyB3b3JrcyBldmVu
IGlmIE9QUCBpcyBlcXVhbCB0byBvbGQgb25lLiBPbmNlCj4+Pj4gT1BQIGhhcyBiZWVuIHN5bmNl
ZCwgYWxsIGZ1cnRoZXIgc3luY3MgYXJlIE5PLU9QcywgaGVuY2UgaXQgZG9lc24ndAo+Pj4+IG1h
dHRlciBob3cgbWFueSB0aW1lcyBzeW5jaW5nIGlzIGNhbGxlZC4KPj4+Pgo+Pj4+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE0LXJjNi9zb3VyY2UvZHJpdmVycy9vcHAvY29y
ZS5jI0wxMDEyCj4+Pgo+Pj4gUmlnaHQsIGJ1dCBob3cgd2lsbCB0aGlzIHdvcmsgZnJvbSBSZXN1
bWUgPyBXb24ndCB0aGF0IGJlIGEgbm8tb3AgPwo+Pgo+PiBUaGUgZmlyc3QgcmVzdW1lIGluaXRp
YWxpemVzIHRoZSBPUFAgc3RhdGUgb24gc3luYywgYWxsIGZ1cnRoZXIgc3luY3Mgb24KPj4gcmVz
dW1lIGFyZSBuby1vcHMuCj4+Cj4gCj4gTm90aWNlIHRoYXQgd2UgdXNlIEdFTlBEIGhlcmUuIEdF
TlBEIGNvcmUgdGFrZXMgY2FyZSBvZiBzdG9yaW5nIFBEJ3MKPiBwZXJmb3JtYW5jZSBzdGF0ZSAo
dm9sdGFnZSBpbiBjYXNlIG9mIFRlZ3JhKSBhbmQgZHJvcHBpbmcgaXQgdG8gMCBhZnRlcgo+IHJw
bS1zdXNwZW5kLCBHRU5QRCBjb3JlIGFsc28gcmVzdG9yZXMgdGhlIHN0YXRlIGJlZm9yZSBycG0t
cmVzdW1lLgoKQnkgJ2hlcmUnIEkgbWVhbiBpbiB0aGlzIHNlcmllcy4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
