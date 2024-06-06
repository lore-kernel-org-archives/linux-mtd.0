Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC3BC27C52
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQLQ/8DDC+l1apxt3pELQmTU2nbxHe6Sb9CMjOKa6So=; b=rmbLooq/v/+h/1
	VAODGDTavED/CQRV04b4RIEy65jEzMaIB9FfYUt4/2Z5p/Yw+X0a3QV36M7NbP2K2COVmHCK8pIrN
	Ht9ZKXgHfCfv/l9pqwVSaXXGzC/NyATswcYqxduE254ND2PhbsH2JlwDV+IUaLhDvwbskFJlJfzc/
	DkBu2cpUteLc8QWw49YWPh5W2FS6HuHZInvJPLlguX/y7VsKHDSBunFBjnmuih5QvKKcAKPXMf0nm
	IHtZvcJsKsmojXyZbr6tRLCjDBkMKIrJ9acN4svYAC9IFdxFsr/JTtMkHRMNW9MMjFAh35+WfrC3V
	O4iiivtV33tEJIe9i2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9L1-000000097C9-2HV0;
	Thu, 06 Jun 2024 09:23:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Ky-0000000975g-3akN
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 09:23:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a68ee841138so81467666b.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717665785; x=1718270585; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdo3ldNDeMyIM6Kx3VweI5RQmky1PUGTcMckmPYOvUE=;
        b=hbfW5XDSAGMW8sjJj7b5vGhZqsBSmHgnI6YZz75V0vyN83+k1CIigPSKR4SaZ+YoHs
         7+Bn2/U2OUt4Cbo122xgLK3UpGFMszd11iLyt3BLHdZVe93HrG3iUtRmy7LcU5DaEqRP
         42ysjFamEh11uC+HsSxBcNuaC+iICIoCKFNz957Bss9eKaGU/4x/TuAJdQfoZtdgqZgn
         QwsfHtY6A0Lg5aUw8s4+Zya9lVGY9LRFU6aHWR8u6S1U7ggr1Rnwr1OyW/97ukHCPyhw
         X6iM/jROKp90m0Sgy5+/9+WijE7xzhGuF1owqDI+67u4JvkPab1RBi3rfqKx5cBUGU9X
         Aorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665785; x=1718270585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xdo3ldNDeMyIM6Kx3VweI5RQmky1PUGTcMckmPYOvUE=;
        b=UjcO9xdai1mUcaxpJX47TgU/Q1wp2CeHvOdBBqhbSNbb6leXkGUEKwqswZvdMHc2YM
         Y6lvcy3zZ6JBrHLcp3FPnACqbVFNpEUNa90s3GvvRmRGWOiQ17shBuy7+cczVJsg6OJb
         R9u1BLSo2idgrWBqd9dpdFRbV5VXezdNDcF7OKyE49gGvUbRM5hZR00CcjcJmbUEJIsa
         a8M6jGnnlnn+dKrzlorPRnHOCBGWbsK8C8ORMt4YqdL0oTxQ+hlhxXJeDyrA0lFZMn2S
         R9f/EBRusJ50F0YwXxKjiGxDWwylgX267RK2aTlqE3fb9kohlaZIVEAniu6ZFg+AZ09l
         ZkMw==
X-Forwarded-Encrypted: i=1; AJvYcCVzAr/fwV/Ka/G1zUmEfy+tTsHtM8VwHl9GumiHKOgAnjNx5Eq2u9qx93Hcqp1nF91eDRO0KemRXk9Lkc85X0ZxgElIElJ/iS8btNlS1w==
X-Gm-Message-State: AOJu0YyfP/VruKf5QeH9ZgE3hDBMX+j1tEfLr5UKpoUaIYGilIeH6++T
	dcl03DiXiZFh2qsEinVSbCvlR3/2RSCKgfLVUBTWERwr13Q3NQLPLoeU87bOpGVQmTzmQW+U8JD
	9Y7BVzi9BqMXcpkFris8Gkb+I2AH5UCQ+74ew
X-Google-Smtp-Source: AGHT+IEbpprl6blPk8T2xU2kaYzhaNrmYq2+TvX42xRzC/TSvUdDQXwO9kRI4X6UmxZu4UT9hOygjZqZt2phPUhxZ0w=
X-Received: by 2002:a17:906:4694:b0:a5a:2d30:b8c1 with SMTP id
 a640c23a62f3a-a699f680d76mr317202766b.14.1717665784784; Thu, 06 Jun 2024
 02:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-2-joychakr@google.com>
 <b2ccaf40-fe04-490f-a625-4c502c038627@roeck-us.net>
