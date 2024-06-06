Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52703C27C52
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+vPA/iO+WQB+HumtFhqT8nC6JmJEx714V3994k4aiA=; b=g7GFm2Ow4ttM+C
	cdStK/d3GsDj6zlyF5KMe3+hTa3ipMfC9xf5fmxa4TqZ0wJDBlj6eYWB2JAsho3SrVmxUIyEi9ZiC
	K7g7y8kDLicqw+27traWMTM9L6WV9Eo3cAO3Qpff28w8qau5WGIpDItvDebyNK3rhaFdCRJUJ+nyS
	KOCM1jV0IUYCuuqpfWq+vDFL/T1Z+/AcmkAbgG+0Vbbv6Csz4X0wRfHdNWpvM770YnzpKkgImNJr/
	STOhw7PHbg+xuy3ocaDjt6Y9b0ln8Yeh8YfCluFZ1iDc1l6qAeI0i7P46xFC54gUxH9Eezo+0BEVe
	gSJpAavtiSXy0aMBiZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9MH-0000000988t-2Tch;
	Thu, 06 Jun 2024 09:24:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9MB-000000097yH-15uv
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 09:24:29 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-6bce380eb96so499014a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717665866; x=1718270666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=H2Rh5ShQJX087eGsrBGsuOTOediLhL3pUXnZXaGT9mcNoymVtNg9+Ce3pSeTnc8pO9
         7dySQbHE43+jf06MlINKZn+JK5F+/m2JKNAFr/INWIVAzZPoXAnMwfXeer+dTqIiQcLn
         xP58sbLmDHsPrK4u/DPKbscsXf8tN6bRHSM/1JXPHIT8RrypsHi+5PDxmj1qtG2FDNLu
         acLGFhmKwDCvrPYYdt8vF4muGCE1dw/sVTk6rGgIMxCWVPYfrAKxHL7uCOSDhQZOYFl/
         XRQ0Ta1yJsaB3znLc4pVkzDdXExh1EEQLKV1JdZzsO+uKVm/aG4k0IWnx0oN2J5uRoM6
         h36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665866; x=1718270666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgaL8o9gTqW3R6MkCs66+V6tGdqOhyMZityYxhrOKQ=;
        b=uE8BEEE8LzKWcmfdwk6kl3tUoQ/9Z5Q59UEOV1O1EMjWmo3SLi3/m+dEmtpqcn4Uao
         48SYMW6ciDXF5qAgn4bAxvOMXWy4+bi5rl4T0l0B5/gDbDhWMh8DbdF7V0/wLd6FSnI/
         JiBELnc/w6jnVleGpaCRAWoxXSp37ceI7z73StjOzBtyblfSStEKTYhpuG4fjYbkKY2j
         Xqa7T4WF/Nn6NtdI3u3/vv90AUPbvvDozKu+7pR5GQXCEXH2JOuBinM1d1LnRx18+4SM
         aM66Lr9JHCoKc/6PC2Nx93iyxo5fM4sjK0lHmOirpPGMg9p2G0vZVbGJA19ghf/qAqew
         YL+w==
X-Forwarded-Encrypted: i=1; AJvYcCXLbE9OMrLPuu+iH5LIGhxEWdS49TvSbmJRhOZUrtYT4WZRwQgl55sePwx/tQetgWkf8f4aiXqTzC4QGsDIhHHoIA9glBWQYGq2GGsMxA==
X-Gm-Message-State: AOJu0YyjPb9STsDAtD7UMW+RiRIrVU4KSarnqRkf+afVO7EiNal49GzC
	biWBW5Axv/t+x7psmvR/7GAIxjyWts0oloUjAa9eC+jK7gTX4S8gEVqhBTgjQc9yEo/g8DKawgk
	WDJYNTpZRd6J+P2atGPKwAiod3am/abIoUtqW
X-Google-Smtp-Source: AGHT+IFO27fLQ60otnz+VPqegLb1l+ah/BSl+EBtF4Q1892OcY0hAdcmXoAoiATlOwzJL3jUrPraipj4bPnP8gdWMEU=
X-Received: by 2002:a17:90b:4ad0:b0:2c1:ad46:7133 with SMTP id
 98e67ed59e1d1-2c27dafd1d8mr5026032a91.8.1717665865426; Thu, 06 Jun 2024
 02:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-6-joychakr@google.com>
 <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
