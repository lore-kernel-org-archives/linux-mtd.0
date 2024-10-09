Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6254CF044D
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=al68qEDxY+Wa+7r7gjm4gOcGIfzA6k+WyLoHCtzW0DA=; b=xVpIMolgcOJBYQ
	qfXEVV8v2WIxNiLlowgi80IX/RQ+92hfjekbNm40mR7JUhRBkTu+m/fFMDdDRvHmzEXbLbGZfYGdG
	T/wP7rR/CMqQ0Ke4M8wgg3jSgA8qy5PdGXnvdg19j4Yg+qpvqt3N8iEqNIUKOZaRDnVrFFCiwIybJ
	VnntmaRGN0PaDK2TQMHox5A2HFRIZcr3yauh8M653XtAVdwxArlsasbId3W+Xo6lViyaBXsgigRww
	5S8JmOjo3Ujui2rEMzo8zQogMmNQ03syN8BT76N7q8NzKKqrnMvkZT5E5LRGhu8J6stCKWHcNtIWJ
	I/vrH3wPbocRa/XD20sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTtn-00000008sXF-0pej;
	Wed, 09 Oct 2024 10:26:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTny-00000008qyD-1VB5;
	Wed, 09 Oct 2024 10:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AB685C5EE7;
	Wed,  9 Oct 2024 10:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AEDC4CED3;
	Wed,  9 Oct 2024 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469229;
	bh=ImAK0CpUwm+JPbTzbW7azTUBVNfLGbvl7aS7sfbdp0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sypaa8E4XTR2h+6vO973S9djHACjIXek0KLq783ADF8tNtOe1bMZrJFf0zlt8+zSs
	 OLRAtppFEIb5Ic0mWDNDYNRaI6e9/Z7vBQGyOQ8guZklNp3J6lYVvOJPY0Nte+XhtF
	 xT1b91GGI33rYAt7gxwLcB1d3y1SBKs6bb4MxTTF1y6tGBweQi8zO12oDVI1/KpONI
	 bOJQtQv0XV690wHla57wDR2aHvoM6Up16kaIYdw6AVyfMWDvtpnERh2dLqJ6WBvkYw
	 EhkKXnH7yqObLqkMathJ5jYncRSwZXMHxI2dTYJuZPN1g66Yyks/L1YgZFWJ7ipDTo
	 JPDgtbBAM36Bg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e5d0a80db4so3555288eaf.3;
        Wed, 09 Oct 2024 03:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk3V7I2PvncIqlf4fr6Y3d/J2gZidnsGcPwLDEmLI/TTllUxCP8K8xVHJXokTwHwxI3M37nZ+nddDLT/nhJG4=@lists.infradead.org, AJvYcCVzGMRvIfC9gGq+QRAzxqY1nH09TKsgqVEiALgJdbW0nUVQ6dzFps+9GL6CPuOCAwZ+WhKd+HCU+fAQ@lists.infradead.org, AJvYcCWXqV+/m1r1aEyF4JjJoeEbRCRmNbMg/yPNt4feO4fhl6sOQHSbiVsA8AkdaH9U3jOSraVqy8lbt1oFzmsunT4g@lists.infradead.org, AJvYcCWqSFrevRpbRkC8Eb98Oilw9BZMVTmoRDJXmOtFYvNlfCMXxA1bgr6h5isGG0oWGIK1ARFWeWPksxg2@lists.infradead.org, AJvYcCXX6aQEGxZrGOXieHiR4Y2oyc7VHGGBScNxvu/TTSvn9UrZWm9ATBswSxhppYb0B9i6fETSLlfVRM5z@lists.infradead.org
X-Gm-Message-State: AOJu0YxD54b7STzieR/dtL8RtNXjpELzSmLxEceNKF50my7Gp6S2UGAd
	jIu69zeRHMOwSYvjR6FGzRxWesKD94SQohjpuAXe7qK7iyhcQb06ExfGLqUZAPQs8RNqMm/QRIl
	VWGnYDpjiE2JcEQ3f6vsnUkKL6go=
