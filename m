Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D977C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Px49taigj/ZViX140cO6A9h0o6/IJ7GnkiHbxbH8yQ=; b=FOekMSQQ1sjfTE
	2vFJHCNJkcB/HdsbA2qevbpQcINUY/tAQMvTurhP62ok6sNwnzryzs6HnqZ0t0SyV/TvqNJsrJBxT
	gMTRbdIr1yYW5EfCvL74u5KeHPfXCprXIyyx/PeSkwS5x5sSciskrDu5SBrv5ymNg16TuUrv8Spre
	5d44BaNzf2baCnNTYK96Rgu8aTnHA9Egnm22TyThzBBWZAFzYJxtqZodgdNiVD5mNMjdEY753QiJI
	i2rSxR18tIzkE987eAkupBCOe2lmmTzfaZGQT9Xny4etJG+kXMVmjHUfqfxBPKEXXm2efm+sjG4Cc
	W7F8v7AP2cstKjfbVzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6f75-00E6b7-VR; Wed, 29 Jun 2022 21:20:44 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6f6u-00E6Z6-TA; Wed, 29 Jun 2022 21:20:34 +0000
Received: from [37.161.29.0] (port=43545 helo=[192.168.131.30])
	by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <luca@lucaceresoli.net>)
	id 1o6f6m-000BzC-Qd;
	Wed, 29 Jun 2022 23:20:25 +0200
Message-ID: <d682fb60-c254-f89e-5d6d-cdf7aa752939@lucaceresoli.net>
Date: Wed, 29 Jun 2022 23:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-mediatek@lists.infradead.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_142033_136740_A23A237D 
X-CRM114-Status: GOOD (  11.17  )
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

SGksCgpba2VlcGluZyBvbmx5IGluZGl2aWR1YWxzIGFuZCBsaXN0cyBpbiBDYyB0byBhdm9pZCBi
b3VuY2VzXQoKT24gMjgvMDYvMjIgMTY6MDMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZy
b206IFV3ZSBLbGVpbmUtS8O2bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5vcmc+Cj4gCj4gVGhlIHZh
bHVlIHJldHVybmVkIGJ5IGFuIGkyYyBkcml2ZXIncyByZW1vdmUgZnVuY3Rpb24gaXMgbW9zdGx5
IGlnbm9yZWQuCj4gKE9ubHkgYW4gZXJyb3IgbWVzc2FnZSBpcyBwcmludGVkIGlmIHRoZSB2YWx1
ZSBpcyBub24temVybyB0aGF0IHRoZQo+IGVycm9yIGlzIGlnbm9yZWQuKQo+IAo+IFNvIGNoYW5n
ZSB0aGUgcHJvdG90eXBlIG9mIHRoZSByZW1vdmUgZnVuY3Rpb24gdG8gcmV0dXJuIG5vIHZhbHVl
LiBUaGlzCj4gd2F5IGRyaXZlciBhdXRob3JzIGFyZSBub3QgdGVtcHRlZCB0byBhc3N1bWUgdGhh
dCBwYXNzaW5nIGFuIGVycm9yIHRvCj4gdGhlIHVwcGVyIGxheWVyIGlzIGEgZ29vZCBpZGVhLiBB
bGwgZHJpdmVycyBhcmUgYWRhcHRlZCBhY2NvcmRpbmdseS4KPiBUaGVyZSBpcyBubyBpbnRlbmRl
ZCBjaGFuZ2Ugb2YgYmVoYXZpb3VyLCBhbGwgY2FsbGJhY2tzIHdlcmUgcHJlcGFyZWQgdG8KPiBy
ZXR1cm4gMCBiZWZvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KCkZvciB2ZXJzYWNsb2NrOgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvY2xrLXZlcnNhY2xvY2s1LmMgYi9kcml2ZXJzL2Nsay9jbGstdmVy
c2FjbG9jazUuYwo+IGluZGV4IGU3YmUzZTU0YjliZS4uNjU3NDkzZWNjZTRjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvY2xrL2Nsay12ZXJzYWNsb2NrNS5jCj4gKysrIGIvZHJpdmVycy9jbGsvY2xr
LXZlcnNhY2xvY2s1LmMKPiBAQCAtMTEzOCw3ICsxMTM4LDcgQEAgc3RhdGljIGludCB2YzVfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4g
LXN0YXRpYyBpbnQgdmM1X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICtzdGF0
aWMgdm9pZCB2YzVfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gIHsKPiAgCXN0
cnVjdCB2YzVfZHJpdmVyX2RhdGEgKnZjNSA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOwo+
ICAKPiBAQCAtMTE0Niw4ICsxMTQ2LDYgQEAgc3RhdGljIGludCB2YzVfcmVtb3ZlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCj4gIAo+ICAJaWYgKHZjNS0+Y2hpcF9pbmZvLT5mbGFncyAmIFZD
NV9IQVNfSU5URVJOQUxfWFRBTCkKPiAgCQljbGtfdW5yZWdpc3Rlcl9maXhlZF9yYXRlKHZjNS0+
cGluX3hpbik7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgdmM1X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoKUmV2aWV3ZWQtYnk6IEx1
Y2EgQ2VyZXNvbGkgPGx1Y2FAbHVjYWNlcmVzb2xpLm5ldD4KUmV2aWV3ZWQtYnk6IEx1Y2EgQ2Vy
ZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgotLSAKTHVjYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
