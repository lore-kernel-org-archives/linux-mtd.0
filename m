Return-Path: <SRS0=RcjP=YD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A07C4360C
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 23:48:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01216206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 23:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eir1bkc0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="EDUt7LdV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01216206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aDIM2CeO+FLqysNq9BU6jZ3nJH9MqGfHnM//9TIcKQ=; b=eir1bkc0asFH90
	sPEUfOvoEDsMno1sb6IYJJ8r2I9l+nZjQUp2A6nagGHDuSfoN6x89/ZrpY50ZChH57ee7mPR31UvD
	HIE6ETw5CvaxW+eWUQENPQyTjGOcPGfAz4oC2ysk9rtwUae3HffljGbdPyMOPbxrWckZ2THR64Fq/
	mmii/vuFK0kmgMci2TqgZxUyssnR9OiBAWpGjnlzw2G4f892R5pqYEvvEDk+6o/JNMgrQ0YzBwVYo
	wFG0aZkpq33q0/PzrOOXKflh4JI60JwsW8iNKRgD0aHuzSc0lpmar2A7Ggl9uSrvKbElGrhszRG6o
	pKE58o9JME25Ek9Y3uxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIiA6-0001DL-6v; Thu, 10 Oct 2019 23:48:02 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIiA2-0001Ct-5G; Thu, 10 Oct 2019 23:47:59 +0000
Received: by mail-qk1-x743.google.com with SMTP id y189so7297639qkc.3;
 Thu, 10 Oct 2019 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VOfBNfcbIIkZoZr/JsJgcwA46NAWvjDA5yLgk2p3Qs4=;
 b=EDUt7LdV6VNgqNyLlHw7iBGgTCVUCFcGML1XAofYuTyAjIYOkd2pYJh2Ks9Y2dhgpO
 MI/NUcqTO2rn+88NuysO1fVKxXLU4fPJ8RO3SKW6qsZc+xfi0Dmy9vW0yjv9vKTge+bu
 03tTV/hw2MnCGpkVyC2/t+P6v2uGB+A4EA/n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VOfBNfcbIIkZoZr/JsJgcwA46NAWvjDA5yLgk2p3Qs4=;
 b=M5Ks5gg95ST/7zIIohXxJji6VMCHCj2pUNyAHXrExKNS/apgKoB8y07BpRgu7NDhEx
 omtvfUeL0RU13tYec3exfgGoBUIp/z+ixuT5/ow20/oXlnDbkNWG6N5p8A0Rmr3YrkTb
 7U50zxJnNf3uaJlXeB+jaB3puOq4ia7IMKvvvnmZE9viGzZf3eLShtwotU+zg0mXGqoi
 W1NmfTGpCcAPIF/pDdfhDi4ACQh3o7O2f9CY773kb1gq5biC16BEOERpjddvvdX5VUUJ
 PTSVixznSaBltyxfpv9rfkahA94JLtrfk+lFOLxMEDA+L/BISaAJOukT9y+uw7vT3NRR
 wljA==
X-Gm-Message-State: APjAAAUSvJErx7WwlIydNx+/qb5eSfTY+tUjcnrq4IZxdGDKqEBSWsK8
 x69bLdHCuQKMwLtTBGOCh90/lIsx2KlMrgZozeg=
X-Google-Smtp-Source: APXvYqxoqIE5UuZnpgZoeTxKPAd5ePSRS1KXmPevRfEYsZ/g9e8t/yRQ3AWtpqZI2CmDKgIWa7L3/HE1GEcsFn4V1tE=
X-Received: by 2002:a37:4dca:: with SMTP id
 a193mr12705697qkb.292.1570751276858; 
 Thu, 10 Oct 2019 16:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191004115919.20788-1-clg@kaod.org>
 <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191009225555.67622339@dhcp-172-31-174-146.wireless.concordia.ca>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:47:45 +0000
