Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8257CC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4/BEEf9lUX5TsXHhe5hw0V6hzjlzzgJYsDzfa/GPO8=; b=UsUN8ZlklSR5z4
	1iBNg8AIvUrDzxuznbRWZiYQNLpjBNX4GKKuCRBh/kAGONRKuHVQBS34MspTxQK5UxdLNk6Dx3l83
	L0hU+VkN/cqY1BGUSHRvEiJ+bYyKP/+mDsBCnNSVOz+aRFn2NFIsUBYhNrfdvC2Ap/H5UFfPsGKmh
	x3U/7g8V8gSj2pHBBP9rFjW5SqUQxyw8xP1fWcbTDcRU/F3Q/e+jOdNRaWx1riccjJq0RBsGgdkvG
	KW8iCVmWTuRxHQXpE+Il5BtOfP0TFVxlysWGkNkghQY36SGuIM9zjc/J9yEdWZGYE8D2Y0+mdZeTf
	ULJyav/o4X4GzaV1i4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3c3Z-007Hjq-OH; Fri, 09 Dec 2022 12:00:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3c3S-007Hhd-R4
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2022 12:00:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id ud5so10988548ejc.4
        for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2022 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCwzWMPdgO9Dcc0FuYTNg8nT6gaYsC62geOPdirkTlQ=;
        b=blV6eki9f/dE3yt8k9vQjmYbdmKqtjXhWL8aRDi0+PTy9DZ7PoASn6Hb4YDawt6/Pq
         TOTWkNyJ1bQ0LXeAOKmZsgrohPEAxg4I9Vxq8Iql4MCfOpzd9bk59Kg8A1l2aCabzc1i
         Pwb8zUD5pTagBDWz9wlqw8be8RXHOe4ntLhBEh7HXgPppKgizTPX68btz3fJ69iSfJef
         zAFAyKFjvCY4s0mBfuw+77i/sj6ivMcyXsKkk5Q+7miuQY1uqqYMcxvazgbad3gQhSeN
         osKwSC1CYREx2mikz7Rsbjiro/V/gVq1uBZVJYbtUMGcexuFEHFb/xJK0jJPCO1YVyoF
         GpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCwzWMPdgO9Dcc0FuYTNg8nT6gaYsC62geOPdirkTlQ=;
        b=f33ozpMtKJ43JgGq+me8h/Rgmg2MPUbwczKw4NJZfp4wHFhaUoDZdh8hvkYE5QegW8
         6jz4yRdqQea/lojSUCm+XACmsiZY9+N7kTL+Sf+tE12J5HpmH1tt1uko3rLXsWgReEpV
         Wr492RdYOYE3vfkASPHqDwJFKWzUkKFqMWtCqQwjwoGVUtOw4QrHQsRIgDEFDAiLc1Lr
         rkuU9JuCM1wU+kDFNwUHGt6oBsorQOPsF+BTS3xWmce4VXgEqu4EHl5cpaOsVAdIeyW/
         w3mU6GjkRdLsUvy/p0sCWA494ZHm/W6ulV37vVqASCxbk7ypNMryrrfuR2Umg26bG70H
         Fvzg==
X-Gm-Message-State: ANoB5pn0Q69nvqT1bDlVTHIDYMnkXKS1TDaO8VIuzp+roG7gHFGHTlnn
	82DzJuncLpUxUh0gNiHmt1tRsw==
X-Google-Smtp-Source: AA0mqf7P1uuFrcKToZQL1Qs7OSMRUELHntqUphTx86r+y9eGx8OMntNtg5Twtz4wxSVo6DNFFYUZgg==
X-Received: by 2002:a17:906:4907:b0:7c0:d4fa:3151 with SMTP id b7-20020a170906490700b007c0d4fa3151mr4765674ejq.17.1670587236522;
        Fri, 09 Dec 2022 04:00:36 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906861700b007c0a7286c0asm489597ejx.58.2022.12.09.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:00:35 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Grant Likely <grant.likely@linaro.org>,
	Lee Jones <lee.jones@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-media@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	Purism Kernel Team <kernel@puri.sm>,
	linux-rpi-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org,
	linux-actions@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-staging@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linuxppc-dev@lists.ozlabs.org,
	patches@opensource.cirrus.com,
	linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Date: Fri,  9 Dec 2022 13:00:14 +0100
Message-Id: <167058708567.1651663.18170722235132459286.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_040038_941554_799A21C9 
X-CRM114-Status: UNSURE (   7.65  )
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

