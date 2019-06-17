Return-Path: <SRS0=mO4J=UQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C58BC31E57
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 12:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E479820657
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2019 12:35:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EWYZMMGD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E479820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjbiXWSrsG+7Qr4Ij1UkMtNW/0Pp59YLmrsb/GZabJI=; b=EWYZMMGDZb3slf
	hCcMBqDdKsNdXKVDQpux2IIJ12WJQYYh3Jr3dIXKmzKOsloAyStS4j4ZLkBYimuZl//XicOmJrowa
	SwyEqhRo5x20zGgdsuTf2buwt5NZL5fir8Mws7W7gnecaRCMj7e2Wt0haue1FPgoeUY/mjRTXBRSG
	Kkj9RPreF/xaMkzgttY9G/D05aOAmGaemYkUWjRiCkdFUBaLVV8NYHhqD4fctAfs+JDlveTdwbOhL
	tfq/1+1XJLpdGhvQgG/6Y6eZ0wfAxIxCIQ3qILHz7P7XFUUOuOP8r/MxgVvz/AjCL9V3xnvrwMXZ8
	IAkzasptngO/2xjc7i0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcqrI-0006Dw-4n; Mon, 17 Jun 2019 12:35:36 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqrD-00067S-48
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2019 12:35:33 +0000
Received: from xps13 (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C29EB20000E;
 Mon, 17 Jun 2019 12:35:11 +0000 (UTC)
Date: Mon, 17 Jun 2019 14:35:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
Message-ID: <20190617143510.4ded5728@xps13>
In-Reply-To: <OFE923A8E5.50375C30-ON48258409.0009AE1B-48258409.00119767@mxic.com.tw>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>
 <OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
 <20190520142333.390091d5@xps13>
 <OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
 <20190527144250.71908bd9@xps13>
 <OFE923A8E5.50375C30-ON48258409.0009AE1B-48258409.00119767@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_053531_490687_C137AE33 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marcel.ziswiler@toradex.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBXZWQsIDI5IE1heSAy
MDE5IDExOjEyOjA4ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiA+ID4gPiA+ID4gK3N0YXRp
YyB2b2lkIG14aWNfbmFuZF9zZWxlY3RfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQg
ICAKPiAgCj4gPiA+IGNoaXBucikgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IF9zZWxlY3Rf
dGFyZ2V0KCkgaXMgcHJlZmVycmVkIG5vdyAgIAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBEbyB5b3Ug
bWVhbiBJIGltcGxlbWVudCBteGljX25hbmRfc2VsZWN0X3RhcmdldCgpIHRvIGNvbnRyb2wgI0NT
ID8KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSWYgc28sIEkgbmVlZCB0byBjYWxsIG14aWNfbmFuZF9z
ZWxlY3RfdGFyZ2V0KCApIHRvIGNvbnRyb2wgI0NTIE9OCj4gPiA+ID4gPiBhbmQgdGhlbiAjQ1Mg
T0ZGIGluIF9leGVjX29wKCkgZHVlIHRvIG5hbmRfc2VsZWN0X3RhcmdldCgpPGluICAgCj4gPiA+
IG5hbmRfYmFzZSxjPiAgIAo+ID4gPiA+ID4gaXMgc3RpbGwgY2FsbGluZyBjaGlwLT5sZWdhY3ku
c2VsZWN0X2NoaXAgPyAgIAo+ID4gPiA+IAo+ID4gPiA+IFlvdSBtdXN0IGZvcmdldCBhYm91dCB0
aGUgLT5zZWxlY3RfY2hpcCgpIGNhbGxiYWNrLiBOb3cgaXQgc2hvdWxkIGJlCj4gPiA+ID4gaGFu
ZGxlZCBkaXJlY3RseSBmcm9tIHRoZSBjb250cm9sbGVyIGRyaXZlci4gUGxlYXNlIGhhdmUgYSBs
b29rIGF0ICAgCj4gdGhlCj4gPiA+ID4gY29tbWl0IHBvaW50ZWQgYWdhaW5zdCB0aGUgbWFydmVs
bF9uYW5kLmMgZHJpdmVyLiAgIAo+ID4gPiAKPiA+ID4gSSBoYXZlIG5vIE1hcnZlbGwgTkZDIGRh
dGFzaGVldCBhbmQgaGF2ZSBvbmUgcXVlc3Rpb24uCj4gPiA+IAo+ID4gPiBJbiBtYXJ2ZWxsX25h
bmQuYywgdGhlcmUgaXMgbm8geHh4X2Rlc2VsZWN0X3RhcmdldCgpIG9yIAo+ID4gPiBzb21ldGhp
bmcgbGlrZSB0aGF0IGRvaW5nICNDUyBPRkYuCj4gPiA+IG1hcnZlbGxfbmZjX3NlbGVjdF90YXJn
ZXQoKSBzZWVtcyBhbHdheXMgdG8gbWFrZSBvbmUgb2YgY2hpcCBvciBkaWUKPiA+ID4gI0NTIGtl
ZXAgbG93Lgo+ID4gPiAKPiA+ID4gSXMgaXQgcmlnaHQgPyAgCj4gPiAKPiA+IFllcywgQUZBSVIg
dGhlcmUgaXMgbm8gImRlLWFzc2VydCIgbWVjaGFuaXNtIGluIHRoaXMgY29udHJvbGxlci4KPiA+
ICAgCj4gPiA+IAo+ID4gPiBIb3cgdG8gbWFrZSBhbGwgI0NTIGtlZXAgaGlnaCBmb3IgTkFORCB0
byBlbnRlciAKPiA+ID4gbG93LXBvd2VyIHN0YW5kYnkgbW9kZSBpZiBkcml2ZXIgZG9uJ3QgdXNl
ICJsZWdhY3kuc2VsZWN0X2NoaXAoKSIgPyAgCj4gPiAKPiA+IFNlZSBjb21taXQgMDJiNGE1MjYw
NGE0ICgibXRkOiByYXduYW5kOiBNYWtlIC0+c2VsZWN0X2NoaXAoKSBvcHRpb25hbAo+ID4gd2hl
biAtPmV4ZWNfb3AoKSBpcyBpbXBsZW1lbnRlZCIpIHdoaWNoIHN0YXRlczoKPiA+IAo+ID4gICAg
ICAgICAiV2hlbiBbLT5zZWxlY3RfY2hpcCgpIGlzXSBub3QgaW1wbGVtZW50ZWQsIHRoZSBjb3Jl
IGlzIGFzc3VtaW5nCj4gPiAgICB0aGUgQ1MgbGluZSBpcyBhdXRvbWF0aWNhbGx5IGFzc2VydGVk
L2RlYXNzZXJ0ZWQgYnkgdGhlIGRyaXZlciAgCj4gPiAgICAtPmV4ZWNfb3AoKSBpbXBsZW1lbnRh
dGlvbi4iICAKPiA+IAo+ID4gT2YgY291cnNlLCB0aGUgYWJvdmUgaXMgcmlnaHQgb25seSB3aGVu
IHRoZSBjb250cm9sbGVyIGRyaXZlciBzdXBwb3J0cwo+ID4gdGhlIC0+ZXhlY19vcCgpIGludGVy
ZmFjZS4gICAKPiAKPiBDdXJyZW50bHksIGl0IHNlZW1zIHRoYXQgd2Ugd2lsbCBnZXQgdGhlIGlu
Y29ycmVjdCBkYXRhIGFuZCBlcnJvcgo+IG9wZXJhdGlvbiBkdWUgdG8gQ1MgaW4gZXJyb3IgdG9n
Z2xpbmcgaWYgQ1MgbGluZSBpcyBjb250cm9sbGVkIGluIAo+IC0+ZXhlY19vcCgpLiAgCgpNb3N0
IG9mIHRoZSBjaGlwcyB0b2RheSBhcmUgQ1MtZG9uJ3QtY2FyZSwgd2hpY2ggY2hpcCBhcmUgeW91
IHVzaW5nPwoKSXMgdGhpcyBiZWhhdmlvciBwdWJsaWNseSBkb2N1bWVudGVkPwoKSXMgdGhpcyBM
UE0gbW9kZSBhbHdheXMgYWN0aXZhdGVkPwoKPiBpLmUsLiAKPiAKPiAxKSBJbiBuYW5kX29uZmlf
ZGV0ZWN0KCkgdG8gY2FsbCBuYW5kX2V4ZWNfb3AoKSB0d2ljZSBieSAKPiBuYW5kX3JlYWRfcGFy
YW1fcGFnZV9vcCgpIGFuZCBhbm5kX3JlYWRfZGF0YV9vcCgpCj4gCj4gMikgSW4gbmFuZF93cml0
ZV9wYWdlX3h4eCB0byBjYWxsIG5hbmRfZXhlY19vcCgpIG1hbnkgdGltZXMgYnkKPiBuYW5kX3By
b2dfcGFnZV9iZWdpbl9vcCgpLCBuYW5kX3dyaXRlX2RhdGFfb3AoKSBhbmQgCj4gbmFuZF9wcm9n
X3BhZ2VfZW5kX29wKCkuCj4gCj4gCj4gU2hvdWxkIHdlIGNvbnNpZGVyIHRvIGFkZCBhIENTIGxp
bmUgY29udHJvbGxlciBpbiBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyCj4gaS5lLC4KPiAKPiBzdHJ1
Y3QgbmFuZF9jb250cm9sbGVyIHsKPiAgICAgICAgICBzdHJ1Y3QgbXV0ZXggbG9jazsKPiAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyX29wcyAqb3BzOwo+ICsgICAgICAgICAg
dm9pZCAoKnNlbGVjdF9jaGlwKShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY3MpOwo+IH07
Cj4gCj4gdG8gcmVwbGFjZSBsZWdhY3kuc2VsZWN0X2NoaXAoKSA/Cj4gCgpObywgaWYgcmVhbGx5
IG5lZWRlZCwgd2UgY291bGQgYWRkIGEgIm1hY3JvIG9wIGRvbmUiIGZsYWcgaW4gdGhlIG5hbmQK
b3BlcmF0aW9uIHN0cnVjdHVyZS4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