Message-ID: <CACPK8Xe__AYvrh40vqjwoM=XKJfp5MeqrMARpFUDGWCyJK6jXQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] mtd: spi-nor: aspeed: AST2600 support and extensions
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_164758_202994_BCC0423A 
X-CRM114-Status: GOOD (  25.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA5IE9jdCAyMDE5IGF0IDIwOjU2LCBCb3JpcyBCcmV6aWxsb24KPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IEhpIENlZHJpYywKPgo+IE9uIEZyaSwgIDQg
T2N0IDIwMTkgMTM6NTk6MDMgKzAyMDAKPiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
PiB3cm90ZToKPgo+ID4gSGVsbG8sCj4gPgo+ID4gVGhpcyBzZXJpZXMgZmlyc3QgZXh0ZW5kcyB0
aGUgc3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBBU1QyNTAwIGFuZAo+ID4gQVNUMjQwMCBTTUMgZHJp
dmVyLiBJdCBhZGRzIER1YWwgRGF0YSBzdXBwb3J0IGFuZCByZWFkIHRyYWluaW5nIGdpdmluZwo+
ID4gdGhlIGJlc3QgcmVhZCBzZXR0aW5ncyBmb3IgYSBnaXZlbiBjaGlwLiBTdXBwb3J0IGZvciB0
aGUgbmV3IEFTVDI2MDAKPiA+IFNvQyBpcyBhZGRlZCBhdCB0aGUgZW5kLgo+ID4KPiA+IEkgdW5k
ZXJzdGFuZCB0aGF0IGEgbmV3IHNwaV9tZW0gZnJhbWV3b3JrIGV4aXN0cyBhbmQgSSBkbyBoYXZl
IGFuCj4gPiBleHBlcmltZW50YWwgZHJpdmVyIHVzaW5nIGl0LiBCdXQgdW5mb3J0dW5hdGVseSwg
aXQgaXMgZGlmZmljdWx0IHRvCj4gPiBpbnRlZ3JhdGUgdGhlIHJlYWQgdHJhaW5pbmcuIFRoZSBB
c3BlZWQgY29uc3RyYWludHMgYXJlIG5vdCBjb21wYXRpYmxlCj4gPiBhbmQgaSBoYXZlbid0IGhh
ZCB0aGUgdGltZSB0byBleHRlbmQgdGhlIGN1cnJlbnQgZnJhbWV3b3JrLgo+Cj4gSG0sIEkgZG9u
J3QgdGhpbmsgdGhhdCdzIGEgZ29vZCByZWFzb24gdG8gcHVzaCBuZXcgZmVhdHVyZXMgdG8gdGhl
Cj4gZXhpc3RpbmcgZHJpdmVyLCBlc3BlY2lhbGx5IHNpbmNlIEkgYXNrZWQgb3RoZXJzIHRvIG1p
Z3JhdGUgdGhlaXIKPiBkcml2ZXJzIHRvIHNwaS1tZW0gaW4gdGhlIHBhc3QuIEkgZG8gdW5kZXJz
dGFuZCB5b3VyIGNvbmNlcm5zLCBhbmQgSSdsbAo+IGxldCB0aGUgU1BJIE5PUi9NVEQgbWFpbnRh
aW5lcnMgbWFrZSB0aGUgZmluYWwgY2FsbCwgYnV0IEkgdGhpbmsgaXQnZAo+IGJlIGJldHRlciBm
b3IgdGhlIFNQSSBNRU0gZWNvc3lzdGVtIHRvIHRoaW5rIGFib3V0IHRoaXMgbGluay10cmFpbmlu
Zwo+IEFQSSAoVmlnbmVzaCBuZWVkcyBpdCBmb3IgdGhlIENhZGVuY2UgZHJpdmVyIElJUkMpIHJh
dGhlciB0aGFuIHB1c2hpbmcKPiB0aGlzIGtpbmQgb2YgZmVhdHVyZSB0byBzcGktbm9yIGNvbnRy
b2xsZXIgZHJpdmVycy4KCkFzIENlZHJpYyBtZW50aW9uZWQsIHRoZSBPcGVuQk1DIHByb2plY3Qg
aGFzIGJlZW4gc2hpcHBpbmcgdGhlIHJlYWQKdHJhaW5pbmcgY29kZSBmb3IgdGhlIGFzdDI0MDAv
YXN0MjQwMCBmb3Igc2V2ZXJhbCB5ZWFycyBub3cuIEl0IHdvdWxkCmJlIGdyZWF0IHRvIHNlZSBp
dCBpbiBtYWlubGluZS4KCkkgdGhpbmsgaXQncyByZWFzb25hYmxlIHRvIGFzayBmb3IgdGhlIGRy
aXZlciB0byBiZSBtb3ZlZCB0byB0aGUKc3BpLW1lbSBzdWJzeXN0ZW0gb25jZSBpdCBoYXMgdGhl
IHJlcXVpcmVkIEFQSXMuCgpDaGVlcnMsCgpKb2VsCgoKPgo+ID4KPiA+IFRoaXMgcGF0Y2hzZXQg
aGFzIGJlZW4gaW4gdXNlIGZvciBzb21lIHRpbWUgaW4gdGhlIE9wZW5CTUMga2VybmVsIG9uCj4g
PiB0aGVzZSBzeXN0ZW1zIDoKPiA+Cj4gPiAgKiBPcGVuUE9XRVIgUGFsbWV0dG8gKEFTVDI0MDAp
Cj4gPiAgKiBFdmFsdWF0aW9uIGJvYXJkIChBU1QyNTAwKQo+ID4gICogT3BlblBPV0VSIFdpdGhl
cnNwb29uIChBU1QyNTAwKQo+ID4gICogT3BlblBPV0VSIFJvbXVsdXMgKEFTVDI1MDApCj4gPiAg
KiBPcGVuUE9XRVIgWmFpdXMgKEFTVDI1MDApCj4gPiAgICBhbmQgbWFueSBvdGhlcnMKPiA+Cj4g
PiBhbmQgaXQgaXMgbm93IGluIHVzZSBvbiB0aGVzZSBib2FyZHMgd2l0aCB0aGUgbmV3IFNvQyA6
Cj4gPgo+ID4gICogRXZhbHVhdGlvbiBib2FyZCAoQVNUMjYwMCkKPiA+ICAqIFRhY29tYSBib2Fy
ZCAoQVNUMjYwMCkKPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQy4KPiA+Cj4gPiBBbGV4YW5kZXIg
U29sZGF0b3YgKDEpOgo+ID4gICBtdGQ6IHNwaS1ub3I6IGZpeCBvcHRpb25zIGZvciBteDY2bDUx
MjM1Zgo+ID4KPiA+IEPDqWRyaWMgTGUgR29hdGVyICgxNSk6Cj4gPiAgIG10ZDogc3BpLW5vcjog
YXNwZWVkOiBVc2UgY29tbWFuZCBtb2RlIGZvciByZWFkcwo+ID4gICBtdGQ6IHNwaS1ub3I6IGFz
cGVlZDogQWRkIHN1cHBvcnQgZm9yIFNQSSBkdWFsIElPIHJlYWQgbW9kZQo+ID4gICBtdGQ6IHNw
aS1ub3I6IGFzcGVlZDogTGluayBjb250cm9sbGVyIHdpdGggdGhlIGFoYiBjbG9jawo+ID4gICBt
dGQ6IHNwaS1ub3I6IGFzcGVlZDogQWRkIHJlYWQgdHJhaW5pbmcKPiA+ICAgbXRkOiBzcGktbm9y
OiBhc3BlZWQ6IExpbWl0IHRoZSBtYXhpbXVtIFNQSSBmcmVxdWVuY3kKPiA+ICAgbXRkOiBzcGkt
bm9yOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciB0aGUgNEIgb3Bjb2Rlcwo+ID4gICBtdGQ6IHNw
aS1ub3I6IEFkZCBzdXBwb3J0IGZvciB3MjVxNTEyanYKPiA+ICAgbXRkOiBzcGktbm9yOiBhc3Bl
ZWQ6IEludHJvZHVjZSBhIGZpZWxkIGZvciB0aGUgQUhCIHBoeXNpY2FsIGFkZHJlc3MKPiA+ICAg
bXRkOiBzcGktbm9yOiBhc3BlZWQ6IEludHJvZHVjZSBzZWdtZW50IG9wZXJhdGlvbnMKPiA+ICAg
ZHQtYmluZGluZ3M6IG10ZDogYXNwZWVkLXNtYzogQWRkIG5ldyBjb21wdGF0aWJsZSBmb3IgQVNU
MjYwMAo+ID4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogQWRkIGluaXRpYWwgc3VwcG9ydCBmb3Ig
dGhlIEFTVDI2MDAKPiA+ICAgbXRkOiBzcGktbm9yOiBhc3BlZWQ6IENoZWNrIGZvciBkaXNhYmxl
ZCBzZWdtZW50cyBvbiB0aGUgQVNUMjYwMAo+ID4gICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogSW50
cm9kdWNlIHRyYWluaW5nIG9wZXJhdGlvbnMgcGVyIHBsYXRmb3JtCj4gPiAgIG10ZDogc3BpLW5v
cjogYXNwZWVkOiBJbnRyb2R1Y2UgYSBIQ0xLIG1hc2sgZm9yIHRyYWluaW5nCj4gPiAgIG10ZDog
c3BpLW5vcjogYXNwZWVkOiBBZGQgcmVhZCB0cmFpbmluZyBzdXBwb3J0IGZvciB0aGUgQVNUMjYw
MAo+ID4KPiA+ICBkcml2ZXJzL210ZC9zcGktbm9yL2FzcGVlZC1zbWMuYyAgICAgICAgICAgICAg
fCA1OTMgKysrKysrKysrKysrKysrKy0tCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9y
LmMgICAgICAgICAgICAgICAgIHwgICA1ICstCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2FzcGVlZC1zbWMudHh0ICAgIHwgICAyICsKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU1MSBp
bnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
