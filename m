Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFF9CCF2C1
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFG3aBwopLra7+vuy6mdIj057+GWpo7wcnKNxpCrgBU=; b=ZONnyHYtQpvH8m
	ISdGFGUeya9RgPLUfR8r0nqk3UBs/EDbDo56Q160MPZlZ7j2Vhlp0xWquLbxaNLjS2dnizJkcXYkY
	hBJgxUJv/gq4kEvsIXFBIu3KZJ1+8WrvTl45L0rCizf2YOdojsTZO1RNS9GSpvRJ1MglZ9PSpf7BL
	0byYGss1era9H0RK5nocMCRKA7AX54UzX94Nwl4gvBfPef3hNQYZKUktN4N+YOtOVcHvWoQZEGVLZ
	FfvBLdnbC5YJSJZ4whAnZ8yz/cRk/Afwdrc8R+kuHwjne2dUBbYX045ZifYrInxVbKIXmX7F8PD09
	4K/CHBCKq0BzL57hNrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1pz-00000004g01-0bjM;
	Sat, 17 Oct 2026 10:40:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1px-00000004fzl-400f
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 10:40:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58ACF439B1;
	Sat, 17 Oct 2026 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103531F000C5;
	Sat, 17 Oct 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233625;
	bh=syagm1z6iqEfYWovBTYwlVHaRWTMRBf7hz7aJ9XN2Rc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ZntMhMgZ/v5lwK5VyQVIPRw6T+3cReC0/PhY5YmbPeiKVGzWmySFONwV4XXaokDkZ
	 mVH31JjAGSsaFM2GDYBVpPhDydIYAha/NbxlWAFcEKLY8Zny8Pp7/GW+UugTmaIe+7
	 O2mlwF+n0csLwbBLw5z8RoBe0H6R++/hF7FVxmCelS5cSZ+TkjrjEREo8Cyd/jyV29
	 D7RmmNk1UNARN/RDEZI/Ymu7SEkUS3gHfh5LDR45lxaKD4pul12Emul03NrVybjEzz
	 R1FFPNnHeKBPqPBBBwy3h1l72yL+J48fHVNVeMLXAJpWQXVwicryKQfIKTw3lu28ah
	 7abVs3aK/cMWw==
