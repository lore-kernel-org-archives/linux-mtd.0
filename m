Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E051CEDD95
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVRfoPtfPoGJs0TIfJftuGpYUnW27r304HqRKE+DEJs=; b=mkrhy+WWVM7mam
	owfq3c3Rv7II9RXnuGQ5wvkewXPHmMRmt14yIrzC4U+b/SbOdTja5xyHbuT74roGZt7frKV19hn5X
	Pzr2BLyPsXBBUto+Bg6+1Z5f7uvP9eivJTXQI5EPQ+j0khJBdwz3NpRTdDX07EFq24vgxhJduDbW1
	2E0R5LA9NMh4+QygW8wAJ7yIVQrvHFnJqV5Xe+Jt/8xeWr+qx9QyvrHlqvDMT8deu4CB+bKxfoRp7
	Ql0h6kUcD7J8WjZxYZ5WhS6pO3ixfs2thEnrT4D4aBYmSM333l2dZcYltI4N96jdHw67sC0AUlG4x
	FkrQK/kNd4Ay7mEuVI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWtU-00000009RIH-3iSd;
	Wed, 09 Oct 2024 13:38:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWq0-00000009QRp-2P9T;
	Wed, 09 Oct 2024 13:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A603FA43FAA;
	Wed,  9 Oct 2024 13:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FF6C4CED5;
	Wed,  9 Oct 2024 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728480886;
	bh=e0gqHlZkDT5WvXlJLxiiH51AUvpJH6OopoCW36UMFTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U3neOl0ybb4Ab65jgWhp3xT7HcEy4YMuUgGV+fe0qorbYgOtJiVf4vdBC8aSbF+zk
	 VaSzmlKJr1Td+ZlEfUnqPwPvP3ItSIxZE3mhiSqTU0Y+ILn1z2LAcj5l0mNd964u9E
	 IJiiL6vn/nZ84NJqFn6bT+eDEGpN/zUWDJjiTS1Nw44OfqVQU1G+/BklpTTM5qjnQt
	 qFWcWXBTn592t1uwoUFl7fAOhoRDLvjep0N3/TGk+zJy9Qodx9ZM9pOn4mlQ+m1tjB
	 +zz3ljVHlk8StJ6aovxl3cW8GcQDcp3o2MYDG6IpoR0lwS4CMa0F2Pi7cYkeI0mOAq
	 BM9t8zEhFY8Sg==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5e1c49f9b9aso2731866eaf.2;
        Wed, 09 Oct 2024 06:34:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0TJBhMdzCzF8zfvZexJlSsZTGrYx3VRDi41d2LgHdIZhrLqEDxvuwBkY6QuvlUbNRLipKC3SUJMpw@lists.infradead.org, AJvYcCWECfZlukcsZc/JZ63wbGUTubZb8np9bFo2qMhopAT1DQhTFbxZ3Fbl7bWaGMOAGqpQTtZhq56X7p11@lists.infradead.org, AJvYcCWLjVC/wTUCcIbtNFBjQ8dDvu1Lc37VR7MNHH0WDhdzIBpRXECd8y7m/va81rBegZ+r76nU0J7NBdxyptrvxtZq@lists.infradead.org, AJvYcCX7ke+Iy7y3vhxFFw7WZXzhDQyDFTWrjGzlcG67ljFHHUeCy6qQsxM19OOnacffLASVgNvlb/ew8nzR@lists.infradead.org, AJvYcCXl7PiCZkRK9DTW0XpjUDbxP46GGKmeEPEhTatyDkLgVIM1Yed/OnPQ521lNCL3dEcgkATSimyTPOumUdVIHz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKbByM4AHVXtwcOdV/0Kuh3W3D06YulTwTK9+yDz4KSFfSZfj5
	9tegnQ2uIsXjSpbwcGGcX1nhzjDOnEpUM/5jVZCMgxgZLxorgeBJaTyGrjAkkPzC8D/Nx6WJo6N
	CLpLk2YwJZlOW8OB1lF0mBBJgnPI=
