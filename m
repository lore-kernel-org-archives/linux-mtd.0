Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6077AC352BE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 07:21:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E82206D5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 07:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M8VNYndW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWro629A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E82206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0R4x1vD++gIJ04Ejnbj3SttPbDl9LNFfMCk1bxqOxE=; b=M8VNYndWuaiLQL
	Ld86YvAeV49yxPjP/DGekmbT141kORu8U1s4rSlScVkXgROkpP6Ya67uuUhjeJKE9I/LGBuKUlwtC
	CUWKWy+H7IJVwAkAQh2ln1v73o0nJ4DHrqKQKWMX2GfDQ5wlnR6hSVLU2VgsiH3VlbaISrFUXe/s1
	PG1CI1uQQBQVkE1qJmBFldCl//I8JjRa80M1Vt2YDpHjsL0ewl2fcbxPC1EZPz7H0BXZiP+ixnC9m
	HbSR4Gx3Fd10pTeno7BLN6oYRTVdmrZEynDNAFYDVUouDEnym2tyL3cSvwwENZ6gNpp9/HVeoSCT6
	iA61qGIWqGX7wrJ63PsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOyq9-0007Lm-SP; Thu, 16 Apr 2020 07:21:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOyq6-0007KN-Cl
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 07:21:35 +0000
Received: by mail-wm1-x343.google.com with SMTP id v8so1788915wma.0
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PfcEIjHVOwJJoI3IG1yq+hLuJEPuCeMcpBtriOzJSVE=;
 b=fWro629AKCHe7c1PY8qWNnc/MO1FUAtCQOwruVmdsj4Kyvr1SDGr9Xgc/VGuT4Ao08
 aszgwv1hJNkmDxBtLtWK7K2S9mv6z5/c8TCmg4n+kwj4eAnnvC2Dt4pvdKuMnlfnbcGf
 puxMyauwUmvCn/LNyQLnyjFrS1Kzkios1/MsF6m/I4GPnRVdRC2+tstnjmmO650ZwQzj
 4aWRTSNgkZKvvDPkpZ/B7oqv4O1vvl2M0bRRRPUNQCjnZDrbzcP/JjjuClCaNvbDFuVJ
 cZP/dedvaVFsRZKmIeGsiWSNvkLi9aAZR4c6U1deMU+GHzWLDixE4IBaBhe7BLuqYxXC
 CRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PfcEIjHVOwJJoI3IG1yq+hLuJEPuCeMcpBtriOzJSVE=;
 b=JpbjeSb+5gXgZAGO9lfQqfsL64svQqu3/B9zi5JYFoAZr+PWddlGoSNrKarTQIHD64
 tEtTJhdi/lh3uvs9itd80dmLNcWddl/I9ZKHkptmTCHG4juY3N8BZzEXg/fNVlx2of6N
 W56JX57T3TYEGtDrO/lVo65WQyfZssOCzty2FEzoUiJxolQGD2q9JNwmtbSmTCTIScsB
 xd7vc1tLu028M6GT7pHhlMC3EX/V/tYUiGtrfLpwKbxzHfsFVyyqScFBpXPmGD1P3xnX
 Qzm2qi488R+1byPtaEdc7BuqbYEHbcgXWJdqOTqGmCse1IiKkFmPDbCF2Wr5w9b7d4tT
 Vp2Q==
X-Gm-Message-State: AGi0PuZafmSjNPU92UOKgdiyQ3TpG/qyBGBFsUjJa4XyDc/ZzDMTdoEP
 2mOCdMN14Ga15Fq4sBj4a6QD0g==
X-Google-Smtp-Source: APiQypKxoroogYo0WPMcKERsdRMrzAoaU5nNn92qAMbIpRzZIzICMY0kveTYaemzAUSe6fR6V9LLBA==
X-Received: by 2002:a1c:990d:: with SMTP id b13mr3217540wme.179.1587021691888; 
 Thu, 16 Apr 2020 00:21:31 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id h188sm2608116wme.8.2020.04.16.00.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:21:31 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:22:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416072231.GT2167633@dell>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_002134_433450_0FDD31D5 
