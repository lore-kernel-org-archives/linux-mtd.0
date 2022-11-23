Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF21C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 17:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uphbtbelSiKuqtjHInDRgeeulqo6Br+HkPR7+ftVa0Q=; b=Ey3ReyuO6RKaQG
	lxsjI8Zxb0FPPuwgQy5qlR3HnIO7Bm0FNAH97eNGKcCJOtlksCQnu2koIghvtCwXFmI5a63M57xkU
	kMcdkVnWK1skh8+09LCG49oMBPqvSpecJHlyhhokPw/NasgwWAr+npctHtQxchbBEUX3z9klAxNgZ
	SZjtgL/YlOp9Vbb5zOZ4CMeNXbPRFACQ4btlGZOGhBSvj7g4ygng7s2DX6tTivRfCJG3ez1eTZAlB
	Xf/UYkxcrqlJ6hKCLdKXVdqLtOXX1dUefNLu5nZT0vi8qhFhIrC+WEaUIrfWQy8558+X50gMqdEWb
	KhD17ByhasB4xNOyjb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtda-001D18-4F; Wed, 23 Nov 2022 17:34:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtcx-001Cu5-1U; Wed, 23 Nov 2022 17:33:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83C1461E01;
	Wed, 23 Nov 2022 17:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06998C433C1;
	Wed, 23 Nov 2022 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669224236;
	bh=NklP56tySe3Xv444ZHt52vRJGyzaYy1R0Ex9JoaAzOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cM7LkUwn/UGY9APeo61IFLdLFugI/mycScX1L27zLnBFWztWOvsY2/pXAQvU8BtqA
	 zN2grVWU907Puoa1962eNoEzm7M0GyfMXDTyo0m/fYESjcYYfLenMyR420GN0LPle7
	 fHre3CZnC438ac14FaQ0ftW3eoi7y+NqR03dNnG17mNGguUXELDqAXtYw+kabasJh/
	 GdE3AFFOilgHHG2SfRFJ7XFkovjxBFA4x69koAbNo4eANtlUFZ7DlagmzghcWyagzN
	 hB+OrPBoifu3z+M9f10yfPgcQGlZSqkBCHUx9fpHFf/LyumxpmD68OdmhxG3k3+QWy
	 NRxBKM7JX5qXQ==
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-crypto@vger.kernel.org, alsa-devel@alsa-project.org, chrome-platform@lists.linux.dev,
 linux-actions@lists.infradead.org, linux-pwm@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-leds@vger.kernel.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-integrity@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166922422872.540277.7243893319002961181.b4-ty@kernel.org>
Date: Wed, 23 Nov 2022 17:23:48 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_093339_185597_812FA76B 
X-CRM114-Status: GOOD (  14.64  )
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
IGludG8geW91ciB0cmVlIHRvIGdldCBpdDoKPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9yZWd1
bGF0b3IuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbNTM5LzYwNl0gcmVndWxhdG9yOiBhZDUzOTg6
IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDdmNjllZGJh
OTYwYmJkY2JjODI5ZDhkMDk5NWIxMTE3Y2UyOWU4YjEKWzU0NC82MDZdIHJlZ3VsYXRvcjogbHA4
NzJ4OiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiA4N2Zl
Y2NiMzQ3YjI1ZjVkYzZmZjQ1MTEyM2I4MzJjOWFkNWRkZGZlCls1NDYvNjA2XSByZWd1bGF0b3I6
IGx0YzM1ODk6IENvbnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6
IDc4YzhmNmNkYjUxZDQ3MTkyOGQ0ODFlZDNiMmM4MmRiYzExMGExZWQKWzU0OS82MDZdIHJlZ3Vs
YXRvcjogbWF4ODY2MDogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKICAgICAgICAgIGNv
bW1pdDogZGJmMzFkYWM3MDMwMDkxNzQyMjZiYjg3YjM5MTRiZDA5MjA0MDMyNwpbNTUxLzYwNl0g
cmVndWxhdG9yOiBtYXg4OTczLXJlZ3VsYXRvcjogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkKICAgICAgICAgIGNvbW1pdDogNGU4NWU1ZDY0ZjY2YWM1ZTRiMDI4NmVlNGI2ZjhlOGNlMTA0
NGQ0MgpbNTU3LzYwNl0gcmVndWxhdG9yOiB0cHM2MjM2MC1yZWd1bGF0b3I6IENvbnZlcnQgdG8g
aTJjJ3MgLnByb2JlX25ldygpCiAgICAgICAgICBjb21taXQ6IDE4ODA0MTYwMjc3ZWMyYWI5OTIz
NzMzODVmODZjNmFmMjMyMmIyOGIKWzU1OS82MDZdIHJlZ3VsYXRvcjogdHBzNjUwMjMtcmVndWxh
dG9yOiBDb252ZXJ0IHRvIGkyYydzIC5wcm9iZV9uZXcoKQogICAgICAgICAgY29tbWl0OiAzYjVi
MDdkZGU5OThmNmFkZTc0MzNhOGRiMDE5Y2Y4MTZjN2UzNWFmCgpBbGwgYmVpbmcgd2VsbCB0aGlz
IG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJl
ZSAodXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGlu
dXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVn
IGZpeCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2gg
bWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuCgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMg
cmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZpZXcgb2Yg
dGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFu
ZApzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJl
cG9ydGVkIGlmIG5lZWRlZC4KCklmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJl
IHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVt
ZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlzdGluZwpwYXRjaGVzIHdpbGwg
bm90IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50
YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZwp0byB0aGlzIG1haWwuCgpUaGFua3MsCk1h
cmsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