X-Google-Smtp-Source: AGHT+IGPvjQmX3zbZk+/LQ5kxG4XslEJ8m7y5iETpKVOpmsBmOdZ4tET2kRXnqT/piSrFy5yYrBa2CfwSNatwWXgz3s=
X-Received: by 2002:a05:6820:270f:b0:5e5:c489:6f3c with SMTP id
 006d021491bc7-5e987bc9df9mr1249377eaf.5.1728480885551; Wed, 09 Oct 2024
 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com> <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
In-Reply-To: <41a0ad69-912b-4eb3-84f7-fb385433c056@opensource.cirrus.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 15:34:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gbrhMpPT0fHYSC+ES5WS5kv7XkM2hj9M4vpNwFFs6xsQ@mail.gmail.com>
Message-ID: <CAJZ5v0gbrhMpPT0fHYSC+ES5WS5kv7XkM2hj9M4vpNwFFs6xsQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Richard Fitzgerald <rf@opensource.cirrus.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
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
	asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_063448_790620_FB0BB7BC 
X-CRM114-Status: GOOD (  41.47  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCAyOjQ44oCvUE0gUmljaGFyZCBGaXR6Z2VyYWxkCjxyZkBv
cGVuc291cmNlLmNpcnJ1cy5jb20+IHdyb3RlOgo+Cj4gT24gMDgvMTAvMjAyNCA3OjI0IHBtLCBS
YWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IE9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgMTI6MzXi
gK9BTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4KPiA+
PiBPbiBUdWUsIDggT2N0IDIwMjQgYXQgMDA6MjUsIExhdXJlbnQgUGluY2hhcnQKPiA+PiA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gSGkgVWxm
LAo+ID4+Pgo+ID4+PiBPbiBUdWUsIE9jdCAwOCwgMjAyNCBhdCAxMjowODoyNEFNICswMjAwLCBV
bGYgSGFuc3NvbiB3cm90ZToKPiA+Pj4+IE9uIE1vbiwgNyBPY3QgMjAyNCBhdCAyMDo0OSwgTGF1
cmVudCBQaW5jaGFydCB3cm90ZToKPiA+Pj4+PiBPbiBGcmksIE9jdCAwNCwgMjAyNCBhdCAwNDoz
ODozNlBNICswMjAwLCBVbGYgSGFuc3NvbiB3cm90ZToKPiA+Pj4+Pj4gT24gRnJpLCA0IE9jdCAy
MDI0IGF0IDExOjQxLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSGVs
bG8gZXZlcnlvbmUsCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gVGhpcyBzZXQgd2lsbCBzd2l0Y2ggdGhl
IHVzZXJzIG9mIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdG8KPiA+Pj4+Pj4+IF9fcG1f
cnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSB3aGlsZSB0aGUgZm9ybWVyIHdpbGwgc29vbiBiZSBy
ZS1wdXJwb3NlZAo+ID4+Pj4+Pj4gdG8gaW5jbHVkZSBhIGNhbGwgdG8gcG1fcnVudGltZV9tYXJr
X2xhc3RfYnVzeSgpLiBUaGUgdHdvIGFyZSBhbG1vc3QKPiA+Pj4+Pj4+IGFsd2F5cyB1c2VkIHRv
Z2V0aGVyLCBhcGFydCBmcm9tIGJ1Z3Mgd2hpY2ggYXJlIGxpa2VseSBjb21tb24uIEdvaW5nCj4g
Pj4+Pj4+PiBmb3J3YXJkLCBtb3N0IG5ldyB1c2VycyBzaG91bGQgYmUgdXNpbmcgcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQoKS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBPbmNlIHRoaXMgY29udmVy
c2lvbiBpcyBkb25lIGFuZCBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHJlLXB1cnBvc2Vk
LAo+ID4+Pj4+Pj4gSSdsbCBwb3N0IGFub3RoZXIgc2V0IHRvIG1lcmdlIHRoZSBjYWxscyB0byBf
X3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkKPiA+Pj4+Pj4+IGFuZCBwbV9ydW50aW1lX21h
cmtfbGFzdF9idXN5KCkuCj4gPj4+Pj4+Cj4gPj4+Pj4+IFRoYXQgc291bmRzIGxpa2UgaXQgY291
bGQgY2F1c2UgYSBsb3Qgb2YgY2h1cm5zLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBXaHkgbm90IGFkZCBh
IG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQo+ID4+Pj4+PiBwbV9ydW50aW1lX3B1
dF9hdXRvc3VzcGVuZCgpIGFuZCB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpCj4gPj4+
Pj4+IHRoaW5ncz8gVGhlbiB3ZSBjYW4gc3RhcnQgbW92aW5nIHVzZXJzIG92ZXIgdG8gdGhpcyBu
ZXcgaW50ZXJmYWNlLAo+ID4+Pj4+PiByYXRoZXIgdGhhbiBoYXZpbmcgdGhpcyBpbnRlcm1lZGlh
dGUgc3RlcD8KPiA+Pj4+Pgo+ID4+Pj4+IEkgdGhpbmsgdGhlIEFQSSB3b3VsZCBiZSBuaWNlciBp
ZiB3ZSB1c2VkIHRoZSBzaG9ydGVzdCBhbmQgc2ltcGxlc3QKPiA+Pj4+PiBmdW5jdGlvbiBuYW1l
cyBmb3IgdGhlIG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93aW5nCj4gPj4+Pj4gcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoKSB3aXRoIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBp
cyB0aGF0Cj4gPj4+Pj4gbW9zdCBjb21tb24gdXNlIGNhc2UuIFRoYXQncyB3aHkgSSBsaWtlIFNh
a2FyaSdzIGFwcHJvYWNoIG9mIHJlcHVycG9zaW5nCj4gPj4+Pj4gcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKSwgYW5kIGludHJvZHVjaW5nCj4gPj4+Pj4gX19wbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZCgpIGZvciB0aGUgb2RkIGNhc2VzIHdoZXJlCj4gPj4+Pj4gcG1fcnVudGltZV9tYXJr
X2xhc3RfYnVzeSgpIHNob3VsZG4ndCBiZSBjYWxsZWQuCj4gPj4+Pgo+ID4+Pj4gT2theSwgc28g
dGhlIHJlYXNvbiBmb3IgdGhpcyBhcHByb2FjaCBpcyBiZWNhdXNlIHdlIGNvdWxkbid0IGZpbmQg
YQo+ID4+Pj4gc2hvcnQgYW5kIGRlc2NyaXB0aXZlIG5hbWUgdGhhdCBjb3VsZCBiZSB1c2VkIGlu
IGZhdm9yIG9mCj4gPj4+PiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLiBMZXQgbWUgdGhy
b3cgc29tZSBpZGVhcyBhdCBpdCBhbmQgbWF5YmUKPiA+Pj4+IHlvdSBsaWtlIGl0IC0gb3Igbm90
LiA6LSkKPiA+Pj4KPiA+Pj4gSSBsaWtlIHRoZSBpZGVhIGF0IGxlYXN0IDotKQo+ID4+Pgo+ID4+
Pj4gSSBkb24ndCBrbm93IHdoYXQgb3B0aW9ucyB5b3UgZ3V5cyBkaXNjdXNzZWQsIGJ1dCB0byBt
ZSB0aGUgZW50aXJlCj4gPj4+PiAiYXV0b3N1c3BlbmQiLXN1ZmZpeCBpc24ndCByZWFsbHkgdGhh
dCBuZWNlc3NhcnkgaW4gbXkgb3Bpbmlvbi4gVGhlcmUKPiA+Pj4+IGFyZSBtb3JlIHdheXMgdGhh
biBjYWxsaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdGhhdCB0cmlnZ2Vycwo+ID4+
Pj4gdXMgdG8gdXNlIHRoZSBSUE1fQVVUTyBmbGFnIGZvciBycG1fc3VzcGVuZCgpLiBGb3IgZXhh
bXBsZSwganVzdAo+ID4+Pj4gY2FsbGluZyBwbV9ydW50aW1lX3B1dCgpIGhhcyB0aGUgc2ltaWxh
ciBlZmZlY3QuCj4gPj4+Cj4gPj4+IFRvIGJlIGhvbmVzdCwgSSdtIGxvc3QgdGhlcmUuIHBtX3J1
bnRpbWVfcHV0KCkgY2FsbHMKPiA+Pj4gX19wbV9ydW50aW1lX2lkbGUoUlBNX0dFVF9QVVQgfCBS
UE1fQVNZTkMpLCB3aGlsZQo+ID4+PiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIGNhbGxz
IF9fcG1fcnVudGltZV9zdXNwZW5kKFJQTV9HRVRfUFVUIHwKPiA+Pj4gUlBNX0FTWU5DIHwgUlBN
X0FVVE8pLgo+ID4+Cj4gPj4gX19wbV9ydW50aW1lX2lkbGUoKSBlbmRzIHVwIGNhbGxpbmcgcnBt
X2lkbGUoKSwgd2hpY2ggbWF5IGNhbGwKPiA+PiBycG1fc3VzcGVuZCgpIC0gaWYgaXQgc3VjY2Vl
ZHMgdG8gaWRsZSB0aGUgZGV2aWNlLiBJbiB0aGF0IGNhc2UsIGl0Cj4gPj4gdGFncyBvbiB0aGUg
UlBNX0FVVE8gZmxhZyBpbiB0aGUgY2FsbCB0byBycG1fc3VzcGVuZCgpLiBRdWl0ZSBzaW1pbGFy
Cj4gPj4gdG8gd2hhdCBpcyBoYXBwZW5pbmcgd2hlbiBjYWxsaW5nIHBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKCkuCj4gPgo+ID4gUmlnaHQuCj4gPgo+ID4gRm9yIGFsbW9zdCBldmVyeWJvZHks
IGV4Y2VwdCBmb3IgYSBzbWFsbCBidW5jaCBvZiBkcml2ZXJzIHRoYXQKPiA+IGFjdHVhbGx5IGhh
dmUgYSAucnVudGltZV9pZGxlKCkgY2FsbGJhY2ssIHBtX3J1bnRpbWVfcHV0KCkgaXMKPiA+IGxp
dGVyYWxseSBlcXVpdmFsZW50IHRvIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuCj4gPgo+
ID4gU28gcmVhbGx5IHRoZSBxdWVzdGlvbiBpcyB3aHkgYW55b25lIHdobyBkb2Vzbid0IHByb3Zp
ZGUgYQo+ID4gLnJ1bnRpbWVfaWRsZSgpIGNhbGxiYWNrIGJvdGhlcnMgd2l0aCB1c2luZyB0aGlz
IHNwZWNpYWwKPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdGhpbmcsCj4KPiBCZWNh
dXNlIHRoZXkgYXJlIGZvbGxvd2luZyB0aGUgZG9jdW1lbnRhdGlvbj8gSXQgc2F5czoKPgo+ICJE
cml2ZXJzIHNob3VsZCBjYWxsIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSB0byB1cGRhdGUg
dGhpcyBmaWVsZAo+IGFmdGVyIGNhcnJ5aW5nIG91dCBJL08sIHR5cGljYWxseSBqdXN0IGJlZm9y
ZSBjYWxsaW5nCj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4iCj4KPiBhbmQKPgo+ICJJ
biBvcmRlciB0byB1c2UgYXV0b3N1c3BlbmQsIHN1YnN5c3RlbXMgb3IgZHJpdmVycyBtdXN0IGNh
bGwKPiBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgpICguLi4pLCBhbmQgdGhlcmVhZnRlciB0
aGV5IHNob3VsZCB1c2UgdGhlCj4gdmFyaW91cyBgKl9hdXRvc3VzcGVuZCgpYCBoZWxwZXIgZnVu
Y3Rpb25zIGluc3RlYWQgb2YgdGhlIG5vbiMKPiBhdXRvc3VzcGVuZCBjb3VudGVycGFydHMiCj4K
PiBTbyB0aGUgZG9jdW1lbnRhdGlvbiBzYXlzIEkgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCkKPiBpbnN0ZWFkIG9mIHBtX3J1bnRpbWVfcHV0KCkuCj4KPiBTZWVt
cyB1bmZhaXIgdG8gY3JpdGljaXNlIHBlb3BsZSBmb3IgZm9sbG93aW5nIHRoZSBkb2N1bWVudGF0
aW9uLgoKSSdtIG5vdCBjcml0aWNpc2luZyBhbnlvbmUsIGp1c3Qgd29uZGVyaW5nIHdoeSB0aGV5
IGRvIHdoYXQgdGhleSBkby4KCiJCZWNhdXNlIGl0IGlzIGRvY3VtZW50ZWQgdGhpcyB3YXkiIGlz
IGEgZmFpciBhbnN3ZXIsIGJ1dCBpdCBkb2Vzbid0CmludmFsaWRhdGUgdGhlIG9ic2VydmF0aW9u
IHRoYXQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbgpwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgp
IGFuZCBwbV9ydW50aW1lX3B1dCgpIGJvaWxzIGRvd24gdG8gdGhlCmNhc2VzIHdoZW4gdGhlIC5y
dW50aW1lX2lkbGUoKSBjYWxsYmFjayBpcyBwcmVzZW50ICh3aGljaCBhcmUgZmV3IGFuZApmYXIg
YmV0d2VlbiBzbyB0byBzcGVhaykuICBNb3Jlb3ZlciwgdGhlcmUgYXJlIGNhbGwgc2l0ZXMgdXNp
bmcKcG1fcnVudGltZV8qKCkgZnVuY3Rpb25zIGV2ZW4gdGhvdWdoIHRoZXkgbWF5IG5vdCBrbm93
IHdoZXRoZXIgb3Igbm90CmF1dG9zdXNwZW5kIGlzIGVuYWJsZWQgZm9yIHRoZSB0YXJnZXQgZGV2
aWNlcywgc28gdGhlIGFkdmljZSBnaXZlbiBpbgp0aGUgZG9jdW1lbnRhdGlvbiBjYW5ub3QgYmUg
dW5pdmVyc2FsbHkgZm9sbG93ZWQgcmVnYXJkbGVzcy4KClRoaXMgdGhyZWFkIGlzIGFib3V0IHRo
ZSB3YXkgdG8gZ28sIGdlbmVyYWxseSBzcGVha2luZywgYW5kIHdoYXQgSSdtCnNheWluZyBpcyBl
ZmZlY3RpdmVseSB0aGF0IHJlcGxhY2luZyBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdp
dGgKcG1fcnVudGltZV9wdXQoKSBhbG1vc3QgZXZlcnl3aGVyZSAoaWYgbm90IGp1c3QgZXZlcnl3
aGVyZSkgd291bGQgYmUKZmluZSB3aXRoIG1lLgoKSSBhbHNvIHRoaW5rIHRoYXQgdGhlIGN1cnJl
bnQgdXNlcnMgb2YgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKQp0aGF0IGlzIG5vdCBpbW1l
ZGlhdGVseSBwcmVjZWRlZCBieSBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgY2FuIGJlCnJl
YWRpbHkgc3dpdGNoZWQgb3ZlciB0byB1c2luZyBwbV9ydW50aW1lX3B1dCgpIGluc3RlYWQgb2Yg
aXQgYW5kIHRoZW4KcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBjYW4gYmUgbWFkZSBjYWxs
CnBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSwgc28gdGhlIGxhdHRlciBjYW4gYmUgcmVtb3Zl
ZCBmcm9tIHRoZQpjb2RlIHVzaW5nIHRoZSBmb3JtZXIuICBOb3RlIHRoYXQgdGhpcyBsYXN0IHN0
ZXAgZG9lcyBub3QgcmVxdWlyZQp0cmVlLXdpZGUgY2hhbmdlcywgYmVjYXVzZSBjYWxsaW5nIHBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSB0d2ljZQppbiBhIHJvdyBmb3IgdGhlIHNhbWUgZGV2
aWNlIGlzIG5vdCBhIHByb2JsZW0uCgpPZiBjb3Vyc2UsIHRoZSBkb2N1bWVudGF0aW9uIG5lZWRz
IHRvIGJlIHVwZGF0ZWQgaW4gYWNjb3JkYW5jZSB3aXRoCnRoZSBjb2RlIGNoYW5nZXMsIHdoaWNo
IGRpZG4ndCBoYXBwZW4gd2hlbiBwcmV2aW91cyBjaGFuZ2VzIHdlcmUgbWFkZQp0byBwbV9ydW50
aW1lX3B1dCgpIGFuZCB0aGF0IGxpa2VseSBpcyB3aHkgaXQgZG9lcyBub3QgcmVmbGVjdCB0aGUK
Y3VycmVudCBjb2RlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
