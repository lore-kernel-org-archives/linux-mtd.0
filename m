Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOq9UJPefUyVd5lo31f1VNwD/PMzsKK7jV2vo0y2ytA=; b=lPoNW1AHZc7AfD
	7UTVmA50NUdnThBgCpD4srhWZxOqGN2XWdGThjsoGYWpY7QNd6/gS4K3b1FClPKg4b37g2Ob8l8Yc
	Djqo1p8q9CLvHudfaEHDuYqpTM0gF+yp5AgqnyiRgjyeergIZOfsAijtfqjjF+A4syGUuKb/mKMwp
	zlM1ZlOcVEgmKdMYoHZInHKuYYWnT4Zu9X4mWx7zP72bAY8x3/F7LEz2Ni8CWwxC/94X2xPJzaRv2
	0hFYe4WfvrBPjTH58dNlzpweQni8XbquEHZWBjiiAnMokf/s3icdb4AjdkVOezWF1jvCAyhT+AUfh
	M+Ye2gtWt/kLxqJOedng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxCG-009jnw-Cu; Wed, 22 Dec 2021 08:42:04 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxCD-009jn4-9A
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 08:42:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D5D68E0007;
 Wed, 22 Dec 2021 08:41:57 +0000 (UTC)
Date: Wed, 22 Dec 2021 09:41:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Message-ID: <20211222094156.7bfce4e4@xps13>
In-Reply-To: <20211222092324.7ec6ec6a@xps13>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
 <20211221170058.18333-2-miquel.raynal@bootlin.com>
 <20211221184725.46lelrdfoxeom6uc@ti.com>
 <20211222092324.7ec6ec6a@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_004201_619979_292CF9C3 
