Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D91CEFC3C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCAdEfDvZxK0ql8D6vA01zbULWn25StljYHabz/P+qQ=; b=02BW3tnG+VD7/I
	PNKmnrfbMt1skbYJWTE61+2FDT7g8Ocdyjldax4GrvLhKvdpa5h2HVgVfjdv+3M2SQ3kOSe7c7K7Q
	xLA1qia9shLJuuJYUu5sKDyzKRP1o8KslO4vKBV1N1w00WYCI0owJWx3JEbRaZBoZPPgsAXKr6vq5
	XFM7uoQTDT34HGbwPfAs3+LoYFxKST/7Mc4wrsEmBJhtD9Z2dPjOSPbGDqXJRrvWn4lZsxg0RVd9H
	c/NLh2uYTT7SWe7ZZpHvAJyLVWei9XAKk1XYp8mTn2yRpI2gt0g/aHBMUXGGotQXmi1go1FQzTGsx
	Y6rHnEZXHtz03Z21pliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syExu-00000006my3-421J;
	Tue, 08 Oct 2024 18:29:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syEtQ-00000006mB2-2kG9;
	Tue, 08 Oct 2024 18:25:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56F845C5B34;
	Tue,  8 Oct 2024 18:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427B6C4CECE;
	Tue,  8 Oct 2024 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728411907;
	bh=gbTLwyB5anW/NVNa27O4GYEgcT7Zt8zwGlDOBl4w9X4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QWv3+c7hgheNar52dT93kuaRJqQGwrTlm+2qt+dJoGyQzAHIgU0jubrC8ThWhyZIZ
	 RS8ECJijkXPnKWXZt/DHYo4oNlel2cdA7QmeMfgDuBLkCfLLpl6vQcl4DNTcV5EyFH
	 5h8XYKukhwE21LUBMtMTij4WxRmO6XhWfjQaEwayPWgg9ncS5s6vbgtpgFKR2d4Ze1
	 U8RaeSIFzvB8vNoypQgBEdP43kZiPZVbc5vt/+kjhif0hCbio5j23Z7Fbcd2MdU+Eu
	 u4mqS8NwdiP912BRPYfCL4ckK1zD9U7UpC3cflIOLH9kTp0r9qM6ScGNZWHbmYuBvP
	 5BPH6goJRp7XQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e5d0a80db4so3217625eaf.3;
        Tue, 08 Oct 2024 11:25:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2XiXnKj1t73wvrzbcJdfVVoHCfOXVrAutCmntPFSr7BxXIEvb24APBh7R1+UvNZMwVrkNCFGp86mP@lists.infradead.org, AJvYcCUL1oVYCjTIKr+eKtAsHYn70N3ZN7GoMBIB+pXUdJeMTAzP3lSOcPyI/7PHHaUmpmgoNPT/QPyhMvrO@lists.infradead.org, AJvYcCV5ZOKTQbbuhhCg26y2eEkKRxXcxdExHP1vv1OruOsiVeXKKT+2v6AljAdfghZsFdmJ6pREtyVe1ucd45DA0r8=@lists.infradead.org, AJvYcCVajjV2zfQ41/AQjYHuEHuTIsoV5oqTkT2mHke8cId5t69hTCbJ6m0XCXoPzrfFhJlhMMMMFVNC9/F3CRHw58OX@lists.infradead.org, AJvYcCX8ic0M2IRUWsDrSjNgI1g2TfO8S6f/EcgoXRJ2XU+VeItEnvAylLIMMRHtH77vuoXHtbUpUqhqUyec@lists.infradead.org
X-Gm-Message-State: AOJu0YzyXovsFSMGNvLTaibeugS3DnG87i1MaXYHV7g8rBYIpR0PLhN2
	vyqdPiOhG3t7oNGXcdPxy17B468j9Ft2IEN4ISYTq4oVF1z7L9UjgOePJoXlxEMoqJbMsx56N2d
	3xqgCbj0lZ6vUI7zhfGs1ASVFD+Y=