Message-ID: <sashiko-outbox-175471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/8] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, pengpeng@iscas.ac.cn, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <9d578cf2d4ded92eb0b78a5e131e86fa19022b34.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <9d578cf2d4ded92eb0b78a5e131e86fa19022b34.1792145382.git.manikandan.m@microchip.com>
Date: Sat, 17 Oct 2026 10:40:23 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG52bWVtOiBVc2UtYWZ0
ZXItZnJlZSBvbiBsYXlvdXQgbW9kdWxlIHVubG9hZCB2aWEgcmVhZF9wb3N0X3Byb2Nlc3MKLS0K
CmNvbW1pdCAzODg0NWY5ZDYyMjcyNTIzOGZjMzJiOGUxZWFjM2M5YjdkYzhiM2I3CkF1dGhvcjog
TWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPgoKbnZt
ZW06IGxheW91dHM6IGFkZCBNaWNyb2NoaXAvU1NUIFNGRFAgRVVJIGxheW91dCBkcml2ZXIKCkFk
ZCBhbiBOVk1FTSBsYXlvdXQgdGhhdCBleHBvc2VzIHRoZSBmYWN0b3J5LXByb2dyYW1tZWQgRVVJ
LTQ4IGlkZW50aWZpZXIKZnJvbSB0aGUgTWljcm9jaGlwL1NTVCB2ZW5kb3IgU0ZEUCBwYXJhbWV0
ZXIgdGFibGUgKGUuZy4gU1NUMjZWRjA2NEJFVUkpCmFzIGEgIm1hYy1hZGRyZXNzIiBjZWxsLCBm
b3IgdXNlIGFzIGEgbmV0d29yayBNQUMgYWRkcmVzcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bnZtZW0vbGF5b3V0cy9zc3QyNnZmLXNmZHAtZXVpLmMgYi9kcml2ZXJzL252bWVtL2xheW91dHMv
c3N0MjZ2Zi1zZmRwLWV1aS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAwLi5mNDZhNmQ5ZDBlOTNhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvbnZt
ZW0vbGF5b3V0cy9zc3QyNnZmLXNmZHAtZXVpLmMKWyAuLi4gXQo+ICtzdGF0aWMgaW50IHNmZHBf
ZXVpX2FkZF9jZWxscyhzdHJ1Y3QgbnZtZW1fbGF5b3V0ICpsYXlvdXQpCj4gK3sKPiArCXN0cnVj
dCBudm1lbV9kZXZpY2UgKm52bWVtID0gbGF5b3V0LT5udm1lbTsKWyAuLi4gXQo+ICsJaW5mby5u
YW1lID0gIm1hYy1hZGRyZXNzIjsKPiArCWluZm8ub2Zmc2V0ID0gYmFzZSArIFNGRFBfTUNIUF9F
VUk0OF9PRkZTRVQ7Cj4gKwlpbmZvLmJ5dGVzID0gRVRIX0FMRU47Cj4gKwlpbmZvLm5wID0gb2Zf
Z2V0X2NoaWxkX2J5X25hbWUobGF5b3V0X25wLCAibWFjLWFkZHJlc3MiKTsKPiArCWluZm8ucmVh
ZF9wb3N0X3Byb2Nlc3MgPSBzZmRwX2V1aV9yZWFkX3Bvc3RfcHJvY2VzczsKPiArCj4gKwlyZXQg
PSBudm1lbV9hZGRfb25lX2NlbGwobnZtZW0sICZpbmZvKTsKPiArCWlmIChyZXQpCj4gKwkJb2Zf
bm9kZV9wdXQoaW5mby5ucCk7Cj4gKwo+ICsJb2Zfbm9kZV9wdXQobGF5b3V0X25wKTsKPiArCj4g
KwlyZXR1cm4gcmV0Owo+ICt9ClsgLi4uIF0KPiArc3RhdGljIHZvaWQgc2ZkcF9ldWlfcmVtb3Zl
KHN0cnVjdCBudm1lbV9sYXlvdXQgKmxheW91dCkKPiArewo+ICsJbnZtZW1fbGF5b3V0X3VucmVn
aXN0ZXIobGF5b3V0KTsKPiArfQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSBsZWF2
ZSB0aGUgbW9kdWxlIHZ1bG5lcmFibGUgdG8gYSB1c2UtYWZ0ZXItZnJlZSBwYW5pYyBvbgptb2R1
bGUgdW5sb2FkPwoKVGhlIGNvcmUgbnZtZW0gZnVuY3Rpb24gbnZtZW1fbGF5b3V0X3VucmVnaXN0
ZXIoKSBpcyBhbiBlbXB0eSBzdHViIHRoYXQgZG9lcwpub3QgcmVtb3ZlIHRoZSByZWdpc3RlcmVk
IGNlbGxzOgoKZHJpdmVycy9udm1lbS9jb3JlLmM6bnZtZW1fbGF5b3V0X3VucmVnaXN0ZXIoKSB7
CgkvKiBLZWVwIHRoZSBBUEkgZXZlbiB3aXRoIGFuIGVtcHR5IHN0dWIgaW4gY2FzZSB3ZSBuZWVk
IGl0IGxhdGVyICovCn0KCldoZW4gdGhpcyBsYXlvdXQgZHJpdmVyIGlzIHVubG9hZGVkLCBzZmRw
X2V1aV9yZW1vdmUoKSBjYWxscwpudm1lbV9sYXlvdXRfdW5yZWdpc3RlcihsYXlvdXQpIGJ1dCB0
aGUgY2VsbHMgYW5kIHN5c2ZzIGF0dHJpYnV0ZXMgYXJlIGxlZnQKZGFuZ2xpbmcuCgpCZWNhdXNl
IHRoZSBjZWxsIHdhcyBjb25maWd1cmVkIHdpdGggYSByZWFkX3Bvc3RfcHJvY2VzcyBjYWxsYmFj
ayBwb2ludGluZyB0bwpzZmRwX2V1aV9yZWFkX3Bvc3RfcHJvY2VzcyBpbiB0aGlzIG1vZHVsZSdz
IHRleHQgc2VnbWVudCwgYSBzdWJzZXF1ZW50IHJlYWQgb2YKdGhlIHN5c2ZzIGNlbGwgZmlsZSBh
ZnRlciB0aGUgbW9kdWxlIGlzIHVubG9hZGVkIHdpbGwgY2FsbCB0aGUgZGFuZ2xpbmcKZnVuY3Rp
b24gcG9pbnRlcjoKCmRyaXZlcnMvbnZtZW0vY29yZS5jOl9fbnZtZW1fY2VsbF9yZWFkKCkgewog
ICAgLi4uCgkJcmMgPSBjZWxsLT5yZWFkX3Bvc3RfcHJvY2VzcyhjZWxsLT5wcml2LCBpZCwgaW5k
ZXgsCgkJCQkJICAgICBjZWxsLT5vZmZzZXQsIGJ1ZiwgY2VsbC0+cmF3X2xlbik7CiAgICAuLi4K
fQoKV2lsbCB0aGlzIGNhdXNlIGEga2VybmVsIHBhbmljIGJ5IGV4ZWN1dGluZyBmcmVlZCBtb2R1
bGUgbWVtb3J5PwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC9jb3Zlci4xNzkyMTQ1MzgyLmdpdC5tYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNv
bT9wYXJ0PTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