X-CRM114-Status: GOOD (  35.15  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gV2VkLCAyMiBEZWMgMjAyMSAwOToy
MzoyNCArMDEwMDoKCj4gSGkgUHJhdHl1c2gsCj4gCj4gcC55YWRhdkB0aS5jb20gd3JvdGUgb24g
V2VkLCAyMiBEZWMgMjAyMSAwMDoxNzoyNyArMDUzMDoKPiAKPiA+IE9uIDIxLzEyLzIxIDA2OjAw
UE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+ID4gVGhlIFhpbGlueCBRU1BJIGNvbnRyb2xs
ZXIgaGFzIHR3byBhZHZhbmNlZCBtb2RlcyB3aGljaCBhbGxvdyB0aGUKPiA+ID4gY29udHJvbGxl
ciB0byBiZWhhdmUgZGlmZmVyZW50bHkgYW5kIGNvbnNpZGVyIHR3byBmbGFzaGVzIGFzIG9uZSBz
aW5nbGUKPiA+ID4gc3RvcmFnZS4KPiA+ID4gCj4gPiA+IE9uZSBvZiB0aGVzZSB0d28gbW9kZXMg
aXMgcXVpdGUgY29tcGxleCB0byBzdXBwb3J0IGZyb20gYSBiaW5kaW5nIHBvaW50Cj4gPiA+IG9m
IHZpZXcgYW5kIGlzIHRoZSBkdWFsIHBhcmFsbGVsIG1lbW9yaWVzLiBJbiB0aGlzIG1vZGUsIGVh
Y2ggYnl0ZSBvZgo+ID4gPiBkYXRhIGlzIHN0b3JlZCBpbiBib3RoIGRldmljZXM6IHRoZSBldmVu
IGJpdHMgaW4gb25lLCB0aGUgb2RkIGJpdHMgaW4KPiA+ID4gdGhlIG90aGVyLiBUaGUgc3BsaXQg
aXMgYXV0b21hdGljYWxseSBoYW5kbGVkIGJ5IHRoZSBRU1BJIGNvbnRyb2xsZXIgYW5kCj4gPiA+
IGlzIHRyYW5zcGFyZW50IGZvciB0aGUgdXNlci4KPiA+ID4gCj4gPiA+IFRoZSBvdGhlciBtb2Rl
IGlzIHNpbXBsZXIgdG8gc3VwcG9ydCwgaXQgaXMgY2FsbGVkIGR1YWwgc3RhY2tlZAo+ID4gPiBt
ZW1vcmllcy4gVGhlIGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIFNQSSBidXMgYnV0IGVhY2gg
b2YgdGhlIGRldmljZXMKPiA+ID4gY29udGFpbiBoYWxmIG9mIHRoZSBkYXRhLiBPbmNlIGluIHRo
aXMgbW9kZSwgdGhlIGNvbnRyb2xsZXIgZG9lcyBub3QKPiA+ID4gZm9sbG93IENTIHJlcXVlc3Rz
IGJ1dCBpbnN0ZWFkIGludGVybmFsbHkgd2lyZXMgdGhlIHR3byBDUyBsZXZlbHMgd2l0aAo+ID4g
PiB0aGUgdmFsdWUgb2YgdGhlIG1vc3Qgc2lnbmlmaWNhbnQgYWRkcmVzcyBiaXQuCj4gPiA+IAo+
ID4gPiBTdXBwb3J0aW5nIHRoZXNlIHR3byBtb2RlcyB3aWxsIGludm9sdmUgY29yZSBjaGFuZ2Vz
IHdoaWNoIGluY2x1ZGUgdGhlCj4gPiA+IHBvc3NpYmlsaXR5IG9mIHByb3ZpZGluZyB0d28gQ1Mg
Zm9yIGEgc2luZ2xlIFNQSSBkZXZpY2UKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+IEFja2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIHwgMyArKy0KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gCj4g
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2pl
ZGVjLHNwaS1ub3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
amVkZWMsc3BpLW5vci55YW1sCj4gPiA+IGluZGV4IDM5NDIxZjcyMzNlNC4uNGFiZmI0Y2ZjMTU3
IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2plZGVjLHNwaS1ub3IueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+ID4gPiBAQCAtNDcsNyArNDcsOCBAQCBw
cm9wZXJ0aWVzOgo+ID4gPiAgICAgICAgaWRlbnRpZmllZCBieSB0aGUgSkVERUMgUkVBRCBJRCBv
cGNvZGUgKDB4OUYpLgo+ID4gPiAgCj4gPiA+ICAgIHJlZzoKPiA+ID4gLSAgICBtYXhJdGVtczog
MQo+ID4gPiArICAgIG1pbkl0ZW1zOiAxCj4gPiA+ICsgICAgbWF4SXRlbXM6IDIgICAgCj4gPiAK
PiA+IFlvdSBhbGxvdyB1cCB0byA0IGl0ZW1zIGluIHN0YWNrZWQtbWVtb3JpZXMgYnV0IG9ubHkg
YWxsb3cgdXAgdG8gMiBDUywgCj4gPiB3aGljaCB3b3VsZCBtYWtlIHRoZSBvdGhlciAyIG1lbW9y
aWVzIHVudXNhYmxlLiBTaG91bGQgYWxzbyBjaGFuZ2UgdGhpcyAKPiA+IHRvIDQuICAKPiAKPiBZ
ZXMsIEkgYWxsb3dlZCAibW9yZSIgdGhlb3JldGljYWwgZGV2aWNlcyBpbiB0aGUKPiBzdGFja2Vk
L3BhcmFsbGVsLW1lbW9yaWVzIHByb3BlcnRpZXMgYmVjYXVzZSB0aGVyZSBpcyBubyByZWFsCj4g
bGltaXRhdGlvbiBvbiB0aGlzIHNpZGUgc28gSSBkaWRuJ3Qgd2FudCB0byBjb25zdHJhaW4gaXQg
dG9vIG11Y2gsCj4gd2hpbGUgc3RpbGwga2VlcGluZyBhIG1heGltdW0gdmFsdWUsIGhlbmNlIDQg
c2VlbWVkIGEgbmljZSBndWVzcyBmb3IgYQo+ICJtYXhpbXVtIGJ1dCBjYW4gYmUgYmlnZ2VyIHZh
bHVlIHdlIGRvbid0IHJlYWxseSBjYXJlIGl0J3MganVzdCBmb3IKPiBib3VuZGluZyIuIEhvd2V2
ZXIgb24gdGhlIFNQSSBzaWRlIHRoaXMgaXMgYSBiaWcgY2hhbmdlIHdpdGggZGVlcAo+IGNvbnNl
cXVlbmNlcyBhbmQgSSBkb24ndCB3YW50IHRvIHJ1c2ggdGhpbmdzIHNvIGl0IGlzIG9uIHB1cnBv
c2UgdGhhdCBJCj4ga2VwdCB0aGUgbGltaXRhdGlvbiB0byAyLiBCdXQgd2UgY2FuIGNoYW5nZSB0
aGUgbWF4SXRlbXMgdG8gMgo+IGV2ZXJ5d2hlcmUgaWYgdGhpcyBhcHBlYXJzIHRvIGJlIHRoZSB0
aGluZyB0byBkby4KCkkgZm9yZ290IHRvIG1lbnRpb24gdGhhdCB0aGUgc3RhY2tlZC9wYXJhbGxl
bC1tZW1vcmllcyBjb3VsZAphbHNvIGNlcnRhaW5seSBiZSBjb25zaWRlcmVkICJtZW1vcnkiIHBy
b3BlcnRpZXMgKHRoaW5rIGFib3V0IHRoZQpnZW5lcmljIHRlcm0pLCBub3QgbmVjZXNzYXJpbHkg
Ym91bmQgdG8gU1BJLiBXZSBjb3VsZCBkZWZpbml0ZWx5IGhhdmUKdGhlIHNhbWUgcGF0dGVybiB3
aXRoIG90aGVyIG1lbW9yeSB0eXBlcyBhcyB3ZWxsIGFuZCBub3QgYmUgdGlnaHQgdG8KdGhlIG51
bWJlciBvZiBTUEkgQ1MuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
