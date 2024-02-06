Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE51C48297
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Feb 2024 12:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOiMqtHsGQ4F7yLB/dA6+7WNjb5mzHYIO8oPv7VH+ws=; b=a2TruSqUiyEAob
	swKBHV6Afaiuj1y4GbSyXg4pAhGOY/sjWMr2e9QmmDPOE5b5u1q+QJGOmtMFtuRcdJg6tyVRAYH2j
	f38ARx36BFwHa6P7sfuR5cJY92pHXK05Qk5K0fyB3xnLPRUF8PA3/9TLNAlHqhFGnk1VZvrkmFAwN
	78xbqpEEC5HtgGb9uBXUGZabCtdbsWmo7meSFPuzRzkuSwi4I5hHQUnRZGtvjpGtvjvuIO72UaXKF
	2LJqD1eXd45Wma8a1R6W9uuglbA5Vpcb2dKgpNr5BsjLW5W6fjeGXoq/WRNWGH0iWVuP9y6tp0or2
	9FayXpiho+OU1/Iew9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXK84-00000007RLo-2HQ6;
	Tue, 06 Feb 2024 12:00:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHrK-00000006kEN-0fjP;
	Tue, 06 Feb 2024 09:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Nf+8f8FaGGKCD3vxgT3N1jG16pc7dueDBwmffjlOwGU=; b=mTkIQNprhPDOV/k9YJwzz5pP6B
	YLW7xeFQSKGSP28YhlD86N7BKUXhSFMo3QBc1Ruhhl9NAijnE+EBcyAgFPr6DNBrkblahef287jSt
	iGd+4RAhRmR43qaWxXYU5tTa0w3736qIJRHmuGPnuCaQuNVC7OdxPtiee1XmcfarmIJuNOMVRG20x
	QrP3bCBnzGKwnsIO4SvJVvnwAx3Zs+BoIL2eZKs7XXozCMA/+FmIQ98rY+cQ839J8YRqVUtGGJZVQ
	Zu2YpquOGbwggjdZ7swnYUficrc8+dh/VlDkdCmTxZShkwVA07WD9LR05Z2dFRwQq3eU+K+U8O+OI
	ubAT8YJA==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHr8-0000000CS1k-3Vh4;
	Tue, 06 Feb 2024 09:35:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 035F920008;
	Tue,  6 Feb 2024 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707212098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nf+8f8FaGGKCD3vxgT3N1jG16pc7dueDBwmffjlOwGU=;
	b=ZNFwC8yET76pT3dIP/+NX2sP4bM5KjXSDOMYuppC/UidcMnpqDUrOBrGha1BLmulG2eeZw
	/JIYpGQVjlmZbsGhC1+d74lvlnRKjua1DpqyLLInUGPvC9ZA760GdX4bllKF/In8WhgPaC
	t4BbrvDdvbedKArrwCTcabUp+lApQQ0kjJ5pk2IXsdIdJaShhdLV6Eo/C4ixQwbhCWpSHV
	PQpRh8QiiVoRCVfswaIGgn15fZOgjClt3gP4QHpHndonoEUHMhOl5N6CEE8vPHuZo7U7IE
	lWBpDCMqzTYUNpNMxzVEox/6vKaOjTlrwVplGw4kg8iRTHGSv5fGxPfUIlTUmQ==
Date: Tue, 6 Feb 2024 10:34:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Conor Dooley <conor@kernel.org>, Linux MTD List
 <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
Message-ID: <20240206103453.7ac23384@xps-13>
In-Reply-To: <ce15922e-4292-41d6-8c5f-2b4fbfa83d5c@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
	<20240203002834.171462-4-william.zhang@broadcom.com>
	<20240203-expenses-tarmac-c564bc7ae34f@spud>
	<20240205142639.5d7c70f0@xps-13>
	<ce15922e-4292-41d6-8c5f-2b4fbfa83d5c@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_093508_834046_66545626 