X-CRM114-Status: GOOD (  15.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNSBBcHIgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IGpzb24tc2NoZW1hIHZl
cnNpb25zIGRyYWZ0NyBhbmQgZWFybGllciBoYXZlIGEgd2VpcmQgYmVoYXZpb3IgaW4gdGhhdAo+
IGFueSBrZXl3b3JkcyBjb21iaW5lZCB3aXRoIGEgJyRyZWYnIGFyZSBpZ25vcmVkIChzaWxlbnRs
eSkuIFRoZSBjb3JyZWN0Cj4gZm9ybSB3YXMgdG8gcHV0IGEgJyRyZWYnIHVuZGVyIGFuICdhbGxP
ZicuIFRoaXMgYmVoYXZpb3IgaXMgbm93IGNoYW5nZWQKPiBpbiB0aGUgMjAxOS0wOSBqc29uLXNj
aGVtYSBzcGVjIGFuZCAnJHJlZicgY2FuIGJlIG1peGVkIHdpdGggb3RoZXIKPiBrZXl3b3Jkcy4g
VGhlIGpzb24tc2NoZW1hIGxpYnJhcnkgZG9lc24ndCB5ZXQgc3VwcG9ydCB0aGlzLCBidXQgdGhl
Cj4gdG9vbGluZyBub3cgZG9lcyBhIGZpeHVwIGZvciB0aGlzIGFuZCBlaXRoZXIgd2F5IHdvcmtz
Lgo+IAo+IFRoaXMgaGFzIGJlZW4gYSBjb25zdGFudCBzb3VyY2Ugb2YgcmV2aWV3IGNvbW1lbnRz
LCBzbyBsZXQncyBjaGFuZ2UgdGhpcwo+IHRyZWV3aWRlIHNvIGV2ZXJ5b25lIGNvcGllcyB0aGUg
c2ltcGxlciBzeW50YXguCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2NwdXMueWFtbCAg
ICAgICAgIHwgIDgxICsrKy0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbDJjMngw
LnlhbWwgICAgICAgfCAgODcgKysrLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9w
c2NpLnlhbWwgICAgICAgICB8ICAxNSArLQo+ICAuLi4vYmluZGluZ3MvYXJtL3NhbXN1bmcvZXh5
bm9zLWNoaXBpZC55YW1sICAgfCAgIDUgKy0KPiAgLi4uL2J1cy9hbGx3aW5uZXIsc3VuNTBpLWE2
NC1kZTIueWFtbCAgICAgICAgIHwgICA1ICstCj4gIC4uLi9iaW5kaW5ncy9jbG9jay9maXhlZC1m
YWN0b3ItY2xvY2sueWFtbCAgICB8ICAgNSArLQo+ICAuLi4vYmluZGluZ3MvY29ubmVjdG9yL3Vz
Yi1jb25uZWN0b3IueWFtbCAgICAgfCAgMjggKy0KPiAgLi4uL2JpbmRpbmdzL2NyeXB0by9zdCxz
dG0zMi1oYXNoLnlhbWwgICAgICAgIHwgICA5ICstCj4gIC4uLi9hbGx3aW5uZXIsc3VuNGktYTEw
LWRpc3BsYXktZW5naW5lLnlhbWwgICB8ICAgNyArLQo+ICAuLi4vZGlzcGxheS9hbGx3aW5uZXIs
c3VuNGktYTEwLXRjb24ueWFtbCAgICAgfCAgIDUgKy0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcGFuZWwtY29tbW9uLnlhbWwgIHwgICA1ICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2RtYS9kbWEtY29tbW9uLnlhbWwgICB8ICAgMyArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9kbWEvdGkvazMtdWRtYS55YW1sICAgfCAgMTggKy0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZWVwcm9tL2F0MjQueWFtbCAgICAgIHwgIDExICstCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2V4YW1wbGUtc2NoZW1hLnlhbWwgICB8ICAxNyArLQo+ICAuLi4vYmluZGluZ3MvaHdt
b24vYWRpLGx0YzI5NDcueWFtbCAgICAgICAgICAgfCAgMzIgKy0tCj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2h3bW9uL3RpLHRtcDUxMy55YW1sICB8ICAyMSArLQo+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvc3Qsc3RtMzItaTJjLnlhbWwgfCAgIDkgKy0KPiAgLi4uL2JpbmRpbmdz
L2lpby9hZGMvYWRpLGFkNzEyNC55YW1sICAgICAgICAgIHwgICA1ICstCj4gIC4uLi9iaW5kaW5n
cy9paW8vYWRjL2xsdGMsbHRjMjQ5Ni55YW1sICAgICAgICB8ICAgMyArLQo+ICAuLi4vYmluZGlu
Z3MvaWlvL2FkYy9taWNyb2NoaXAsbWNwMzkxMS55YW1sICAgfCAgIDcgKy0KPiAgLi4uL2JpbmRp
bmdzL2lpby9hZGMvc3Qsc3RtMzItZGZzZG0tYWRjLnlhbWwgIHwgIDMxICstCj4gIC4uLi9iaW5k
aW5ncy9paW8vbGlnaHQvdHNsMjc3Mi55YW1sICAgICAgICAgICB8ICAxMyArLQo+ICAuLi4vYmlu
ZGluZ3MvaWlvL3RlbXBlcmF0dXJlL2FkaSxsdGMyOTgzLnlhbWwgfCAgNTYgKystLQo+ICAuLi4v
aW5wdXQvYWxsd2lubmVyLHN1bjRpLWExMC1scmFkYy1rZXlzLnlhbWwgfCAgIDUgKy0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvaW5wdXQueWFtbCAgICAgIHwgICA5ICstCj4gIC4u
Li9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0sZ2ljLXYzLnlhbWwgICAgICB8ICAzOSArKy0KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUueWFtbCAgIHwgICAzICstCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnlhbWwgICAgICB8ICAxMyArLQo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtZ3Bpby55YW1sICAgfCAgIDMgKy0K
PiAgLi4uL2JpbmRpbmdzL2xlZHMvcm9obSxiZDcxODI4LWxlZHMueWFtbCAgICAgIHwgIDEwICst
Cj4gIC4uLi9iaW5kaW5ncy9tYWlsYm94L3N0LHN0bTMyLWlwY2MueWFtbCAgICAgICB8ICAgNSAr
LQo+ICAuLi4vYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxneC12ZGVjLnlhbWwgICAgICAgfCAgIDYg
Ky0KPiAgLi4uL21lZGlhL2FtbG9naWMsbWVzb24tZ3gtYW8tY2VjLnlhbWwgICAgICAgIHwgICAz
ICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JjLnlhbWwgICAgICAgICB8IDI2
NSArKysrKysrKystLS0tLS0tLS0KPiAgLi4uL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsdmluLnlh
bWwgICAgICAgICAgIHwgICA3ICstCj4gIC4uLi9tZW1vcnktY29udHJvbGxlcnMvZXh5bm9zLXNy
b20ueWFtbCAgICAgICB8ICAxNCArLQo+ICAuLi4vbnZpZGlhLHRlZ3JhMTI0LWVtYy55YW1sICAg
ICAgICAgICAgICAgICAgfCAgIDkgKy0KPiAgLi4uL252aWRpYSx0ZWdyYTEyNC1tYy55YW1sICAg
ICAgICAgICAgICAgICAgIHwgICAzICstCj4gIC4uLi9udmlkaWEsdGVncmEzMC1lbWMueWFtbCAg
ICAgICAgICAgICAgICAgICB8ICAgOSArLQo+ICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL252aWRp
YSx0ZWdyYTMwLW1jLnlhbWwgfCAgIDMgKy0KCj4gIC4uLi9iaW5kaW5ncy9tZmQvYWxsd2lubmVy
LHN1bjRpLWExMC10cy55YW1sICB8ICAyMCArLQo+ICAuLi4vYmluZGluZ3MvbWZkL3N0LHN0bTMy
LXRpbWVycy55YW1sICAgICAgICAgfCAgMzMgKystCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21mZC9zdCxzdHBtaWMxLnlhbWwgICB8ICAgOSArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvc3lzY29uLnlhbWwgICAgICAgfCAgIDUgKy0KCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxl
ZS5qb25lc0BsaW5hcm8ub3JnPgoKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FzcGVl
ZCxzZGhjaS55YW1sIHwgICA0ICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9jZG5z
LHNkaGNpLnlhbWwgICB8ICA3NyArKystLQo+ICAuLi4vYmluZGluZ3MvbW1jL21tYy1jb250cm9s
bGVyLnlhbWwgICAgICAgICAgfCAgMzcgKystCj4gIC4uLi9iaW5kaW5ncy9tbWMvcm9ja2NoaXAt
ZHctbXNoYy55YW1sICAgICAgICB8ICAgNiArLQo+ICAuLi4vYmluZGluZ3MvbW1jL3N5bm9wc3lz
LWR3LW1zaGMtY29tbW9uLnlhbWwgfCAgMTQgKy0KPiAgLi4uL210ZC9hbGx3aW5uZXIsc3VuNGkt
YTEwLW5hbmQueWFtbCAgICAgICAgIHwgIDEzICstCj4gIC4uLi9iaW5kaW5ncy9tdGQvbmFuZC1j
b250cm9sbGVyLnlhbWwgICAgICAgICB8ICAyNyArLQo+ICAuLi4vYmluZGluZ3MvbmV0L2Nhbi9i
b3NjaCxtX2Nhbi55YW1sICAgICAgICAgfCAgNTkgKystLQo+ICAuLi4vYmluZGluZ3MvbmV0L2V0
aGVybmV0LWNvbnRyb2xsZXIueWFtbCAgICAgfCAgMzQgKy0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9xY2EsYXI4MDN4LnlhbWwgICB8ICAxNyArLQo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sICAgfCAgMjIgKy0KPiAgLi4uL2JpbmRpbmdzL25l
dC90aSxjcHN3LXN3aXRjaC55YW1sICAgICAgICAgIHwgICAzICstCj4gIC4uLi9iaW5kaW5ncy9u
ZXQvdGksZGF2aW5jaS1tZGlvLnlhbWwgICAgICAgICB8ICAgNyArLQo+ICAuLi4vYmluZGluZ3Mv
cGNpL2ludGVsLWd3LXBjaWUueWFtbCAgICAgICAgICAgfCAgIDcgKy0KPiAgLi4uL3BpbmN0cmwv
YWxsd2lubmVyLHN1bjRpLWExMC1waW5jdHJsLnlhbWwgIHwgIDEyICstCj4gIC4uLi9waW5jdHJs
L2FzcGVlZCxhc3QyNDAwLXBpbmN0cmwueWFtbCAgICAgICB8ICAzNyArKy0KPiAgLi4uL3BpbmN0
cmwvYXNwZWVkLGFzdDI1MDAtcGluY3RybC55YW1sICAgICAgIHwgIDQ1ICsrLQo+ICAuLi4vcGlu
Y3RybC9hc3BlZWQsYXN0MjYwMC1waW5jdHJsLnlhbWwgICAgICAgfCAxMDggKysrKy0tLQo+ICAu
Li4vYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1wLXBpbmN0cmwueWFtbCAgfCAgMzEgKy0KPiAg
Li4uL2JpbmRpbmdzL3BpbmN0cmwvaW50ZWwsbGdtLWlvLnlhbWwgICAgICAgIHwgICA0ICstCj4g
IC4uLi9iaW5kaW5ncy9waW5jdHJsL3Bpbm11eC1ub2RlLnlhbWwgICAgICAgICB8ICAgMyArLQo+
ICAuLi4vYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWwgICAgfCAgNTYgKyst
LQo+ICAuLi4vYmluZGluZ3MvcG93ZXIvYW1sb2dpYyxtZXNvbi1lZS1wd3JjLnlhbWwgfCAgIDMg
Ky0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1zYW1zdW5nLnlhbWwgIHwgIDEx
ICstCj4gIC4uLi9iaW5kaW5ncy9yZWd1bGF0b3IvZ3Bpby1yZWd1bGF0b3IueWFtbCAgICB8ICAz
NSArKy0KPiAgLi4uL2JpbmRpbmdzL3JlZ3VsYXRvci9tcHMsbXBxNzkyMC55YW1sICAgICAgIHwg
IDMxICstCj4gIC4uLi9iaW5kaW5ncy9yZWd1bGF0b3IvcmVndWxhdG9yLnlhbWwgICAgICAgICB8
ICAgNSArLQo+ICAuLi4vcmVndWxhdG9yL3JvaG0sYmQ3MTgyOC1yZWd1bGF0b3IueWFtbCAgICAg
fCAgMzQgKy0tCj4gIC4uLi9iaW5kaW5ncy9yZWd1bGF0b3Ivc3Qsc3RtMzItYm9vc3Rlci55YW1s
ICB8ICAgMyArLQo+ICAuLi4vcmVndWxhdG9yL3N0LHN0bTMybXAxLXB3ci1yZWcueWFtbCAgICAg
ICAgfCAgIDMgKy0KPiAgLi4uL2JpbmRpbmdzL3JlbW90ZXByb2Mvc3Qsc3RtMzItcnByb2MueWFt
bCAgIHwgICA5ICstCj4gIC4uLi9iaW5kaW5ncy9yZXNldC9pbnRlbCxyY3UtZ3cueWFtbCAgICAg
ICAgICB8ICAgMyArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwg
ICAgICAgfCAgMjAgKy0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3N0LHN0bTMyLXJ0
Yy55YW1sIHwgICA5ICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9wbDAxMS55
YW1sICAgICB8ICAxMCArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcnM0ODUu
eWFtbCAgICAgfCAgMjYgKy0KPiAgLi4uL2JpbmRpbmdzL3NlcmlhbC9zYW1zdW5nX3VhcnQueWFt
bCAgICAgICAgIHwgICA1ICstCj4gIC4uLi9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFt
bCAgICAgICAgICB8ICAyMCArLQo+ICAuLi4vc291bmQvYWxsd2lubmVyLHN1bjRpLWExMC1jb2Rl
Yy55YW1sICAgICAgfCAgNDEgKystCj4gIC4uLi9iaW5kaW5ncy9zb3VuZC9xY29tLHdjZDkzNHgu
eWFtbCAgICAgICAgICB8ICAgMyArLQo+ICAuLi4vYmluZGluZ3Mvc3BpL3JlbmVzYXMsc2gtbXNp
b2YueWFtbCAgICAgICAgfCAgNDIgKystCj4gIC4uLi9iaW5kaW5ncy9zcGkvc3BpLWNvbnRyb2xs
ZXIueWFtbCAgICAgICAgICB8ICAxNCArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
c3BpLXBsMDIyLnlhbWwgICAgfCAgNTUgKystLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9z
cGkvc3BpLXNpZml2ZS55YW1sICAgfCAgMTQgKy0KPiAgLi4uL2JpbmRpbmdzL3RoZXJtYWwvcWNv
bS10c2Vucy55YW1sICAgICAgICAgIHwgICA3ICstCj4gIC4uLi9iaW5kaW5ncy90aW1lci9hcm0s
YXJjaF90aW1lcl9tbWlvLnlhbWwgICB8ICAgNyArLQo+ICA5MSBmaWxlcyBjaGFuZ2VkLCA4ODEg
aW5zZXJ0aW9ucygrKSwgMTEwMyBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
