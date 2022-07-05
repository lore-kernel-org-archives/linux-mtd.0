Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D64C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODrEUMFnNB+KYej1hnz2mk8gDaptXc3uY19MZiL86+E=; b=3hSLlLHBJQjsfZ
	JMdjs4gPfapS9hbzgLEqcmPLQZdToI6la1x0+vBy7teDaW00fWmykcnP64KiCTcr08YhcP2kk/MET
	Uasp+kJwiPxO9/lPKveIUp2mu1bwUjfqB3JIHUSrgab8ctp3bk9wneHe4gXOmGyIe2Kvml6+/rNgT
	m4tCiUsHE1meGXP1sPBsZSruwBTscgUeiXm5/WfdU8287rzyiAJrTudsJqywP6w43eV9kOjlfnyQj
	SqK7T+Mh0n4RgyyyfPtkD/idFLWeq4Nr9PYmtWHqZxnDTmR3tjbGbWo1zrg1k+ziAiBorSi4T8VjL
	qSaCf1iK2ErFoN8423Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fUX-00H4sB-TN; Tue, 05 Jul 2022 10:09:13 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fUL-00H4pA-IF; Tue, 05 Jul 2022 10:09:03 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4BB4A1F91F;
	Tue,  5 Jul 2022 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657015735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvMJ4J1/LuqJ2bm7BlZIoOLJOYmWh+4Rpvkk33SZGOA=;
	b=eByb4sSPqg6rRuVWR7Uyol2qkXUh2FlAJZJl6kQB2+c8EEhcdaxtq/jkX0dVzdvL/5s6D3
	/efNTsY/bdasP3pVQxu6qP4nvHO+zcS4O9fblGgs1NR89rSYgTvYETM292rGHy3CrhOSj+
	qGcOFU+GGl+mKHAF54mbZA9ZrTUJOaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657015735;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvMJ4J1/LuqJ2bm7BlZIoOLJOYmWh+4Rpvkk33SZGOA=;
	b=jKWTp5GMggeoLloojImrUvPvKkYL+8GQzQSR8Qi8VzqCYEK46zUKh7GMjl/cO3qvfPDiP7
	DHXFfHIde+vxx5CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E2AF1339A;
	Tue,  5 Jul 2022 10:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VBGsCbYNxGK1BQAAMHmgww
	(envelope-from <jdelvare@suse.de>); Tue, 05 Jul 2022 10:08:54 +0000
Date: Tue, 5 Jul 2022 12:08:52 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705120852.049dc235@endymion.delvare>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
	<20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_030901_774184_ACC067B1 
X-CRM114-Status: GOOD (  13.04  )
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

T24gVHVlLCAyOCBKdW4gMjAyMiAxNjowMzoxMiArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KPiAK
PiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYW4gaTJjIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBp
cyBtb3N0bHkgaWdub3JlZC4KPiAoT25seSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYg
dGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRoYXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4gCj4g
U28gY2hhbmdlIHRoZSBwcm90b3R5cGUgb2YgdGhlIHJlbW92ZSBmdW5jdGlvbiB0byByZXR1cm4g
bm8gdmFsdWUuIFRoaXMKPiB3YXkgZHJpdmVyIGF1dGhvcnMgYXJlIG5vdCB0ZW1wdGVkIHRvIGFz
c3VtZSB0aGF0IHBhc3NpbmcgYW4gZXJyb3IgdG8KPiB0aGUgdXBwZXIgbGF5ZXIgaXMgYSBnb29k
IGlkZWEuIEFsbCBkcml2ZXJzIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5Lgo+IFRoZXJlIGlzIG5v
IGludGVuZGVkIGNoYW5nZSBvZiBiZWhhdmlvdXIsIGFsbCBjYWxsYmFja3Mgd2VyZSBwcmVwYXJl
ZCB0bwo+IHJldHVybiAwIGJlZm9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQoKVGhhdCdzIGEgaHVn
ZSBjaGFuZ2UgZm9yIGEgcmVsYXRpdmVseSBzbWFsbCBiZW5lZml0LCBidXQgaWYgdGhpcyBpcwph
cHByb3ZlZCBieSB0aGUgSTJDIGNvcmUgbWFpbnRhaW5lciB0aGVuIGZpbmUgd2l0aCBtZS4gRm9y
OgoKPiAgZHJpdmVycy9od21vbi9hZGMxMjhkODE4LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaHdtb24vYWR0NzQ3MC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvaHdtb24vYXNiMTAwLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tCj4gIGRyaXZlcnMvaHdt
b24vYXNjNzYyMS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+
ICBkcml2ZXJzL2h3bW9uL2RtZTE3MzcuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCA0ICstLS0KPiAgZHJpdmVycy9od21vbi9mNzUzNzVzLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNSArKy0tLQo+ICBkcml2ZXJzL2h3bW9uL2ZzY2htZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9u
L2Z0c3RldXRhdGVzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBk
cml2ZXJzL2h3bW9uL2luYTIwOS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICstLS0KPiAgZHJpdmVycy9od21vbi9pbmEzMjIxLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaHdtb24vamM0Mi5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvaHdtb24vbWNwMzAy
MS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJz
L2h3bW9uL29jYy9wOF9pMmMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICst
LS0KPiAgZHJpdmVycy9od21vbi9wY2Y4NTkxLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9od21vbi9zbW02NjUuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9od21vbi90cHMyMzg2MS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaHdtb24v
dzgzNzgxZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBk
cml2ZXJzL2h3bW9uL3c4Mzc5MWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9uL3c4Mzc5MmQuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9uL3c4Mzc5My5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQo+ICBkcml2ZXJzL2h3bW9u
L3c4Mzc5NS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAg
ZHJpdmVycy9od21vbi93ODNsNzg1dHMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgNiArKy0tLS0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgNiArLS0tLS0KPiAgZHJpdmVycy9pMmMvaTJjLXNsYXZlLWVlcHJv
bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaTJjL2ky
Yy1zbGF2ZS10ZXN0dW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gIGRy
aXZlcnMvaTJjL2kyYy1zbWJ1cy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDMgKy0tCj4gIGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtbHRjNDMwNi5jICAgICAgICAgICAg
ICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NDEu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMt
bXV4LXBjYTk1NHguYyAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQoKUmV2aWV3ZWQtYnk6
IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KCi0tIApKZWFuIERlbHZhcmUKU1VTRSBM
MyBTdXBwb3J0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