In-Reply-To: <b2ccaf40-fe04-490f-a625-4c502c038627@roeck-us.net>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 14:52:51 +0530
Message-ID: <CAOSNQF3bw4+-SPEVf9wwsrt0L-6VNK0NWuDKW6AhX701+OKjsg@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem
 reg_read/write return type
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
X-CRM114-CacheID: sfid-20240606_022312_903513_40B75DA0 
X-CRM114-Status: GOOD (  24.76  )
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

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAyOjU54oCvQU0gR3VlbnRlciBSb2VjayA8bGludXhAcm9l
Y2stdXMubmV0PiB3cm90ZToKPgo+IE9uIDYvNS8yNCAxMDo1OSwgSm95IENoYWtyYWJvcnR5IHdy
b3RlOgo+ID4gQ2hhbmdlIG52bWVtIHJlYWQvd3JpdGUgZnVuY3Rpb24gZGVmaW5pdGlvbiByZXR1
cm4gdHlwZSB0byBzc2l6ZV90Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpveSBDaGFrcmFib3J0
eSA8am95Y2hha3JAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2h3bW9uL3BtYnVz
L2FkbTEyNjYuYyB8IDQgKystLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVz
L2FkbTEyNjYuYyBiL2RyaXZlcnMvaHdtb24vcG1idXMvYWRtMTI2Ni5jCj4gPiBpbmRleCAyYzRk
OTRjYzg3MjkuLjdlYWFiNWE3YjA0YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaHdtb24vcG1i
dXMvYWRtMTI2Ni5jCj4gPiArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL2FkbTEyNjYuYwo+ID4g
QEAgLTM3NSw3ICszNzUsNyBAQCBzdGF0aWMgaW50IGFkbTEyNjZfbnZtZW1fcmVhZF9ibGFja2Jv
eChzdHJ1Y3QgYWRtMTI2Nl9kYXRhICpkYXRhLCB1OCAqcmVhZF9idWZmKQo+ID4gICAgICAgcmV0
dXJuIDA7Cj4gPiAgIH0KPiA+Cj4gPiAtc3RhdGljIGludCBhZG0xMjY2X252bWVtX3JlYWQodm9p
ZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpCj4g
PiArc3RhdGljIHNzaXplX3QgYWRtMTI2Nl9udm1lbV9yZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVk
IGludCBvZmZzZXQsIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQo+ID4gICB7Cj4gPiAgICAgICBz
dHJ1Y3QgYWRtMTI2Nl9kYXRhICpkYXRhID0gcHJpdjsKPiA+ICAgICAgIGludCByZXQ7Cj4gPiBA
QCAtMzk1LDcgKzM5NSw3IEBAIHN0YXRpYyBpbnQgYWRtMTI2Nl9udm1lbV9yZWFkKHZvaWQgKnBy
aXYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZhbCwgc2l6ZV90Cj4gPgo+ID4gICAgICAg
bWVtY3B5KHZhbCwgZGF0YS0+ZGV2X21lbSArIG9mZnNldCwgYnl0ZXMpOwo+ID4KPiA+IC0gICAg
IHJldHVybiAwOwo+ID4gKyAgICAgcmV0dXJuIGJ5dGVzOwo+ID4gICB9Cj4gPgo+ID4gICBzdGF0
aWMgaW50IGFkbTEyNjZfY29uZmlnX252bWVtKHN0cnVjdCBhZG0xMjY2X2RhdGEgKmRhdGEpCj4K
PiBUaGUgc2VyaWVzIGRvZXNuJ3QgZXhwbGFpbiB3aGF0IGEgZHJpdmVyIGlzIHN1cHBvc2VkIHRv
IGRvIGlmIGl0Cj4gb25seSB0cmFuc2ZlcnMgcGFydCBvZiB0aGUgZGF0YSBidXQgbm90IGFsbCBv
ZiBpdCBkdWUgdG8gYW4gZXJyb3IsCj4gb3IgYmVjYXVzZSB0aGUgcmVxdWVzdCBleGNlZWRlZCB0
aGUgc2l6ZSBvZiB0aGUgbWVkaWEuCj4KVGhpcyBwYXRjaCBzZXJpZXMgaXMgYWN0dWFsbHkgYSBm
b2xsb3cgdXAgb24KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMjA2MDQyNDA4LjIy
NDEzOC0xLWpveWNoYWtyQGdvb2dsZS5jb20vCndoaWNoIGhhcyBub3cgYmVlbiByZXZlcnRlZCAu
IEkgc2hhbGwgdHJ5IHRvIGNvbGxhdGUgaXQgYW5kIHNlbmQgaXQKYWdhaW4gd2l0aCBhIGJldHRl
ciBleHBsYW5hdGlvbi4KCj4gRm9yIGV4YW1wbGUsIHRoaXMgZHJpdmVyIHN0aWxsIHJldHVybnMg
YW4gZXJyb3IgY29kZSBpZiBpdCBzdWNjZXNzZnVsbHkKPiB0cmFuc2ZlcnJlZCBzb21lIGRhdGEg
YnV0IG5vdCBhbGwgb2YgaXQsIG9yIGlmIG1vcmUgZGF0YSB3YXMgcmVxdWVzdGVkCj4gdGhhbiBp
cyBhdmFpbGFibGUuCj4KPiBJIGRpZG4ndCBjaGVjayBvdGhlciBkcml2ZXJzLCBidXQgSSB3b3Vs
ZCBhc3N1bWUgdGhhdCBtYW55IG9mIHRoZW0KPiBoYXZlIHRoZSBzYW1lIG9yIGEgc2ltaWxhciBw
cm9ibGVtLgo+Cj4gR3VlbnRlcgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
