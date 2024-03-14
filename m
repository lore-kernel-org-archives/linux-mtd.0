Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4399DC54E60
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2024 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFcUb/8zjt7SzVAODJvk5ba5OSwX+YTrTeJqVSfxpXs=; b=sa7JiHuN89FDG8
	0CVrDqUew5mpHlo99O6Se2bXLB9mi+UEFGzCq8vzFq+NwZLIjH0OA46p3Cts/9y1CwyECHWRvV2LA
	vEBPPq+0hyyDOx3d7sVFeUU+IHeoyXJpgdNkU8nv840ZA6k7mpF4ENoW4XGQch+JbQXHt9P6oOs1Z
	mNAe/o1RAqYXqH1YHO0DnzUj4terFN0DcMezKRTOjWhSar1rKL2tNrJqiWLWsBFzYoBq+Hd4V8jEG
	Nw4bd4yo0G1uJhhU7kHnonqlvr9dyqhNgYBXDvhajJWgjZF9DQwEbOnAwGGgDDEOSJa5sp6qEBFXW
	0ie/bBwOx4hjmwPVpS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktBT-0000000Fmzb-3977;
	Thu, 14 Mar 2024 22:04:19 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktBO-0000000FmyW-31vE;
	Thu, 14 Mar 2024 22:04:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CA8940004;
	Thu, 14 Mar 2024 22:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710453849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfCPNoNzVXxzZ2eRtShMfBPSV4HwMjR3iQ1VFpAZEzc=;
	b=TifNrbvjRYYFBiKhOoRSDb2I5S5yVI2rgeqWlGh7Ycjewc8yCWZpzpnWA6DOfqcyY8PkCY
	SnVCJSQiLuRqQxR10aRYC3naw7offG/D2NKgeUsfNg3SJlRr3txDdf9P4mcMI1ZN5Er9xD
	/GRnquIazxL0BQR0cyG/9qTqcOxB6Moif9mRUk6KWO04ixeEl/NhZCy6orSoT+fL2dXUwf
	sYVP1JSS/Owfkmat8Z9SnODB/K+B4P7QaSb3X1c2obRQlefjWazhc9ZL5orMiCUXLN4kmU
	ot7/oc+riO4BDSINtdHRdCQ8ecIgCxCmlrtEvOyZ7Ny9QUGe6D31xvjlE3KiQA==
Date: Thu, 14 Mar 2024 23:04:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: William Zhang <william.zhang@broadcom.com>, Linux MTD List
 <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, Andre Przywara
 <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJl?=
 =?UTF-8?B?Y2tp?= <rafal@milecki.pl>, David Regan <dregan@broadcom.com>,
 devicetree@vger.kernel.org, Alexandre TORGUE <alexandre.torgue@st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Brian Norris
 <computersforpeace@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 00/13] mtd: rawnand: brcmnand: driver and doc updates
Message-ID: <20240314230402.5fc7bbf3@xps-13>
In-Reply-To: <20240229101101.5208195c@xps-13>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
	<90ecf4d2-0eee-48e6-8222-7d3b5fd52b2f@broadcom.com>
	<20240229101101.5208195c@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_150415_277692_981E3724 
X-CRM114-Status: GOOD (  31.07  )
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