X-Google-Smtp-Source: AGHT+IE8/UzrmOfg0dgL+a7sFpnmZmTmVZlVfZVXeH9h9sR6Zbx0f+k3/XHDUWx/NQFfJo1odWsZ7gtN5j50xL2u+GA=
X-Received: by 2002:a05:6820:228e:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e7cc079979mr12626737eaf.3.1728411906564; Tue, 08 Oct 2024
 11:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
In-Reply-To: <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Oct 2024 20:24:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
Message-ID: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241008_112508_818533_882C8E59 
X-CRM114-Status: GOOD (  39.54  )
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

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCAxMjozNeKAr0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgOCBPY3QgMjAyNCBhdCAwMDoyNSwgTGF1
cmVudCBQaW5jaGFydAo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3Rl
Ogo+ID4KPiA+IEhpIFVsZiwKPiA+Cj4gPiBPbiBUdWUsIE9jdCAwOCwgMjAyNCBhdCAxMjowODoy
NEFNICswMjAwLCBVbGYgSGFuc3NvbiB3cm90ZToKPiA+ID4gT24gTW9uLCA3IE9jdCAyMDI0IGF0
IDIwOjQ5LCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgT2N0IDA0LCAy
MDI0IGF0IDA0OjM4OjM2UE0gKzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOgo+ID4gPiA+ID4gT24g
RnJpLCA0IE9jdCAyMDI0IGF0IDExOjQxLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEhlbGxvIGV2ZXJ5b25lLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGlz
IHNldCB3aWxsIHN3aXRjaCB0aGUgdXNlcnMgb2YgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
KSB0bwo+ID4gPiA+ID4gPiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd2hpbGUgdGhl
IGZvcm1lciB3aWxsIHNvb24gYmUgcmUtcHVycG9zZWQKPiA+ID4gPiA+ID4gdG8gaW5jbHVkZSBh
IGNhbGwgdG8gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpLiBUaGUgdHdvIGFyZSBhbG1vc3QK
PiA+ID4gPiA+ID4gYWx3YXlzIHVzZWQgdG9nZXRoZXIsIGFwYXJ0IGZyb20gYnVncyB3aGljaCBh
cmUgbGlrZWx5IGNvbW1vbi4gR29pbmcKPiA+ID4gPiA+ID4gZm9yd2FyZCwgbW9zdCBuZXcgdXNl
cnMgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IE9uY2UgdGhpcyBjb252ZXJzaW9uIGlzIGRvbmUgYW5kIHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCkgcmUtcHVycG9zZWQsCj4gPiA+ID4gPiA+IEknbGwgcG9zdCBh
bm90aGVyIHNldCB0byBtZXJnZSB0aGUgY2FsbHMgdG8gX19wbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpCj4gPiA+ID4gPiA+IGFuZCBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gVGhhdCBzb3VuZHMgbGlrZSBpdCBjb3VsZCBjYXVzZSBhIGxvdCBvZiBj
aHVybnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2h5IG5vdCBhZGQgYSBuZXcgaGVscGVyIGZ1bmN0
aW9uIHRoYXQgZG9lcyB0aGUKPiA+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkg
YW5kIHRoZSBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkKPiA+ID4gPiA+IHRoaW5ncz8gVGhl
biB3ZSBjYW4gc3RhcnQgbW92aW5nIHVzZXJzIG92ZXIgdG8gdGhpcyBuZXcgaW50ZXJmYWNlLAo+
ID4gPiA+ID4gcmF0aGVyIHRoYW4gaGF2aW5nIHRoaXMgaW50ZXJtZWRpYXRlIHN0ZXA/Cj4gPiA+
ID4KPiA+ID4gPiBJIHRoaW5rIHRoZSBBUEkgd291bGQgYmUgbmljZXIgaWYgd2UgdXNlZCB0aGUg
c2hvcnRlc3QgYW5kIHNpbXBsZXN0Cj4gPiA+ID4gZnVuY3Rpb24gbmFtZXMgZm9yIHRoZSBtb3N0
IGNvbW1vbiB1c2UgY2FzZXMuIEZvbGxvd2luZwo+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKCkgd2l0aCBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkgaXMgdGhhdAo+ID4gPiA+
IG1vc3QgY29tbW9uIHVzZSBjYXNlLiBUaGF0J3Mgd2h5IEkgbGlrZSBTYWthcmkncyBhcHByb2Fj
aCBvZiByZXB1cnBvc2luZwo+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCksIGFu
ZCBpbnRyb2R1Y2luZwo+ID4gPiA+IF9fcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBmb3Ig
dGhlIG9kZCBjYXNlcyB3aGVyZQo+ID4gPiA+IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBz
aG91bGRuJ3QgYmUgY2FsbGVkLgo+ID4gPgo+ID4gPiBPa2F5LCBzbyB0aGUgcmVhc29uIGZvciB0
aGlzIGFwcHJvYWNoIGlzIGJlY2F1c2Ugd2UgY291bGRuJ3QgZmluZCBhCj4gPiA+IHNob3J0IGFu
ZCBkZXNjcmlwdGl2ZSBuYW1lIHRoYXQgY291bGQgYmUgdXNlZCBpbiBmYXZvciBvZgo+ID4gPiBw
bV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLiBMZXQgbWUgdGhyb3cgc29tZSBpZGVhcyBhdCBp
dCBhbmQgbWF5YmUKPiA+ID4geW91IGxpa2UgaXQgLSBvciBub3QuIDotKQo+ID4KPiA+IEkgbGlr
ZSB0aGUgaWRlYSBhdCBsZWFzdCA6LSkKPiA+Cj4gPiA+IEkgZG9uJ3Qga25vdyB3aGF0IG9wdGlv
bnMgeW91IGd1eXMgZGlzY3Vzc2VkLCBidXQgdG8gbWUgdGhlIGVudGlyZQo+ID4gPiAiYXV0b3N1
c3BlbmQiLXN1ZmZpeCBpc24ndCByZWFsbHkgdGhhdCBuZWNlc3NhcnkgaW4gbXkgb3Bpbmlvbi4g
VGhlcmUKPiA+ID4gYXJlIG1vcmUgd2F5cyB0aGFuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKSB0aGF0IHRyaWdnZXJzCj4gPiA+IHVzIHRvIHVzZSB0aGUgUlBNX0FVVE8gZmxh
ZyBmb3IgcnBtX3N1c3BlbmQoKS4gRm9yIGV4YW1wbGUsIGp1c3QKPiA+ID4gY2FsbGluZyBwbV9y
dW50aW1lX3B1dCgpIGhhcyB0aGUgc2ltaWxhciBlZmZlY3QuCj4gPgo+ID4gVG8gYmUgaG9uZXN0
LCBJJ20gbG9zdCB0aGVyZS4gcG1fcnVudGltZV9wdXQoKSBjYWxscwo+ID4gX19wbV9ydW50aW1l
X2lkbGUoUlBNX0dFVF9QVVQgfCBSUE1fQVNZTkMpLCB3aGlsZQo+ID4gcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKSBjYWxscyBfX3BtX3J1bnRpbWVfc3VzcGVuZChSUE1fR0VUX1BVVCB8Cj4g
PiBSUE1fQVNZTkMgfCBSUE1fQVVUTykuCj4KPiBfX3BtX3J1bnRpbWVfaWRsZSgpIGVuZHMgdXAg
Y2FsbGluZyBycG1faWRsZSgpLCB3aGljaCBtYXkgY2FsbAo+IHJwbV9zdXNwZW5kKCkgLSBpZiBp
dCBzdWNjZWVkcyB0byBpZGxlIHRoZSBkZXZpY2UuIEluIHRoYXQgY2FzZSwgaXQKPiB0YWdzIG9u
IHRoZSBSUE1fQVVUTyBmbGFnIGluIHRoZSBjYWxsIHRvIHJwbV9zdXNwZW5kKCkuIFF1aXRlIHNp
bWlsYXIKPiB0byB3aGF0IGlzIGhhcHBlbmluZyB3aGVuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKS4KClJpZ2h0LgoKRm9yIGFsbW9zdCBldmVyeWJvZHksIGV4Y2VwdCBmb3Ig
YSBzbWFsbCBidW5jaCBvZiBkcml2ZXJzIHRoYXQKYWN0dWFsbHkgaGF2ZSBhIC5ydW50aW1lX2lk
bGUoKSBjYWxsYmFjaywgcG1fcnVudGltZV9wdXQoKSBpcwpsaXRlcmFsbHkgZXF1aXZhbGVudCB0
byBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLgoKU28gcmVhbGx5IHRoZSBxdWVzdGlvbiBp
cyB3aHkgYW55b25lIHdobyBkb2Vzbid0IHByb3ZpZGUgYQoucnVudGltZV9pZGxlKCkgY2FsbGJh
Y2sgYm90aGVycyB3aXRoIHVzaW5nIHRoaXMgc3BlY2lhbApwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCgpIHRoaW5nLCB3aGljaCByZWFsbHkgbWVhbnMgImRvIGEKcnVudGltZV9wdXQoKSwgYnV0
IHNraXAgbXkgLnJ1bnRpbWVfaWRsZSgpIGNhbGxiYWNrIi4KCj4gPgo+ID4gPgo+ID4gPiBNb3Jl
b3ZlciwgaXQncyBzaW1pbGFyIGZvciBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCksIGl0J3Mg
Y2FsbGVkCj4gPiA+IGR1cmluZyBycG1fcmVzdW1lKCkgdG9vLCBmb3IgZXhhbXBsZS4gU28gd2h5
IGJvdGhlciBhYm91dCBoYXZpbmcKPiA+ID4gIm1hcmtfbGFzdF9idXN5IiBpbiB0aGUgbmV3IG5h
bWUgdG9vLgo+ID4gPgo+ID4gPiBUaGF0IHNhaWQsIG15IHN1Z2dlc3Rpb24gaXMgc2ltcGx5ICJw
bV9ydW50aW1lX3B1dF9zdXNwZW5kIi4KPiA+Cj4gPiBDYW4gd2UgZG8gZXZlbiBiZXR0ZXIsIGFu
ZCBtYWtlIHBtX3J1bnRpbWVfcHV0KCkgdG8gaGFuZGxlIGF1dG9zdXNwZW5kCj4gPiBhdXRvbWF0
aWNhbGx5IHdoZW4gYXV0b3N1c3BlbmQgaXMgZW5hYmxlZCA/Cj4KPiBBcyBzdGF0ZWQgYWJvdmUs
IHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZS4KCldoYXQgcmVhbGx5IGlzIG5lZWRlZCBhcHBlYXJz
IHRvIGJlIGEgY29tYmluYXRpb24gb2YKcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHdpdGgg
cG1fcnVudGltZV9wdXQoKS4KCkdyYW50ZWQsIHBtX3J1bnRpbWVfcHV0KCkgY291bGQgZG8gdGhl
IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKQp0aGluZyBhdXRvbWF0aWNhbGx5IGlmIGF1dG9z
dXNwZW5kIGlzIGVuYWJsZWQgYW5kIHRoZSBvbmx5IGNvbnNlcXVlbmNlCm9mIGl0IG1pZ2h0IGJl
IGRlbGF5aW5nIGEgc3VzcGVuZCBvZiB0aGUgZGV2aWNlIHVudGlsIGl0cyBhdXRvc3VzcGVuZAp0
aW1lciBleHBpcmVzLCB3aGljaCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSBpbiB0aGUgdmFzdCBt
YWpvcml0eSBvZgpjYXNlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