T24gRnJpLCAxOCBOb3YgMjAyMiAyMzozNTozNCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gc2luY2UgY29tbWl0IGI4YTFhNGNkNWE5OCAoImkyYzogUHJvdmlkZSBhIHRlbXBvcmFy
eSAucHJvYmVfbmV3KCkKPiBjYWxsLWJhY2sgdHlwZSIpIGZyb20gMjAxNiB0aGVyZSBpcyBhICJ0
ZW1wb3JhcnkiIGFsdGVybmF0aXZlIHByb2JlCj4gY2FsbGJhY2sgZm9yIGkyYyBkcml2ZXJzLgo+
IAo+IFRoaXMgc2VyaWVzIGNvbXBsZXRlcyBhbGwgZHJpdmVycyB0byB0aGlzIG5ldyBjYWxsYmFj
ayAodW5sZXNzIEkgbWlzc2VkCj4gc29tZXRoaW5nKS4gSXQncyBiYXNlZCBvbiBjdXJyZW50IG5l
eHQvbWFzdGVyLgo+IEEgcGFydCBvZiB0aGUgcGF0Y2hlcyBkZXBlbmQgb24gY29tbWl0IDY2MjIz
MzczMWQ2NiAoImkyYzogY29yZToKPiBJbnRyb2R1Y2UgaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lk
IGhlbHBlciBmdW5jdGlvbiIpLCB0aGVyZSBpcyBhIGJyYW5jaCB0aGF0Cj4geW91IGNhbiBwdWxs
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCBhbGwgcGF0Y2hl
cyB0aGF0IGJ1aWxkLgoKUGF0Y2hlcyBleGNsdWRlZDoKIC0gcHM4NjIyCiAtIHRpLXNuNjVkc2k4
MwogLSBhZHY3NTExCgpSZXBvOiBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
bWlzYy8KCgpbMDE0LzYwNl0gZHJtL2JyaWRnZTogYWR2NzUxMTogQ29udmVydCB0byBpMmMncyAu
cHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAxNS82MDZdIGRybS9icmlk
Z2UvYW5hbG9naXgvYW54NjM0NTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAg
ICAgIChubyBjb21taXQgaW5mbykKWzAxNi82MDZdIGRybS9icmlkZ2UvYW5hbG9naXgvYW54Nzh4
eDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5m
bykKWzAxNy82MDZdIGRybS9icmlkZ2U6IGFueDc2MjU6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2Jl
X25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8pClswMTgvNjA2XSBkcm0vYnJpZGdlOiBp
Y242MjExOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1p
dCBpbmZvKQpbMDE5LzYwNl0gZHJtL2JyaWRnZTogY2hyb250ZWwtY2g3MDMzOiBDb252ZXJ0IHRv
IGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiA4ZGM2ZGUyODBmMDFjMGY3Yjhk
NDA0MzU3MzZmM2M5NzUzNjhhZDcwClswMjAvNjA2XSBkcm0vYnJpZGdlOiBpdDY1MDU6IENvbnZl
cnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8pClswMjEv
NjA2XSBkcm0vYnJpZGdlOiBpdDY2MTIxOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQog
ICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDIyLzYwNl0gZHJtL2JyaWRnZTogbHQ4OTEyYjog
Q29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykK
WzAyMy82MDZdIGRybS9icmlkZ2U6IGx0OTIxMTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAyNC82MDZdIGRybS9icmlkZ2U6IGx0OTYx
MTogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5m
bykKWzAyNS82MDZdIGRybS9icmlkZ2U6IGx0OTYxMXV4YzogQ29udmVydCB0byBpMmMncyAucHJv
YmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAyNi82MDZdIGRybS9icmlkZ2U6
IG1lZ2FjaGlwczogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBj
b21taXQgaW5mbykKWzAyNy82MDZdIGRybS9icmlkZ2U6IG54cC1wdG4zNDYwOiBDb252ZXJ0IHRv
IGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDI4LzYwNl0g
ZHJtL2JyaWRnZTogcGFyYWRlLXBzODYyMjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkK
ICAgICAgICAgIChubyBjb21taXQgaW5mbykKWzAyOS82MDZdIGRybS9icmlkZ2U6IHNpaTkwMng6
IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8gY29tbWl0IGluZm8p
ClswMzAvNjA2XSBkcm0vYnJpZGdlOiBzaWk5MjM0OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9u
ZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDMxLzYwNl0gZHJtL2JyaWRnZTogc2lp
ODYyMDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIChubyBjb21taXQg
aW5mbykKWzAzMi82MDZdIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBDb252ZXJ0IHRvIGkyYydzIC5w
cm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDMzLzYwNl0gZHJtL2JyaWRn
ZTogdGMzNTg3Njg6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICAobm8g
Y29tbWl0IGluZm8pClswMzQvNjA2XSBkcm0vYnJpZGdlL3RjMzU4Nzc1OiBDb252ZXJ0IHRvIGky
YydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDM1LzYwNl0gZHJt
L2JyaWRnZTogdGktc242NWRzaTgzOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAg
ICAgICAgKG5vIGNvbW1pdCBpbmZvKQpbMDM3LzYwNl0gZHJtL2JyaWRnZTogdGZwNDEwOiBDb252
ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgKG5vIGNvbW1pdCBpbmZvKQoKCgpy
b2IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
