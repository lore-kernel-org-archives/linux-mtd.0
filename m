Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98907C00145
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvyHCl4Jqq8NHIEwUnPcA/kqcGNFaPgqJjHY9RawbFg=; b=Bp2k5q4dkGpHz/
	lMJSChl+F1/L3zlkoXB7++mAmTAGuOXmfsHP12hx8SdZdn8a0od9ijQ1F0UkxtxmPa3p+0XeIIerd
	3bGZcF3JZ406o30eGFa6kDUTMbdMoJ/Vw3vWP5ZU769xgwK61jQw9M1zBDsE1p9Kx6b0c78LZ+wAO
	WRaZh/HWvTMULxt850PGsGTdNx67gUBbSsqMQIEw0MckSd7k8T3U1mdPmvrhylJm2gi/qXUIUuxAt
	kBnFQOsMdDdSWQO56Dnzks3+hmRPjZlGYwDUzuV03uCaZnoEADdhI+h9a+N8YJjcQZlRVwqUJzKjt
	AVxvw8B8bW1jq3XVR1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4loR-002BQt-47; Mon, 12 Dec 2022 16:37:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4lnb-002AX5-Te
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 16:37:05 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i9so803989edj.4
        for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2022 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYON1Uq6UT3Qph7OPPr0NH47G6rUYR8O1BO9MFwJow=;
        b=lIFXcScE+1mmzH1SBNLfPzmU2yyZ22FDa7zo6/O0Bw9aIOxDeXxYkEVfus52JWuhda
         4ouELocZnEhmnwFppolEYq4c3c7RHYAqD4pax4M3unQDLONiM/9+ejXSM9E2FE+Z0v02
         plxbNMhSLCExfq6g58BwEJLatQLzpt/xLWOhKWfMwSgaHbhPuPfGnoShEU2Q/8V0GhBe
         I8mO/6POKEHTvHhiQrSmT3i/DlcfyH1o4pAMtSuNXvNoHj+mOy3GKKCsRTSQGVPFd3Z7
         AQYI0FN6wamo3RnZf0VXDCwVvMRjPWjYDkKYXDeP5o/vQIFIn9FanCQzU/XNFNQHrfWF
         2geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYON1Uq6UT3Qph7OPPr0NH47G6rUYR8O1BO9MFwJow=;
        b=h+vt+qXsffHPectGBkpcPJ5Tl2UtD9eLty8VlXjjsuwnzuX7eXGB+Kz0ovYHRJXM4B
         f5wfafWDue0JLd4zTgE/0jokaTtTLRuCuDukCsTyffPRmqWUTgoVjfI+VIOFMPzEQKBs
         +2IcSIlHW84K8BCfkqq77jkVxVubHhZKSZn9L7mWmu2pTucE6DiYADFexCl6hDTPHFZQ
         JBLXRGwVO+lSciHyWfj3+UWs+Br6CbHHj+OfO6iaa0rAAay18Gg/YIYNhHNBh8UxRwyE
         vBzwZiTz6ZezCjLuIo7oxYU+5fOZO0HFKjWQA5Xjxzi+rp29OSMfbDbZvYCKRyZJsEEZ
         v7NA==
X-Gm-Message-State: ANoB5plsDigSaH9LrPvpTKijzdNi+R1F2XrPARQj4kROPiHdT/8UJOeh
	n5dBCB8oRZHo1DbpV2CTsfuN1Q==
X-Google-Smtp-Source: AA0mqf5ppTTyM6N0bPOAfBX//eKXVRPakyRimeYdkY/8NocUbAvjnOSiYLmQOcD2W7tmhBu2XO410g==
X-Received: by 2002:a05:6402:702:b0:46f:68d0:76 with SMTP id w2-20020a056402070200b0046f68d00076mr10093614edx.34.1670863020790;
        Mon, 12 Dec 2022 08:37:00 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a8:ff97:7d8d:1f2e:ffaa])
        by smtp.gmail.com with ESMTPSA id m15-20020a50930f000000b00463597d2c25sm4051979eda.74.2022.12.12.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:37:00 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Grant Likely <grant.likely@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-crypto@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-integrity@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Purism Kernel Team <kernel@puri.sm>,
	linux-staging@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	kernel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net,
	linux-fbdev@vger.kernel.org
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Date: Mon, 12 Dec 2022 17:36:51 +0100
Message-Id: <167086288411.3041259.17824406556561546642.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_083703_995883_52FC2460 
X-CRM114-Status: UNSURE (   8.40  )
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
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoK
UmVwbzogaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvCgoKWzAxNC82
MDZdIGRybS9icmlkZ2U6IGFkdjc1MTE6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAg
ICAgICAgICBjb21taXQ6IDFjNTQ2ODk0ZmY4MmY4YjdjMDcwOTk4YzAzZjliMTVhMzQ5OWYzMjYK
WzAyOC82MDZdIGRybS9icmlkZ2U6IHBhcmFkZS1wczg2MjI6IENvbnZlcnQgdG8gaTJjJ3MgLnBy
b2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IGQ2YjUyMmU5YmJiMGNjYTFhZWFlNGVmNjE4ODgw
MDUzNDc5NDgzNmYKWzAzNS82MDZdIGRybS9icmlkZ2U6IHRpLXNuNjVkc2k4MzogQ29udmVydCB0
byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNvbW1pdDogMGY2NTQ4ODA3ZmE3N2U4N2Ji
YzM3OTY0YzZiMWVkOWJhNmUxMTU1ZAoKCgpyb2IKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