X-CRM114-Status: GOOD (  34.01  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIE1vbiwgNSBG
ZWIgMjAyNCAxMDowNToxNCAtMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDIvNS8yNCAwNToy
NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBjb25vckBrZXJuZWwub3Jn
IHdyb3RlIG9uIFNhdCwgMyBGZWIgMjAyNCAxNDo0OTo1MCArMDAwMDoKPiA+ICAgCj4gPj4gT24g
RnJpLCBGZWIgMDIsIDIwMjQgYXQgMDQ6Mjg6MjRQTSAtMDgwMCwgV2lsbGlhbSBaaGFuZyB3cm90
ZTogIAo+ID4+PiBBZGQgYnJjbSxuYW5kLWVjYy11c2Utc3RyYXAgdG8gZ2V0IGVjYyBhbmQgc3Bh
cmUgYXJlYSBzaXplIHNldHRpbmdzIGZyb20KPiA+Pj4gYm9hcmQgYm9vdCBzdHJhcCBmb3IgYnJv
YWRiYW5kIGJvYXJkIGRlc2lnbnMgYmVjYXVzZSB0aGV5IGRvIG5vdCBzcGVjaWZ5Cj4gPj4+IGVj
YyBzZXR0aW5nIGluIGR0cyBidXQgcmF0aGVyIHVzaW5nIHRoZSBzdHJhcCBzZXR0aW5nLgo+ID4+
Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFpoYW5nIDx3aWxsaWFtLnpoYW5nQGJyb2Fk
Y29tLmNvbT4KPiA+Pj4KPiA+Pj4gLS0tCj4gPj4+Cj4gPj4+IENoYW5nZXMgaW4gdjQ6Cj4gPj4+
IC0gTW92ZSBlY2Mgc3RyYXAgcHJvcGVydHkgdG8gdGhpcyBzZXBhcmF0ZSBwYXRjaCBhbmQgcmVt
b3ZlIHNvbWUKPiA+Pj4gbm9uLWJpbmRpbmcgcmVsYXRlZCB0ZXh0IGZyb20gdGhlIGRlc2NyaXB0
aW9uCj4gPj4+Cj4gPj4+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiA+Pj4gQ2hhbmdlcyBpbiB2Mjog
Tm9uZQo+ID4+Pgo+ID4+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YnJjbSxicmNtbmFuZC55YW1sIHwgOCArKysrKysrKwo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKykKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwKPiA+Pj4gaW5kZXggZDAx
NjhkNTVjNzNlLi4yNTk5ZDkwMmVjM2EgMTAwNjQ0Cj4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4gPj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4g
Pj4+IEBAIC0xNDcsNiArMTQ3LDE0IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4+PiAgICAgICAg
ICAgICBsYXlvdXQuCj4gPj4+ICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzIgIAo+ID4+PiAgID4+PiArICAgICAgYnJjbSxuYW5kLWVjYy11c2Ut
c3RyYXA6ICAKPiA+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4gPj4+ICsgICAgICAgICAgVGhp
cyBmbGFnIGluZGljYXRlcyB0aGUgZWNjIHN0cmVuZ3RoIGFuZCBzcGFyZSBhcmVhIHNpemUgc2hv
dWxkCj4gPj4+ICsgICAgICAgICAgYmUgcmV0cmlldmVkIGZyb20gdGhlIFNvQyBOQU5EIGJvb3Qg
c3RyYXAgc2V0dGluZyBpbnN0ZWFkIG9mCj4gPj4+ICsgICAgICAgICAgbmFuZC1lY2Mtc3RyZW5n
dGggYW5kIGJyY20sbmFuZC1vb2Itc2VjdG9yLXNpemUgb3IgYXV0byBkZXRlY3Rpb24uICAKPiA+
Pgo+ID4+IEknbSBzdGlsbCBvbiB0aGUgZmVuY2UgYWJvdXQgdGhpcyBiZWluZyBvdmVybHkgcHJl
c2NyaXB0aXZlIGFib3V0IHRoZQo+ID4+IG9wZXJhdGluZyBzeXN0ZW1zIGJlaGF2aW91ci4gSSB0
aGluayBpdCB3b3VsZCBiZSBnb29kIHRvIHNheSB3aHkgdGhlCj4gPj4gc3RyYXAgdmFsdWVzIGFy
ZSBiZXR0ZXIgdGhhbiB0aG9zZSBleHBsaWNpdGx5IHByb3ZpZGVkIGluIERUIHJhdGhlciB0aGFu
Cj4gPj4ganVzdCBzYXlpbmcgInRoZXNlIHN0cmFwIHZhbHVlcyBzaG91bGQgYmUgdXNlZCIuICAK
PiA+IAo+ID4gSSBkb24ndCBrbm93IGlmIHRoZXJlIGlzIGEgcG9pbnQgaXMgc2F5aW5nIHdoeSB0
aGV5IHdvdWxkIGJlIGJldHRlciwgYXMKPiA+IHRoZXkgYXJlIG5vdC4gSXQgaXMgYSAtcXVlc3Rp
b25hYmxlLSBkZXNpZ24gY2hvaWNlLiBIb3dldmVyIEkgd291bGQKPiA+IGp1c3QgZ2V0IHJpZCBv
ZiBhbnkgbWVudGlvbiB0byBvdGhlciBwcm9wZXJ0aWVzLiBKdXN0IHNheSBvbmUgc2hvdWxkCj4g
PiBleHBlY3QgdGhlIHN0cmFwIHZhbHVlIHRvIGJlIHJlYWQgYW5kIGFwcGxpZWQgYnkgdGhlIHN5
c3RlbSB3aGVuIHRoaXMKPiA+IHByb3BlcnR5IGlzIHByZXNlbnQuCj4gPiAgIAo+IEFncmVlIHdl
IGRvbid0IG5lZWQgdG8gc2F5IHdoaWNoIGlzIGJldHRlciBhcyBpdCBpcyBqdXN0IGEgZGVzaWdu
IGNob2ljZS4gQW5kIGl0IGlzIHVzZWQgYnkgYWxsIEJDTUJDQSBpbnRlcm5hbCByZWYgYm9hcmRz
IGFuZCBjdXN0b21lciBkZXNpZ25zLiBCdXQgaWYgd2UganVzdCBzYXkgc3RyYXAgdmFsdWUgaXMg
cmVhZCBhbmQgYXBwbGllZCwgaXQgaXMgdmFndWUgYW5kIG5vYm9keSB3b3VsZCBrbm93IHdoYXQg
aXMgYXBwbGllZC4gIEkgcmVwbGllZCB0aGlzIGVtYWlsIHllc3RlcmRheSBhbmQgc3VnZ2VzdCB0
aGUgZm9sbG93aW5nczoKPiAKPiBUaGlzIHByb3BlcnR5IHByb3ZpZGVzIGEgY2hvaWNlIGZvciBy
ZXRyaWV2aW5nIGVjYyBzdHJlbmd0aCBhbmQgc3BhcmUgYXJlYSBzaXplIGZyb20KIHRoZSBTb0Mg
TkFORCBib290IHN0cmFwIHNldHRpbmcuIEl0IGlzIGNvbW1vbmx5IHVzZWQgYnkgdGhlIEJDTUJD
QSBTb0MgYm9hcmQgZGVzaWduLgoKV2hhdCBhYm91dDoKClRoaXMgcHJvcGVydHkgcmVxdWlyZXMg
dGhlIGhvc3Qgc3lzdGVtIHRvIGdldCB0aGUgRUNDIHN0cmVuZ3RoIGFuZCBzdGVwCnNpemUgZnJv
bSB0aGUgU29DIE5BTkQgYm9vdCBzdHJhcCBzZXR0aW5nLiBUaGlzIGlzIGEgY29tbW9uIGhhcmR3
YXJlCmRlc2lnbiBvbiBCQ01CQ0EgYmFzZWQgYm9hcmRzLgoKSSB3b3VsZCBhbHNvIGxpa2UgdG8g
Y29uc3RyYWluIHRoaXMgbW9yZSBieSBhZGRpbmcgYW4gZXhjbHVzaXZlIHVzZSB3cnQKdGhlIG5h
bmQtZWNjLSogcHJvcGVydGllcy4gU28gZWl0aGVyIHlvdSBwdXQgdGhpcyBwcm9wZXJ0eSwgb3Ig
eW91IHB1dAp0aGUgZ2VuZXJpYyBuYW5kLWVjYy0qIHByb3BlcnRpZXMsIG9yIHlvdSBwdXQgbm90
aGluZyAod2hpY2gsIGFnYWluLCBpcwpieSBmYXIgdGhlIGJlc3Qgc29sdXRpb24pLCBidXQgaW4g
bm8gY2FzZSB5b3UgY2FuIGhhdmUgYSBtaXguCgo+IAo+IEhvcGUgdGhpcyBtYWtlIGV2ZXJ5b25l
IGhhcHB5IGFuZCB3ZSBjYW4gbW92ZSBmb3J3YXJkLgoKSSB3YXMgYWR2aXNpbmcgdG8gYXZvaWQg
bWVudGlvbmluZyB0b28gc3BlY2lmaWMgRFQgcHJvcGVydGllcywgYnV0Cm1lbnRpb25pbmcgdGhl
IGtpbmQgb2YgaW1wYWN0IGl0IGhhcyAob24gdGhlIGNob2ljZSBmb3IgdGhlIEVDQwpzdHJlbmd0
aCBhbmQgc2l6ZSkgaXMgZmluZS4KCj4gCj4gCj4gPj4+ICsgICAgICAgICAgVGhpcyBpcyBjb21t
b25seSB1c2VkIGJ5IHRoZSBCQ01CQ0EgU29DIGJvYXJkIGRlc2lnbi4KPiA+Pj4gKyAgICAgICAg
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZwo+ID4+PiArCj4gPj4+
ICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UgIAo+ID4+PiAgID4+PiAgIGFsbE9m
Ogo+ID4+PiAtLSA+Pj4gMi4zNy4zICAKPiA+Pj4gICAgPiA+ICAgCj4gPiBUaGFua3MsCj4gPiBN
aXF1w6hsICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
