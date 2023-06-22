Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1864EEB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8pcdAKwXbhxPcfjemDASZqCQCAQs6odLW58TNBb5+w=; b=E3LPecVG8OeE2K
	s5CMh2d4ftXqOQkAaEvFiNlELKEYUKHwOt4fyXZ5J6aJvHdB5ys81DuZQ7xD0ldacGyYsbhqxvw08
	dzpB4c5dk+wlvSam/io3QnH60lukZpV1Lq9LM8kjUjuq5JtWHKyphC79UGA+iXf98kwGpVt86VOex
	a1Vt5EqG5zMurNLdyugNGeClumLwhef3SGT6OVAa/WVDwkRYVFBkawzEmme3JEAEaMxAjK4JYz3AR
	tLIIW8YYYz2lBNJa529Wt7t4KepfrWQLy4RIW/HcDS/O2eBTtjMrrX2UPUOdyC1KHSzNxXu+LeSWQ
	jexuQFUFpicwzeY6SwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFiF-00HQev-3B;
	Thu, 22 Jun 2023 08:30:44 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFiC-00HQeB-27
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 08:30:42 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687422637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2C9OAWtennWoPZrbFNAF7xrc7sanFnVYruKnET/n8o=;
	b=UuruDO1dWX/jbVqs7EYehuAANp/CTONsONPudYXvjfzRjcxVbdG+/ZPWaUzO4oOmlmGIEI
	GeWhqKUDLEskr0m1jxN8I9BiqMgme7xrh1DVr9rk1ImiYNICtLWRaUYfJA8LHWTIyPnF+U
	DFcFqx7FYx7gYOPGsRJfsaVN+pk8D41jTavaC9NQ6B9JE6YZ93Gpzpm8OIhA39nVPoqHjy
	n2Yien8ZoSkgaS5OOKeRbNp2r6IJkbfsiIerSGpTmsgGkNUdPEXkE1Q3xgYJCrRIpDJauJ
	hIMJ+F+DC//mtdY0VBRBEkGyDXKy4M3RpuU18U7qCZpEofKgnxrXz2NT58gbeA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A93871BF20D;
	Thu, 22 Jun 2023 08:30:33 +0000 (UTC)
Date: Thu, 22 Jun 2023 10:30:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] mtd: prepare for dynamically removed devices
Message-ID: <20230622103032.0febdb25@xps-13>
In-Reply-To: <20230620131905.648089-1-alexander.usyskin@intel.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_013040_840516_B589F5FA 
X-CRM114-Status: GOOD (  12.67  )
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

SGkgQWxleGFuZGVyLAoKYWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tIHdyb3RlIG9uIFR1ZSwg
MjAgSnVuIDIwMjMgMTY6MTk6MDMgKzAzMDA6Cgo+IFByZXBhcmUgbXRkIHN1YnN5c3RlbSBmb3Ig
ZGV2aWNlcyB0aGF0IGNhbiBiZSBkeW5hbWljYWxseSByZW1vdmVkLAo+IGxpa2UgbWVtb3J5IG9u
IFBDSUUgY2FyZC4KPiBVc2UgcmVmY291bnQgdG8gcHJldmVudCBjcmFzaGVzIHdoZW4gdW5kZXJs
eWluZyBkZXZpY2UKPiByZW1vdmVkIHVuZXhwZWN0ZWRseSBhbmQgcmVzaHVmZmxlIF9fZ2V0IGFu
ZCBfX3B1dCBmdW5jdGlvbnMKPiB0byBhbGxvdyB1bmRlcmx5aW5nIGRldmljZSB0byBjbGVhbiBp
dCBtZW1vcnkgYWNjb3JkaW5nIHRvIHJlZmNvdW50Lgo+IAo+IEFsZXhhbmRlciBVc3lza2luICgx
KToKPiAgIG10ZDogY2FsbCBleHRlcm5hbCBfZ2V0IGFuZCBfcHV0IGluIHJpZ2h0IG9yZGVyCj4g
Cj4gVG9tYXMgV2lua2xlciAoMSk6Cj4gICBtdGQ6IHVzZSByZWZjb3VudCB0byBwcmV2ZW50IGNv
cnJ1cHRpb24KPiAKPiAgZHJpdmVycy9tdGQvbXRkY29yZS5jICAgfCA4NiArKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmggICB8
ICAxICsKPiAgZHJpdmVycy9tdGQvbXRkcGFydC5jICAgfCAxNCArKysrLS0tCj4gIGluY2x1ZGUv
bGludXgvbXRkL210ZC5oIHwgIDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25z
KCspLCA0NyBkZWxldGlvbnMoLSkKPiAKClRoZSBpZGVhIGlzIG9mIGNvdXJzZSBncmVhdCwgdGhl
IGltcGxlbWVudGF0aW9uIGxvb2tzIGZpbmUsIGJ1dCB0aGUKcmlzayBpcyB0b28gaGlnaCBhdCAt
cmM3IHNvIEknbGwgdGFrZSB0aGlzIGF0IC1yYzEgZm9yIHRoZSBuZXh0CnJlbGVhc2UuCgpUaGFu
a3MsIE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
