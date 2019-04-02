Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1175CC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63C320857
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAHXSZxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B63C320857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Q0NK0G/HH+0ws2PELuT0r8AnyBJOzWb5HuTjQwhJok=; b=BAHXSZxeyumHWn
	0BgJiJJ3gXRebOM+uM2KGk4waf5+YOjxsC9Tm3jf0wu3oqRIhf6UJn+YnJbkc2927AZaMxUOTg3zG
	N9h6Q1Tm7OeG1LLeNIEit6laV8ztpAQsPwYVmFgrmSAeOYoE/xJENrUmwptzQMkIpP/tYAMwzGdEO
	Nwm7uMs6F0dOB87QKcqf9nPTk7m+Qlfqg4MdFnkdA+9SmYfiQLjA4S7ENx6pKKftywSdehmAVmCrl
	WL0MbmI89Y6p6dUcYepPxCvSslt4GTKFdNUtLJn1Uhngih4N2lQOlv4kcq4XJVHDnvjEFz5Z5+vcW
	/05baw/Nka3nrtGpmtPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBFDl-00014U-QL; Tue, 02 Apr 2019 08:56:41 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBFDc-0000wa-8r; Tue, 02 Apr 2019 08:56:34 +0000
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 34F46240006;
 Tue,  2 Apr 2019 08:56:28 +0000 (UTC)
Date: Tue, 2 Apr 2019 10:56:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
Message-ID: <20190402105627.76a427a7@xps13>
In-Reply-To: <CAL_Jsq+yfng=wZtKuTdjbLHvz-+QGxG=EKkhH6JckpPNG_nFwQ@mail.gmail.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <20190402101917.4f38b9a4@xps13>
 <CAL_Jsq+yfng=wZtKuTdjbLHvz-+QGxG=EKkhH6JckpPNG_nFwQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_015632_463254_7F5C2745 
X-CRM114-Status: GOOD (  20.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4gd3JvdGUgb24gVHVlLCAy
IEFwciAyMDE5IDAzOjQ5OjQxCi0wNTAwOgoKPiBPbiBUdWUsIEFwciAyLCAyMDE5IGF0IDM6MTkg
QU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gSGkgTWF4aW1lLAo+ID4KPiA+IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxp
bi5jb20+IHdyb3RlIG9uIE1vbiwgIDEgQXByIDIwMTkKPiA+IDIzOjEzOjUzICswMjAwOgo+ID4g
IAo+ID4gPiBUaGUgTkFORCBjaGlwcyBpbiBNVEQgaGF2ZSBhIGJ1bmNoIG9mIGdlbmVyaWMgb3B0
aW9ucyB0aGF0IGFyZSBuZWVkZWQgaW4gYQo+ID4gPiBkZXZpY2UgdHJlZS4gQWRkIGEgWUFNTCBz
Y2hlbWFzIGZvciB0aG9zZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIHwgMTMxICsr
KysrKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKykKPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25h
bmQtY29udHJvbGxlci55YW1sCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbAo+ID4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjA1YjFhZmIzNDk3
Mgo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiA+ID4gQEAgLTAsMCArMSwxMzEg
QEAKPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBPUiBCU0QtMi1D
bGF1c2UpCj4gPiA+ICslWUFNTCAxLjIKPiA+ID4gKy0tLQo+ID4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwjCj4gPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4g
Kwo+ID4gPiArdGl0bGU6IE5BTkQgQ2hpcCBhbmQgTkFORCBDb250cm9sbGVyIEdlbmVyaWMgQmlu
ZGluZwo+ID4gPiArCj4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gKyAgLSBCb3JpcyBCcmV6aWxs
b24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gIAo+ID4KPiA+IFVuZm9ydHVuYXRlbHkgQm9yaXMg
aXMgbGVhdmluZy4KPiA+ICAKPiA+ID4gKyAgLSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgo+ID4gPiArICAtIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+ICAKPiA+Cj4gPiBJcyB0aGlzIHJlYWxseSBuZWVkZWQ/IFRoZXJlIGlzIGFscmVhZHkgYSBz
ZWN0aW9uIGZvciB0aGF0IHB1cnBvc2UgaW4KPiA+IE1BSU5UQUlORVJTLiAgCj4gCj4gWWVzLCBi
ZWNhdXNlIE1BSU5UQUlORVJTIGlzIGEga2VybmVsIGZpbGUgYW5kIGJpbmRpbmdzIGFyZSBzb21l
d2hhdAo+IGluZGVwZW5kZW50LiBBbmQgSSBmb3VuZCBtb3N0IGJpbmRpbmcgZmlsZXMgZG9uJ3Qg
aGF2ZSBhIG1haW50YWluZXIKPiAob3RoZXIgdGhhbiBtZSBhcyBkZWZhdWx0KS4KCkkga25vdyBE
VCBhbmQgYmluZGluZ3MgYXJlIGEgYml0IHNwZWNpZmljIGJ1dCB0aGV5IGFyZSBzdGlsbCBpbiB0
aGUKa2VybmVsIHNvdXJjZXMgYW5kIHJpZ2h0IG5vdyBpbiBNQUlOVEFJTkVSUywgdW5kZXIgdGhl
IE1URCBzdWJzeXN0ZW0KZW50cnkgdGhlcmUgaXM6CkY6ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC8KCldoYXQgSSBhbSBzYXlpbmcgaXMgdGhhdCB0aGlzIGxpc3Qg
aXMgYSBkdXBsaWNhdGUgYW5kIHBlb3BsZSB3aWxsCnNpbXBseSBmb3JnZXQgYWJvdXQgaXQgc28g
aXQgd29uJ3QgYmUgdXBkYXRlZCBuYXR1cmFsbHkuCgo+IAo+IElmIHdlIGV2ZXIgZ28gdG8gcGVy
IHN1YnN5c3RlbS9kaXJlY3RvcnkgTUFpTlRBaU5FUlMgZmlsZXMsIHRoZW4gd2UKPiBjYW4gZWFz
aWx5IGdlbmVyYXRlIG9uZSBmcm9tIGJpbmRpbmdzIGZvciB0aGUga2VybmVsLgo+IAo+IFJvYgoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