In-Reply-To: <20a9ea0b-74d0-47b2-8dc0-2b5e7d070d38@roeck-us.net>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 14:54:09 +0530
Message-ID: <CAOSNQF3Kes3MHWf3FMCCfNOCvymSZV8RS+UMM_oKjhBQzQz8Bg@mail.gmail.com>
Subject: Re: [PATCH v1 05/17] misc: ds1682: Change nvmem reg_read/write return type
To: Guenter Roeck <linux@roeck-us.net>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_022427_562177_508B5935 
X-CRM114-Status: GOOD (  16.66  )
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

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAyOjQ44oCvQU0gR3VlbnRlciBSb2VjayA8bGludXhAcm9l
Y2stdXMubmV0PiB3cm90ZToKPgo+IE9uIDYvNS8yNCAxMDo1OSwgSm95IENoYWtyYWJvcnR5IHdy
b3RlOgo+ID4gQ2hhbmdlIG52bWVtIHJlYWQvd3JpdGUgZnVuY3Rpb24gZGVmaW5pdGlvbiByZXR1
cm4gdHlwZSB0byBzc2l6ZV90Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpveSBDaGFrcmFib3J0
eSA8am95Y2hha3JAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL21pc2MvZHMxNjgy
LmMgfCAxNiArKysrKystLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mv
ZHMxNjgyLmMgYi9kcml2ZXJzL21pc2MvZHMxNjgyLmMKPiA+IGluZGV4IDVmOGRjZDBlMzg0OC4u
OTUzMzQxNjY2ZGRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9taXNjL2RzMTY4Mi5jCj4gPiAr
KysgYi9kcml2ZXJzL21pc2MvZHMxNjgyLmMKPiA+IEBAIC0xOTgsMjYgKzE5OCwyMiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgZHMxNjgyX2VlcHJvbV9hdHRyID0gewo+ID4g
ICAgICAgLndyaXRlID0gZHMxNjgyX2VlcHJvbV93cml0ZSwKPiA+ICAgfTsKPiA+Cj4gPiAtc3Rh
dGljIGludCBkczE2ODJfbnZtZW1fcmVhZCh2b2lkICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0
LCB2b2lkICp2YWwsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnl0ZXMp
Cj4gPiArc3RhdGljIHNzaXplX3QgZHMxNjgyX252bWVtX3JlYWQodm9pZCAqcHJpdiwgdW5zaWdu
ZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemVfdCBieXRlcykKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IHByaXY7Cj4gPiAtICAgICBpbnQgcmV0Owo+ID4KPiA+IC0gICAgIHJldCA9IGkyY19z
bWJ1c19yZWFkX2kyY19ibG9ja19kYXRhKGNsaWVudCwgRFMxNjgyX1JFR19FRVBST00gKyBvZmZz
ZXQsCj4gPiArICAgICByZXR1cm4gaTJjX3NtYnVzX3JlYWRfaTJjX2Jsb2NrX2RhdGEoY2xpZW50
LCBEUzE2ODJfUkVHX0VFUFJPTSArIG9mZnNldCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJ5dGVzLCB2YWwpOwo+ID4gLSAgICAgcmV0dXJuIHJldCA8IDAg
PyByZXQgOiAwOwo+ID4gICB9Cj4gPgo+ID4gLXN0YXRpYyBpbnQgZHMxNjgyX252bWVtX3dyaXRl
KHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnl0ZXMpCj4gPiArc3RhdGljIHNzaXplX3QgZHMx
NjgyX252bWVtX3dyaXRlKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZh
bCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGJ5dGVzKQo+ID4g
ICB7Cj4gPiAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gcHJpdjsKPiA+IC0gICAg
IGludCByZXQ7Cj4gPgo+ID4gLSAgICAgcmV0ID0gaTJjX3NtYnVzX3dyaXRlX2kyY19ibG9ja19k
YXRhKGNsaWVudCwgRFMxNjgyX1JFR19FRVBST00gKyBvZmZzZXQsCj4gPiArICAgICByZXR1cm4g
aTJjX3NtYnVzX3dyaXRlX2kyY19ibG9ja19kYXRhKGNsaWVudCwgRFMxNjgyX1JFR19FRVBST00g
KyBvZmZzZXQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Ynl0ZXMsIHZhbCk7Cj4KPiBpMmNfc21idXNfd3JpdGVfaTJjX2Jsb2NrX2RhdGEoKSBkb2VzIG5v
dCByZXR1cm4gdGhlIG51bWJlciBvZiBieXRlcyB3cml0dGVuLgo+IEl0IHJldHVybnMgZWl0aGVy
IDAgb3IgYW4gZXJyb3IgY29kZS4KPgpBY2ssIEkgc2VlIG9ubHkgaTJjX3NtYnVzX3JlYWRfaTJj
X2Jsb2NrX2RhdGEoKSAgcmV0dXJucyB0aGUgbnVtYmVyIG9mCmJ5dGVzIHJlYWQgLiBXaWxsIGZp
eCBpdCBuZXh0IHJldmlzaW9uLgoKPiBHdWVudGVyCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