X-Google-Smtp-Source: AGHT+IF28e1A9mtOEy4wCWwLUrfMAFq/4+DT8Vi41Eljnp8AjlauSlJofg4NJprxAH2sFsPScvE36aWo6OHCPjXQ49c=
X-Received: by 2002:a05:6820:270f:b0:5e7:c925:b05 with SMTP id
 006d021491bc7-5e987aadf58mr1212364eaf.2.1728469228716; Wed, 09 Oct 2024
 03:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 12:20:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Ulf Hansson <ulf.hansson@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
	iommu@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
	asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_032030_512998_D061FBB5 
X-CRM114-Status: GOOD (  43.24  )
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

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCA4OjI04oCvUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgMTI6MzXigK9B
TSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
VHVlLCA4IE9jdCAyMDI0IGF0IDAwOjI1LCBMYXVyZW50IFBpbmNoYXJ0Cj4gPiA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgVWxmLAo+ID4g
Pgo+ID4gPiBPbiBUdWUsIE9jdCAwOCwgMjAyNCBhdCAxMjowODoyNEFNICswMjAwLCBVbGYgSGFu
c3NvbiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIDcgT2N0IDIwMjQgYXQgMjA6NDksIExhdXJlbnQg
UGluY2hhcnQgd3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIE9jdCAwNCwgMjAyNCBhdCAwNDozODoz
NlBNICswMjAwLCBVbGYgSGFuc3NvbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCA0IE9jdCAy
MDI0IGF0IDExOjQxLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBIZWxsbyBldmVyeW9uZSwKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoaXMgc2V0
IHdpbGwgc3dpdGNoIHRoZSB1c2VycyBvZiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRv
Cj4gPiA+ID4gPiA+ID4gX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdoaWxlIHRoZSBm
b3JtZXIgd2lsbCBzb29uIGJlIHJlLXB1cnBvc2VkCj4gPiA+ID4gPiA+ID4gdG8gaW5jbHVkZSBh
IGNhbGwgdG8gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpLiBUaGUgdHdvIGFyZSBhbG1vc3QK
PiA+ID4gPiA+ID4gPiBhbHdheXMgdXNlZCB0b2dldGhlciwgYXBhcnQgZnJvbSBidWdzIHdoaWNo
IGFyZSBsaWtlbHkgY29tbW9uLiBHb2luZwo+ID4gPiA+ID4gPiA+IGZvcndhcmQsIG1vc3QgbmV3
IHVzZXJzIHNob3VsZCBiZSB1c2luZyBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT25jZSB0aGlzIGNvbnZlcnNpb24gaXMgZG9uZSBhbmQg
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSByZS1wdXJwb3NlZCwKPiA+ID4gPiA+ID4gPiBJ
J2xsIHBvc3QgYW5vdGhlciBzZXQgdG8gbWVyZ2UgdGhlIGNhbGxzIHRvIF9fcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKQo+ID4gPiA+ID4gPiA+IGFuZCBwbV9ydW50aW1lX21hcmtfbGFzdF9i
dXN5KCkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQgc291bmRzIGxpa2UgaXQgY291bGQg
Y2F1c2UgYSBsb3Qgb2YgY2h1cm5zLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaHkgbm90IGFk
ZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQo+ID4gPiA+ID4gPiBwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZCgpIGFuZCB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgp
Cj4gPiA+ID4gPiA+IHRoaW5ncz8gVGhlbiB3ZSBjYW4gc3RhcnQgbW92aW5nIHVzZXJzIG92ZXIg
dG8gdGhpcyBuZXcgaW50ZXJmYWNlLAo+ID4gPiA+ID4gPiByYXRoZXIgdGhhbiBoYXZpbmcgdGhp
cyBpbnRlcm1lZGlhdGUgc3RlcD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHRoaW5rIHRoZSBBUEkg
d291bGQgYmUgbmljZXIgaWYgd2UgdXNlZCB0aGUgc2hvcnRlc3QgYW5kIHNpbXBsZXN0Cj4gPiA+
ID4gPiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhlIG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93
aW5nCj4gPiA+ID4gPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdpdGggcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeSgpIGlzIHRoYXQKPiA+ID4gPiA+IG1vc3QgY29tbW9uIHVzZSBjYXNl
LiBUaGF0J3Mgd2h5IEkgbGlrZSBTYWthcmkncyBhcHByb2FjaCBvZiByZXB1cnBvc2luZwo+ID4g
PiA+ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSwgYW5kIGludHJvZHVjaW5nCj4gPiA+
ID4gPiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgZm9yIHRoZSBvZGQgY2FzZXMgd2hl
cmUKPiA+ID4gPiA+IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBzaG91bGRuJ3QgYmUgY2Fs
bGVkLgo+ID4gPiA+Cj4gPiA+ID4gT2theSwgc28gdGhlIHJlYXNvbiBmb3IgdGhpcyBhcHByb2Fj
aCBpcyBiZWNhdXNlIHdlIGNvdWxkbid0IGZpbmQgYQo+ID4gPiA+IHNob3J0IGFuZCBkZXNjcmlw
dGl2ZSBuYW1lIHRoYXQgY291bGQgYmUgdXNlZCBpbiBmYXZvciBvZgo+ID4gPiA+IHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCkuIExldCBtZSB0aHJvdyBzb21lIGlkZWFzIGF0IGl0IGFuZCBt
YXliZQo+ID4gPiA+IHlvdSBsaWtlIGl0IC0gb3Igbm90LiA6LSkKPiA+ID4KPiA+ID4gSSBsaWtl
IHRoZSBpZGVhIGF0IGxlYXN0IDotKQo+ID4gPgo+ID4gPiA+IEkgZG9uJ3Qga25vdyB3aGF0IG9w
dGlvbnMgeW91IGd1eXMgZGlzY3Vzc2VkLCBidXQgdG8gbWUgdGhlIGVudGlyZQo+ID4gPiA+ICJh
dXRvc3VzcGVuZCItc3VmZml4IGlzbid0IHJlYWxseSB0aGF0IG5lY2Vzc2FyeSBpbiBteSBvcGlu
aW9uLiBUaGVyZQo+ID4gPiA+IGFyZSBtb3JlIHdheXMgdGhhbiBjYWxsaW5nIHBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCkgdGhhdCB0cmlnZ2Vycwo+ID4gPiA+IHVzIHRvIHVzZSB0aGUgUlBN
X0FVVE8gZmxhZyBmb3IgcnBtX3N1c3BlbmQoKS4gRm9yIGV4YW1wbGUsIGp1c3QKPiA+ID4gPiBj
YWxsaW5nIHBtX3J1bnRpbWVfcHV0KCkgaGFzIHRoZSBzaW1pbGFyIGVmZmVjdC4KPiA+ID4KPiA+
ID4gVG8gYmUgaG9uZXN0LCBJJ20gbG9zdCB0aGVyZS4gcG1fcnVudGltZV9wdXQoKSBjYWxscwo+
ID4gPiBfX3BtX3J1bnRpbWVfaWRsZShSUE1fR0VUX1BVVCB8IFJQTV9BU1lOQyksIHdoaWxlCj4g
PiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgY2FsbHMgX19wbV9ydW50aW1lX3N1c3Bl
bmQoUlBNX0dFVF9QVVQgfAo+ID4gPiBSUE1fQVNZTkMgfCBSUE1fQVVUTykuCj4gPgo+ID4gX19w
bV9ydW50aW1lX2lkbGUoKSBlbmRzIHVwIGNhbGxpbmcgcnBtX2lkbGUoKSwgd2hpY2ggbWF5IGNh
bGwKPiA+IHJwbV9zdXNwZW5kKCkgLSBpZiBpdCBzdWNjZWVkcyB0byBpZGxlIHRoZSBkZXZpY2Uu
IEluIHRoYXQgY2FzZSwgaXQKPiA+IHRhZ3Mgb24gdGhlIFJQTV9BVVRPIGZsYWcgaW4gdGhlIGNh
bGwgdG8gcnBtX3N1c3BlbmQoKS4gUXVpdGUgc2ltaWxhcgo+ID4gdG8gd2hhdCBpcyBoYXBwZW5p
bmcgd2hlbiBjYWxsaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuCj4KPiBSaWdodC4K
Pgo+IEZvciBhbG1vc3QgZXZlcnlib2R5LCBleGNlcHQgZm9yIGEgc21hbGwgYnVuY2ggb2YgZHJp
dmVycyB0aGF0Cj4gYWN0dWFsbHkgaGF2ZSBhIC5ydW50aW1lX2lkbGUoKSBjYWxsYmFjaywgcG1f
cnVudGltZV9wdXQoKSBpcwo+IGxpdGVyYWxseSBlcXVpdmFsZW50IHRvIHBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKCkuCj4KPiBTbyByZWFsbHkgdGhlIHF1ZXN0aW9uIGlzIHdoeSBhbnlvbmUg
d2hvIGRvZXNuJ3QgcHJvdmlkZSBhCj4gLnJ1bnRpbWVfaWRsZSgpIGNhbGxiYWNrIGJvdGhlcnMg
d2l0aCB1c2luZyB0aGlzIHNwZWNpYWwKPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRo
aW5nLCB3aGljaCByZWFsbHkgbWVhbnMgImRvIGEKPiBydW50aW1lX3B1dCgpLCBidXQgc2tpcCBt
eSAucnVudGltZV9pZGxlKCkgY2FsbGJhY2siLgo+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBNb3Jl
b3ZlciwgaXQncyBzaW1pbGFyIGZvciBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCksIGl0J3Mg
Y2FsbGVkCj4gPiA+ID4gZHVyaW5nIHJwbV9yZXN1bWUoKSB0b28sIGZvciBleGFtcGxlLiBTbyB3
aHkgYm90aGVyIGFib3V0IGhhdmluZwo+ID4gPiA+ICJtYXJrX2xhc3RfYnVzeSIgaW4gdGhlIG5l
dyBuYW1lIHRvby4KPiA+ID4gPgo+ID4gPiA+IFRoYXQgc2FpZCwgbXkgc3VnZ2VzdGlvbiBpcyBz
aW1wbHkgInBtX3J1bnRpbWVfcHV0X3N1c3BlbmQiLgo+ID4gPgo+ID4gPiBDYW4gd2UgZG8gZXZl
biBiZXR0ZXIsIGFuZCBtYWtlIHBtX3J1bnRpbWVfcHV0KCkgdG8gaGFuZGxlIGF1dG9zdXNwZW5k
Cj4gPiA+IGF1dG9tYXRpY2FsbHkgd2hlbiBhdXRvc3VzcGVuZCBpcyBlbmFibGVkID8KPiA+Cj4g
PiBBcyBzdGF0ZWQgYWJvdmUsIHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZS4KPgo+IFdoYXQgcmVh
bGx5IGlzIG5lZWRlZCBhcHBlYXJzIHRvIGJlIGEgY29tYmluYXRpb24gb2YKPiBwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KCkgd2l0aCBwbV9ydW50aW1lX3B1dCgpLgo+Cj4gR3JhbnRlZCwgcG1f
cnVudGltZV9wdXQoKSBjb3VsZCBkbyB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpCj4g
dGhpbmcgYXV0b21hdGljYWxseSBpZiBhdXRvc3VzcGVuZCBpcyBlbmFibGVkIGFuZCB0aGUgb25s
eSBjb25zZXF1ZW5jZQo+IG9mIGl0IG1pZ2h0IGJlIGRlbGF5aW5nIGEgc3VzcGVuZCBvZiB0aGUg
ZGV2aWNlIHVudGlsIGl0cyBhdXRvc3VzcGVuZAo+IHRpbWVyIGV4cGlyZXMsIHdoaWNoIHNob3Vs
ZCBub3QgYmUgYSBwcm9ibGVtIGluIHRoZSB2YXN0IG1ham9yaXR5IG9mCj4gY2FzZXMuCgpUaGF0
IHNhaWQsIGl0IGlzIGxpa2VseSBiZXR0ZXIgdG8gYXZvaWQgc3VycHJpc2luZyB0aGUgY3VycmVu
dCB1c2VycwpvZiBwbV9ydW50aW1lX3B1dCgpIGFuZCBkZWZpbmUgc29tZXRoaW5nIGxpa2UKCnN0
YXRpYyBpbmxpbmUgdm9pZCBwbV9ydW50aW1lX3RvdWNoX2FuZF9wdXQoc3RydWN0IGRldmljZSAq
ZGV2KQp7CiAgICAgICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOwogICAgICAgIHBt
X3J1bnRpbWVfcHV0KGRldik7Cn0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
