Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BECC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 16:36:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4D16056C
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 16:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E4D16056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NasFL4vS8L9LqgYfO90QBSQJ8V2X7bmKEzvfs3s+xoQ=; b=rPiFbvm1Nte5Iw
	QOjPExi4uLYJPO9xmKlz/5nwtpLBS1KJkR/wOYVTkEfFyk4LnBGEuB/s5FrNVy4s1ROHwHLfHuIfV
	l3UTDzkFEtmokut+ooa7urIf4+08tddrINSkhcCnGLrI+qfFMhEoAwrpDazZqB9fTDBT0C7lOKXPT
	9zZouBq7GjtZCE8IvaGF4dXjN/msBPxJv87NIrpOWMXKg6clYt3ayCRNM/2GNKgBcgW/+HrXCKtm5
	QDJM9ASRRhUx6PtOAuaLZGgJrzmVHfb5Yz+l5sN8cukVJO23HdZfv47GF1Cz9HCwO0An1UYtj6yGL
	lW/1f+sr/rZpfjZvFelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNe4f-004Cs7-Vn; Tue, 07 Sep 2021 16:35:54 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNe4c-004Cr8-OD
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 16:35:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 93BC560009;
 Tue,  7 Sep 2021 16:35:46 +0000 (UTC)
Date: Tue, 7 Sep 2021 18:35:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>, <tony@atomide.com>,
 <robh+dt@kernel.org>, <nm@ti.com>, <lokeshvutla@ti.com>, <nsekhar@ti.com>,
 <krzysztof.kozlowski@canonical.com>, <devicetree@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
Message-ID: <20210907183545.3e281b7d@xps13>
In-Reply-To: <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com>
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-6-rogerq@kernel.org>
 <20210907160317.2ec5304a@xps13>
 <dc3d465f-50d5-31e5-07e6-f83223b90800@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_093550_979898_359D577F 
X-CRM114-Status: GOOD (  17.20  )
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

SGkgR3J5Z29yaWksCgo+ID4gICAKPiA+PiArCj4gPj4gKyAgbmFuZC1idXMtd2lkdGg6Cj4gPj4g
KyAgICBkZXNjcmlwdGlvbjoKPiA+PiArICAgICAgQnVzIHdpZHRoIHRvIHRoZSBOQU5EIGNoaXAK
PiA+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+
ID4+ICsgICAgZW51bTogWzgsIDE2XQo+ID4+ICsgICAgZGVmYXVsdDogOCAgCj4gPiAKPiA+IFRo
aXMgaXMgcGFydCBvZiBuYW5kLWNvbnRyb2xsZXIueWFtbCBiaW5kaW5nIGFuZCBzaG91bGQgbm90
IGJlIHRoZXJlLgo+ID4gICAKPiA+PiArCj4gPj4gK2FsbE9mOgo+ID4+ICsgIC0gJHJlZjogIi4u
L21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLWNoaWxkLnlhbWwiICAKPiA+IAo+ID4gTWF5YmUg
eW91IG5lZWQgdG8gcmVmZXJlbmNlIHRoZSBuYW5kIGNvbnRyb2xsZXIgYmluZGluZ3MgYXMgd2Vs
bAo+ID4gICAKPiAKPiBUaGlzIHdpbGwgbm90IHdvcmsgb3V0IG9mIHRoZSBib3ggOiggYXMgbmFu
ZC1jb250cm9sbGVyLnlhbWwgZGVmaW5lcyBib3RoCj4gICBuYW5kIGNvbnRyb2xsZXIgYW5kIG5h
bmQgbWVtb3J5LiBJdCBwb3RlbnRpYWxseSBtaWdodCB3b3JrIGlmIGl0IHdpbGwgYmUgcG9zc2li
bGUgdG8gc3BsaXQKPiBuYW5kIG1lbW9yeSBkZWZpbml0aW9uIChvciBuYW5kIG1lbW9yeSBwcm9w
ZXJ0aWVzKSBvdXQgb2YgYW5kLWNvbnRyb2xsZXIueWFtbCwgc2ltaWxhcmx5IHRvCj4gdGksZ3Bt
Yy1jaGlsZC55YW1sIGZyb20gdGhpcyBzZXJpZXMuCgpXaGF0IHlvdSB0aGluayB3b3VsZCBiZSB0
aGUgaXNzdWU/CgpJIGFtIG5vdCBvcHBvc2VkIHRvIHNwbGl0IG5hbmQtY29udHJvbGxlci55YW1s
IGludG8KbmFuZC1jb250cm9sbGVyLnlhbWwgYW5kIG5hbmQtY2hpcC55YW1sIGlmIGl0IHNpbXBs
aWZpZXMgdGhlCmRlc2NyaXB0aW9uIG9mIGNvbnRyb2xsZXJzIGJ1dCBJIGRvbid0IGdldCB3aHkg
aXQgd291bGQgYmUgbmVlZGVkLiBJbgpwYXJ0aWN1bGFyIHNpbmNlIHdlIGV4cGVjdCBhbGwgZHJp
dmVycyB0byBzdXBwb3J0IHRoZQoKbmFuZC1jb250cm9sbGVyIHsKCWNvbnRyb2xsZXItcHJvcHM7
CgluYW5kLWNoaXAgewoJCWNoaXAtcHJvcHM7Cgl9Cn0KCm9yZ2FuaXphdGlvbiB3aGljaCBoYXMg
YmVlbiBlbmZvcmNlZCBzaW5jZSBhdCBsZWFzdCAyMDE4LiBIYXZpbmcgYQpjb250cm9sbGVyIHZz
LiBjaGlwIHJlcHJlc2VudGF0aW9uIGlzIGZ1bmRhbWVudGFsbHkgcmlnaHQuIEJ1dCBoZXJlIEkK
c2VlIGhvdyAibGVnYWN5IiBhcmUgdGhlc2UgYmluZGluZ3Mgd2l0aCBzbyBtdWNoIHVubmVlZGVk
IHNwZWNpZmljICJ0aSwiCnByb3BlcnRpZXMuLi4gT24gb25lIHNpZGUgaXQgd291bGQgYmUgZ29v
ZCB0byB2ZXJpZnkgdGhhdCB0aGUgZHJpdmVyCnN1cHBvcnRzIHRoaXMgcmVwcmVzZW50YXRpb24g
KHdoaWNoIEkgYmVsaWV2ZSBpcyB0cnVlKSBhbmQgb24gdGhlIG90aGVyCnNpZGUgbWF5YmUgaXQn
cyB0aW1lIHRvIGFkdmVydGlzZSAiYmV0dGVyIiBiaW5kaW5ncyBhcyB3ZWxsLgoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
