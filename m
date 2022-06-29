Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FCCC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hl50D7c8/JsgnFe/35BoWX0WAgWDjBKk0kVfn/uzac=; b=gesESO/B46L5zt
	dFnmmYHd5x7tgcPCkiMU7R63OJXYBHYVQUWsBDNx5M/gN6htqm9MRSdB7894hpiTGs+RVt4QSxhKA
	+O45b5IoyVry8avPCRtayOk6w4yeOkj5HG3pHcla6Prigxw30c9oxh91q+60/F5hrp6u7zKSHWvPk
	tXtMqSsVnf47Pt8loWB1MJJep9/Om5NAlBIR0Hnff4Yk1LIQdRwunbXpBZUyG9P3vr2K+audjLmPl
	vCxr99p173PLpTUWVAdcVvLIj1bDFhtc/tSDjB4PKf4sf0Mvloo2ehnsHWwJ3fdcTGOUcObTfFZWS
	/0wBUZU7YcOSDN/LpHNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6SHw-00A99A-8t; Wed, 29 Jun 2022 07:39:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6SHt-00A97h-T6
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 07:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656488340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
	b=Qf+Icu3mFwODmA8VH7iez7lUal+9uGrgn0IfsOqTq7Yy6a8+IpgIyO/IEzO/pIQBSKIqw5
	S0OUj7g/Q2pXuNW8hsgrns8Ro1B9Ae5fQp0cBa3GQFdh2rF37pHexj3L9oC8N6mqdxnm+B
	ZHclb2olNbrr2GXLrS1wgAqKAmx/H4Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-yFuMod9kPlCWdbLT_3VjCg-1; Wed, 29 Jun 2022 03:37:12 -0400
X-MC-Unique: yFuMod9kPlCWdbLT_3VjCg-1
Received: by mail-wr1-f71.google.com with SMTP id r20-20020adfb1d4000000b0021b8507563eso2147043wra.16
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
        b=JjblMQnUjH8x4bgyYqgp8hobagmYNdIcHkzKgOKQkyouzKNuBr9Sz7yLw0lunGkHCC
         YN3U6xmgVUNn4KK1TzLjKJW1X21lQAByta3rdDWaSUsHr+wvtNtICcty0S07RxLUsf4u
         8L/vbvYV6HTk8/9fBQ3QUD8GK4uuzFVG7O//JW/XtAG7AzcZWleFiIcfM4ZFxOHoqZQs
         zfLtKDUvPR0brRHIvwBn3gVNbwJFwbNcii9JOAdP3eiMujwHsMyaGB9kc+CRC3+U8bXE
         ArLNWtKJiYnLoPhksWt979AqWOryYuYs0EJb6T+GOeQcVyhH5Ht85bBjM7vZPu0uo9g0
         eTKQ==
X-Gm-Message-State: AJIora8DapYKxaEtaz/XGIw28kKv385KB8i8n2PEeDFrBEX1c6hgEPSA
	Nym8KW/Y/DUZIt8Ya9mhJIFcO4nr5Ey8/Rttf4pslNu7uIXFyl3eeVgOqmSoBlULvoLcF8KDSlM
	GLUWEbzBtgTHLMzUPFq4qidUdFQ==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650274wrx.279.1656488231007;
        Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfq7mqFRSJqFJPQOP6rs25Ch1nA7fBeueZwuaRaLaWENw0ay54yTOP4QHXmGLo1NEA4L9c5g==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650238wrx.279.1656488230741;
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm15832366wrq.115.2022.06.29.00.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Message-ID: <7654a74e-a410-a8a5-c228-d006dbbc200f@redhat.com>
Date: Wed, 29 Jun 2022 09:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>, netdev@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_003902_023139_5CA996E9 
X-CRM114-Status: GOOD (  14.03  )
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

T24gNi8yOS8yMiAwOToyMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
W0kgZHJvcHBlZCBuZWFybHkgYWxsIGluZGl2aWR1YWxzIGZyb20gdGhlIENjOiBsaXN0IGJlY2F1
c2UgdmFyaW91cwo+IGJvdW5jZXMgcmVwb3J0ZWQgdG8gYmUgdW5oYXBweSBhYm91dCB0aGUgbG9u
ZyAobG9naWNhbCkgbGluZS5dCj4KClllcywgaXQgYWxzbyBib3VuY2VkIGZvciBtZSB3aGVuIEkg
dHJpZWQgdG8gcmVwbHkgZWFybGllciB0b2RheS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zb2xvbW9uL3NzZDEzMHgtaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2Qx
MzB4LWkyYy5jCj4gaW5kZXggMWUwZmNlYzdiZTQ3Li5kZGZhMGJiNWQ5YzkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC1pMmMuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zb2xvbW9uL3NzZDEzMHgtaTJjLmMKPiBAQCAtMzksMTMgKzM5LDExIEBAIHN0YXRp
YyBpbnQgc3NkMTMweF9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHNzZDEzMHhfaTJjX3JlbW92ZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50KQo+ICtzdGF0aWMgdm9pZCBzc2QxMzB4X2kyY19yZW1vdmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgewo+ICAJc3RydWN0IHNzZDEzMHhfZGV2aWNlICpz
c2QxMzB4ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7Cj4gIAo+ICAJc3NkMTMweF9yZW1v
dmUoc3NkMTMweCk7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHNz
ZDEzMHhfaTJjX3NodXRkb3duKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCgpSZXZpZXdlZC1i
eTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+IAotLSAKQmVz
dCByZWdhcmRzLAoKSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzCkxpbnV4IEVuZ2luZWVyaW5nClJl
ZCBIYXQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