SGkgRmxvcmlhbiwKCm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gVGh1LCAyOSBG
ZWIgMjAyNCAxMDoxMTowMSArMDEwMDoKCj4gSGkgRmxvcmlhbiwKPiAKPiBmbG9yaWFuLmZhaW5l
bGxpQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBNb24sIDI2IEZlYiAyMDI0IDA5OjM2OjAyIC0wODAw
Ogo+IAo+ID4gT24gMi8yMi8yNCAxOTo0NywgV2lsbGlhbSBaaGFuZyB3cm90ZTogIAo+ID4gPiBU
aGlzIHBhdGNoIHNlcmllcyBpcyBhbiB1cGRhdGUgZnJvbSB0aGUgcHJldmlvdXMgdmVyc2lvbiBb
MV0gYWZ0ZXIKPiA+ID4gZXhleF9vcCBzdXBwb3J0IGFuZCBmaXhlcyAocGF0Y2ggMSB0byA0IGZy
b20gdGhlIHByZXZpb3VzIHZlcnNpb24uKQo+ID4gPiAKPiA+ID4gSXQgdXBkYXRlcyBhbGwgdGhl
IEJDTUJDQSBTb0MgdG8gc3VwcG9ydCB0aGUgbmFuZCBjb250cm9sbGVyIGFuZCBhZGQKPiA+ID4g
ZnVuY3Rpb25zIHRvIGhhbmRsZSBCQ01CQ0Egc3BlY2lmaWMgbmVlZHMgb24gRUNDIGFuZCBXcml0
ZSBQcm90ZWN0aW9uCj4gPiA+IHVzYWdlLiBUaGUgZGV2aWNlIHRyZWUgZG9jdW1lbnQgaXMgYWxz
byB1cGRhdGVkIGFjY29yZGluZ2x5IHdpdGggdGhlIG5ldwo+ID4gPiBwcm9wZXJ0aWVzIG5lZWRl
ZCBieSB0aGUgZHJpdmVyLgo+ID4gPiAKPiA+ID4gSW4gYWRkaXRpb24gdGhlcmUgaXMgYSBidWcg
Zml4IGZvciBleGVjX29wIGhlbHBlciBmdW5jdGlvbnMsIGxvZyBsZXZlbAo+ID4gPiBhZGp1c3Rt
ZW50IG9uIHVuY29ycmVjdGFibGUgRUNDIGVycm9yIGFuZCBzb21lIGNvZGluZyBzdHlsZSBmaXhl
cy4KPiA+ID4gCj4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMwNjA2
MjMxMjUyLjk0ODM4LTEtd2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20vICAgIAo+ID4gCj4gPiBN
aXF1ZWwsIHRoYW5rcyBmb3IgaGF2aW5nIGFwcGxpZWQgdGhlIHBhdGNoZXMsIHdlIHNob3VsZCBo
YXZlIGRpc2N1c3NlZCBhaGVhZCBvZiB0aW1lIHdoZXRoZXIgeW91IHNob3VsZCB0YWtlIHRoZSBT
b0MvYm9hcmQtbGV2ZWwgRFRTIGNoYW5nZXMgdGhyb3VnaCB5b3VyIHRyZWUgb3IgbWluZSwgYnV0
IGl0J3MgZmluZSBlaXRoZXIgd2F5IGFuZCBzaG91bGQgbm90IGxlYWQgdG8gY29uZmxpY3RzIGlu
IExpbnVzJyB0cmVlLiAgCj4gCj4gSSdtIHNvcnJ5IGZvciBub3QgdGhpbmtpbmcgYWJvdXQgdGhp
cyBhaGVhZCBvZiB0aW1lLCBJIHdhcyBhbHNvIG5vdAo+IENjZWQgb24gdGhlIG90aGVyIHBhdGNo
ZXMsIEkgbm90aWNlZCBpdCAodG9sZCBXaWxsbGlhbSkgYW5kIGp1c3QgZm9yZ290Cj4gYWJvdXQg
dGhpcyB3aGVuIEkgYXBwbGllZCB0aGUgc2VyaWVzLgo+IAo+IEl0IGlzIGN1cnJlbnRseSBsaXZp
bmcgaW4gLW5leHQgc28gaWYgdGhlcmUgaXMgYW55IHByb2JsZW0gSSBjYW4gc3RpbGwKPiBhY3Qu
Cj4gCj4gSG93ZXZlciBmb3IgdGhpcyBraW5kIG9mIGNoYW5nZSBJIHVzdWFsbHkgYXBwbHkgdGhl
IGJpbmRpbmdzIGFuZCAuYwo+IGNoYW5nZXMgaW5kZXBlbmRlbnRseSBmcm9tIHRoZSBEVCBwYXRj
aGVzLiBJIGJlbGlldmUgdGhlcmUgaXMgbm8KPiBwcm9ibGVtIGhhdmluZyBvbmUgb3IgdGhlIG90
aGVyIGJlaW5nIG1lcmdlZCBmaXJzdCwgb3IgZG8gSSBvdmVybG9vawo+IHNvbWV0aGluZz8KCldo
YXQgdGhlIGhlY2sgL29cIEkganVzdCB1bmRlcnN0YW5kIG5vdyBteSBtaXN0YWtlLCBJIGFtIHZl
cnkgdHJ1bHkKc29ycnkgZm9yIHRoYXQuLi4KCllvdSB3ZXJlIHRlbGxpbmcgbWUgSSBzaG91bGQg
c3luYyB3aXRoIHlvdSBiZWZvcmUgdGFraW5nIERUIGNoYW5nZXMsCmFuZCBJIHdhcyBzbyBjb252
aW5jZWQgSSBfZGlkX25vdF8gdGFrZSB0aGUgRFQsIHdoZW4gSSBsb29rZWQgYXQgdGhlCmJyYW5j
aCBJIGRpZCBub3QgdW5kZXJzdGFuZCB5b3VyIHBvaW50LiBCdXQgSSBhbSB0b3RhbGx5IHNvcnJ5
IEkKYWN0dWFsbHkgZGlkIHRha2UgdGhlIERUcyBieSBtaXN0YWtlIGFuZCBJIHRydWx5IGRpZCBu
b3Qgbm90aWNlIGl0LgpDb25maXJtYXRpb24gYmlhcyBJIHN1cHBvc2UuIE15IHZlcnkgc2luY2Vy
ZSBhcG9sb2dpZXMuCgpBcyBtZW50aW9uZWQgcHJldmlvdXNseSwgSSB3YXMgbm90IENDJ2VkIG9u
IHRoZSBEVCBwYXRjaGVzLCBidXQgSQpiZWxpZXZlIHRoZSBsaW51eC1tdGQgbGlzdCB3YXMsIHNv
IHRoZSBwYXRjaGVzIGRpZG4ndCBhcHBlYXIgaW4gbXkKaW5ib3gsIGFuZCBvbmNlIEkgd2FzIGhh
cHB5IHdpdGggdGhlIGJpbmRpbmcvZHJpdmVyIGNoYW5nZXMgSSBhcHBsaWVkCml0IGFsbCB3aXRo
b3V0IG5vdGljaW5nIHRoZSBEVCBjaGFuZ2VzIGhhZCBzbmVha2VkIGluLgoKSSdtIGZpbmFsbHkg
cHJlcGFyaW5nIHRoZSBQUiBmb3IgTGludXMgYW5kIEkgc2VlIGl0IG5vdy4uLgoKSSBiZWxpZXZl
IHRoZSBTb0MgdHJlZSBpcyBjbG9zZWQgbm93IHNvIGl0J3MgdXAgdG8geW91IHdoYXQgSSBzaG91
bGQgZG8Kd2l0aCB0aGVtLiBMZXQgbWUga25vdyBpZiB5b3Ugd2FudCBtZSB0byBrZWVwIHRoZW0g
aW4gbXkgdHJlZSBhbmQKZm9yd2FyZCB0aGVtIHRvIExpbnVzIG9yIGlmIEkgc2hvdWxkIGRyb3Ag
dGhlbSBhbmQgeW91J2xsIHRha2UgdGhlbSBmb3IKdGhlIG5leHQgY3ljbGUuIEFsc28sIGlmIEkg
a2VlcCB0aGVtLCBzaGFsbCBJIGFkZCBzb21lIHRhZyBvZiB5b3VycyBvbgp0aGVzZSAzIHBhdGNo
ZXM/IEZvciB0aGUgcmVjb3JkIEkgZGlkIG5vdCByZXZpZXcgdGhlbS4KClRoYW5rcyBhbmQgYWdh
aW4sIEknbSBjb25mdXNlZC4gSSBuZXZlciBhcHBseSBEVCBwYXRjaGVzIGxpa2UgdGhhdCwKeW91
ciBpbml0aWFsIHJlbWFyayB3YXMgbW9yZSB0aGFuIGxlZ2l0aW1hdGUuCgpDaGVlcnMsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
